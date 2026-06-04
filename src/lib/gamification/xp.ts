// クイズ報酬の XP・レベル計算ロジック（純粋関数）。
// UI/DB から切り離してテスト可能にするため QuizPlayer から抽出した。

/** 1問あたりの基本 XP */
export const XP_PER_CORRECT = 10;
/** クイズ完了時の固定ボーナス XP */
export const XP_COMPLETION_BONUS = 20;
/** レベル L → L+1 に必要な XP（L * 100） */
export const xpForNextLevel = (level: number): number => level * 100;

/**
 * クイズ1回で獲得する XP を計算する。
 * @param score 正答数
 * @param bonusXp クエストモードなどの追加ボーナス（既定 0）
 */
export function calcEarnedXp(score: number, bonusXp = 0): number {
    const safeScore = Math.max(0, Math.floor(score));
    const safeBonus = Math.max(0, Math.floor(bonusXp));
    return safeScore * XP_PER_CORRECT + XP_COMPLETION_BONUS + safeBonus;
}

export interface LevelState {
    level: number;
    xp: number;
}

/**
 * 現在のレベル/XP に獲得 XP を加算し、レベルアップを反映した新しい状態を返す。
 * 1回の獲得で複数レベル上がるケースにも対応する。
 */
export function applyXpGain(
    currentLevel: number,
    currentXp: number,
    earnedXp: number,
): LevelState {
    // レベルは最低 1、XP は最低 0 に正規化（DB の null 既定値に対応）
    let level = Math.max(1, Math.floor(currentLevel || 1));
    let xp = Math.max(0, Math.floor(currentXp || 0)) + Math.max(0, Math.floor(earnedXp));

    let needed = xpForNextLevel(level);
    while (xp >= needed) {
        xp -= needed;
        level++;
        needed = xpForNextLevel(level);
    }

    return { level, xp };
}
