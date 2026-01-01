import { createClient } from "@/lib/supabase/server";
import { QuestionForm } from "@/components/admin/QuestionForm";
import { redirect } from "next/navigation";
import { ArrowLeft } from "lucide-react";
import Link from "next/link";

interface PageProps {
    params: Promise<{
        id: string;
    }>
}

export default async function EditQuestionPage({ params }: PageProps) {
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

    const { id } = await params;

    // Fetch Categories
    const { data: categories } = await supabase
        .from("categories")
        .select("id, name")
        .order("order");

    // Fetch Question Data
    const { data: question, error } = await supabase
        .from("questions")
        .select(`
            *,
            options (
                id,
                content,
                is_correct,
                order
            )
        `)
        .eq("id", id)
        .single();

    if (error || !question) {
        return <div>Question not found</div>;
    }

    // Format data for form
    const formattedData = {
        id: question.id,
        category_id: question.category_id,
        content: question.content,
        explanation: question.explanation || "",
        difficulty: question.difficulty || 1,
        exam_year: question.exam_year || undefined,
        question_number: question.question_number || undefined,
        options: question.options?.sort((a: any, b: any) => (a.order || 0) - (b.order || 0)) || []
    };

    return (
        <div className="container max-w-2xl mx-auto py-20 px-4">
            <div className="mb-8">
                <Link href="/admin/questions" className="text-sm text-slate-400 hover:text-white flex items-center gap-1 mb-4">
                    <ArrowLeft className="w-4 h-4" /> Back to List
                </Link>
                <h1 className="text-3xl font-bold text-white bg-clip-text text-transparent bg-gradient-to-r from-white to-slate-400">
                    問題編集
                </h1>
                <p className="text-slate-400 mt-2">
                    既存の問題を修正します
                </p>
            </div>

            <div className="glass p-6 rounded-xl">
                <QuestionForm
                    categories={categories || []}
                    initialData={formattedData}
                />
            </div>
        </div>
    );
}
