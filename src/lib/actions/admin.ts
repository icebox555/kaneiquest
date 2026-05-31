"use server";

import { createClient } from "@/lib/supabase/server";
import { revalidatePath } from "next/cache";

const UUID_REGEX =
    /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

const ALLOWED_PLANS = ["free", "pro"] as const;

/**
 * Verify the current session user has role = 'admin'.
 * Throws if unauthenticated or not an admin.
 */
async function verifyAdmin() {
    const supabase = await createClient();
    const {
        data: { user },
    } = await supabase.auth.getUser();

    if (!user) throw new Error("Unauthorized");

    const { data: profile } = await supabase
        .from("profiles")
        .select("role")
        .eq("id", user.id)
        .single();

    if (profile?.role !== "admin") throw new Error("Forbidden");

    return { supabase, userId: user.id };
}

// ---------------------------------------------------------------------------
// Question deletion
// ---------------------------------------------------------------------------

export async function deleteQuestion(
    questionId: string
): Promise<{ error?: string }> {
    try {
        if (!UUID_REGEX.test(questionId)) return { error: "Invalid question ID" };

        const { supabase } = await verifyAdmin();

        const { error } = await supabase
            .from("questions")
            .delete()
            .eq("id", questionId);

        if (error) throw error;

        revalidatePath("/admin/questions");
        return {};
    } catch (err) {
        const message = err instanceof Error ? err.message : "Unknown error";
        return { error: message };
    }
}

// ---------------------------------------------------------------------------
// Question publish toggle
// ---------------------------------------------------------------------------

export async function toggleQuestionStatus(
    questionId: string,
    currentStatus: 'draft' | 'published'
): Promise<{ error?: string }> {
    try {
        if (!UUID_REGEX.test(questionId)) return { error: "Invalid question ID" };

        const { supabase } = await verifyAdmin();
        const newStatus = currentStatus === 'published' ? 'draft' : 'published';

        const { error } = await supabase
            .from("questions")
            .update({ status: newStatus })
            .eq("id", questionId);

        if (error) throw error;

        revalidatePath("/admin/questions");
        return {};
    } catch (err) {
        const message = err instanceof Error ? err.message : "Unknown error";
        return { error: message };
    }
}

// ---------------------------------------------------------------------------
// Question save (create / update)
// ---------------------------------------------------------------------------

export type OptionInput = {
    id?: string;
    content: string;
    is_correct: boolean;
};

export type QuestionInput = {
    id?: string;
    category_id: string;
    content: string;
    explanation: string;
    difficulty: number;
    exam_year?: number;
    question_number?: number;
    status?: 'draft' | 'published';
    options: OptionInput[];
    /** Option IDs that were removed (update only) */
    optionIdsToDelete?: string[];
};

export async function saveQuestion(
    data: QuestionInput
): Promise<{ error?: string; questionId?: string }> {
    try {
        // --- server-side validation ---
        if (!data.content.trim() || data.content.length > 2000) {
            return { error: "問題文が無効です（1〜2000文字）" };
        }
        if (!data.explanation) data.explanation = "";
        if (data.explanation.length > 5000) {
            return { error: "解説が長すぎます（5000文字以内）" };
        }
        if (data.options.length < 2 || data.options.length > 10) {
            return { error: "選択肢は2〜10個必要です" };
        }
        for (const opt of data.options) {
            if (!opt.content.trim() || opt.content.length > 500) {
                return { error: "選択肢テキストが無効です（1〜500文字）" };
            }
        }
        if (!data.options.some((o) => o.is_correct)) {
            return { error: "正解の選択肢を1つ選んでください" };
        }
        if (data.id && !UUID_REGEX.test(data.id)) {
            return { error: "Invalid question ID" };
        }
        if (!UUID_REGEX.test(data.category_id)) {
            return { error: "Invalid category ID" };
        }
        const difficulty = Number(data.difficulty);
        if (![1, 2, 3].includes(difficulty)) {
            return { error: "Invalid difficulty" };
        }

        const { supabase } = await verifyAdmin();

        const status = data.status === 'draft' ? 'draft' : 'published';

        if (data.id) {
            // ----- UPDATE -----
            const { error: qError } = await supabase
                .from("questions")
                .update({
                    category_id: data.category_id,
                    content: data.content.trim(),
                    explanation: data.explanation.trim(),
                    difficulty,
                    exam_year: data.exam_year ?? null,
                    question_number: data.question_number ?? null,
                    status,
                })
                .eq("id", data.id);

            if (qError) throw qError;

            // Upsert options (existing ones get updated by PK, new ones inserted)
            const optionsToUpsert = data.options.map((opt, index) => ({
                // Only pass id if it looks like a valid UUID so Supabase treats it as update
                ...(opt.id && UUID_REGEX.test(opt.id) ? { id: opt.id } : {}),
                question_id: data.id,
                content: opt.content.trim(),
                is_correct: opt.is_correct,
                order: index + 1,
            }));

            const { error: oError } = await supabase
                .from("options")
                .upsert(optionsToUpsert);

            if (oError) throw oError;

            // Delete removed options (only valid UUIDs)
            const toDelete = (data.optionIdsToDelete ?? []).filter((id) =>
                UUID_REGEX.test(id)
            );
            if (toDelete.length > 0) {
                await supabase.from("options").delete().in("id", toDelete);
            }

            revalidatePath("/admin/questions");
            return { questionId: data.id };
        } else {
            // ----- INSERT -----
            const { data: question, error: qError } = await supabase
                .from("questions")
                .insert({
                    category_id: data.category_id,
                    content: data.content.trim(),
                    explanation: data.explanation.trim(),
                    difficulty,
                    exam_year: data.exam_year ?? null,
                    question_number: data.question_number ?? null,
                    question_type: "multiple_choice",
                    status,
                })
                .select()
                .single();

            if (qError) throw qError;

            const optionsToInsert = data.options.map((opt, index) => ({
                question_id: question.id,
                content: opt.content.trim(),
                is_correct: opt.is_correct,
                order: index + 1,
            }));

            const { error: oError } = await supabase
                .from("options")
                .insert(optionsToInsert);

            if (oError) throw oError;

            revalidatePath("/admin/questions");
            return { questionId: question.id };
        }
    } catch (err) {
        const message = err instanceof Error ? err.message : "Unknown error";
        return { error: message };
    }
}

// ---------------------------------------------------------------------------
// User profile update (admin only, plan cannot be escalated to admin)
// ---------------------------------------------------------------------------

export async function updateUserProfile(
    targetUserId: string,
    name: string,
    plan: string
): Promise<{ error?: string }> {
    try {
        if (!UUID_REGEX.test(targetUserId)) return { error: "Invalid user ID" };
        if (!(ALLOWED_PLANS as readonly string[]).includes(plan)) {
            return { error: "Invalid plan" };
        }
        const trimmedName = name.trim();
        if (!trimmedName || trimmedName.length > 50) {
            return { error: "名前が無効です（1〜50文字）" };
        }

        const { supabase } = await verifyAdmin();

        const { error } = await supabase
            .from("profiles")
            .update({ name: trimmedName, plan })
            .eq("id", targetUserId);

        if (error) throw error;

        revalidatePath("/admin/users");
        return {};
    } catch (err) {
        const message = err instanceof Error ? err.message : "Unknown error";
        return { error: message };
    }
}
