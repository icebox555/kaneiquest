"use client";

import { Flame } from "lucide-react";

interface Props {
    streak: number;
    totalCompleted: number;
}

export function StreakCard({ streak, totalCompleted }: Props) {
    const milestones = [3, 7, 14, 30, 60, 100];
    const next = milestones.find(m => m > streak) ?? 100;
    const prev = milestones.filter(m => m <= streak).at(-1) ?? 0;
    const progress = prev === next ? 100 : Math.round(((streak - prev) / (next - prev)) * 100);

    return (
        <div className="glass p-4 md:p-6 rounded-2xl space-y-3 md:space-y-4">
            <div className="flex items-center gap-3 md:gap-4">
                <div className={`p-2.5 md:p-3 rounded-xl ${streak >= 3 ? "bg-orange-500/15 text-orange-500" : "bg-stone-100 text-stone-400"}`}>
                    <Flame className={`w-5 h-5 md:w-6 md:h-6 ${streak >= 3 ? "fill-orange-500/30" : ""}`} />
                </div>
                <div>
                    <h3 className="text-base md:text-lg font-bold text-stone-800">連続学習</h3>
                    <p className="text-xs text-stone-400">累計 {totalCompleted} 日達成</p>
                </div>
            </div>

            <div className="flex items-end gap-2">
                <span className={`text-4xl md:text-5xl font-extrabold ${streak >= 7 ? "text-orange-500" : "text-stone-700"}`}>
                    {streak}
                </span>
                <span className="text-stone-500 mb-1 md:mb-2 text-base md:text-lg">日連続</span>
            </div>

            <div className="space-y-1">
                <div className="flex justify-between text-xs text-stone-400">
                    <span>次のマイルストーン: {next}日</span>
                    <span>{progress}%</span>
                </div>
                <div className="h-2 w-full bg-stone-100 rounded-full overflow-hidden">
                    <div
                        className="h-full bg-gradient-to-r from-orange-400 to-rose-400 transition-all duration-700"
                        style={{ width: `${progress}%` }}
                    />
                </div>
            </div>

            {streak === 0 && (
                <p className="text-xs text-stone-400">今日問題を解いてストリークをスタートしよう！</p>
            )}
            {streak >= 7 && (
                <p className="text-xs text-orange-500 font-semibold">🔥 {streak}日連続！素晴らしい継続力です！</p>
            )}
        </div>
    );
}
