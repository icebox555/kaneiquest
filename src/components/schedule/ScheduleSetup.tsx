"use client";

import { useState, useTransition } from "react";
import { Calendar, Clock, Bell, ChevronRight, Check } from "lucide-react";
import { upsertSchedule, generateStudyPlan } from "@/lib/actions/schedule";
import type { ScheduleInput } from "@/lib/actions/schedule";

const DAYS = [
    { label: "日", value: 0 },
    { label: "月", value: 1 },
    { label: "火", value: 2 },
    { label: "水", value: 3 },
    { label: "木", value: 4 },
    { label: "金", value: 5 },
    { label: "土", value: 6 },
];

const NOTIFICATION_OPTIONS = [
    { value: "both", label: "両方", description: "ブラウザ通知 + アプリ内通知" },
    { value: "browser", label: "ブラウザ", description: "ブラウザ通知のみ" },
    { value: "inapp", label: "アプリ内", description: "アプリ内通知のみ" },
    { value: "none", label: "なし", description: "通知しない" },
] as const;

const GOAL_OPTIONS = [30, 60, 90, 120];

export function ScheduleSetup() {
    const [step, setStep] = useState(1);
    const [isPending, startTransition] = useTransition();
    const [error, setError] = useState<string | null>(null);

    const [form, setForm] = useState<ScheduleInput>({
        exam_date: "2026-03-01",
        daily_goal_minutes: 60,
        study_days: [1, 2, 3, 4, 5],
        notification_pref: "both",
    });

    function toggleDay(day: number) {
        setForm((prev) => ({
            ...prev,
            study_days: prev.study_days.includes(day)
                ? prev.study_days.filter((d) => d !== day)
                : [...prev.study_days, day].sort(),
        }));
    }

    function handleFinish() {
        startTransition(async () => {
            setError(null);
            const result = await upsertSchedule(form);
            if (!result.success) {
                setError(result.error ?? "エラーが発生しました");
                return;
            }
            // Auto-generate study plan after setup
            const planResult = await generateStudyPlan();
            if (!planResult.success) {
                setError(planResult.error ?? "計画生成に失敗しました");
            }
        });
    }

    return (
        <div className="min-h-[50vh] flex items-center justify-center">
            <div className="w-full max-w-lg">
                <div className="rounded-2xl glass p-8 shadow-xl">
                    {/* Step indicator */}
                    <div className="flex items-center justify-center gap-2 mb-8">
                        {[1, 2, 3].map((s) => (
                            <div key={s} className="flex items-center gap-2">
                                <div
                                    className={`w-8 h-8 rounded-full flex items-center justify-center text-sm font-bold transition-colors ${
                                        step > s
                                            ? "bg-emerald-500 text-white"
                                            : step === s
                                            ? "bg-primary text-white"
                                            : "bg-stone-100 text-stone-400"
                                    }`}
                                >
                                    {step > s ? <Check className="h-4 w-4" /> : s}
                                </div>
                                {s < 3 && (
                                    <div
                                        className={`w-8 h-0.5 ${
                                            step > s ? "bg-emerald-500" : "bg-stone-200"
                                        }`}
                                    />
                                )}
                            </div>
                        ))}
                    </div>

                    {/* Step 1: Exam date & goal */}
                    {step === 1 && (
                        <div className="flex flex-col gap-6">
                            <div className="text-center">
                                <div className="w-12 h-12 bg-primary/10 rounded-2xl flex items-center justify-center mx-auto mb-3">
                                    <Calendar className="h-6 w-6 text-primary" />
                                </div>
                                <h2 className="text-xl font-bold text-stone-800">試験日と目標を設定</h2>
                                <p className="text-stone-500 text-sm mt-1">
                                    学習スケジュールを自動生成します
                                </p>
                            </div>

                            <div className="flex flex-col gap-2">
                                <label className="text-sm font-medium text-stone-700">
                                    試験日
                                </label>
                                <input
                                    type="date"
                                    value={form.exam_date}
                                    onChange={(e) =>
                                        setForm((p) => ({ ...p, exam_date: e.target.value }))
                                    }
                                    className="h-11 rounded-xl border border-stone-200 bg-white/70 px-4 text-stone-800 focus:outline-none focus:ring-2 focus:ring-primary/30"
                                />
                            </div>

                            <div className="flex flex-col gap-2">
                                <label className="text-sm font-medium text-stone-700">
                                    1日の学習目標
                                </label>
                                <div className="grid grid-cols-4 gap-2">
                                    {GOAL_OPTIONS.map((mins) => (
                                        <button
                                            key={mins}
                                            onClick={() =>
                                                setForm((p) => ({
                                                    ...p,
                                                    daily_goal_minutes: mins,
                                                }))
                                            }
                                            className={`py-2 rounded-xl text-sm font-semibold border transition-colors ${
                                                form.daily_goal_minutes === mins
                                                    ? "border-primary bg-primary text-white"
                                                    : "border-stone-200 hover:border-primary text-stone-600"
                                            }`}
                                        >
                                            {mins}分
                                        </button>
                                    ))}
                                </div>
                            </div>

                            <button
                                onClick={() => setStep(2)}
                                className="w-full h-12 rounded-xl bg-primary text-white font-semibold flex items-center justify-center gap-2 hover:bg-primary/90 transition-colors"
                            >
                                次へ <ChevronRight className="h-4 w-4" />
                            </button>
                        </div>
                    )}

                    {/* Step 2: Study days */}
                    {step === 2 && (
                        <div className="flex flex-col gap-6">
                            <div className="text-center">
                                <div className="w-12 h-12 bg-primary/10 rounded-2xl flex items-center justify-center mx-auto mb-3">
                                    <Clock className="h-6 w-6 text-primary" />
                                </div>
                                <h2 className="text-xl font-bold text-stone-800">学習曜日を選択</h2>
                                <p className="text-stone-500 text-sm mt-1">
                                    学習する曜日を選んでください
                                </p>
                            </div>

                            <div className="flex justify-center gap-2">
                                {DAYS.map((day) => (
                                    <button
                                        key={day.value}
                                        onClick={() => toggleDay(day.value)}
                                        className={`w-10 h-10 rounded-full text-sm font-bold transition-colors ${
                                            form.study_days.includes(day.value)
                                                ? day.value === 0
                                                    ? "bg-red-400 text-white"
                                                    : day.value === 6
                                                    ? "bg-blue-400 text-white"
                                                    : "bg-primary text-white"
                                                : "bg-stone-100 text-stone-400 hover:bg-stone-200"
                                        }`}
                                    >
                                        {day.label}
                                    </button>
                                ))}
                            </div>

                            <p className="text-center text-sm text-stone-500">
                                {form.study_days.length > 0
                                    ? `週${form.study_days.length}日 学習します`
                                    : "最低1日は選択してください"}
                            </p>

                            <div className="flex gap-3">
                                <button
                                    onClick={() => setStep(1)}
                                    className="flex-1 h-12 rounded-xl border border-stone-200 text-stone-600 font-semibold hover:border-stone-300 transition-colors"
                                >
                                    戻る
                                </button>
                                <button
                                    onClick={() => setStep(3)}
                                    disabled={form.study_days.length === 0}
                                    className="flex-1 h-12 rounded-xl bg-primary text-white font-semibold flex items-center justify-center gap-2 hover:bg-primary/90 transition-colors disabled:opacity-50"
                                >
                                    次へ <ChevronRight className="h-4 w-4" />
                                </button>
                            </div>
                        </div>
                    )}

                    {/* Step 3: Notifications */}
                    {step === 3 && (
                        <div className="flex flex-col gap-6">
                            <div className="text-center">
                                <div className="w-12 h-12 bg-primary/10 rounded-2xl flex items-center justify-center mx-auto mb-3">
                                    <Bell className="h-6 w-6 text-primary" />
                                </div>
                                <h2 className="text-xl font-bold text-stone-800">通知設定</h2>
                                <p className="text-stone-500 text-sm mt-1">
                                    学習リマインダーを設定します
                                </p>
                            </div>

                            <div className="flex flex-col gap-2">
                                {NOTIFICATION_OPTIONS.map((opt) => (
                                    <button
                                        key={opt.value}
                                        onClick={() =>
                                            setForm((p) => ({
                                                ...p,
                                                notification_pref: opt.value,
                                            }))
                                        }
                                        className={`flex items-center justify-between p-4 rounded-xl border transition-colors text-left ${
                                            form.notification_pref === opt.value
                                                ? "border-primary bg-primary/5"
                                                : "border-stone-200 hover:border-stone-300"
                                        }`}
                                    >
                                        <div>
                                            <p className="text-sm font-semibold text-stone-700">
                                                {opt.label}
                                            </p>
                                            <p className="text-xs text-stone-400">{opt.description}</p>
                                        </div>
                                        {form.notification_pref === opt.value && (
                                            <Check className="h-5 w-5 text-primary" />
                                        )}
                                    </button>
                                ))}
                            </div>

                            {error && (
                                <p className="text-sm text-red-500 text-center">{error}</p>
                            )}

                            <div className="flex gap-3">
                                <button
                                    onClick={() => setStep(2)}
                                    className="flex-1 h-12 rounded-xl border border-stone-200 text-stone-600 font-semibold hover:border-stone-300 transition-colors"
                                >
                                    戻る
                                </button>
                                <button
                                    onClick={handleFinish}
                                    disabled={isPending}
                                    className="flex-1 h-12 rounded-xl bg-primary text-white font-semibold hover:bg-primary/90 transition-colors disabled:opacity-50"
                                >
                                    {isPending ? "生成中..." : "計画を作成"}
                                </button>
                            </div>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}
