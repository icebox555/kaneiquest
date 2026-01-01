import { createClient } from "@/lib/supabase/server";
import { QuestionForm } from "@/components/admin/QuestionForm";
import { redirect } from "next/navigation";
import { ArrowLeft } from "lucide-react";
import Link from "next/link";

export default async function NewQuestionPage() {
    const supabase = await createClient();

    // Auth Check
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) redirect("/login");

    const { data: profile } = await supabase
        .from("profiles")
        .select("role")
        .eq("id", user.id)
        .single();

    if (profile?.role !== "admin") redirect("/dashboard");

    // Fetch Categories
    const { data: categories } = await supabase
        .from("categories")
        .select("id, name")
        .order("order");

    return (
        <div className="container max-w-2xl mx-auto py-20 px-4">
            <div className="mb-8">
                <Link href="/admin/questions" className="text-sm text-slate-400 hover:text-white flex items-center gap-1 mb-4">
                    <ArrowLeft className="w-4 h-4" /> Back to List
                </Link>
                <h1 className="text-3xl font-bold text-white bg-clip-text text-transparent bg-gradient-to-r from-white to-slate-400">
                    新規問題作成
                </h1>
                <p className="text-slate-400 mt-2">
                    新しい演習問題を追加します
                </p>
            </div>

            <div className="glass p-6 rounded-xl">
                <QuestionForm categories={categories || []} />
            </div>
        </div>
    );
}
