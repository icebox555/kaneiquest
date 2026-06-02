import Link from "next/link";
import { BookOpen, Trophy, Crown, ArrowRight, Bookmark, Activity, BarChart2 } from "lucide-react";
import { GlassTable } from "@/components/ui/GlassTable";
import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import { AnnouncementBanner } from "@/components/dashboard/AnnouncementBanner";
import { ScoreHistoryChart } from "@/components/dashboard/analytics/ScoreHistoryChart";
import { CategoryRadarChart } from "@/components/dashboard/analytics/CategoryRadarChart";
import { MotionWrapper } from "@/components/ui/MotionWrapper";
import { RankingBoard } from "@/components/ranking/RankingBoard";
import { RandomQuizButton } from "@/components/practice/RandomQuizButton";
import { DailyQuestCard } from "@/components/dashboard/DailyQuestCard";
import { ExamCountdown } from "@/components/dashboard/ExamCountdown";
import { StreakCard } from "@/components/dashboard/StreakCard";
import { CollapsibleSection } from "@/components/dashboard/CollapsibleSection";
import { getWeaknessAnalysis } from "@/lib/ai/coach";
import { getSchedule } from "@/lib/actions/schedule";
import { ShareButton } from "@/components/gamification/ShareButton";
import { HeartActionClaimer } from "@/components/gamification/HeartActionClaimer";

