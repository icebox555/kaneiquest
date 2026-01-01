"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/Button";
import { Heart, Loader2, Play } from "lucide-react";
import { consumeHeart } from "@/lib/actions/heart";

export function RandomQuizButton() {
    const router = useRouter();
    const [loading, setLoading] = useState(false);

    const handleStart = async () => {
        setLoading(true);
        try {
            const result = await consumeHeart();
            if (result.success) {
                // Redirect to random quiz page (we'll assume /practice/random for now, or existing exam page)
                // Since "Random Question" mode logic isn't fully defined in user request besides "Tsum Tsum style heart consumption", 
                // I will point to a new /practice/random page.
                router.push("/practice/random");
            } else {
                alert(result.message || "ハートが足りません！");
            }
        } catch (error) {
            console.error("Error starting quiz:", error);
            alert("エラーが発生しました。");
        } finally {
            setLoading(false);
        }
    };

    return (
        <Button
            onClick={handleStart}
            className="w-full h-full bg-gradient-to-br from-rose-400 to-amber-500 hover:from-rose-500 hover:to-amber-600 text-white border-0 shadow-lg group relative overflow-hidden"
        >
            <div className="absolute top-0 right-0 p-4 opacity-10">
                <Heart className="w-24 h-24 rotate-12" />
            </div>

            <div className="flex flex-col items-center justify-center gap-2 relative z-10">
                <div className="p-3 bg-white/20 rounded-full mb-1 group-hover:scale-110 transition-transform">
                    {loading ? <Loader2 className="w-8 h-8 animate-spin" /> : <Play className="w-8 h-8 fill-current" />}
                </div>
                <span className="text-xl font-bold">ランダム演習</span>
                <div className="flex items-center gap-1 text-xs font-bold bg-black/20 px-2 py-0.5 rounded-full">
                    <Heart className="w-3 h-3 fill-current" />
                    <span>1 消費</span>
                </div>
            </div>
        </Button>
    );
}
