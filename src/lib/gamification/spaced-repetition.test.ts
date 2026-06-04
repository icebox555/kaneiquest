import { describe, expect, it } from "vitest";
import { dueWindow, SPACED_INTERVALS, WINDOW_TOLERANCE_HOURS } from "./spaced-repetition";

const DAY = 24 * 60 * 60 * 1000;
const HOUR = 60 * 60 * 1000;
const NOW = new Date("2026-06-04T12:00:00.000Z");

describe("SPACED_INTERVALS", () => {
    it("1日後・3日後・7日後", () => {
        expect([...SPACED_INTERVALS]).toEqual([1, 3, 7]);
    });
});

describe("dueWindow", () => {
    it("from は (days+1) 日前", () => {
        const { from } = dueWindow(NOW, 1);
        expect(from.getTime()).toBe(NOW.getTime() - 2 * DAY);
    });

    it("to は (days-1) 日前 + 許容時間", () => {
        const { to } = dueWindow(NOW, 1);
        expect(to.getTime()).toBe(NOW.getTime() - 0 * DAY + WINDOW_TOLERANCE_HOURS * HOUR);
    });

    it("ちょうど days 日前の時刻はウィンドウ内に含まれる", () => {
        for (const days of SPACED_INTERVALS) {
            const { from, to } = dueWindow(NOW, days);
            const exactlyDaysAgo = NOW.getTime() - days * DAY;
            expect(exactlyDaysAgo).toBeGreaterThanOrEqual(from.getTime());
            expect(exactlyDaysAgo).toBeLessThanOrEqual(to.getTime());
        }
    });

    it("ウィンドウ幅は 2日 + 許容時間", () => {
        const { from, to } = dueWindow(NOW, 3);
        expect(to.getTime() - from.getTime()).toBe(2 * DAY + WINDOW_TOLERANCE_HOURS * HOUR);
    });
});
