import { createClient } from "@/lib/supabase/server";
import { MotionWrapper } from "@/components/ui/MotionWrapper";
import { redirect } from "next/navigation";
import { RankingBoard } from "@/components/ranking/RankingBoard";

export default async function RankingPage() {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    const { data: rankings } = await supabase
        .from("leaderboard")
        .select("*")
        .limit(50);

    return (
        <div className="min-h-screen bg-transparent pt-20 pb-12">
            <div className="container max-w-2xl px-4 md:px-0">

                {/* Header */}
                <MotionWrapper className="text-center mb-6 relative">
                    <div className="inline-block px-12 py-3 bg-white/80 backdrop-blur-md rounded-full border border-rose-100 shadow-sm relative z-10">
                        <h1 className="text-2xl font-bold text-stone-800 tracking-wider">
                            週間ランキング
                        </h1>
                        <p className="text-xs text-stone-400 mt-1">
                            上位を目指して頑張ろう！
                        </p>
                    </div>
                    {/* Decorative line */}
                    <div className="absolute top-1/2 left-0 w-full h-px bg-gradient-to-r from-transparent via-rose-200 to-transparent -z-0"></div>
                </MotionWrapper>

                {/* Main Board */}
                <RankingBoard rankings={rankings || []} currentUserId={user.id} />
            </div>
        </div>
    );
}

