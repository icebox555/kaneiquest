"use client";

import { useState } from "react";
import { deleteQuestion } from "@/lib/actions/admin";
import { Button } from "@/components/ui/Button";
import { Trash } from "lucide-react";
import { useRouter } from "next/navigation";

export function DeleteQuestionButton({ questionId }: { questionId: string }) {
    const router = useRouter();
    const [loading, setLoading] = useState(false);
    const [confirming, setConfirming] = useState(false);

    const handleClick = () => {
        if (!confirming) {
            setConfirming(true);
            // Auto-cancel confirm after 3 seconds
            setTimeout(() => setConfirming(false), 3000);
            return;
        }
        handleDelete();
    };

    const handleDelete = async () => {
        setLoading(true);
        try {
            const result = await deleteQuestion(questionId);
            if (result.error) throw new Error(result.error);
            router.refresh();
        } catch (error: unknown) {
            console.error("削除に失敗しました:", error);
        } finally {
            setLoading(false);
            setConfirming(false);
        }
    };

    return (
        <Button
            variant="ghost"
            size="sm"
            className={`h-8 p-0 transition-all ${confirming ? 'w-16 text-[10px] px-1 text-red-300 bg-red-500/20' : 'w-8 text-red-400 hover:text-red-300 hover:bg-red-500/10'}`}
            onClick={handleClick}
            loading={loading}
            title={confirming ? "もう一度クリックで削除" : "削除"}
        >
            {!loading && (confirming ? "確認?" : <Trash className="w-4 h-4" />)}
        </Button>
    );
}
