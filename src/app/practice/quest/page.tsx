import { QuizPlayer } from "@/components/quiz/QuizPlayer";
import { generateDailyQuest } from "@/lib/ai/coach";
import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";

export default async function QuestPage() {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    const quest = await generateDailyQuest(user.id);

    if (!quest) {
        // Fallback if no quest generated (e.g. no history or no questions)
        // Redirect to practice or show message
        return (
            <div className="container mx-auto py-24 px-4 text-center">
                <h1 className="text-2xl font-bold mb-4">クエストを準備できませんでした</h1>
                <p className="mb-8">現時点ではクエストを生成できませんでした。もう少し演習を重ねると、AIが苦手分野を分析します！</p>
                <a href="/practice" className="text-primary font-bold hover:underline">演習に戻る</a>
            </div>
        );
    }

    return (
        <div className="min-h-screen bg-stone-50">
            <div className="container mx-auto px-4 py-8">
                <div className="mb-8">
                    <h1 className="text-2xl font-bold text-stone-800 flex items-center gap-2">
                        デイリークエスト
                        <span className="text-sm font-normal text-stone-500 bg-white px-2 py-1 rounded-full border border-stone-200">
                            重点: {quest.weakCategories.map(c => c.categoryName).join("、")}
                        </span>
                    </h1>
                </div>

                <div className="max-w-4xl mx-auto">
                    <QuizPlayer
                        questions={quest.questions}
                        initialSeconds={600} // 10 mins for 10 questions
                        mode="quest"
                    />
                </div>
            </div>
        </div>
    );
}
