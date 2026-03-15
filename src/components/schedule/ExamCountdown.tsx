"use client";

import { useEffect, useState } from "react";

interface Props {
    examDate: string; // ISO date string e.g. "2026-03-01"
    studyDaysAvailable: number;
}

interface TimeLeft {
    days: number;
    hours: number;
    minutes: number;
    seconds: number;
}

function calcTimeLeft(examDate: string): TimeLeft {
    const target = new Date(examDate);
    target.setHours(9, 0, 0, 0); // Exam typically starts at 9:00
    const diff = target.getTime() - Date.now();

    if (diff <= 0) return { days: 0, hours: 0, minutes: 0, seconds: 0 };

    return {
        days: Math.floor(diff / (1000 * 60 * 60 * 24)),
        hours: Math.floor((diff / (1000 * 60 * 60)) % 24),
        minutes: Math.floor((diff / (1000 * 60)) % 60),
        seconds: Math.floor((diff / 1000) % 60),
    };
}

function urgencyColor(days: number): string {
    if (days > 30) return "from-emerald-500 to-green-400";
    if (days > 14) return "from-yellow-500 to-amber-400";
    if (days > 7) return "from-orange-500 to-amber-500";
    return "from-red-600 to-rose-500";
}

export function ExamCountdown({ examDate, studyDaysAvailable }: Props) {
    const [timeLeft, setTimeLeft] = useState<TimeLeft>(calcTimeLeft(examDate));

    useEffect(() => {
        const id = setInterval(() => {
            setTimeLeft(calcTimeLeft(examDate));
        }, 1000);
        return () => clearInterval(id);
    }, [examDate]);

    const colorClass = urgencyColor(timeLeft.days);

    return (
        <div className="rounded-2xl glass p-5 flex flex-col md:flex-row md:items-center md:justify-between gap-4">
            <div>
                <p className="text-xs text-stone-500 font-medium uppercase tracking-wider mb-1">
                    管理栄養士国家試験まで
                </p>
                <div className="flex items-end gap-3">
                    {[
                        { value: timeLeft.days, label: "日" },
                        { value: timeLeft.hours, label: "時間" },
                        { value: timeLeft.minutes, label: "分" },
                        { value: timeLeft.seconds, label: "秒" },
                    ].map(({ value, label }) => (
                        <div key={label} className="flex flex-col items-center">
                            <span
                                className={`text-3xl font-bold tabular-nums bg-gradient-to-br ${colorClass} bg-clip-text text-transparent`}
                            >
                                {String(value).padStart(2, "0")}
                            </span>
                            <span className="text-[10px] text-stone-400">{label}</span>
                        </div>
                    ))}
                </div>
            </div>

            <div className="flex gap-6 text-center">
                <div>
                    <p className="text-2xl font-bold text-stone-700">{timeLeft.days}</p>
                    <p className="text-xs text-stone-500">残り日数</p>
                </div>
                <div className="w-px bg-stone-200" />
                <div>
                    <p className="text-2xl font-bold text-stone-700">{studyDaysAvailable}</p>
                    <p className="text-xs text-stone-500">学習可能日</p>
                </div>
                <div className="w-px bg-stone-200" />
                <div>
                    <p className={`text-2xl font-bold bg-gradient-to-br ${colorClass} bg-clip-text text-transparent`}>
                        {new Date(examDate).toLocaleDateString("ja-JP", {
                            month: "numeric",
                            day: "numeric",
                        })}
                    </p>
                    <p className="text-xs text-stone-500">試験日</p>
                </div>
            </div>
        </div>
    );
}
