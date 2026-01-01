import { createClient } from "@/lib/supabase/server";
// import { BookOpen, ArrowRight, Activity, Beaker, Apple, Users } from "lucide-react"; // Removed unused components
import Link from "next/link";
import { redirect } from "next/navigation";
import { PracticeEntryCard } from "@/components/practice/PracticeEntryCard";

// Helper to get icon based on slug or name
// Helper to get icon based on slug or name
const getCategoryIconName = (slug: string) => {
    switch (slug) {
        case 'structure-and-function': return 'Activity';
        case 'clinical-nutrition': return 'Beaker';
        case 'food-science': return 'Apple';
        case 'public-health-nutrition': return 'Users';
        default: return 'BookOpen';
    }
};

export default async function PracticePage() {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    const { data: categories } = await supabase
        .from("categories")
        .select(`
            *,
            questions (count)
        `)
        .order("order");

    return (
        <div className="min-h-screen bg-transparent pt-20 pb-12">
            <div className="container mx-auto px-4 md:px-6">
                <div className="mb-10 text-center">
                    <h1 className="text-4xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-stone-800 to-stone-500 mb-4">
                        演習モード
                    </h1>
                    <p className="text-stone-500 text-lg max-w-2xl mx-auto">
                        分野を選択して学習を始めましょう。<br />
                        日々の積み重ねが合格への近道です。
                    </p>
                </div>

                <div className="mb-12">
                    <h2 className="text-2xl font-bold text-stone-800 mb-6 border-l-4 border-amber-500 pl-4">
                        過去問に挑戦 (年度別)
                    </h2>
                    <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
                        <PracticeEntryCard
                            href="/practice/year/39"
                            title="第39回 管理栄養士国家試験"
                            description="2025年実施。最新の出題傾向を確認しましょう。"
                            iconName="BookOpen"
                            bgClass="bg-amber-500/10 text-amber-500"
                            accentColorClass="text-stone-800 group-hover:text-amber-600"
                            buttonText="START EXAM"
                        />
                    </div>
                </div>

                <h2 className="text-2xl font-bold text-stone-800 mb-6 border-l-4 border-primary pl-4">
                    分野別演習
                </h2>
                <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
                    {categories?.map((category) => {
                        const iconName = getCategoryIconName(category.slug || '');
                        const questionCount = category.questions?.[0]?.count ?? 0;
                        const hasQuestions = questionCount > 0;

                        return (
                            <PracticeEntryCard
                                key={category.id}
                                href={`/practice/${category.id}`}
                                title={category.name}
                                description={category.description || "練習問題"}
                                iconName={iconName}
                                badgeText={`${questionCount}問`}
                                badgeColorClass="text-stone-500 bg-stone-100"
                                bgClass={hasQuestions ? 'bg-primary/10 text-primary' : 'bg-stone-100 text-stone-400'}
                                accentColorClass={hasQuestions ? 'text-stone-800 group-hover:text-primary' : 'text-stone-400'}
                                isLocked={!hasQuestions}
                                buttonText="START QUIZ"
                            />
                        );
                    })}
                </div>
            </div>
        </div>
    );
}
