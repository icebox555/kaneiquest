import { createClient } from "@/lib/supabase/server";
import Link from "next/link";
import { FileText, ArrowRight, Clock } from "lucide-react";
import { redirect } from "next/navigation";

export default async function MockExamPage() {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    // Fetch distinct years (getting all IDs for now and filtering in JS to avoid complicated group by)
    // Actually, let's just get all questions minimal data
    const { data: questions } = await supabase
        .from("questions")
        .select("exam_year");

    const uniqueYears = Array.from(new Set(questions?.map(q => q.exam_year).filter(y => y))).sort((a, b) => (b as number) - (a as number));

    return (
        <div className="min-h-screen bg-transparent pt-20 pb-12">
            <div className="container mx-auto px-4 md:px-6">
                <div className="mb-10 text-center">
                    <h1 className="text-4xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-stone-800 to-stone-500 mb-4">
                        模擬試験モード
                    </h1>
                    <p className="text-stone-500 text-lg max-w-2xl mx-auto">
                        本番形式（200問・時間制限あり）で実力を試します。<br />
                        途中で中断せず、一気に解くことを推奨します。
                    </p>
                </div>

                <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3 max-w-5xl mx-auto">
                    {uniqueYears.map((year) => (
                        <div key={year} className="glass glass-hover p-1 rounded-2xl transition-all duration-300 hover:-translate-y-1">
                            <div className="h-full rounded-xl bg-white/60 p-6 flex flex-col relative overflow-hidden">
                                <div className="absolute top-0 right-0 p-3 opacity-10 pointer-events-none">
                                    <FileText className="w-24 h-24" />
                                </div>

                                <div className="mb-4 inline-flex p-3 rounded-xl bg-indigo-50 text-indigo-500 w-fit">
                                    <FileText className="w-8 h-8" />
                                </div>

                                <h3 className="text-xl font-bold text-stone-800 mb-2">
                                    第{year}回 管理栄養士国家試験
                                </h3>
                                <div className="flex items-center gap-2 text-sm text-stone-500 mb-6">
                                    <Clock className="w-4 h-4" /> 5時間10分 (目安)
                                </div>

                                <Link
                                    href={`/mock-exam/${year}`}
                                    className="mt-auto group inline-flex items-center justify-center rounded-lg bg-stone-800 px-4 py-2 text-sm font-bold text-white transition-colors hover:bg-stone-700"
                                >
                                    試験を開始 <ArrowRight className="ml-2 h-4 w-4 transition-transform group-hover:translate-x-1" />
                                </Link>
                            </div>
                        </div>
                    ))}

                    {uniqueYears.length === 0 && (
                        <div className="col-span-full py-12 text-center glass rounded-2xl">
                            <p className="text-stone-500">現在、利用可能な模擬試験はありません。</p>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}
