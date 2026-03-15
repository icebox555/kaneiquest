"use server";

import { createClient } from "@/lib/supabase/server";
import { revalidatePath } from "next/cache";
import { getWeaknessAnalysis } from "@/lib/ai/coach";

// ─── Types ────────────────────────────────────────────────────────────────────

export interface StudySchedule {
    id: string;
    user_id: string;
    exam_date: string;
    daily_goal_minutes: number;
    study_days: number[];
    notification_pref: "browser" | "inapp" | "both" | "none";
    created_at: string;
    updated_at: string;
}

export interface StudyTask {
    id: string;
    user_id: string;
    category_id: string | null;
    scheduled_date: string;
    title: string;
    description: string | null;
    planned_minutes: number;
    actual_minutes: number | null;
    status: "pending" | "completed" | "skipped" | "rescheduled";
    pomodoros_planned: number;
    pomodoros_done: number;
    completed_at: string | null;
    created_at: string;
    updated_at: string;
}

export interface ScheduleInput {
    exam_date: string;
    daily_goal_minutes: number;
    study_days: number[];
    notification_pref: "browser" | "inapp" | "both" | "none";
}

// ─── Actions ──────────────────────────────────────────────────────────────────

export async function getSchedule(): Promise<StudySchedule | null> {
    const supabase = await createClient();
    const {
        data: { user },
    } = await supabase.auth.getUser();
    if (!user) return null;

    const { data } = await supabase
        .from("study_schedules")
        .select("*")
        .eq("user_id", user.id)
        .single();

    return data ?? null;
}

export async function upsertSchedule(
    input: ScheduleInput
): Promise<{ success: boolean; error?: string }> {
    const supabase = await createClient();
    const {
        data: { user },
    } = await supabase.auth.getUser();
    if (!user) return { success: false, error: "ログインが必要です" };

    const { error } = await supabase.from("study_schedules").upsert(
        {
            user_id: user.id,
            exam_date: input.exam_date,
            daily_goal_minutes: input.daily_goal_minutes,
            study_days: input.study_days,
            notification_pref: input.notification_pref,
            updated_at: new Date().toISOString(),
        },
        { onConflict: "user_id" }
    );

    if (error) return { success: false, error: error.message };
    revalidatePath("/schedule");
    return { success: true };
}

export async function getTasksForDate(date: string): Promise<StudyTask[]> {
    const supabase = await createClient();
    const {
        data: { user },
    } = await supabase.auth.getUser();
    if (!user) return [];

    const { data } = await supabase
        .from("study_tasks")
        .select("*")
        .eq("user_id", user.id)
        .eq("scheduled_date", date)
        .order("created_at", { ascending: true });

    return (data as StudyTask[]) ?? [];
}

export async function getTasksForRange(
    from: string,
    to: string
): Promise<StudyTask[]> {
    const supabase = await createClient();
    const {
        data: { user },
    } = await supabase.auth.getUser();
    if (!user) return [];

    const { data } = await supabase
        .from("study_tasks")
        .select("*")
        .eq("user_id", user.id)
        .gte("scheduled_date", from)
        .lte("scheduled_date", to)
        .order("scheduled_date", { ascending: true });

    return (data as StudyTask[]) ?? [];
}

export async function completeTask(
    taskId: string,
    actualMinutes: number
): Promise<{ success: boolean; error?: string }> {
    const supabase = await createClient();
    const {
        data: { user },
    } = await supabase.auth.getUser();
    if (!user) return { success: false, error: "ログインが必要です" };

    const { error } = await supabase
        .from("study_tasks")
        .update({
            status: "completed",
            actual_minutes: actualMinutes,
            completed_at: new Date().toISOString(),
            updated_at: new Date().toISOString(),
        })
        .eq("id", taskId)
        .eq("user_id", user.id);

    if (error) return { success: false, error: error.message };

    // Add XP (+20)
    const { data: profile } = await supabase
        .from("profiles")
        .select("xp")
        .eq("id", user.id)
        .single();

    if (profile) {
        await supabase
            .from("profiles")
            .update({ xp: (profile.xp ?? 0) + 20 })
            .eq("id", user.id);
    }

    // In-app notification
    await supabase.from("notifications").insert({
        user_id: user.id,
        title: "タスク完了！",
        message: "よくできました！+20 XP を獲得しました。",
        type: "success",
    });

    revalidatePath("/schedule");
    return { success: true };
}

