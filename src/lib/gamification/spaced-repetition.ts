// 間隔反復（spaced repetition）の「今日が復習日」を判定する時間ウィンドウ計算。
// 復習ハブ（件数カウント）と復習プレイヤー（出題）で共有してテスト可能にする。

const DAY_MS = 24 * 60 * 60 * 1000;
const HOUR_MS = 60 * 60 * 1000;

/** 間違えた問題を再出題する間隔（日数）。1日後・3日後・7日後。 */
export const SPACED_INTERVALS = [1, 3, 7] as const;

/** ±許容時間（時）。境界の取りこぼし防止のため to 側を広げる。 */
export const WINDOW_TOLERANCE_HOURS = 20;

export interface DueWindow {
    from: Date;
    to: Date;
}

/**
 * 「`days` 日前に間違えた問題」を今日の復習対象とみなすための
 * created_at の検索ウィンドウ（from..to）を返す。
 *
 * @param now  現在時刻
 * @param days 何日前を対象とするか（SPACED_INTERVALS の各値）
 */
export function dueWindow(now: Date, days: number): DueWindow {
    const from = new Date(now.getTime() - (days + 1) * DAY_MS);
    const to = new Date(now.getTime() - (days - 1) * DAY_MS + WINDOW_TOLERANCE_HOURS * HOUR_MS);
    return { from, to };
}
