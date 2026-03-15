"use client";

import { useState, useTransition } from "react";
import { Bell, Check } from "lucide-react";
import { upsertSchedule } from "@/lib/actions/schedule";
import type { StudySchedule } from "@/lib/actions/schedule";

interface Props {
    schedule: StudySchedule;
}

const OPTIONS = [
    { value: "both", label: "両方", description: "ブラウザ通知 + アプリ内通知" },
    { value: "browser", label: "ブラウザ", description: "ポモドーロ終了時にブラウザ通知" },
    { value: "inapp", label: "アプリ内", description: "タスク完了時にアプリ内通知" },
    { value: "none", label: "なし", description: "通知しない" },
] as const;

export function NotificationSettings({ schedule }: Props) {
    const [isPending, startTransition] = useTransition();
    const [current, setCurrent] = useState(schedule.notification_pref);
    const [saved, setSaved] = useState(false);

    function handleChange(val: typeof current) {
        setCurrent(val);
        setSaved(false);
        startTransition(async () => {
            await upsertSchedule({
                exam_date: schedule.exam_date,
                daily_goal_minutes: schedule.daily_goal_minutes,
                study_days: schedule.study_days,
                notification_pref: val,
            });
            setSaved(true);
            setTimeout(() => setSaved(false), 2000);
        });
    }

    return (
        <div className="rounded-2xl glass p-5 flex flex-col gap-4">
            <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                    <Bell className="h-4 w-4 text-stone-500" />
                    <h3 className="font-bold text-stone-800">通知設定</h3>
                </div>
                {saved && (
                    <span className="text-xs text-emerald-500 flex items-center gap-1">
                        <Check className="h-3.5 w-3.5" /> 保存しました
                    </span>
                )}
            </div>

            <div className="grid grid-cols-2 gap-2">
                {OPTIONS.map((opt) => (
                    <button
                        key={opt.value}
                        onClick={() => handleChange(opt.value)}
                        disabled={isPending}
                        className={`flex flex-col items-start p-3 rounded-xl border transition-colors text-left disabled:opacity-50 ${
                            current === opt.value
                                ? "border-primary bg-primary/5"
                                : "border-stone-200 hover:border-stone-300"
                        }`}
                    >
                        <div className="flex items-center justify-between w-full mb-0.5">
                            <span className="text-sm font-semibold text-stone-700">
                                {opt.label}
                            </span>
                            {current === opt.value && (
                                <Check className="h-4 w-4 text-primary" />
                            )}
                        </div>
                        <span className="text-xs text-stone-400">{opt.description}</span>
                    </button>
                ))}
            </div>
        </div>
    );
}