export async function rescheduleTask(
    taskId: string
): Promise<{ success: boolean; error?: string }> {
    const supabase = await createClient();
    const {
        data: { user },
    } = await supabase.auth.getUser();
    if (!user) return { success: false, error: "ログインが必要です" };

    const { data: task } = await supabase
        .from("study_tasks")
        .select("*")
        .eq("id", taskId)
        .eq("user_id", user.id)
        .single();

    if (!task) return { success: false, error: "タスクが見つかりません" };

    const { data: schedule } = await supabase
        .from("study_schedules")
        .select("study_days")
        .eq("user_id", user.id)
        .single();

    const studyDays: number[] = schedule?.study_days ?? [1, 2, 3, 4, 5];

    // Find the next valid study day (start from tomorrow)
    const nextDate = new Date(task.scheduled_date);
    nextDate.setDate(nextDate.getDate() + 1);

    for (let i = 0; i < 14; i++) {
        if (studyDays.includes(nextDate.getDay())) break;
        nextDate.setDate(nextDate.getDate() + 1);
    }

    const nextDateStr = nextDate.toISOString().split("T")[0];

    const { error } = await supabase
        .from("study_tasks")
        .update({
            scheduled_date: nextDateStr,
            status: "rescheduled",
            updated_at: new Date().toISOString(),
        })
        .eq("id", taskId)
        .eq("user_id", user.id);

    if (error) return { success: false, error: error.message };
    revalidatePath("/schedule");
    return { success: true };
}

export async function generateStudyPlan(): Promise<{
    success: boolean;
    error?: string;
}> {
    const supabase = await createClient();
    const {
        data: { user },
    } = await supabase.auth.getUser();
    if (!user) return { success: false, error: "ログインが必要です" };

    const { data: schedule } = await supabase
        .from("study_schedules")
        .select("*")
        .eq("user_id", user.id)
        .single();

    if (!schedule) return { success: false, error: "スケジュール設定が見つかりません" };

    // Weakness analysis for weighted category selection
    const weaknesses = await getWeaknessAnalysis(user.id);
    const weakCategoryIds = new Set(weaknesses.slice(0, 5).map((w) => w.categoryId));

    const { data: categories } = await supabase
        .from("categories")
        .select("id, name")
        .order("order", { ascending: true });

    if (!categories || categories.length === 0) {
        return { success: false, error: "カテゴリが見つかりません" };
    }

    // Delete existing pending tasks before regenerating
    await supabase
        .from("study_tasks")
        .delete()
        .eq("user_id", user.id)
        .eq("status", "pending");

    const examDate = new Date(schedule.exam_date);
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    const maxDate = new Date(
        Math.min(examDate.getTime(), today.getTime() + 14 * 24 * 60 * 60 * 1000)
    );

    const sessionsPerDay = Math.min(3, Math.floor(schedule.daily_goal_minutes / 30));

    // Build weighted category list (weakness categories get 1.5x weight)
    const weightedCategories = categories.map((cat) => ({
        id: cat.id,
        name: cat.name,
        weight: weakCategoryIds.has(cat.id) ? 1.5 : 1.0,
    }));

    // Expand list by weight (round to nearest integer slots)
    const expandedPool: { id: string; name: string }[] = [];
    for (const cat of weightedCategories) {
        const slots = cat.weight >= 1.5 ? 3 : 2;
        for (let i = 0; i < slots; i++) {
            expandedPool.push({ id: cat.id, name: cat.name });
        }
    }

    const tasks: {
        user_id: string;
        category_id: string;
        scheduled_date: string;
        title: string;
        description: string;
        planned_minutes: number;
        pomodoros_planned: number;
        status: string;
    }[] = [];

    let poolIndex = 0;
    const currentDate = new Date(today);

    while (currentDate <= maxDate) {
        const dayOfWeek = currentDate.getDay();
        if ((schedule.study_days as number[]).includes(dayOfWeek)) {
            const dateStr = currentDate.toISOString().split("T")[0];
            for (let s = 0; s < sessionsPerDay; s++) {
                const cat = expandedPool[poolIndex % expandedPool.length];
                poolIndex++;
                tasks.push({
                    user_id: user.id,
                    category_id: cat.id,
                    scheduled_date: dateStr,
                    title: cat.name,
                    description: `${cat.name}の問題演習`,
                    planned_minutes: 30,
                    pomodoros_planned: 1,
                    status: "pending",
                });
            }
        }
        currentDate.setDate(currentDate.getDate() + 1);
    }

    if (tasks.length > 0) {
        const { error } = await supabase.from("study_tasks").insert(tasks);
        if (error) return { success: false, error: error.message };
    }

    revalidatePath("/schedule");
    return { success: true };
}

export async function updatePomodoroCount(
    taskId: string,
    count: number
): Promise<{ success: boolean; error?: string }> {
    const supabase = await createClient();
    const {
        data: { user },
    } = await supabase.auth.getUser();
    if (!user) return { success: false, error: "ログインが必要です" };

    const { error } = await supabase
        .from("study_tasks")
        .update({ pomodoros_done: count, updated_at: new Date().toISOString() })
        .eq("id", taskId)
        .eq("user_id", user.id);

    if (error) return { success: false, error: error.message };
    revalidatePath("/schedule");
    return { success: true };
}
