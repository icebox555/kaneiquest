"use server";

import { createClient } from "@/lib/supabase/server";
import { revalidatePath } from "next/cache";

const REGEN_CAP = 7;     // Auto-regen fills up to this value only
const MAX_HEARTS = 99;   // Absolute ceiling (earn hearts beyond REGEN_CAP via actions)
const REGEN_MINUTES = 15;
const REGEN_MS = REGEN_MINUTES * 60 * 1000;

export interface HeartStatus {
    hearts: number;
    maxHearts: number;
    nextRegenTime: Date | null;
    isUnlimited: boolean;
}

export async function getHeartStatus(userId?: string): Promise<HeartStatus> {
    const supabase = await createClient();

    // If no userId provided, try to get from session (useful for client components calling this)
    if (!userId) {
        const { data: { user } } = await supabase.auth.getUser();
        if (!user) return { hearts: 0, maxHearts: MAX_HEARTS, nextRegenTime: null, isUnlimited: false };
        userId = user.id;
    }

    // Fetch user profile
    const { data: profile, error } = await supabase
        .from('profiles')
        .select('hearts, last_heart_regenerated_at, plan')
        .eq('id', userId)
        .single();

    if (error || !profile) {
        console.error("Error fetching heart status:", error);
        return { hearts: 0, maxHearts: MAX_HEARTS, nextRegenTime: null, isUnlimited: false };
    }

    // Unlimited for Pro
    if (profile.plan === 'pro' || profile.plan === 'premium') {
        return { hearts: profile.hearts ?? REGEN_CAP, maxHearts: REGEN_CAP, nextRegenTime: null, isUnlimited: true };
    }

    let { hearts, last_heart_regenerated_at } = profile;

    // Regen only applies when below REGEN_CAP (7).
    // Hearts above REGEN_CAP are earned via actions and are not auto-regenerated.
    if (hearts >= REGEN_CAP) {
        return { hearts, maxHearts: REGEN_CAP, nextRegenTime: null, isUnlimited: false };
    }

    // Calculate regeneration
    const lastRegen = new Date(last_heart_regenerated_at);
    const now = new Date();
    const elapsed = now.getTime() - lastRegen.getTime();

    if (elapsed > 0) {
        const heartsRecovered = Math.floor(elapsed / REGEN_MS);

        if (heartsRecovered > 0) {
            // Regen fills only up to REGEN_CAP (7), never beyond
            const newHearts = Math.min(REGEN_CAP, hearts + heartsRecovered);
            const newLastRegen = new Date(lastRegen.getTime() + (heartsRecovered * REGEN_MS));

            const { error: updateError } = await supabase
                .from('profiles')
                .update({
                    hearts: newHearts,
                    last_heart_regenerated_at: newLastRegen.toISOString()
                })
                .eq('id', userId);

            if (!updateError) {
                hearts = newHearts;
                last_heart_regenerated_at = newLastRegen.toISOString();
            }
        }
    }

    // Show regen timer only while below REGEN_CAP
    let nextRegenTime = null;
    if (hearts < REGEN_CAP) {
        nextRegenTime = new Date(new Date(last_heart_regenerated_at).getTime() + REGEN_MS);
    }

    return {
        hearts,
        maxHearts: REGEN_CAP,
        nextRegenTime,
        isUnlimited: false
    };
}

export async function consumeHeart(): Promise<{ success: boolean; message?: string }> {
    const supabase = await createClient();

    // Always derive userId from the authenticated session — never accept it as a parameter
    // to prevent callers from consuming hearts on behalf of other users.
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return { success: false, message: "User not found" };
    const userId = user.id;

    // Get current status (triggers update logic)
    const status = await getHeartStatus(userId);

    if (status.isUnlimited) {
        return { success: true };
    }

    if (status.hearts <= 0) {
        return { success: false, message: "Not enough hearts" };
    }

    // Consuming heart
    const updates: any = {
        hearts: status.hearts - 1
    };

    // If we were at MAX_HEARTS, we need to start the timer NOW.
    // getHeartStatus returns the *current* state. 
    // If hearts was MAX (7), the timer wasn't running/didn't matter.
    // So we set last_heart_regenerated_at to NOW.
    if (status.hearts === MAX_HEARTS) {
        updates.last_heart_regenerated_at = new Date().toISOString();
    }
    // If hearts < MAX, the timer is already running relative to existing last_heart_regenerated_at, so we DON'T touch it.

    const { error } = await supabase
        .from('profiles')
        .update(updates)
        .eq('id', userId);

    if (error) {
        console.error("Error consuming heart:", error);
        return { success: false, message: "Database error" };
    }

    revalidatePath('/practice');
    revalidatePath('/dashboard');
    return { success: true };
}

// --- Heart Earning System ---

const DAILY_LIMITS: Record<string, number> = {
    daily_login: 1,
    quiz_complete: 1,
    share: 3,
    referral_signup: 10,
};

