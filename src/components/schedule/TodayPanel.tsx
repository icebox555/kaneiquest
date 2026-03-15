"use client";

import { useState, useTransition } from "react";
import { CheckCircle2, Clock, SkipForward, ChevronDown, ChevronUp, Flame } from "lucide-react";
import { completeTask, rescheduleTask } from "@/lib/actions/schedule";
import type { StudyTask } from "@/lib/actions/schedule";

interface Props {
    tasks: StudyTask[];
    streak: number;
    onTaskSelect?: (task: StudyTask) => void;
    focusMode?: boolean;
    onToggleFocus?: () => void;
}

const MAX_VISIBLE = 3;

export function TodayPanel({ tasks, streak, onTaskSelect, focusMode, onToggleFocus }: Props) {
    const [isPending, startTransition] = useTransition();
    const [xpFlash, setXpFlash] = useState<string | null>(null);
    const [showAll, setShowAll] = useState(false);

    const pending = tasks.filter((t) => t.status === "pending" || t.status === "rescheduled");
    const completed = tasks.filter((t) => t.status === "completed");
    const visible = showAll ? pending : pending.slice(0, MAX_VISIBLE);
    const hiddenCount = pending.length - MAX_VISIBLE;

    function handleComplete(task: StudyTask) {
        startTransition(async () => {
            const elapsed = task.planned_minutes;
            const result = await completeTask(task.id, elapsed);
            if (result.success) {
                setXpFlash(task.id);
                setTimeout(() => setXpFlash(null), 1500);
            }
        });
    }

    function handleReschedule(taskId: string) {
        startTransition(async () => {
            await rescheduleTask(taskId);
        });
    }

    const progressPct =
        tasks.length > 0 ? Math.round((completed.length / tasks.length) * 100) : 0;

    if (focusMode && pending.length > 0) {
        const focusTask = pending[0];
        return (
            <div className="rounded-2xl glass p-6 flex flex-col items-center gap-6">
                <button
                    onClick={onToggleFocus}
                    className="self-end text-xs text-stone-400 hover:text-stone-600 underline"
                >
                    フォーカスモードを終了
                </button>
                <div className="text-center">
                    <p className="text-xs text-stone-500 uppercase tracking-wider mb-2">今集中すること</p>
                    <h2 className="text-2xl font-bold text-stone-800 mb-1">{focusTask.title}</h2>
                    {focusTask.description && (
                        <p className="text-stone-500 text-sm">{focusTask.description}</p>
                    )}
                    <p className="text-stone-400 text-sm mt-1">
                        <Clock className="inline h-4 w-4 mr-1" />
                        {focusTask.planned_minutes}分
                    </p>
                </div>
                <div className="flex gap-3">
                    <button
                        onClick={() => handleComplete(focusTask)}
                        disabled={isPending}
                        className="px-6 py-3 rounded-xl bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-colors disabled:opacity-50"
                    >
                        完了！
                    </button>
                    <button
                        onClick={() => handleReschedule(focusTask.id)}
                        disabled={isPending}
                        className="px-6 py-3 rounded-xl border border-stone-200 hover:border-stone-300 text-stone-600 font-semibold transition-colors disabled:opacity-50"
                    >
                        後でやる
                    </button>
                </div>
            </div>
        );
    }

    return (
        <div className="rounded-2xl glass p-5 flex flex-col gap-4">
            {/* Header */}
            <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                    <h2 className="font-bold text-stone-800">今日の学習</h2>
                    {streak > 0 && (
                        <span className="flex items-center gap-1 text-xs font-semibold bg-orange-100 text-orange-600 px-2 py-0.5 rounded-full">
                            <Flame className="h-3 w-3" />
                            {streak}日連続
                        </span>
                    )}
                </div>
                <button
                    onClick={onToggleFocus}
                    className="text-xs text-primary hover:underline font-medium"
                >
                    フォーカスモード
                </button>
            </div>

            {/* Progress bar */}
            <div>
                <div className="flex justify-between text-xs text-stone-500 mb-1">
                    <span>
                        {completed.length} / {tasks.length} タスク完了
                    </span>
                    <span>{progressPct}%</span>
                </div>
                <div className="h-2 bg-stone-100 rounded-full overflow-hidden">
                    <div
                        className="h-full bg-gradient-to-r from-emerald-400 to-green-500 transition-all duration-700 ease-out"
                        style={{ width: `${progressPct}%` }}
                    />
                </div>
            </div>

            {/* Task list */}
            {tasks.length === 0 ? (
                <p className="text-center text-stone-400 text-sm py-4">
                    今日のタスクはありません
                </p>
            ) : (
                <ul className="flex flex-col gap-2">
                    {visible.map((task) => (
                        <li
                            key={task.id}
                            className="relative flex items-center gap-3 p-3 rounded-xl bg-white/50 hover:bg-white/70 transition-colors border border-stone-100"
                        >
                            {/* XP flash */}
                            {xpFlash === task.id && (
                                <span className="absolute right-3 top-1 text-xs font-bold text-emerald-500 animate-bounce">
                                    +20 XP!
                                </span>
                            )}

                            <button
                                onClick={() => handleComplete(task)}
                                disabled={isPending}
                                className="flex-shrink-0 w-6 h-6 rounded-full border-2 border-stone-300 hover:border-emerald-400 hover:bg-emerald-50 transition-colors flex items-center justify-center disabled:opacity-50"
                                aria-label="完了"
                            >
                                <CheckCircle2 className="h-5 w-5 text-transparent hover:text-emerald-400" />
                            </button>

                            <button
                                onClick={() => onTaskSelect?.(task)}
                                className="flex-1 text-left"
                            >
                                <p className="text-sm font-medium text-stone-700">{task.title}</p>
                                <p className="text-xs text-stone-400 flex items-center gap-1">
                                    <Clock className="h-3 w-3" />
                                    {task.planned_minutes}分 · 🍅 ×{task.pomodoros_planned}
                                </p>
                            </button>

                            <button
                                onClick={() => handleReschedule(task.id)}
                                disabled={isPending}
                                className="flex-shrink-0 flex items-center gap-1 text-xs text-stone-400 hover:text-orange-400 transition-colors disabled:opacity-50 px-2 py-1 rounded-lg hover:bg-orange-50"
                                title="後でやる"
                            >
                                <SkipForward className="h-3.5 w-3.5" />
                                後でやる
                            </button>
                        </li>
                    ))}

                    {/* Completed tasks (collapsed) */}
                    {completed.map((task) => (
                        <li
                            key={task.id}
                            className="flex items-center gap-3 p-3 rounded-xl bg-stone-50/50 border border-stone-100 opacity-60"
                        >
                            <CheckCircle2 className="h-5 w-5 text-emerald-500 flex-shrink-0" />
                            <p className="text-sm text-stone-500 line-through">{task.title}</p>
                        </li>
                    ))}
                </ul>
            )}

            {/* Show more / less toggle */}
            {hiddenCount > 0 && (
                <button
                    onClick={() => setShowAll((v) => !v)}
                    className="text-xs text-stone-400 hover:text-stone-600 flex items-center gap-1 self-center"
                >
                    {showAll ? (
                        <>
                            <ChevronUp className="h-3.5 w-3.5" /> 折りたたむ
                        </>
                    ) : (
                        <>
                            <ChevronDown className="h-3.5 w-3.5" /> 他{hiddenCount}件を表示
                        </>
                    )}
                </button>
            )}
        </div>
    );
}
