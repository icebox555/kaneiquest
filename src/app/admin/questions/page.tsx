import { SearchInput } from "@/components/admin/SearchInput";
import { GlassTable } from "@/components/ui/GlassTable";
import { Button } from "@/components/ui/Button";
import { DeleteQuestionButton } from "@/components/admin/DeleteQuestionButton";
import { PublishToggleButton } from "@/components/admin/PublishToggleButton";
import { Plus, Edit } from "lucide-react";
import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import Link from "next/link";

export default async function QuestionsPage({ searchParams }: { searchParams: Promise<{ year?: string, q?: string, status?: string }> }) {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    // Role check
    const { data: profile } = await supabase
        .from("profiles")
        .select("role")
        .eq("id", user.id)
        .single();

    if (profile?.role !== "admin") {
        redirect("/dashboard");
    }

    // Await params
    const { year, q, status: statusParam } = await searchParams;
    const statusFilter = statusParam === 'draft' ? 'draft' : statusParam === 'published' ? 'published' : null;

    // Validate query parameters to prevent DoS via overly long strings
    // and injection via malformed year values.
    const MAX_SEARCH_LEN = 200;
    const safeQ = typeof q === "string" ? q.slice(0, MAX_SEARCH_LEN) : undefined;

    let safeYear: number | undefined;
    if (year) {
        const parsed = parseInt(year, 10);
        if (!isNaN(parsed) && parsed >= 1 && parsed <= 9999) {
            safeYear = parsed;
        }
    }

    // Build query
    let query = supabase
        .from("questions")
        .select(`
            *,
            categories (
                name
            )
        `)
        .order("created_at", { ascending: false });

    if (safeYear !== undefined) {
        query = query.eq('exam_year', safeYear);
    }

    if (safeQ) {
        query = query.ilike('content', `%${safeQ}%`);
    }

    if (statusFilter) {
        query = query.eq('status', statusFilter);
    }

    const { data: questions } = await query;

    // Transform for table
    const questionList = questions?.map(q => ({
        id: q.id,
        content: q.content.length > 50 ? q.content.substring(0, 50) + "..." : q.content,
        category: (q.categories as unknown as { name: string })?.name || 'Unknown',
        difficulty: q.difficulty === 1 ? 'Easy' : q.difficulty === 2 ? 'Medium' : 'Hard',
        exam_year: q.exam_year || '-',
        question_number: q.question_number || '-',
        status: (q.status ?? 'published') as 'draft' | 'published',
        has_explanation: !!q.explanation?.trim(),
    })) || [];

    const draftCount = questions?.filter(q => (q.status ?? 'published') === 'draft').length ?? 0;

    const columns = [
        { header: "No.", accessor: "question_number" as const },
        { header: "Year", accessor: "exam_year" as const },
        { header: "Question", accessor: "content" as const },
        { header: "Category", accessor: "category" as const },
        {
            header: "解説",
            accessor: (item: any) => (
                <span className={`text-xs px-2 py-0.5 rounded-full ${item.has_explanation ? 'bg-blue-500/20 text-blue-300' : 'bg-slate-700 text-slate-500'}`}>
                    {item.has_explanation ? 'あり' : 'なし'}
                </span>
            )
        },
        {
            header: "ステータス",
            accessor: (item: any) => (
                <PublishToggleButton questionId={item.id} currentStatus={item.status} />
            )
        },
        {
            header: "Actions",
            accessor: (item: any) => (
                <div className="flex gap-2">
                    <Link href={`/admin/questions/${item.id}`}>
                        <Button variant="ghost" size="sm" className="h-8 w-8 p-0">
                            <Edit className="w-4 h-4" />
                        </Button>
                    </Link>
                    <DeleteQuestionButton questionId={item.id} />
                </div>
            )
        }
    ];

    return (
        <div className="p-8 pt-24 text-white">
            <div className="mb-8 flex items-center justify-between">
                <div>
                    <h1 className="text-3xl font-bold text-white">
                        問題管理
                    </h1>
                    <p className="text-slate-400 mt-2">
                        演習問題の追加・編集・削除
                    </p>
                </div>
                <Link href="/admin/questions/new">
                    <Button variant="premium" className="gap-2">
                        <Plus className="w-4 h-4" /> 新規作成
                    </Button>
                </Link>
            </div>

            {draftCount > 0 && (
                <div className="mb-4 flex items-center gap-2 bg-yellow-500/10 border border-yellow-500/30 rounded-lg px-4 py-2 text-yellow-300 text-sm">
                    <span className="font-bold">⚠️ 下書き {draftCount}件</span>
                    <span className="text-yellow-400/70">— 公開するまでユーザーには表示されません</span>
                    <Link href="/admin/questions?status=draft" className="ml-auto text-xs underline hover:text-yellow-100">確認する →</Link>
                </div>
            )}

            <div className="mb-6 flex gap-4 items-center flex-wrap">
                <SearchInput placeholder="問題を検索 (部分一致)..." />
                <div className="flex gap-2 flex-wrap">
                    <Link href="/admin/questions">
                        <Button variant="outline" size="sm" className={!statusParam && !year ? 'bg-slate-700' : ''}>すべて</Button>
                    </Link>
                    <Link href="/admin/questions?status=draft">
                        <Button variant="outline" size="sm" className={statusParam === 'draft' ? 'bg-yellow-500/20 text-yellow-300 border-yellow-500/50' : ''}>
                            下書き
                        </Button>
                    </Link>
                    <Link href="/admin/questions?status=published">
                        <Button variant="outline" size="sm" className={statusParam === 'published' ? 'bg-green-500/20 text-green-300 border-green-500/50' : ''}>
                            公開中
                        </Button>
                    </Link>
                    <div className="w-px bg-slate-700 mx-1" />
                    <Link href="/admin/questions?year=39">
                        <Button variant="outline" size="sm" className={year === '39' ? 'bg-slate-700' : ''}>第39回</Button>
                    </Link>
                    <Link href="/admin/questions?year=38">
                        <Button variant="outline" size="sm" className={year === '38' ? 'bg-slate-700' : ''}>第38回</Button>
                    </Link>
                </div>
            </div>

            <GlassTable
                data={questionList}
                columns={columns}
                keyField="id"
            />
        </div>
    );
}
