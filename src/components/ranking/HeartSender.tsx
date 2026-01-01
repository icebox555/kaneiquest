"use client";

import { useState } from "react";
import { Heart } from "lucide-react";
import { sendHeart } from "@/lib/actions/heart";

export function HeartSender({ targetUserId, isMe }: { targetUserId: string, isMe: boolean }) {
    const [loading, setLoading] = useState(false);
    const [sent, setSent] = useState(false);

    if (isMe) return null; // Logic handled in parent, but good safety

    const handleSend = async (e: React.MouseEvent) => {
        e.preventDefault();
        e.stopPropagation();

        if (loading || sent) return;

        if (!confirm("ハートを送りますか？(1時間に1回)")) return;

        setLoading(true);
        try {
            const result = await sendHeart(targetUserId);
            if (result.success) {
                setSent(true);
                alert(result.message);
            } else {
                alert(result.message);
            }
        } catch (error) {
            console.error("Failed to send heart", error);
        } finally {
            setLoading(false);
        }
    };

    return (
        <button
            onClick={handleSend}
            disabled={loading || sent}
            className={`w-10 h-10 rounded-full border flex items-center justify-center shadow-sm transition-all group/heart
                ${sent
                    ? "bg-rose-100 border-rose-200 text-rose-500 cursor-default"
                    : "bg-white border-rose-100 text-rose-300 hover:text-rose-500 hover:bg-rose-50 hover:border-rose-200 hover:scale-110 hover:shadow-md active:scale-95"
                }
            `}
            title={sent ? "送信済み" : "ハートを送る"}
        >
            <Heart className={`w-5 h-5 fill-current ${loading ? "animate-pulse" : sent ? "" : "group-hover/heart:animate-pulse"}`} />
        </button>
    );
}
