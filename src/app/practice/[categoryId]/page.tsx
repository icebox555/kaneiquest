import { createClient } from "@/lib/supabase/server";
import { QuizPlayer } from "@/components/quiz/QuizPlayer";
import { redirect } from "next/navigation";

interface PageProps {
    params: Promise<{
        categoryId: string;
    }>
}

export default async function QuizPage({ params }: PageProps) {
    const { categoryId } = await params;
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    // Fetch questions for this category (random 10)
    // Note: random ordering is tricky directly in Supabase API without RPC, 
    // but for small dataset we can fetch and shuffle, or use .order('random()') if extension enabled (unlikely by default).
    // Better way without extension: Fetch all IDs, pick random 10 in JS, then fetch details. 
    // OR just fetch 50 and shuffle in JS for MVP.

    const { data: questions } = await supabase
        .from("questions")
        .select(`
            id,
            content,
            explanation,
            options (
                id,
                content,
                is_correct
            )
        `)
        .eq("category_id", categoryId)
        .limit(20);

    // Shuffle questions client-side or here
    const shuffledQuestions = questions?.sort(() => Math.random() - 0.5).slice(0, 10).map(q => ({
        ...q,
        options: q.options.sort(() => Math.random() - 0.5) // Shuffle options too
    })) || [];

    return (
        <div className="min-h-screen bg-transparent pt-20">
            <QuizPlayer questions={shuffledQuestions} categoryId={categoryId} />
        </div>
    );
}
