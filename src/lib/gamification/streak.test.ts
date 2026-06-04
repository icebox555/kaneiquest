import { describe, expect, it } from "vitest";
import { computeAtRiskUsers, type TaskRow } from "./streak";

const Y = "2026-06-03";
const T = "2026-06-04";

describe("computeAtRiskUsers", () => {
    it("昨日完了・今日未完了のユーザーを対象にする", () => {
        const tasks: TaskRow[] = [{ user_id: "u1", scheduled_date: Y }];
        expect(computeAtRiskUsers(tasks, Y, T)).toEqual(["u1"]);
    });

    it("今日も完了済みなら対象外", () => {
        const tasks: TaskRow[] = [
            { user_id: "u1", scheduled_date: Y },
            { user_id: "u1", scheduled_date: T },
        ];
        expect(computeAtRiskUsers(tasks, Y, T)).toEqual([]);
    });

    it("昨日やっていない（今日だけ）ユーザーは対象外", () => {
        const tasks: TaskRow[] = [{ user_id: "u2", scheduled_date: T }];
        expect(computeAtRiskUsers(tasks, Y, T)).toEqual([]);
    });

    it("複数ユーザーを正しく振り分ける", () => {
        const tasks: TaskRow[] = [
            { user_id: "at-risk", scheduled_date: Y },
            { user_id: "safe", scheduled_date: Y },
            { user_id: "safe", scheduled_date: T },
            { user_id: "new-today", scheduled_date: T },
        ];
        expect(computeAtRiskUsers(tasks, Y, T)).toEqual(["at-risk"]);
    });

    it("user_id が null の行は無視する", () => {
        const tasks: TaskRow[] = [{ user_id: null, scheduled_date: Y }];
        expect(computeAtRiskUsers(tasks, Y, T)).toEqual([]);
    });
});
