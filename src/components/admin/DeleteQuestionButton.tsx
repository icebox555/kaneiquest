"use client";

import { useState } from "react";
import { deleteQuestion } from "@/lib/actions/admin";
import { Button } from "@/components/ui/Button";
import { Trash, Loader2 } from "lucide-react";
import { useRouter } from "next/navigation";

export function DeleteQuestionButton({ questionId }: { questionId: string }) {
    const router = useRouter();
    const [loading, setLoading] = useState(false);

    const handleDelete = async () => {
        if (!confirm("本当にこの問題を削除しますか？この操作は取り消せません。")) return;

        setLoading(true);
        try {
            // Server Action: verifies admin role server-side before deleting
            const result = await deleteQuestion(questionId);
            if (result.error) throw new Error(result.error);

            router.refresh();
        } catch (error: unknown) {
            const message = error instanceof Error ? error.message : "不明なエラー";
            alert("削除に失敗しました: " + message);
        } finally {
            setLoading(false);
        }
    };

    return (
        <Button
            variant="ghost"
            size="sm"
            className="h-8 w-8 p-0 text-red-400 hover:text-red-300 hover:bg-red-500/10"
            onClick={handleDelete}
            disabled={loading}
        >
            {loading ? <Loader2 className="w-4 h-4 animate-spin" /> : <Trash className="w-4 h-4" />}
        </Button>
    );
}
