import { describe, expect, it } from "vitest";
import { applyXpGain, calcEarnedXp, xpForNextLevel } from "./xp";

describe("calcEarnedXp", () => {
    it("正答数×10 + 完了ボーナス20 を返す", () => {
        expect(calcEarnedXp(0)).toBe(20);
        expect(calcEarnedXp(5)).toBe(70);
        expect(calcEarnedXp(10)).toBe(120);
    });

    it("ボーナスXP（クエストモード等）を加算する", () => {
        expect(calcEarnedXp(10, 50)).toBe(170);
    });

    it("負値や小数を安全に正規化する", () => {
        expect(calcEarnedXp(-3)).toBe(20);
        expect(calcEarnedXp(2.9)).toBe(40);
        expect(calcEarnedXp(5, -100)).toBe(70);
    });
});

describe("xpForNextLevel", () => {
    it("レベル × 100 を返す", () => {
        expect(xpForNextLevel(1)).toBe(100);
        expect(xpForNextLevel(7)).toBe(700);
    });
});

describe("applyXpGain", () => {
    it("レベルアップしない加算", () => {
        expect(applyXpGain(1, 0, 70)).toEqual({ level: 1, xp: 70 });
    });

    it("ちょうど閾値でレベルアップし XP は繰り越す", () => {
        // Lv1 は 100 で次へ → 余り 20 が Lv2 の XP に
        expect(applyXpGain(1, 50, 70)).toEqual({ level: 2, xp: 20 });
    });

    it("1回の獲得で複数レベル上がる", () => {
        // Lv1: 0 + 350 → 100消費(Lv2,残250) → 200消費(Lv3,残50)
        expect(applyXpGain(1, 0, 350)).toEqual({ level: 3, xp: 50 });
    });

    it("DBのnull既定（level=0/未設定, xp=0）を安全に扱う", () => {
        expect(applyXpGain(0, 0, 30)).toEqual({ level: 1, xp: 30 });
    });

    it("獲得0XPでも無限ループせず現状維持", () => {
        expect(applyXpGain(3, 40, 0)).toEqual({ level: 3, xp: 40 });
    });
});
