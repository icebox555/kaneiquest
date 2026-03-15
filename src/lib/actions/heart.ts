"use server";

import { createClient } from "@/lib/supabase/server";
import { revalidatePath } from "next/cache";

const MAX_HEARTS = 7;
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
    if (profile.plan === 'pro' || profile.plan === 'premium') { // Assuming 'pro' or check your plan logic
        return { hearts: MAX_HEARTS, maxHearts: MAX_HEARTS, nextRegenTime: null, isUnlimited: true };
    }

    let { hearts, last_heart_regenerated_at } = profile;

    // If already at max, no regen needed
    if (hearts >= MAX_HEARTS) {
        return { hearts: MAX_HEARTS, maxHearts: MAX_HEARTS, nextRegenTime: null, isUnlimited: false };
    }

    // Calculate regeneration
    const lastRegen = new Date(last_heart_regenerated_at);
    const now = new Date();
    const elapsed = now.getTime() - lastRegen.getTime();

    if (elapsed > 0) {
        const heartsRecovered = Math.floor(elapsed / REGEN_MS);

        if (heartsRecovered > 0) {
            const newHearts = Math.min(MAX_HEARTS, hearts + heartsRecovered);

            // Calculate new last regen time (preserve progress)
            // If we reached max, we effectively stop the timer, but for DB consistency we can just update hearts
            // If we didn't reach max, we advance last_regenerated_at by heartsRecovered * REGEN_MS
            let newLastRegen = new Date(lastRegen.getTime() + (heartsRecovered * REGEN_MS));

            // If we capped at MAX_HEARTS, the precise time doesn't matter as much until we consume again, 
            // but let's keep it clean.

            // Update DB
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

    // Recalculate next regen time if still distinct from max
    let nextRegenTime = null;
    if (hearts < MAX_HEARTS) {
        nextRegenTime = new Date(new Date(last_heart_regenerated_at).getTime() + REGEN_MS);
    }

    return {
        hearts,
        maxHearts: MAX_HEARTS,
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
        await supabase.from('profiles').update({ hearts: receiver.hearts + 1 }).eq('id', targetUserId);
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
