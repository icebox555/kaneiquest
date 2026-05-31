import Link from "next/link";
import { ArrowLeft } from "lucide-react";
import { PracticeEntryCard } from "@/components/practice/PracticeEntryCard";
import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";

export default async function ReviewHubPage() {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) redirect("/login");

    // Count spaced repetition questions due today
    const now = new Date();
    let spacedCount = 0;
    for (const days of [1, 3, 7]) {
        const from = new Date(now.getTime() - (days + 1) * 24 * 60 * 60 * 1000);
        const to = new Date(now.getTime() - (days - 1) * 24 * 60 * 60 * 1000 + 20 * 60 * 60 * 1000);
        const { count } = await supabase
            .from("question_attempts")
            .select("*", { count: "exact", head: true })
            .eq("user_id", user.id)
            .eq("is_correct", false)
            .gte("created_at", from.toISOString())
            .lte("created_at", to.toISOString());
        spacedCount += count ?? 0;
    }

    return (
        <div className="min-h-screen bg-transparent pt-20 pb-12">
            <div className="container mx-auto px-4 md:px-6">
                <div className="mb-10 text-center">
                    <div className="mb-4 flex justify-center">
                        <Link
                            href="/practice"
                            className="inline-flex items-center text-stone-500 hover:text-primary transition-colors mb-4"
                        >
                            <ArrowLeft className="w-4 h-4 mr-2" />
                            演習一覧に戻る
                        </Link>
                    </div>
                    <h1 className="text-4xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-stone-800 to-stone-500 mb-4">
                        弱点克服・復習
                    </h1>
                    <p className="text-stone-500 text-lg max-w-2xl mx-auto">
                        重点的に復習したいモードを選んでください。
                    </p>
                </div>

                <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3 max-w-5xl mx-auto">
                    {/* Wrong Answers Review */}
                    <div className="h-64">
                        <PracticeEntryCard
                            href="/practice/review/wrong"
                            title="間違えた問題"
                            description="これまで間違えた問題を重点的に復習します。苦手分野を克服しましょう。"
                            iconName="XCircle"
                            bgClass="bg-red-500/10 text-red-500"
                            accentColorClass="text-stone-800 group-hover:text-red-500"
                            buttonText="START REVIEW"
                            requiresHeart={false}
                        />
                    </div>

                    {/* Bookmarks Review */}
                    <div className="h-64">
                        <PracticeEntryCard
                            href="/practice/review/bookmarks"
                            title="ブックマーク"
                            description="ブックマークした問題を復習します。重要事項の確認に最適です。"
                            iconName="Bookmark"
                            bgClass="bg-yellow-500/10 text-yellow-500"
                            accentColorClass="text-stone-800 group-hover:text-yellow-500"
                            buttonText="START REVIEW"
                            requiresHeart={false}
                        />
                    </div>

                    {/* Spaced Repetition */}
                    <div className="h-64">
                        <PracticeEntryCard
                            href="/practice/review/spaced"
                            title={`間隔反復${spacedCount > 0 ? ` (${spacedCount}問)` : ''}`}
                            description="1日後・3日後・7日後に自動で再出題。科学的な間隔で記憶を定着させます。"
                            iconName="RefreshCw"
                            bgClass="bg-purple-500/10 text-purple-500"
                            accentColorClass="text-stone-800 group-hover:text-purple-500"
                            buttonText={spacedCount > 0 ? "TODAY'S REVIEW" : "NO DUE TODAY"}
                            requiresHeart={false}
                        />
                    </div>
                </div>
            </div>
        </div>
    );
}
