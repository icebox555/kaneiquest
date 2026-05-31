"use client";

import { useEffect, useState } from "react";
import { Heart, Infinity as InfinityIcon } from "lucide-react";
import { HeartStatus, getHeartStatus } from "@/lib/actions/heart";

export function HeartDisplay() {
    const [status, setStatus] = useState<HeartStatus | null>(null);
    const [timeLeft, setTimeLeft] = useState<string>("");

    // Fetch status
    const fetchStatus = async () => {
        const data = await getHeartStatus();
        setStatus(data);
    };

    useEffect(() => {
        fetchStatus();

        // Refresh periodically (every 1 min to sync with server)
        const interval = setInterval(fetchStatus, 60000);
        return () => clearInterval(interval);
    }, []);

    // Countdown timer logic
    useEffect(() => {
        if (!status || status.isUnlimited || !status.nextRegenTime) {
            setTimeLeft("");
            return;
        }

        const updateTimer = () => {
            const now = new Date().getTime();
            const target = new Date(status.nextRegenTime!).getTime();
            const diff = target - now;

            if (diff <= 0) {
                // Time up, refresh status
                fetchStatus();
                return;
            }

            const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((diff % (1000 * 60)) / 1000);
            setTimeLeft(`${minutes}:${seconds.toString().padStart(2, '0')}`);
        };

        updateTimer(); // Initial call
        const timer = setInterval(updateTimer, 1000);
        return () => clearInterval(timer);
    }, [status]);

    if (!status) return null; // Loading state

    const overflowing = status.hearts > status.maxHearts;

    return (
        <div
            className={`flex items-center gap-1.5 px-3 py-1.5 rounded-full border shadow-sm text-sm font-bold transition-colors
                ${overflowing
                    ? "bg-rose-50 border-rose-200 text-rose-600"
                    : "bg-white/50 backdrop-blur-sm border-stone-200 text-stone-600"
                }`}
            title="ハート (スタミナ) — 7を超えた分はアクションで獲得したボーナス"
        >
            <Heart className={`w-4 h-4 ${status.hearts > 0 ? "text-rose-500 fill-rose-500" : "text-stone-300"}`} />

            {status.isUnlimited ? (
                <InfinityIcon className="w-4 h-4 text-rose-500" />
            ) : overflowing ? (
                // Hearts above regen cap — show count with + badge
                <div className="flex items-baseline gap-0.5">
                    <span className="text-rose-600">{status.hearts}</span>
                    <span className="text-rose-300 text-[10px] font-normal">+{status.hearts - status.maxHearts}</span>
                </div>
            ) : (
                <div className="flex items-baseline gap-1">
                    <span className={status.hearts === 0 ? "text-rose-500" : "text-stone-700"}>
                        {status.hearts}
                    </span>
                    <span className="text-stone-400 text-[10px] font-normal">
                        /{status.maxHearts}
                    </span>
                </div>
            )}

            {!status.isUnlimited && status.hearts < status.maxHearts && timeLeft && (
                <span className="text-[10px] text-stone-400 font-mono w-[32px] text-right">
                    {timeLeft}
                </span>
            )}
        </div>
    );
}
