"use client";

import { useMemo, useState } from "react";
import { ChevronLeft, ChevronRight } from "lucide-react";
import type { StudyTask } from "@/lib/actions/schedule";

interface Props {
    tasks: StudyTask[];
}

const DAYS_JA = ["日", "月", "火", "水", "木", "金", "土"];
const MONTHS_JA = [
    "1月", "2月", "3月", "4月", "5月", "6月",
    "7月", "8月", "9月", "10月", "11月", "12月",
];

function toDateStr(d: Date): string {
    return d.toISOString().split("T")[0];
}

export function MonthCalendar({ tasks }: Props) {
    const today = new Date();
    const [viewDate, setViewDate] = useState(
        new Date(today.getFullYear(), today.getMonth(), 1)
    );

    const tasksByDate = useMemo(() => {
        const map: Record<string, StudyTask[]> = {};
        for (const t of tasks) {
            if (!map[t.scheduled_date]) map[t.scheduled_date] = [];
            map[t.scheduled_date].push(t);
        }
        return map;
    }, [tasks]);

    // Build calendar grid
    const year = viewDate.getFullYear();
    const month = viewDate.getMonth();
    const firstDay = new Date(year, month, 1).getDay(); // 0=Sun
    const daysInMonth = new Date(year, month + 1, 0).getDate();

    const cells: (Date | null)[] = [
        ...Array(firstDay).fill(null),
        ...Array.from({ length: daysInMonth }, (_, i) => new Date(year, month, i + 1)),
    ];
    // Pad to complete weeks
    while (cells.length % 7 !== 0) cells.push(null);

    const todayStr = toDateStr(today);

    function prevMonth() {
        setViewDate(new Date(year, month - 1, 1));
    }
    function nextMonth() {
        setViewDate(new Date(year, month + 1, 1));
    }

    return (
        <div className="rounded-2xl glass p-5">
            {/* Header */}
            <div className="flex items-center justify-between mb-4">
                <h3 className="font-bold text-stone-800">月間カレンダー</h3>
                <div className="flex items-center gap-2">
                    <button
                        onClick={prevMonth}
                        className="p-1 rounded-lg hover:bg-stone-100 text-stone-500 transition-colors"
                    >
                        <ChevronLeft className="h-4 w-4" />
                    </button>
                    <span className="text-sm font-semibold text-stone-700 min-w-[4rem] text-center">
                        {year}年 {MONTHS_JA[month]}
                    </span>
                    <button
                        onClick={nextMonth}
                        className="p-1 rounded-lg hover:bg-stone-100 text-stone-500 transition-colors"
                    >
                        <ChevronRight className="h-4 w-4" />
                    </button>
                </div>
            </div>

            {/* Day headers */}
            <div className="grid grid-cols-7 mb-1">
                {DAYS_JA.map((d, i) => (
                    <div
                        key={d}
                        className={`text-[10px] font-semibold text-center py-1 ${
                            i === 0 ? "text-red-400" : i === 6 ? "text-blue-400" : "text-stone-400"
                        }`}
                    >
                        {d}
                    </div>
                ))}
            </div>

            {/* Calendar grid */}
            <div className="grid grid-cols-7 gap-1">
                {cells.map((date, idx) => {
                    if (!date) {
                        return <div key={`empty-${idx}`} className="h-10" />;
                    }

                    const dateStr = toDateStr(date);
                    const dayTasks = tasksByDate[dateStr] ?? [];
                    const completed = dayTasks.filter((t) => t.status === "completed").length;
                    const isToday = dateStr === todayStr;
                    const isPast = dateStr < todayStr;
                    const hasAll = dayTasks.length > 0 && completed === dayTasks.length;
                    const hasSome = dayTasks.length > 0 && completed > 0 && completed < dayTasks.length;
                    const hasPending = dayTasks.length > 0 && completed === 0;

                    return (
                        <div
                            key={dateStr}
                            className={`relative flex flex-col items-center justify-start pt-1 h-10 rounded-lg transition-colors ${
                                isToday
                                    ? "bg-primary/10 border border-primary/30"
                                    : "hover:bg-stone-50"
                            } ${isPast && !isToday ? "opacity-50" : ""}`}
                        >
                            <span
                                className={`text-xs font-medium w-6 h-6 flex items-center justify-center rounded-full leading-none ${
                                    isToday
                                        ? "bg-primary text-white font-bold"
                                        : date.getDay() === 0
                                        ? "text-red-400"
                                        : date.getDay() === 6
                                        ? "text-blue-400"
                                        : "text-stone-600"
                                }`}
                            >
                                {date.getDate()}
                            </span>

                            {/* Task indicator dot */}
                            {dayTasks.length > 0 && (
                                <div
                                    className={`absolute bottom-1 w-1.5 h-1.5 rounded-full ${
                                        hasAll
                                            ? "bg-emerald-400"
                                            : hasSome
                                            ? "bg-yellow-400"
                                            : hasPending
                                            ? "bg-primary/50"
                                            : ""
                                    }`}
                                />
                            )}
                        </div>
                    );
                })}
            </div>

            {/* Legend */}
            <div className="flex gap-4 mt-3 text-[10px] text-stone-400">
                <span className="flex items-center gap-1">
                    <span className="w-2 h-2 rounded-full bg-emerald-400 inline-block" /> 全完了
                </span>
                <span className="flex items-center gap-1">
                    <span className="w-2 h-2 rounded-full bg-yellow-400 inline-block" /> 一部完了
                </span>
                <span className="flex items-center gap-1">
                    <span className="w-2 h-2 rounded-full bg-primary/50 inline-block" /> 予定あり
                </span>
            </div>
        </div>
    );
}