export default async function DashboardPage() {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    const { data: profile } = await supabase
        .from("profiles")
        .select("*")
        .eq("id", user.id)
        .single();

    // Stats
    const level = profile?.level ?? 1;
    const currentXp = profile?.xp ?? 0;
    const nextLevelXp = level * 100;
    const progressPercent = Math.min(100, Math.floor((currentXp / nextLevelXp) * 100));
    const plan = profile?.plan === 'pro' ? 'PRO Plan' : 'Free Plan';

    // Fetch Rankings (limit 5 for dashboard)
    const { data: rankings } = await supabase
        .from("leaderboard")
        .select("*")
        .limit(5);

    // Fetch Announcement
    const { data: announcementData } = await supabase
        .from("app_settings")
        .select("value")
        .eq("key", "announcement")
        .single();

    const announcement = announcementData?.value as { message: string; active: boolean } | undefined;

    // Study Schedule (for countdown)
    const schedule = await getSchedule();

    // Today's question count
    const todayStart = new Date();
    todayStart.setHours(0, 0, 0, 0);
    const { count: todayCount } = await supabase
        .from("question_attempts")
        .select("*", { count: "exact", head: true })
        .eq("user_id", user.id)
        .gte("created_at", todayStart.toISOString());

    // Streak calculation
    const { data: allTasks } = await supabase
        .from("study_tasks")
        .select("scheduled_date, status")
        .eq("user_id", user.id)
        .order("scheduled_date", { ascending: false })
        .limit(365);

    const completedDates = new Set(
        (allTasks ?? [])
            .filter(t => t.status === "completed")
            .map(t => t.scheduled_date)
    );
    let streak = 0;
    const cur = new Date();
    cur.setHours(0, 0, 0, 0);
    for (let i = 0; i < 365; i++) {
        const dateStr = cur.toISOString().split("T")[0];
        if (completedDates.has(dateStr)) {
            streak++;
            cur.setDate(cur.getDate() - 1);
        } else {
            break;
        }
    }

    // AI Coach Weakness Analysis
    const weaknesses = await getWeaknessAnalysis(user.id).catch(() => []);
    const weaknessName = weaknesses.length > 0 ? weaknesses[0].categoryName : undefined;

    // Fetch Recent History (Real Data)
    const { data: attempts } = await supabase
        .from("exam_attempts")
        .select(`
            id,
            score,
            total_questions,
            completed_at,
            is_completed,
            category_id,
            exam_year,
            categories (
                name
            )
        `)
        .eq("user_id", user.id)
        .eq("is_completed", true)
        .order("completed_at", { ascending: false })
        .limit(5);

    const { count: totalAttempts } = await supabase
        .from("exam_attempts")
        .select("*", { count: 'exact', head: true })
        .eq("user_id", user.id)
        .eq("is_completed", true);

    // --- Analytics Data Fetching ---
    // 1. History Data
    const { data: historyDataRaw } = await supabase
        .from("exam_attempts")
        .select("completed_at, score, total_questions")
        .eq("user_id", user.id)
        .eq("is_completed", true)
        .order("completed_at", { ascending: true }) // Oldest first for chart
        .limit(20);

    const historyData = historyDataRaw?.map(h => ({
        date: new Date(h.completed_at!).toLocaleDateString([], { month: '2-digit', day: '2-digit' }),
        score: Math.round((h.score! / h.total_questions!) * 100)
    })) || [];

    // 2. Category Radar Data
    const { data: categoryAttempts } = await supabase
        .from("exam_attempts")
        .select(`
            score,
            total_questions,
            categories (
                name
            )
        `)
        .eq("user_id", user.id)
        .eq("is_completed", true)
        .not("category_id", "is", null);

    // Aggregate by category
    const categoryStats: Record<string, { totalScore: number, totalMax: number }> = {};

    categoryAttempts?.forEach(a => {
        const catName = (a.categories as unknown as { name: string })?.name || "Unknown";
        if (!categoryStats[catName]) {
            categoryStats[catName] = { totalScore: 0, totalMax: 0 };
        }
        categoryStats[catName].totalScore += a.score!;
        categoryStats[catName].totalMax += a.total_questions!;
    });

    const radarData = Object.keys(categoryStats).map(subject => ({
        subject,
        A: Math.round((categoryStats[subject].totalScore / categoryStats[subject].totalMax) * 100),
        fullMark: 100
    }));

    return (
        <div className="min-h-screen bg-transparent pt-20 pb-12">
            <div className="container mx-auto px-4 md:px-6">
                <HeartActionClaimer />

                <MotionWrapper className="mb-5 md:mb-8 flex items-center justify-between gap-3 flex-wrap">
                    <div>
                        <h1 className="text-2xl md:text-3xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-stone-900 to-stone-500">
                            マイページ
                        </h1>
                        <p className="text-sm md:text-base text-stone-500 mt-1 md:mt-2">
                            学習の進捗を確認しましょう
                        </p>
                    </div>
                    <div className="flex items-center gap-2 flex-wrap justify-end">
                        <ShareButton userId={user.id} />
                        <div className={`glass px-4 py-2 rounded-full flex items-center gap-2 border-primary/20 ${profile?.plan === 'pro' ? 'text-primary' : 'text-stone-500'}`}>
                            <Crown className="w-5 h-5" />
                            <span className="font-bold uppercase">{plan}</span>
                        </div>
                    </div>
                </MotionWrapper>

                {/* Announcement Banner */}
                {announcement && (
                    <MotionWrapper delay={0.1}>
                        <AnnouncementBanner
                            message={announcement.message}
                            active={announcement.active}
                        />
                    </MotionWrapper>
                )}

                {/* AI Learning Coach */}
                <MotionWrapper delay={0.15} className="mb-4 md:mb-6">
                    <DailyQuestCard weaknessName={weaknessName} />
                </MotionWrapper>

                <div className="grid gap-3 md:gap-6 grid-cols-2 lg:grid-cols-3">
                    {/* Exam Countdown */}
                    {schedule && (
                        <MotionWrapper delay={0.2}>
                            <ExamCountdown
                                examDate={schedule.exam_date}
                                dailyGoalMinutes={schedule.daily_goal_minutes}
                            />
                        </MotionWrapper>
                    )}

                    {/* Streak Card */}
                    <MotionWrapper delay={0.25}>
                        <StreakCard streak={streak} totalCompleted={completedDates.size} />
                    </MotionWrapper>

                    {/* Stats Card */}
                    <MotionWrapper delay={0.2} className="glass p-4 md:p-6 rounded-2xl space-y-3 md:space-y-4">
                        <div className="flex items-center gap-3 md:gap-4">
                            <div className="p-2.5 md:p-3 rounded-xl bg-primary/10 text-primary">
                                <Trophy className="w-5 h-5 md:w-6 md:h-6" />
                            </div>
                            <div>
                                <h3 className="text-base md:text-lg font-bold text-stone-800">現在のレベル</h3>
                                <p className="text-xs md:text-sm text-stone-500">ランク {Math.floor(level / 10) + 1} (Lv.{level})</p>
                            </div>
                        </div>
                        <div className="h-2 w-full bg-stone-200 rounded-full overflow-hidden">
                            <div
                                className="h-full bg-gradient-to-r from-primary to-orange-500 transition-all duration-1000"
                                style={{ width: `${progressPercent}%` }}
                            />
                        </div>
                        <p className="text-xs text-right text-stone-500">次のレベルまであと {nextLevelXp - currentXp} XP</p>
                    </MotionWrapper>

                    {/* Progress Card */}
                    <MotionWrapper delay={0.3} className="glass p-4 md:p-6 rounded-2xl space-y-3 md:space-y-4">
                        <div className="flex items-center gap-3 md:gap-4">
                            <div className="p-2.5 md:p-3 rounded-xl bg-secondary/10 text-secondary">
                                <BookOpen className="w-5 h-5 md:w-6 md:h-6" />
                            </div>
                            <div>
                                <h3 className="text-base md:text-lg font-bold text-stone-800">今日の問題数</h3>
                                <p className="text-xs md:text-sm text-stone-500">累計 {totalAttempts || 0} セッション</p>
                            </div>
                        </div>
                        <div className="flex items-end justify-between">
                            <div>
                                <span className="text-4xl md:text-5xl font-extrabold text-stone-800">{todayCount ?? 0}</span>
                                <span className="text-stone-500 ml-1 text-base md:text-lg">問</span>
                            </div>
                            {schedule && (
                                <span className="text-xs text-stone-400 mb-1 text-right">
                                    目標: {schedule.daily_goal_minutes}分/日
                                </span>
                            )}
                        </div>
                    </MotionWrapper>
                </div>

                {/* Ranking Section */}
                <div className="mt-6 md:mt-8">
                    <div className="flex items-center justify-between mb-3 md:mb-4">
                        <h2 className="text-lg md:text-xl font-bold text-stone-800">週間ランキング (TOP 5)</h2>
                        <Link href="/ranking" className="text-sm font-bold text-primary flex items-center gap-1 hover:underline">
                            すべて見る <ArrowRight className="w-3 h-3" />
                        </Link>
                    </div>
                    <RankingBoard rankings={rankings || []} currentUserId={user.id} />
                </div>

                {/* Analytics Section */}
                <CollapsibleSection title="学習分析" className="mt-6 md:mt-8">
                    <div className="grid gap-4 md:gap-6 lg:grid-cols-2">
                        <MotionWrapper delay={0.05} className="glass p-4 md:p-6 rounded-2xl">
                            <div className="flex items-center gap-3 mb-4 md:mb-6">
                                <div className="p-2 rounded-lg bg-amber-500/10 text-amber-500">
                                    <Activity className="w-5 h-5" />
                                </div>
                                <h3 className="text-base md:text-lg font-bold text-stone-800">スコア推移</h3>
                            </div>
                            <div className="h-[220px] md:h-[300px]">
                                <ScoreHistoryChart data={historyData} />
                            </div>
                        </MotionWrapper>

                        <MotionWrapper delay={0.1} className="glass p-4 md:p-6 rounded-2xl">
                            <div className="flex items-center gap-3 mb-4 md:mb-6">
                                <div className="p-2 rounded-lg bg-blue-500/10 text-blue-500">
                                    <BarChart2 className="w-5 h-5" />
                                </div>
                                <h3 className="text-base md:text-lg font-bold text-stone-800">分野別分析</h3>
                            </div>
                            <div className="h-[220px] md:h-[300px]">
                                <CategoryRadarChart data={radarData} />
                            </div>
                        </MotionWrapper>
                    </div>
                </CollapsibleSection>

                <div className="mt-6 md:mt-8">
                    <MotionWrapper delay={0.6}>
                        <h2 className="text-lg md:text-xl font-bold text-stone-800 mb-3 md:mb-4">学習を始める</h2>
                    </MotionWrapper>
                    <div className="grid gap-3 md:gap-4 md:grid-cols-2 lg:grid-cols-3">
                        <MotionWrapper delay={0.7}>
                            <div className="h-full">
                                <RandomQuizButton />
                            </div>
                        </MotionWrapper>

                        <MotionWrapper delay={0.8}>
                            <Link href="/practice" className="glass glass-hover p-4 md:p-6 rounded-2xl group block h-full relative overflow-hidden">
                                <div className="absolute top-0 right-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
                                    <BookOpen className="w-20 h-20 md:w-24 md:h-24 text-primary" />
                                </div>
                                <h3 className="text-base md:text-lg font-bold text-stone-800 group-hover:text-primary transition-colors">
                                    演習選択モード
                                </h3>
                                <p className="text-xs md:text-sm text-stone-500 mt-1 md:mt-2 mb-3 md:mb-4">
                                    分野別に問題を解いて実力を伸ばす
                                </p>
                                <span className="text-xs font-bold text-primary flex items-center gap-1 group-hover:gap-2 transition-all">
                                    START <ArrowRight className="w-3 h-3" />
                                </span>
                            </Link>
                        </MotionWrapper>

                        <MotionWrapper delay={0.9}>
                            <Link href="/practice/review" className="glass glass-hover p-4 md:p-6 rounded-2xl group block h-full relative overflow-hidden">
                                <div className="absolute top-0 right-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
                                    <Bookmark className="w-20 h-20 md:w-24 md:h-24 text-yellow-500" />
                                </div>
                                <h3 className="text-base md:text-lg font-bold text-stone-800 group-hover:text-yellow-400 transition-colors">
                                    復習モード
                                </h3>
                                <p className="text-xs md:text-sm text-stone-500 mt-1 md:mt-2 mb-3 md:mb-4">
                                    間違えた問題やブックマークを重点的に
                                </p>
                                <span className="text-xs font-bold text-yellow-500 flex items-center gap-1 group-hover:gap-2 transition-all">
                                    REVIEW <ArrowRight className="w-3 h-3" />
                                </span>
                            </Link>
                        </MotionWrapper>

                    </div>
                </div>

                <MotionWrapper delay={0.9} className="mt-6 md:mt-8">
                    <h2 className="text-lg md:text-xl font-bold text-stone-800 mb-3 md:mb-4">最近の学習履歴</h2>
                    <GlassTable
                        data={attempts?.map(a => ({
                            id: a.id,
                            date: new Date(a.completed_at!).toLocaleDateString(),
                            category: a.exam_year
                                ? `第${a.exam_year}回 国家試験`
                                : (a.categories as unknown as { name: string })?.name || 'Practice',
                            score: `${a.score}/${a.total_questions}`,
                            status: (a.score! / a.total_questions!) >= 0.6 ? "Pass" : "Review"
                        })) || []}
                        columns={[
                            { header: "日付", accessor: "date" },
                            { header: "分野", accessor: "category" },
                            { header: "スコア", accessor: "score" },
                            {
                                header: "状態",
                                accessor: (item: any) => (
                                    <span className={`px-2 py-1 rounded text-xs font-bold ${item.status === "Pass" ? "bg-green-500/20 text-green-400" : "bg-yellow-500/20 text-yellow-400"
                                        }`}>
                                        {item.status}
                                    </span>
                                )
                            },
                        ]}
                        keyField="id"
                    />
                </MotionWrapper>
            </div>
        </div>
    );
}
