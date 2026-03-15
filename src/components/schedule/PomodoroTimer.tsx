"use client";

import { useEffect, useRef, useState, useCallback } from "react";
import { Play, Pause, RotateCcw, Coffee } from "lucide-react";
import { updatePomodoroCount } from "@/lib/actions/schedule";
import type { StudyTask } from "@/lib/actions/schedule";

const WORK_SECONDS = 25 * 60;
const SHORT_BREAK = 5 * 60;
const LONG_BREAK = 15 * 60;
const LONG_BREAK_AFTER = 4;

type Phase = "work" | "short-break" | "long-break";

interface Props {
    activeTask?: StudyTask | null;
    notificationPref?: string;
}

function phaseLabel(phase: Phase): string {
    if (phase === "work") return "集中";
    if (phase === "short-break") return "休憩";
    return "長休憩";
}

function phaseSeconds(phase: Phase): number {
    if (phase === "work") return WORK_SECONDS;
    if (phase === "short-break") return SHORT_BREAK;
    return LONG_BREAK;
}

function requestBrowserNotification(title: string, body: string) {
    if (typeof window === "undefined") return;
    if (!("Notification" in window)) return;
    if (Notification.permission === "granted") {
        new Notification(title, { body, icon: "/favicon.ico" });
    }
}

export function PomodoroTimer({ activeTask, notificationPref }: Props) {
    const [phase, setPhase] = useState<Phase>("work");
    const [seconds, setSeconds] = useState(WORK_SECONDS);
    const [running, setRunning] = useState(false);
    const [pomodorosDone, setPomodorosDone] = useState(0);
    const [flash, setFlash] = useState(false);
    const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null);

    const canNotify = notificationPref === "browser" || notificationPref === "both";

    const notify = useCallback(
        (title: string, body: string) => {
            if (canNotify) {
                requestBrowserNotification(title, body);
            }
            // Screen flash fallback
            setFlash(true);
            setTimeout(() => setFlash(false), 600);
        },
        [canNotify]
    );

    const advancePhase = useCallback(async () => {
        setRunning(false);

        if (phase === "work") {
            const newDone = pomodorosDone + 1;
            setPomodorosDone(newDone);

            if (activeTask) {
                await updatePomodoroCount(activeTask.id, newDone);
            }

            if (newDone % LONG_BREAK_AFTER === 0) {
                setPhase("long-break");
                setSeconds(LONG_BREAK);
                notify("長休憩！", "4ポモドーロ達成！15分休みましょう。");
            } else {
                setPhase("short-break");
                setSeconds(SHORT_BREAK);
                notify("休憩タイム！", "5分間休憩しましょう。");
            }
        } else {
            setPhase("work");
            setSeconds(WORK_SECONDS);
            notify("集中タイム開始！", "25分間集中しましょう。");
        }
    }, [phase, pomodorosDone, activeTask, notify]);

    useEffect(() => {
        if (!running) {
            if (intervalRef.current) clearInterval(intervalRef.current);
            return;
        }

        intervalRef.current = setInterval(() => {
            setSeconds((s) => {
                if (s <= 1) {
                    advancePhase();
                    return 0;
                }
                return s - 1;
            });
        }, 1000);

        return () => {
            if (intervalRef.current) clearInterval(intervalRef.current);
        };
    }, [running, advancePhase]);

    function handleReset() {
        setRunning(false);
        setPhase("work");
        setSeconds(WORK_SECONDS);
    }

    async function handleRequestPermission() {
        if ("Notification" in window && Notification.permission === "default") {
            await Notification.requestPermission();
        }
    }

    const totalSeconds = phaseSeconds(phase);
    const progress = ((totalSeconds - seconds) / totalSeconds) * 100;
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;

    const ringColor =
        phase === "work"
            ? "stroke-primary"
            : phase === "short-break"
            ? "stroke-emerald-400"
            : "stroke-blue-400";

    const radius = 54;
    const circumference = 2 * Math.PI * radius;
    const dashOffset = circumference * (1 - progress / 100);

    return (
        <div
            className={`rounded-2xl glass p-5 flex flex-col items-center gap-4 transition-colors duration-300 ${
                flash ? "bg-yellow-50" : ""
            }`}
        >
            <div className="flex items-center justify-between w-full">
                <h2 className="font-bold text-stone-800">ポモドーロ</h2>
                <span className="text-xs bg-stone-100 text-stone-600 px-2 py-0.5 rounded-full">
                    {phaseLabel(phase)}
                </span>
            </div>

            {/* Active task name */}
            {activeTask && (
                <p className="text-xs text-stone-500 truncate max-w-full">
                    集中中: {activeTask.title}
                </p>
            )}

            {/* SVG Ring Timer */}
            <div className="relative w-32 h-32">
                <svg className="w-full h-full -rotate-90" viewBox="0 0 128 128">
                    <circle
                        cx="64"
                        cy="64"
                        r={radius}
                        strokeWidth="8"
                        fill="none"
                        className="stroke-stone-100"
                    />
                    <circle
                        cx="64"
                        cy="64"
                        r={radius}
                        strokeWidth="8"
                        fill="none"
                        className={`${ringColor} transition-all duration-1000`}
                        strokeDasharray={circumference}
                        strokeDashoffset={dashOffset}
                        strokeLinecap="round"
                    />
                </svg>
                <div className="absolute inset-0 flex flex-col items-center justify-center">
                    <span className="text-2xl font-bold tabular-nums text-stone-800">
                        {String(mins).padStart(2, "0")}:{String(secs).padStart(2, "0")}
                    </span>
                    <span className="text-xs text-stone-400">
                        🍅 ×{pomodorosDone}
                    </span>
                </div>
            </div>

            {/* Controls */}
            <div className="flex items-center gap-3">
                <button
                    onClick={handleReset}
                    className="p-2 rounded-full hover:bg-stone-100 text-stone-400 hover:text-stone-600 transition-colors"
                    aria-label="リセット"
                >
                    <RotateCcw className="h-4 w-4" />
                </button>

                <button
                    onClick={() => setRunning((v) => !v)}
                    className="w-12 h-12 rounded-full bg-primary hover:bg-primary/90 text-white flex items-center justify-center transition-colors shadow-md"
                    aria-label={running ? "一時停止" : "開始"}
                >
                    {running ? <Pause className="h-5 w-5" /> : <Play className="h-5 w-5 ml-0.5" />}
                </button>

                <button
                    onClick={advancePhase}
                    className="p-2 rounded-full hover:bg-stone-100 text-stone-400 hover:text-stone-600 transition-colors"
                    aria-label="スキップ"
                    title="次のフェーズへ"
                >
                    <Coffee className="h-4 w-4" />
                </button>
            </div>

            {/* Notification permission prompt */}
            {canNotify &&
                typeof window !== "undefined" &&
                "Notification" in window &&
                Notification.permission === "default" && (
                    <button
                        onClick={handleRequestPermission}
                        className="text-xs text-primary hover:underline"
                    >
                        ブラウザ通知を許可する
                    </button>
                )}

            {/* Phase dots */}
            <div className="flex gap-1.5">
                {Array.from({ length: LONG_BREAK_AFTER }).map((_, i) => (
                    <div
                        key={i}
                        className={`w-2 h-2 rounded-full transition-colors ${
                            i < pomodorosDone % LONG_BREAK_AFTER || (pomodorosDone % LONG_BREAK_AFTER === 0 && pomodorosDone > 0 && i < LONG_BREAK_AFTER)
                                ? "bg-primary"
                                : "bg-stone-200"
                        }`}
                    />
                ))}
            </div>
        </div>
    );
}
