import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import { QuizPlayer } from "@/components/quiz/QuizPlayer";
import { dueWindow, SPACED_INTERVALS } from "@/lib/gamification/spaced-repetition";
import Link from "next/link";
import { ArrowLeft } from "lucide-react";

interface PageProps {
    params: Promise<{
        mode: string;
    }>;
}

export default async function ReviewPlayerPage({ params }: PageProps) {
    const { mode } = await params;
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    if (!['wrong', 'bookmarks', 'spaced'].includes(mode)) {
        redirect("/practice/review");
    }

    let questionsData: any[] = [];

    if (mode === 'wrong') {
        const { data: attempts } = await supabase
            .from("latest_question_attempts")
            .select("question_id")
            .eq("user_id", user.id)
            .eq("is_correct", false)
            .order("created_at", { ascending: false })
            .limit(100);

        const questionIds = Array.from(new Set(attempts?.map(a => a.question_id)));

        if (questionIds.length > 0) {
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
                .in("id", questionIds);
            questionsData = questions || [];
        }

    } else if (mode === 'spaced') {
        // Spaced repetition: questions answered wrong 1, 3, or 7+ days ago
        const now = new Date();

        const questionIdSet = new Set<string>();

        for (const days of SPACED_INTERVALS) {
            const { from, to } = dueWindow(now, days);

            const { data: spacedAttempts } = await supabase
                .from("question_attempts")
                .select("question_id")
                .eq("user_id", user.id)
                .eq("is_correct", false)
                .gte("created_at", from.toISOString())
                .lte("created_at", to.toISOString());

            spacedAttempts?.forEach(a => { if (a.question_id) questionIdSet.add(a.question_id); });
        }

        const questionIds = Array.from(questionIdSet);
        if (questionIds.length > 0) {
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
                .in("id", questionIds)
                .limit(30);
            questionsData = questions || [];
        }

    } else if (mode === 'bookmarks') {
        const { data: bookmarks } = await supabase
            .from("bookmarks")
            .select("question_id")
            .eq("user_id", user.id);

        const questionIds = bookmarks?.map(b => b.question_id) || [];

        if (questionIds.length > 0) {
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
                .in("id", questionIds);
            questionsData = questions || [];
        }
    }

    return (
        <div className="min-h-screen bg-transparent pt-20 pb-12">
            <div className="container mx-auto px-4 md:px-6">
                <div className="mb-4">
                    <Link
                        href="/practice/review"
                        className="inline-flex items-center text-stone-500 hover:text-primary transition-colors"
                    >
                        <ArrowLeft className="w-4 h-4 mr-2" />
                        復習モード選択に戻る
                    </Link>
                </div>

                <div className="mb-8">
                    <h1 className="text-xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-stone-800 to-stone-500 mb-2">
                        {mode === 'wrong' ? '間違えた問題の復習' : mode === 'spaced' ? '間隔反復トレーニング' : 'ブックマークした問題の復習'}
                    </h1>
                    <p className="text-stone-500 text-sm">
                        {questionsData.length}問の問題が見つかりました
                    </p>
                </div>

                <QuizPlayer questions={questionsData} />
            </div>
        </div>
    );
}
