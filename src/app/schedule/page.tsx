import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import {
    getSchedule,
    getTasksForDate,
    getTasksForRange,
} from "@/lib/actions/schedule";
import { ScheduleSetup } from "@/components/schedule/ScheduleSetup";
import { ScheduleClient } from "@/components/schedule/ScheduleClient";

function calcStudyDaysAvailable(
    examDate: string,
    studyDays: number[]
): number {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const exam = new Date(examDate);
    exam.setHours(0, 0, 0, 0);

    let count = 0;
    const cur = new Date(today);
    while (cur < exam) {
        if (studyDays.includes(cur.getDay())) count++;
        cur.setDate(cur.getDate() + 1);
    }
    return count;
}

function calcStreak(tasks: { scheduled_date: string; status: string }[]): number {
    const completedDates = new Set(
        tasks
            .filter((t) => t.status === "completed")
            .map((t) => t.scheduled_date)
    );

    let streak = 0;
    const cur = new Date();
    cur.setHours(0, 0, 0, 0);

    // Count back from today
    for (let i = 0; i < 365; i++) {
        const dateStr = cur.toISOString().split("T")[0];
        if (completedDates.has(dateStr)) {
            streak++;
            cur.setDate(cur.getDate() - 1);
        } else {
            break;
        }
    }
    return streak;
}

export default async function SchedulePage() {
    const supabase = await createClient();
    const {
        data: { user },
    } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    const schedule = await getSchedule();

    // First visit — show setup wizard
    if (!schedule) {
        return (
            <div className="min-h-screen bg-transparent pt-24 pb-12">
                <div className="container max-w-4xl px-4 md:px-6">
                    <div className="mb-8 text-center">
                        <h1 className="text-3xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-stone-800 to-stone-600">
                            学習スケジュール
                        </h1>
                        <p className="text-stone-500 mt-2">
                            まず学習計画を設定しましょう
                        </p>
                    </div>
                    <ScheduleSetup />
                </div>
            </div>
        );
    }

    // Fetch tasks
    const todayStr = new Date().toISOString().split("T")[0];

    const rangeFrom = todayStr;
    const rangeTo = new Date(
        Date.now() + 30 * 24 * 60 * 60 * 1000
    )
        .toISOString()
        .split("T")[0];

    const [todayTasks, rangeTasks] = await Promise.all([
        getTasksForDate(todayStr),
        getTasksForRange(rangeFrom, rangeTo),
    ]);

    // Also get recent tasks for streak calculation (last 60 days)
    const recentFrom = new Date(Date.now() - 60 * 24 * 60 * 60 * 1000)
        .toISOString()
        .split("T")[0];
    const { data: recentTasks } = await supabase
        .from("study_tasks")
        .select("scheduled_date, status")
        .eq("user_id", user.id)
        .gte("scheduled_date", recentFrom)
        .lte("scheduled_date", todayStr);

    const streak = calcStreak(recentTasks ?? []);
    const studyDaysAvailable = calcStudyDaysAvailable(
        schedule.exam_date,
        schedule.study_days
    );

    return (
        <div className="min-h-screen bg-transparent pt-24 pb-12">
            <div className="container max-w-4xl px-4 md:px-6">
                <div className="mb-6">
                    <h1 className="text-3xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-stone-800 to-stone-600">
                        学習スケジュール
                    </h1>
                    <p className="text-stone-500 mt-1 text-sm">
                        毎日少しずつ、着実に進めましょう
                    </p>
                </div>

                <ScheduleClient
                    schedule={schedule}
                    todayTasks={todayTasks}
                    rangeTasks={rangeTasks}
                    streak={streak}
                    studyDaysAvailable={studyDaysAvailable}
                />
            </div>
        </div>
    );
}
