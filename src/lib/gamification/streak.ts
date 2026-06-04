// ストリークリマインドの対象ユーザー判定ロジック（純粋関数）。
// Cron ルートから切り離してテスト可能にする。

export interface TaskRow {
    user_id: string | null;
    scheduled_date: string; // YYYY-MM-DD
    // status は呼び出し側で 'completed' に絞り込み済みの前提
}

/**
 * 「昨日は学習タスクを完了したが、今日はまだ完了していない」ユーザーの一覧を返す。
 * これらはストリークが途切れる手前にいるため、リマインド対象となる。
 *
 * @param completedTasks status='completed' に絞った昨日・今日のタスク行
 * @param yesterday YYYY-MM-DD
 * @param today YYYY-MM-DD
 */
export function computeAtRiskUsers(
    completedTasks: TaskRow[],
    yesterday: string,
    today: string,
): string[] {
    const doneYesterday = new Set<string>();
    const doneToday = new Set<string>();

    for (const t of completedTasks) {
        if (!t.user_id) continue;
        if (t.scheduled_date === yesterday) doneYesterday.add(t.user_id);
        if (t.scheduled_date === today) doneToday.add(t.user_id);
    }

    return [...doneYesterday].filter((uid) => !doneToday.has(uid));
}
