import { createClient } from "@/lib/supabase/server";
import { QuizPlayer } from "@/components/quiz/QuizPlayer";
import { redirect } from "next/navigation";

export default async function RandomQuizPage() {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    // Fetch random questions from ALL questions
    // fetching 50 to shuffle
    const { data: questions } = await supabase
        .from("questions")
        .select(`
            id,
            content,
            explanation,
            category_id,
            options (
                id,
                content,
                is_correct
            )
        `)
        .limit(50);

    // Shuffle client-side (server-side context)
    const shuffledQuestions = questions?.sort(() => Math.random() - 0.5).slice(0, 10).map(q => ({
        ...q,
        options: q.options.sort(() => Math.random() - 0.5)
    })) || [];

    // Note: passing undefined for categoryId results in null in DB insert, which is what we want for mixed/random
    return (
        <div className="min-h-screen bg-transparent pt-20">
            <QuizPlayer questions={shuffledQuestions} />
        </div>
    );
}
