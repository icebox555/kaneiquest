import { createClient } from "@supabase/supabase-js";
import { NextResponse } from "next/server";
import { computeAtRiskUsers } from "@/lib/gamification/streak";

// ストリーク維持リマインドを毎日生成する Cron ジョブ。
// 「昨日は学習タスクを完了したが、今日はまだ未完了」のユーザーへ通知を1件挿入する。
// Vercel Cron から日次で呼ばれる想定（vercel.json の crons 参照）。
//
// 必要な環境変数:
//   - CRON_SECRET                  : Vercel Cron の Authorization Bearer と照合
//   - NEXT_PUBLIC_SUPABASE_URL     : Supabase プロジェクト URL
//   - SUPABASE_SERVICE_ROLE_KEY    : RLS を越えて全ユーザーを処理するためのサービスロールキー

export const dynamic = "force-dynamic";

// dashboard のストリーク計算と同じく UTC 日付文字列で揃える。
function utcDateString(offsetDays: number): string {
    const d = new Date();
    d.setUTCDate(d.getUTCDate() + offsetDays);
    return d.toISOString().split("T")[0];
}

export async function GET(request: Request) {
    // --- 認可: Vercel Cron は Authorization: Bearer <CRON_SECRET> を送る ---
    const cronSecret = process.env.CRON_SECRET;
    if (!cronSecret) {
        return NextResponse.json({ error: "CRON_SECRET not configured" }, { status: 500 });
    }
    const auth = request.headers.get("authorization");
    if (auth !== `Bearer ${cronSecret}`) {
        return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
    const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
    if (!supabaseUrl || !serviceKey) {
        return NextResponse.json({ error: "Supabase env not configured" }, { status: 500 });
    }

    const supabase = createClient(supabaseUrl, serviceKey, {
        auth: { autoRefreshToken: false, persistSession: false },
    });

    const today = utcDateString(0);
    const yesterday = utcDateString(-1);

    // 昨日・今日に「完了」した学習タスクをまとめて取得
    const { data: tasks, error: tasksError } = await supabase
        .from("study_tasks")
        .select("user_id, scheduled_date")
        .eq("status", "completed")
        .in("scheduled_date", [yesterday, today]);

    if (tasksError) {
        return NextResponse.json({ error: tasksError.message }, { status: 500 });
    }

    // 昨日やったが今日まだ → ストリークが途切れそうなユーザー
    const atRisk = computeAtRiskUsers(tasks ?? [], yesterday, today);
    if (atRisk.length === 0) {
        return NextResponse.json({ ok: true, reminded: 0, scanned: 0 });
    }

    // 二重送信防止: 今日すでに streak_reminder を受け取ったユーザーを除外
    const todayStart = `${today}T00:00:00.000Z`;
    const { data: existing } = await supabase
        .from("notifications")
        .select("user_id")
        .eq("type", "streak_reminder")
        .gte("created_at", todayStart)
        .in("user_id", atRisk);

    const alreadyNotified = new Set((existing ?? []).map((n) => n.user_id));
    const targets = atRisk.filter((uid) => !alreadyNotified.has(uid));

    if (targets.length === 0) {
        return NextResponse.json({ ok: true, reminded: 0, scanned: atRisk.length });
    }

    const rows = targets.map((uid) => ({
        user_id: uid,
        title: "🔥 ストリークが途切れそう！",
        message: "今日まだ学習が完了していません。1問だけでも解いて連続記録を守りましょう。",
        type: "streak_reminder",
    }));

    const { error: insertError } = await supabase.from("notifications").insert(rows);
    if (insertError) {
        return NextResponse.json({ error: insertError.message }, { status: 500 });
    }

    return NextResponse.json({ ok: true, reminded: targets.length, scanned: atRisk.length });
}
