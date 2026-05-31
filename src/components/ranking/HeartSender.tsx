"use client";

import { useState } from "react";
import { Heart, Loader2 } from "lucide-react";
import { sendHeart } from "@/lib/actions/heart";

export function HeartSender({ targetUserId, isMe }: { targetUserId: string, isMe: boolean }) {
    const [loading, setLoading] = useState(false);
    const [sent, setSent] = useState(false);
    const [errorMsg, setErrorMsg] = useState<string | null>(null);

    if (isMe) return null;

    const handleSend = async (e: React.MouseEvent) => {
        e.preventDefault();
        e.stopPropagation();

        if (loading || sent) return;

        setLoading(true);
        setErrorMsg(null);
        try {
            const result = await sendHeart(targetUserId);
            if (result.success) {
                setSent(true);
            } else {
                setErrorMsg(result.message || "送信に失敗しました");
            }
        } catch (error) {
            console.error("Failed to send heart", error);
            setErrorMsg("エラーが発生しました");
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="flex flex-col items-center gap-1">
            <button
                onClick={handleSend}
                disabled={loading || sent}
                className={`w-10 h-10 rounded-full border flex items-center justify-center shadow-sm transition-all group/heart
                    ${sent
                        ? "bg-rose-100 border-rose-200 text-rose-500 cursor-default"
                        : "bg-white border-rose-100 text-rose-300 hover:text-rose-500 hover:bg-rose-50 hover:border-rose-200 hover:scale-110 hover:shadow-md active:scale-95"
                    }
                `}
                title={sent ? "送信済み" : "ハートを送る (1時間に1回)"}
            >
                {loading
                    ? <Loader2 className="w-4 h-4 animate-spin" />
                    : <Heart className={`w-5 h-5 fill-current ${sent ? "" : "group-hover/heart:animate-pulse"}`} />
                }
            </button>
            {errorMsg && (
                <span className="text-[10px] text-red-500 text-center max-w-[60px] leading-tight">{errorMsg}</span>
            )}
        </div>
    );
}
