import { createClient } from "@/lib/supabase/server";
import { QuizPlayer } from "@/components/quiz/QuizPlayer";
import { redirect } from "next/navigation";

interface PageProps {
    params: Promise<{
        year: string;
    }>
}

export default async function ExamYearPage({ params }: PageProps) {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    const { year } = await params;
    const yearInt = parseInt(year);

    // Fetch questions for this year
    const { data: questions } = await supabase
        .from("questions")
        .select(`
            id,
            content,
            explanation,
            question_number,
            options (
                id,
                content,
                is_correct
            )
        `)
        .eq("exam_year", yearInt)
        .eq("status", "published")
        .order("question_number", { ascending: true });

    // No shuffling for exam mode
    const examQuestions = questions || [];

    return (
        <div className="min-h-screen bg-transparent pt-20">
            <QuizPlayer
                questions={examQuestions}
                examYear={yearInt}
            />
        </div>
    );
}
