import { Users, Mail } from "lucide-react";
import { GlassTable } from "@/components/ui/GlassTable";
import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import { UserListFilters } from "@/components/admin/UserListFilters";
import { UserEditDialog } from "@/components/admin/UserEditDialog";

export default async function UsersPage({
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
    const { data: profiles } = await query.limit(50);

    // Transform profiles for the table
    const userList = profiles?.map(p => ({
        id: p.id,
        name: p.name || "",
        email: p.email,
        plan: p.plan || 'Free',
        status: 'Active',
        joinedAt: p.created_at ? new Date(p.created_at).toLocaleDateString() : 'N/A'
    })) || [];

    const columns = [
        {
            header: "ユーザー",
            accessor: (item: typeof userList[0]) => (
                <div className="flex items-center gap-3">
                    <div className="w-8 h-8 rounded-full bg-slate-700 flex items-center justify-center text-xs font-bold text-white">
                        {(item.name || item.email || "?").slice(0, 1)}
                    </div>
                    <div>
                        <div className="font-medium text-white">{item.name || "未設定"}</div>
                        <div className="text-xs text-slate-500">{item.email}</div>
                    </div>
                </div>
            ),
            className: "min-w-[200px]"
        },
        {
            header: "プラン",
            accessor: (item: typeof userList[0]) => (
                <span className={`font-bold ${item.plan === "Pro" ? "text-primary" : "text-slate-400"}`}>
                    {item.plan}
                </span>
            ),
            className: "w-24"
        },
        {
            header: "ステータス",
            accessor: (item: typeof userList[0]) => (
                <span className={`px-2 py-1 rounded text-xs font-bold ${item.status === "Active" ? "bg-green-500/20 text-green-400" :
                    item.status === "Inactive" ? "bg-slate-500/20 text-slate-400" :
                        "bg-red-500/20 text-red-400"
                    }`}>
                    {item.status}
                </span>
            ),
            className: "w-24"
        },
        { header: "登録日", accessor: "joinedAt" as const, className: "w-32" },
        {
            header: "編集",
            accessor: (item: typeof userList[0]) => (
                <UserEditDialog user={item} />
            ),
            className: "w-16"
        },
    ];

    return (
        <div className="p-8 pt-24 text-white">
            <div className="flex justify-between items-center mb-8">
                <div>
                    <h1 className="text-3xl font-bold">ユーザー管理</h1>
                    <p className="text-slate-400 mt-1">登録ユーザーの状況確認と管理</p>
                </div>
            </div>

            <UserListFilters />

            <GlassTable
                data={userList}
                columns={columns}
                keyField="id"
            />
        </div>
    );
}
