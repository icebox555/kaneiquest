"use client";

import { useMemo } from "react";
import { CheckCircle2, Circle, Clock } from "lucide-react";
import type { StudyTask } from "@/lib/actions/schedule";

interface Props {
    tasks: StudyTask[];
    referenceDate?: string; // ISO date to anchor the week (defaults to today)
}

const DAYS_JA = ["日", "月", "火", "水", "木", "金", "土"];

function getWeekDates(anchor: Date): Date[] {
    const start = new Date(anchor);
    start.setDate(anchor.getDate() - anchor.getDay()); // Sunday start
    return Array.from({ length: 7 }, (_, i) => {
        const d = new Date(start);
        d.setDate(start.getDate() + i);
        return d;
    });
}

function toDateStr(d: Date): string {
    return d.toISOString().split("T")[0];
}

function statusColor(
    pending: number,
    completed: number,
    total: number
): string {
    if (total === 0) return "bg-stone-100 text-stone-400";
    if (pending === 0) return "bg-emerald-100 text-emerald-700";
    if (completed > 0) return "bg-yellow-100 text-yellow-700";
    return "bg-blue-50 text-blue-600";
}

export function WeekCalendar({ tasks, referenceDate }: Props) {
    const anchor = referenceDate ? new Date(referenceDate) : new Date();
    const weekDates = useMemo(() => getWeekDates(anchor), [anchor.toDateString()]);

    const today = toDateStr(new Date());

    // Group tasks by date
    const tasksByDate = useMemo(() => {
        const map: Record<string, StudyTask[]> = {};
        for (const t of tasks) {
            if (!map[t.scheduled_date]) map[t.scheduled_date] = [];
            map[t.scheduled_date].push(t);
        }
        return map;
    }, [tasks]);

    return (
        <div className="rounded-2xl glass p-5">
            <h3 className="font-bold text-stone-800 mb-4">週間カレンダー</h3>
            <div className="grid grid-cols-7 gap-2">
                {weekDates.map((date) => {
                    const dateStr = toDateStr(date);
                    const dayTasks = tasksByDate[dateStr] ?? [];
                    const completed = dayTasks.filter((t) => t.status === "completed").length;
                    const pending = dayTasks.filter(
                        (t) => t.status === "pending" || t.status === "rescheduled"
                    ).length;
                    const isToday = dateStr === today;
                    const isPast = dateStr < today;

                    return (
                        <div
                            key={dateStr}
                            className={`flex flex-col items-center gap-1.5 p-2 rounded-xl border transition-colors ${
                                isToday
                                    ? "border-primary bg-primary/5"
                                    : "border-stone-100 hover:border-stone-200"
                            } ${isPast && !isToday ? "opacity-60" : ""}`}
                        >
                            {/* Day label */}
                            <span
                                className={`text-[10px] font-semibold ${
                                    date.getDay() === 0
                                        ? "text-red-400"
                                        : date.getDay() === 6
                                        ? "text-blue-400"
                                        : "text-stone-500"
                                }`}
                            >
                                {DAYS_JA[date.getDay()]}
                            </span>

                            {/* Date number */}
                            <span
                                className={`text-sm font-bold w-7 h-7 flex items-center justify-center rounded-full ${
                                    isToday
                                        ? "bg-primary text-white"
                                        : "text-stone-700"
                                }`}
                            >
                                {date.getDate()}
                            </span>

                            {/* Task summary */}
                            {dayTasks.length > 0 ? (
                                <div
                                    className={`w-full text-center text-[10px] font-medium px-1 py-0.5 rounded-md ${statusColor(
                                        pending,
                                        completed,
                                        dayTasks.length
                                    )}`}
                                >
                                    {completed}/{dayTasks.length}
                                </div>
                            ) : (
                                <div className="w-full h-5" />
                            )}

                            {/* Mini task dots */}
                            {dayTasks.length > 0 && (
                                <div className="flex flex-wrap gap-0.5 justify-center">
                                    {dayTasks.slice(0, 3).map((t) => (
                                        <div
                                            key={t.id}
                                            className={`w-1.5 h-1.5 rounded-full ${
                                                t.status === "completed"
                                                    ? "bg-emerald-400"
                                                    : t.status === "rescheduled"
                                                    ? "bg-yellow-400"
                                                    : "bg-primary/40"
                                            }`}
                                        />
                                    ))}
                                    {dayTasks.length > 3 && (
                                        <span className="text-[9px] text-stone-400">
                                            +{dayTasks.length - 3}
                                        </span>
                                    )}
                                </div>
                            )}
                        </div>
                    );
                })}
            </div>

            {/* Legend */}
            <div className="flex gap-4 mt-3 text-[10px] text-stone-400">
                <span className="flex items-center gap-1">
                    <span className="w-2 h-2 rounded-full bg-emerald-400 inline-block" /> 完了
                </span>
                <span className="flex items-center gap-1">
                    <span className="w-2 h-2 rounded-full bg-primary/40 inline-block" /> 予定
                </span>
                <span className="flex items-center gap-1">
                    <span className="w-2 h-2 rounded-full bg-yellow-400 inline-block" /> 後でやる
                </span>
            </div>
        </div>
    );
}
