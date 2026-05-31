
import { createClient } from "@/lib/supabase/server";
import { MockExamPlayer } from "@/components/exam/MockExamPlayer";
import { redirect } from "next/navigation";

interface PageProps {
    params: Promise<{
        year: string;
    }>
}

export default async function MockExamYearPage({ params }: PageProps) {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    const { year } = await params;
    const yearInt = parseInt(year, 10);

    // Reject non-numeric or out-of-range year values early
    if (isNaN(yearInt) || yearInt < 1 || yearInt > 9999) {
        redirect("/mock-exam");
    }

    // Fetch questions
    const { data: questions } = await supabase
        .from("questions")
        .select(`
            id,
            content,
            explanation,
            question_number,
            exam_year,
            options (
                id,
                content,
                is_correct
            )
        `)
        .eq("exam_year", yearInt)
        .eq("status", "published")
        .order("question_number", { ascending: true });

    const examQuestions = questions || [];
    const timeLimit = examQuestions.length * 90;

    // Check for existing unfinished attempt
    const { data: existingAttempt } = await supabase
        .from("exam_attempts")
        .select("*")
        .eq("user_id", user.id)
        .eq("exam_year", yearInt)
        .eq("mode", "mock_exam")
        .eq("is_completed", false)
        .order("created_at", { ascending: false })
        .limit(1)
        .single();

    let initialAnswers: Record<string, string> = {};
    let initialTimeRemaining = timeLimit > 0 ? timeLimit : 18000;

    if (existingAttempt) {
        // Fetch saved answers for this attempt
        const { data: savedAnswers } = await supabase
            .from("question_attempts")
            .select("question_id, option_id")
            .eq("attempt_id", existingAttempt.id)
            .order("created_at", { ascending: true });

        if (savedAnswers) {
            savedAnswers.forEach(a => {
                if (a.option_id) initialAnswers[a.question_id] = a.option_id;
            });
        }

        if (existingAttempt.time_remaining) {
            initialTimeRemaining = existingAttempt.time_remaining;
        }
    }

    return (
        <div className="min-h-screen bg-transparent">
            {examQuestions.length > 0 ? (
                <MockExamPlayer
                    questions={examQuestions}
                    examYear={yearInt}
                    initialTimeRemaining={initialTimeRemaining}
                    initialAttemptId={existingAttempt?.id}
                    initialAnswers={initialAnswers}
                />
            ) : (
                <div className="container mx-auto py-20 text-center text-red-500">
                    問題が見つかりませんでした。
                </div>
            )}
        </div>
    );
}
