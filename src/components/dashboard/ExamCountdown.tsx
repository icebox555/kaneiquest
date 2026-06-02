"use client";

import { CalendarDays } from "lucide-react";

interface Props {
    examDate: string; // "YYYY-MM-DD"
    dailyGoalMinutes: number;
}

export function ExamCountdown({ examDate, dailyGoalMinutes }: Props) {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const exam = new Date(examDate);
    exam.setHours(0, 0, 0, 0);
    const daysLeft = Math.ceil((exam.getTime() - today.getTime()) / (1000 * 60 * 60 * 24));
    const isPast = daysLeft < 0;
    const isNear = daysLeft <= 30 && daysLeft >= 0;

    return (
        <div className={`glass p-4 md:p-6 rounded-2xl space-y-2 md:space-y-3 border ${isNear ? "border-rose-300/50 bg-rose-50/20" : "border-transparent"}`}>
            <div className="flex items-center gap-3">
                <div className={`p-2.5 md:p-3 rounded-xl ${isNear ? "bg-rose-500/10 text-rose-500" : "bg-primary/10 text-primary"}`}>
                    <CalendarDays className="w-5 h-5 md:w-6 md:h-6" />
                </div>
                <div>
                    <h3 className="text-base md:text-lg font-bold text-stone-800">試験まであと</h3>
                    <p className="text-xs text-stone-400">
                        {new Date(examDate).toLocaleDateString("ja-JP", { year: "numeric", month: "long", day: "numeric" })}
                    </p>
                </div>
            </div>

            {isPast ? (
                <p className="text-2xl font-bold text-stone-400">試験日が過ぎています</p>
            ) : (
                <>
                    <div className="flex items-end gap-2">
                        <span className={`text-4xl md:text-5xl font-extrabold ${isNear ? "text-rose-500" : "text-gradient-gold"}`}>
                            {daysLeft}
                        </span>
                        <span className="text-stone-500 mb-1 md:mb-2 text-base md:text-lg">日</span>
                    </div>
                    <div className="text-xs text-stone-400 space-y-1 pt-1 border-t border-stone-100">
                        <p>目標: 1日 <span className="font-semibold text-stone-600">{dailyGoalMinutes}分</span> の学習</p>
                        {isNear && (
                            <p className="text-rose-500 font-semibold">残り1ヶ月を切りました！毎日の演習が合否を分けます。</p>
                        )}
                    </div>
                </>
            )}
        </div>
    );
}
