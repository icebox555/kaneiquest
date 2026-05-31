import { Users, DollarSign, Activity, FileText, TrendingUp, Target, BookOpen, Trophy } from "lucide-react";
import type { LucideIcon } from "lucide-react";
import { GlassTable } from "@/components/ui/GlassTable";
import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import { UserListFilters } from "@/components/admin/UserListFilters";

function StatCard({
    title,
    value,
    sub,
    icon: Icon,
    borderColor,
    iconColor,
}: {
    title: string;
    value: string | number;
    sub: string;
    icon: LucideIcon;
    borderColor: string;
    iconColor: string;
}) {
    return (
        <div className={`admin-glass p-5 rounded-xl border-l-4 ${borderColor}`}>
            <div className="flex justify-between items-start">
                <div className="min-w-0 flex-1">
                    <p className="text-xs text-slate-400 uppercase font-bold tracking-wider">{title}</p>
                    <h3 className="text-2xl font-bold text-white mt-1">{value}</h3>
                </div>
                <Icon className={`w-5 h-5 shrink-0 ml-2 ${iconColor}`} />
            </div>
            <p className="text-xs text-slate-500 mt-2">{sub}</p>
        </div>
    );
}

export default async function AdminPage({
    searchParams,
}: {
    searchParams: Promise<{ [key: string]: string | string[] | undefined }>;
}) {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) redirect("/login");

    const { data: profile } = await supabase
        .from("profiles")
        .select("role")
        .eq("id", user.id)
        .single();

    if (profile?.role !== "admin") redirect("/dashboard");

    const { sort: sortParam, order: orderParam, plan: planParam } = await searchParams;
    const sort = typeof sortParam === "string" ? sortParam : "created_at";
    const order = typeof orderParam === "string" ? orderParam : "desc";
    const plan = typeof planParam === "string" ? planParam : "all";

    // ---- Date ranges ----
    const sevenDaysAgo = new Date();
    sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7);
    const thirtyDaysAgo = new Date();
    thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);

    // ---- Parallel data fetching ----
    let userListQuery = supabase.from("profiles").select("*");
    if (plan !== "all") userListQuery = userListQuery.eq("plan", plan);
    userListQuery = userListQuery.order(sort, { ascending: order === "asc" });

    const results = await Promise.allSettled([
        userListQuery.limit(20),
        supabase.from("profiles").select("*", { count: "exact", head: true }),
        supabase.from("questions").select("*", { count: "exact", head: true }),
        supabase.from("profiles").select("*", { count: "exact", head: true }).eq("plan", "pro"),
        supabase.from("exam_attempts").select("*", { count: "exact", head: true }).eq("is_completed", true),
        supabase.from("question_attempts").select("*", { count: "exact", head: true }),
        supabase.from("question_attempts").select("*", { count: "exact", head: true }).eq("is_correct", true),
        supabase.from("question_attempts").select("*", { count: "exact", head: true }).gt("created_at", sevenDaysAgo.toISOString()),
        supabase.from("question_attempts").select("user_id").gt("created_at", thirtyDaysAgo.toISOString()),
        supabase.from("question_attempts").select("user_id").gt("created_at", sevenDaysAgo.toISOString()),
        supabase.from("exam_attempts").select("score").eq("is_completed", true).not("score", "is", null),
        supabase.from("categories").select("id, name").order("order"),
        supabase.from("questions").select("category_id"),
    ]);

    const profiles    = results[0].status === 'fulfilled' ? results[0].value.data : null;
    const totalUsers  = results[1].status === 'fulfilled' ? results[1].value.count : null;
    const totalQuestions = results[2].status === 'fulfilled' ? results[2].value.count : null;
    const proUsers    = results[3].status === 'fulfilled' ? results[3].value.count : null;
    const completedExams = results[4].status === 'fulfilled' ? results[4].value.count : null;
    const totalAnswers   = results[5].status === 'fulfilled' ? results[5].value.count : null;
    const correctAnswers = results[6].status === 'fulfilled' ? results[6].value.count : null;
    const answersThisWeek = results[7].status === 'fulfilled' ? results[7].value.count : null;
    const recentAttemptUsers = results[8].status === 'fulfilled' ? results[8].value.data : [];
    const weekAttemptUsers   = results[9].status === 'fulfilled' ? results[9].value.data : [];
    const avgScoreRows  = results[10].status === 'fulfilled' ? results[10].value.data : [];
    const allCategories = results[11].status === 'fulfilled' ? results[11].value.data : [];
    const allQuestions  = results[12].status === 'fulfilled' ? results[12].value.data : [];

    // ---- Derived metrics ----
    const activeUsers30d = new Set(recentAttemptUsers?.map(r => r.user_id) ?? []).size;
    const activeUsers7d = new Set(weekAttemptUsers?.map(r => r.user_id) ?? []).size;

    const correctRate = totalAnswers && totalAnswers > 0
        ? Math.round(((correctAnswers ?? 0) / totalAnswers) * 100)
        : 0;

    const avgScore = avgScoreRows && avgScoreRows.length > 0
        ? Math.round(avgScoreRows.reduce((sum, r) => sum + (r.score ?? 0), 0) / avgScoreRows.length)
        : 0;

    const revenue = (proUsers || 0) * 980;
    const conversionRate = totalUsers ? Math.round(((proUsers ?? 0) / totalUsers) * 100) : 0;

    // ---- Category breakdown ----
    const categoryCounts = new Map<string, number>();
    allQuestions?.forEach(q => {
        categoryCounts.set(q.category_id, (categoryCounts.get(q.category_id) ?? 0) + 1);
    });
    const categoryStats = (allCategories ?? []).map(c => ({
        name: c.name,
        count: categoryCounts.get(c.id) ?? 0,
    }));
    const maxCategoryCount = Math.max(...categoryStats.map(c => c.count), 1);

    // ---- User table ----
    const recentUsers = (profiles ?? []).map(p => ({
        id: p.id,
        name: p.name || p.email,
        email: p.email,
        plan: p.plan || "free",
        joinedAt: p.created_at ? new Date(p.created_at).toLocaleDateString("ja-JP") : "N/A",
    }));

    const columns = [
        { header: "名前", accessor: "name" as const },
        { header: "メール", accessor: "email" as const },
        {
            header: "プラン",
            accessor: (item: typeof recentUsers[0]) => (
                <span className={`text-xs font-bold px-2 py-1 rounded ${item.plan === "pro"
                    ? "bg-primary/20 text-primary"
                    : item.plan === "admin"
                        ? "bg-red-500/20 text-red-400"
                        : "bg-white/5 text-slate-400"
                    }`}>
                    {item.plan === "pro" ? "Pro" : item.plan === "admin" ? "Admin" : "Free"}
                </span>
            ),
        },
        { header: "登録日", accessor: "joinedAt" as const },
    ];

    return (
        <div className="p-8 pt-24 text-white">
            <div className="mb-8">
                <h1 className="text-3xl font-bold text-white">管理ダッシュボード</h1>
                <p className="text-slate-400 mt-2">システム全体の概要</p>
            </div>

            {/* ---- ユーザー・収益 ---- */}
            <p className="text-xs text-slate-500 uppercase tracking-widest font-semibold mb-3">ユーザー・収益</p>
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4 mb-6">
                <StatCard
                    title="総ユーザー数"
                    value={totalUsers ?? 0}
                    sub={`Pro ${proUsers ?? 0}名 / Free ${(totalUsers ?? 0) - (proUsers ?? 0)}名`}
                    icon={Users}
                    borderColor="border-primary"
                    iconColor="text-primary"
                />
                <StatCard
                    title="Pro 転換率"
                    value={`${conversionRate}%`}
                    sub={`${proUsers ?? 0}名がProプラン加入中`}
                    icon={TrendingUp}
                    borderColor="border-secondary"
                    iconColor="text-secondary"
                />
                <StatCard
                    title="今週のアクティブ"
                    value={`${activeUsers7d}名`}
                    sub={`30日間: ${activeUsers30d}名`}
                    icon={Activity}
                    borderColor="border-orange-500"
                    iconColor="text-orange-400"
                />
                <StatCard
                    title="推定月収"
                    value={`¥${revenue.toLocaleString()}`}
                    sub={`Pro ${proUsers ?? 0}名 × ¥980`}
                    icon={DollarSign}
                    borderColor="border-green-500"
                    iconColor="text-green-400"
                />
            </div>

            {/* ---- 学習活動 ---- */}
            <p className="text-xs text-slate-500 uppercase tracking-widest font-semibold mb-3">学習活動</p>
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4 mb-8">
                <StatCard
                    title="今週の回答数"
                    value={(answersThisWeek ?? 0).toLocaleString()}
                    sub={`累計 ${(totalAnswers ?? 0).toLocaleString()} 問`}
                    icon={BookOpen}
                    borderColor="border-blue-500"
                    iconColor="text-blue-400"
                />
                <StatCard
                    title="全体正答率"
                    value={`${correctRate}%`}
                    sub={`${(correctAnswers ?? 0).toLocaleString()} / ${(totalAnswers ?? 0).toLocaleString()} 問正解`}
                    icon={Target}
                    borderColor="border-primary"
                    iconColor="text-primary"
                />
                <StatCard
                    title="完了した模擬試験"
                    value={completedExams ?? 0}
                    sub={`平均スコア ${avgScore}%`}
                    icon={Trophy}
                    borderColor="border-secondary"
                    iconColor="text-secondary"
                />
                <Link href="/admin/questions" className="block transition-transform hover:scale-105">
                    <StatCard
                        title="問題総数"
                        value={(totalQuestions ?? 0).toLocaleString()}
                        sub="クリックして問題管理へ →"
                        icon={FileText}
                        borderColor="border-orange-500"
                        iconColor="text-orange-400"
                    />
                </Link>
            </div>

            {/* ---- カテゴリ別問題数 ---- */}
            <div className="admin-glass rounded-xl p-6 mb-8">
                <h3 className="font-bold text-white text-lg mb-5">カテゴリ別 問題数</h3>
                <div className="space-y-3">
                    {categoryStats.map(c => (
                        <div key={c.name} className="flex items-center gap-4">
                            <span className="text-sm text-slate-300 w-44 shrink-0 truncate">{c.name}</span>
                            <div className="flex-1 bg-white/5 rounded-full h-2 overflow-hidden">
                                <div
                                    className="bg-gradient-to-r from-primary to-primary/50 h-full rounded-full"
                                    style={{ width: `${Math.round((c.count / maxCategoryCount) * 100)}%` }}
                                />
                            </div>
                            <span className={`text-sm w-10 text-right shrink-0 ${c.count === 0 ? "text-slate-600" : "text-slate-400"}`}>
                                {c.count}問
                            </span>
                        </div>
                    ))}
                </div>
            </div>

            {/* ---- ユーザー一覧 ---- */}
            <div>
                <div className="mb-4 flex items-center justify-between">
                    <h3 className="font-bold text-white text-lg">ユーザー一覧</h3>
                    <Link href="/admin/users" className="text-xs text-slate-400 hover:text-white transition-colors">
                        すべて見る →
                    </Link>
                </div>
                <UserListFilters />
                <GlassTable
                    data={recentUsers}
                    columns={columns}
                    keyField="id"
                />
            </div>
        </div>
    );
}
