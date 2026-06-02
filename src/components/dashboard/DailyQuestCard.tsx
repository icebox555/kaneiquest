'use client';

import { ArrowRight, Sparkles, Zap } from "lucide-react";
import Link from "next/link";
import { MotionWrapper } from "@/components/ui/MotionWrapper";

interface DailyQuestCardProps {
    weaknessName?: string;
}

export function DailyQuestCard({ weaknessName }: DailyQuestCardProps) {
    if (!weaknessName) {
        // Fallback or "All Good" state
        return (
            <MotionWrapper className="glass p-4 md:p-6 rounded-2xl relative overflow-hidden group">
                <div className="absolute top-0 right-0 p-4 opacity-5 group-hover:opacity-10 transition-opacity">
                    <Sparkles className="w-28 h-28 md:w-32 md:h-32 text-yellow-500" />
                </div>

                <div className="relative z-10">
                    <div className="flex items-center gap-2 mb-3 md:mb-4">
                        <div className="p-2 rounded-lg bg-yellow-500/10 text-yellow-600">
                            <Sparkles className="w-5 h-5" />
                        </div>
                        <h3 className="text-base md:text-lg font-bold text-stone-800">AI学習コーチ</h3>
                    </div>

                    <h4 className="text-lg md:text-xl font-bold text-stone-900 mb-2">
                        素晴らしい！苦手分野が見つかりませんでした。
                    </h4>
                    <p className="text-xs md:text-sm text-stone-500 mb-4 md:mb-6">
                        この調子で頑張りましょう！ランダム演習でさらに実力を磨きましょう。
                    </p>

                    <Link
                        href="/practice"
                        className="inline-flex items-center justify-center w-full px-4 py-2.5 md:py-3 bg-stone-900 text-white font-bold rounded-xl hover:bg-stone-800 transition-colors"
                    >
                        演習を始める
                        <ArrowRight className="w-4 h-4 ml-2" />
                    </Link>
                </div>
            </MotionWrapper>
        );
    }

    return (
        <MotionWrapper className="glass p-4 md:p-6 rounded-2xl relative overflow-hidden group border-2 border-primary/10 hover:border-primary/30 transition-colors">
            {/* Background Decor */}
            <div className="absolute top-0 right-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
                <Zap className="w-28 h-28 md:w-32 md:h-32 text-primary" />
            </div>

            <div className="relative z-10">
                <div className="flex items-center gap-2 mb-3 md:mb-4">
                    <div className="p-2 rounded-lg bg-gradient-to-br from-primary to-orange-500 text-white shadow-lg shadow-orange-500/20">
                        <Zap className="w-5 h-5" />
                    </div>
                    <div>
                        <h3 className="text-base md:text-lg font-bold text-stone-800">デイリークエスト</h3>
                        <p className="text-xs text-primary font-bold">あなたへのおすすめ</p>
                    </div>
                </div>

                <div className="mb-4 md:mb-6">
                    <p className="text-xs md:text-sm text-stone-500 mb-1">重点強化エリア</p>
                    <h4 className="text-xl md:text-2xl font-bold text-stone-900 leading-tight">
                        {weaknessName}
                    </h4>
                    <p className="text-xs text-stone-500 mt-1.5 md:mt-2 flex items-center gap-1">
                        <Sparkles className="w-3 h-3 text-yellow-500" />
                        <span>直近の成績をもとにAIが分析しました</span>
                    </p>
                </div>

                <div className="flex items-center justify-between gap-4">
                    <div className="text-xs font-bold text-stone-400">
                        クリア報酬: <span className="text-yellow-600">+50 XP</span>
                    </div>
                    <Link
                        href="/practice/quest"
                        className="flex-1 inline-flex items-center justify-center px-4 py-2.5 md:py-3 bg-gradient-to-r from-primary to-orange-500 text-white font-bold rounded-xl shadow-lg shadow-orange-500/20 hover:shadow-orange-500/40 hover:scale-[1.02] transition-all"
                    >
                        クエストを始める
                        <ArrowRight className="w-4 h-4 ml-2" />
                    </Link>
                </div>
            </div>
        </MotionWrapper>
    );
}
