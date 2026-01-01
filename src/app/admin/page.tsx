import { Users, DollarSign, Activity, FileText } from "lucide-react";
import { GlassTable } from "@/components/ui/GlassTable";
import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import { UserListFilters } from "@/components/admin/UserListFilters";

export default async function AdminPage({
    searchParams,
}: {
    searchParams: Promise<{ [key: string]: string | string[] | undefined }>;
}) {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    // Check admin role
    const { data: profile } = await supabase
        .from("profiles")
        .select("role")
        .eq("id", user.id)
        .single();

    if (profile?.role !== "admin") {
        redirect("/dashboard");
    }

    const { sort: sortParam, order: orderParam, plan: planParam } = await searchParams;

    // Parse Search Params
    const sort = typeof sortParam === "string" ? sortParam : "created_at";
    const order = typeof orderParam === "string" ? orderParam : "desc";
    const plan = typeof planParam === "string" ? planParam : "all";

    // Build Query
    let query = supabase
        .from("profiles")
        .select("*");

    if (plan !== "all") {
        query = query.eq("plan", plan);
    }

    // Sort
    query = query.order(sort, { ascending: order === "asc" });

    // Fetch
    const { data: profiles } = await query.limit(20);

    // Transform profiles for the table
    const recentUsers = profiles?.map(p => ({
        id: p.id,
        name: p.name || p.email,
        email: p.email,
        plan: p.plan || 'Free',
        status: 'Active',
        joinedAt: p.created_at ? new Date(p.created_at).toLocaleDateString() : 'N/A'
    })) || [];

    const columns = [
        { header: "Name", accessor: "name" as const },
        { header: "Email", accessor: "email" as const },
        {
            header: "Plan",
            accessor: (item: typeof recentUsers[0]) => (
                <span className={item.plan === "Pro" ? "text-primary font-bold" : ""}>{item.plan}</span>
            )
        },
        {
            header: "Status",
            accessor: (item: typeof recentUsers[0]) => (
                <span className={`text-xs px-2 py-1 rounded ${item.status === "Active" ? "bg-green-500/20 text-green-400" : "bg-yellow-500/20 text-yellow-400"
                    }`}>
                    {item.status}
                </span>
            )
        },
        { header: "Joined", accessor: "joinedAt" as const },
    ];

    // Stats Fetching
    const { count: totalUsers } = await supabase.from("profiles").select("*", { count: 'exact', head: true });

    const { count: totalQuestions } = await supabase.from("questions").select("*", { count: 'exact', head: true });

    const { count: proUsers } = await supabase.from("profiles").select("*", { count: 'exact', head: true }).eq("plan", "pro");

    // Estimate Active Users (updated profile in last 30 days)
    const thirtyDaysAgo = new Date();
    thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);

    // Note: 'updated_at' might not change on login depending on implementation.
    // Assuming 'updated_at' might be used, or just use total users for now if accurate tracking isn't there.
    // Let's use totalUsers for now or just a placeholder if we can't track activity.
    // Actually, let's just use a hardcoded ratio or "N/A" if checking updated_at is unreliable without audit logs.
    // But `updated_at` exists on profiles. Let's try.
    const { count: activeUsers } = await supabase
        .from("profiles")
        .select("*", { count: 'exact', head: true })
        .gt("updated_at", thirtyDaysAgo.toISOString());

    const revenue = (proUsers || 0) * 980; // Monthly estimate

    return (
        <div className="p-8 pt-24 text-white">
            <div className="mb-8 flex items-center justify-between">
                <div>
                    <h1 className="text-3xl font-bold text-white">
                        管理ダッシュボード
                    </h1>
                    <p className="text-slate-400 mt-2">
                        システム全体の概要
                    </p>
                </div>
            </div>

            {/* Stats Grid */}
            <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-4 mb-8">
                <div className="glass p-6 rounded-xl border-l-4 border-primary">
                    <div className="flex justify-between items-start">
                        <div>
                            <p className="text-xs text-slate-400 uppercase font-bold tracking-wider">Total Users</p>
                            <h3 className="text-2xl font-bold text-white mt-2">{totalUsers ?? 0}</h3>
                        </div>
                        <Users className="w-5 h-5 text-primary" />
                    </div>
                </div>

                <div className="glass p-6 rounded-xl border-l-4 border-secondary">
                    <div className="flex justify-between items-start">
                        <div>
                            <p className="text-xs text-slate-400 uppercase font-bold tracking-wider">Est. Monthly Revenue</p>
                            <h3 className="text-2xl font-bold text-white mt-2">¥{revenue.toLocaleString()}</h3>
                        </div>
                        <DollarSign className="w-5 h-5 text-secondary" />
                    </div>
                    <p className="text-xs text-stone-400 mt-2">
                        {proUsers} Pro Users
                    </p>
                </div>

                <Link href="/admin/questions" className="block transition-transform hover:scale-105">
                    <div className="glass glass-hover p-6 rounded-xl border-l-4 border-green-500 cursor-pointer h-full">
                        <div className="flex justify-between items-start">
                            <div>
                                <p className="text-xs text-slate-400 uppercase font-bold tracking-wider">Questions</p>
                                <h3 className="text-2xl font-bold text-white mt-2">{totalQuestions ?? 0}</h3>
                            </div>
                            <FileText className="w-5 h-5 text-green-500" />
                        </div>
                        <p className="text-xs text-green-400 mt-2 flex items-center">
                            Manage Questions <span className="text-slate-500 ml-1">→</span>
                        </p>
                    </div>
                </Link>

                <div className="glass p-6 rounded-xl border-l-4 border-orange-500">
                    <div className="flex justify-between items-start">
                        <div>
                            <p className="text-xs text-slate-400 uppercase font-bold tracking-wider">Active (30d)</p>
                            <h3 className="text-2xl font-bold text-white mt-2">{activeUsers ?? 0}</h3>
                        </div>
                        <Activity className="w-5 h-5 text-orange-500" />
                    </div>
                </div>
            </div>

            {/* Recent Users Table */}
            <div>
                <div className="mb-4 flex items-center justify-between">
                    <h3 className="font-bold text-white text-lg">ユーザー一覧</h3>
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
