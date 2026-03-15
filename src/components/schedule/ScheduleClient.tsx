"use client";

import { useState, useTransition } from "react";
import { LayoutGrid, CalendarDays, RefreshCw } from "lucide-react";
import { ExamCountdown } from "./ExamCountdown";
import { TodayPanel } from "./TodayPanel";
import { PomodoroTimer } from "./PomodoroTimer";
import { WeekCalendar } from "./WeekCalendar";
import { MonthCalendar } from "./MonthCalendar";
import { NotificationSettings } from "./NotificationSettings";
import { generateStudyPlan } from "@/lib/actions/schedule";
import type { StudySchedule, StudyTask } from "@/lib/actions/schedule";

interface Props {
    schedule: StudySchedule;
    todayTasks: StudyTask[];
    rangeTasks: StudyTask[];
    streak: number;
    studyDaysAvailable: number;
}

type CalView = "week" | "month";

export function ScheduleClient({
    schedule,
    todayTasks,
    rangeTasks,
    streak,
    studyDaysAvailable,
}: Props) {
    const [calView, setCalView] = useState<CalView>("week");
    const [activeTask, setActiveTask] = useState<StudyTask | null>(null);
    const [focusMode, setFocusMode] = useState(false);
    const [isRegenerating, startRegenerate] = useTransition();
    const [regenMsg, setRegenMsg] = useState<string | null>(null);

    function handleRegenerate() {
        startRegenerate(async () => {
            setRegenMsg(null);
            const result = await generateStudyPlan();
            setRegenMsg(result.success ? "計画を再生成しました！" : result.error ?? "エラー");
            setTimeout(() => setRegenMsg(null), 3000);
        });
    }

    return (
        <div className="flex flex-col gap-5">
            {/* Exam countdown */}
            <ExamCountdown
                examDate={schedule.exam_date}
                studyDaysAvailable={studyDaysAvailable}
            />

            {/* Today + Pomodoro */}
            <div className="grid grid-cols-1 md:grid-cols-[1fr_260px] gap-5">
                <TodayPanel
                    tasks={todayTasks}
                    streak={streak}
                    onTaskSelect={setActiveTask}
                    focusMode={focusMode}
                    onToggleFocus={() => setFocusMode((v) => !v)}
                />
                <PomodoroTimer
                    activeTask={activeTask}
                    notificationPref={schedule.notification_pref}
                />
            </div>

            {/* Calendar toggle */}
            <div className="flex flex-col gap-3">
                <div className="flex items-center gap-2">
                    <div className="flex bg-stone-100 rounded-xl p-1 gap-1">
                        <button
                            onClick={() => setCalView("week")}
                            className={`flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-sm font-medium transition-colors ${
                                calView === "week"
                                    ? "bg-white text-stone-800 shadow-sm"
                                    : "text-stone-500 hover:text-stone-700"
                            }`}
                        >
                            <CalendarDays className="h-4 w-4" />
                            週間
                        </button>
                        <button
                            onClick={() => setCalView("month")}
                            className={`flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-sm font-medium transition-colors ${
                                calView === "month"
                                    ? "bg-white text-stone-800 shadow-sm"
                                    : "text-stone-500 hover:text-stone-700"
                            }`}
                        >
                            <LayoutGrid className="h-4 w-4" />
                            月間
                        </button>
                    </div>
                </div>

                {calView === "week" ? (
                    <WeekCalendar tasks={rangeTasks} />
                ) : (
                    <MonthCalendar tasks={rangeTasks} />
                )}
            </div>

            {/* Notification settings + Regenerate */}
            <div className="grid grid-cols-1 md:grid-cols-[1fr_auto] gap-5 items-start">
                <NotificationSettings schedule={schedule} />

                <div className="flex flex-col gap-3 rounded-2xl glass p-5">
                    <h3 className="font-bold text-stone-800 text-sm">学習計画</h3>
                    <p className="text-xs text-stone-500">
                        弱点を考慮してAIが計画を自動生成します
                    </p>
                    {regenMsg && (
                        <p className="text-xs text-emerald-600 font-medium">{regenMsg}</p>
                    )}
                    <button
                        onClick={handleRegenerate}
                        disabled={isRegenerating}
                        className="flex items-center gap-2 px-4 py-2 rounded-xl bg-primary text-white text-sm font-semibold hover:bg-primary/90 transition-colors disabled:opacity-50"
                    >
                        <RefreshCw
                            className={`h-4 w-4 ${isRegenerating ? "animate-spin" : ""}`}
                        />
                        {isRegenerating ? "生成中..." : "計画を再生成"}
                    </button>
                </div>
            </div>
        </div>
    );
}
