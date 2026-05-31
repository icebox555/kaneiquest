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
        .eq("status", "published")
        .limit(50);

    // Fisher-Yates shuffle for unbiased randomization
    function shuffle<T>(arr: T[]): T[] {
        const a = [...arr];
        for (let i = a.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [a[i], a[j]] = [a[j], a[i]];
        }
        return a;
    }

    const shuffledQuestions = shuffle(questions || []).slice(0, 10).map(q => ({
        ...q,
        options: shuffle(q.options),
    }));

    // Note: passing undefined for categoryId results in null in DB insert, which is what we want for mixed/random
    return (
        <div className="min-h-screen bg-transparent pt-20">
            <QuizPlayer questions={shuffledQuestions} />
        </div>
    );
}