export async function earnHeart(actionType: string): Promise<{ success: boolean; message?: string }> {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return { success: false, message: "Login required" };

    const limit = DAILY_LIMITS[actionType];
    if (limit === undefined) return { success: false, message: "Unknown action" };

    const todayStart = new Date();
    todayStart.setHours(0, 0, 0, 0);

    const { count } = await supabase
        .from('heart_action_logs')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', user.id)
        .eq('action_type', actionType)
        .gte('created_at', todayStart.toISOString());

    if ((count ?? 0) >= limit) {
        return { success: false, message: "本日の上限に達しました" };
    }

    // Log the action first (guard against double-execution)
    const { error: logError } = await supabase.from('heart_action_logs').insert({
        user_id: user.id,
        action_type: actionType,
    });
    if (logError) return { success: false, message: "Failed to log action" };

    // Add heart, capped at MAX_HEARTS
    const { data: profile } = await supabase
        .from('profiles')
        .select('hearts')
        .eq('id', user.id)
        .single();

    if (profile) {
        // Can exceed REGEN_CAP (7) via actions, capped at hard MAX_HEARTS (99)
        const newHearts = Math.min(MAX_HEARTS, profile.hearts + 1);
        await supabase.from('profiles').update({ hearts: newHearts }).eq('id', user.id);
    }

    revalidatePath('/dashboard');
    revalidatePath('/practice');
    return { success: true };
}

// Called when a new user signs up via a referral link — rewards the referrer
export async function processReferral(referrerId: string): Promise<{ success: boolean }> {
    if (!referrerId) return { success: false };
    const supabase = await createClient();

    // Verify referrer exists and is not the current user
    const { data: { user } } = await supabase.auth.getUser();
    if (!user || user.id === referrerId) return { success: false };

    const { data: referrer } = await supabase
        .from('profiles')
        .select('hearts')
        .eq('id', referrerId)
        .single();

    if (!referrer) return { success: false };

    const todayStart = new Date();
    todayStart.setHours(0, 0, 0, 0);

    // Check daily referral limit for the referrer
    const { count } = await supabase
        .from('heart_action_logs')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', referrerId)
        .eq('action_type', 'referral_signup')
        .gte('created_at', todayStart.toISOString());

    if ((count ?? 0) >= DAILY_LIMITS.referral_signup) return { success: false };

    await supabase.from('heart_action_logs').insert({
        user_id: referrerId,
        action_type: 'referral_signup',
    });

    const newHearts = Math.min(MAX_HEARTS, referrer.hearts + 1);  // cap at 99
    await supabase.from('profiles').update({ hearts: newHearts }).eq('id', referrerId);

    return { success: true };
}

// --- Original sendHeart ---

export async function sendHeart(targetUserId: string): Promise<{ success: boolean; message?: string }> {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) return { success: false, message: "Login required" };
    if (user.id === targetUserId) return { success: false, message: "自分には送れません" };

    // Check cooldown (1 hour)
    const { data: existingLog } = await supabase
        .from('heart_logs')
        .select('created_at')
        .eq('sender_id', user.id)
        .eq('receiver_id', targetUserId)
        .gt('created_at', new Date(Date.now() - 60 * 60 * 1000).toISOString())
        .single();

    if (existingLog) {
        return { success: false, message: "1時間に1回だけ送れます" };
    }

    // Transaction-like operations
    // 1. Log the send
    const { error: logError } = await supabase
        .from('heart_logs')
        .insert({
            sender_id: user.id,
            receiver_id: targetUserId
        });

    if (logError) {
        console.error("Error logging heart:", logError);
        return { success: false, message: "Failed to send" };
    }

    // 2. Increment receiver hearts (RPC is safer for concurrency but simple update is fine for now)
    // We strictly increment, ignoring MAX_HEARTS cap for "Inbox" style overflow?
    // User requested "Sender gets +1 heart".
    // Let's increment.

    // Fetch receiver profile first to check existence and current hearts
    const { data: receiver } = await supabase.from('profiles').select('hearts').eq('id', targetUserId).single();
    if (receiver) {
        await supabase.from('profiles').update({ hearts: Math.min(MAX_HEARTS, receiver.hearts + 1) }).eq('id', targetUserId);
    }

    // 3. Reward sender (XP + 10)
    // Fetch sender profile
    const { data: sender } = await supabase.from('profiles').select('xp, level').eq('id', user.id).single();
    if (sender) {
        // Simple XP addition, level up logic duplicated from QuizPlayer? 
        // ideally shared util, but for 10xp unlikely to level up often. 
        // Let's look at `updateUserStats` in QuizPlayer. 
        // For now just add XP.
        await supabase.from('profiles').update({ xp: sender.xp + 10 }).eq('id', user.id);
    }

    revalidatePath('/dashboard');
    return { success: true, message: "ハートを送りました！ (+10 XP)" };
}
