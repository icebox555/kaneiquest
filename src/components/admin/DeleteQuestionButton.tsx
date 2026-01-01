"use client";

import { useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { Button } from "@/components/ui/Button";
import { Trash, Loader2 } from "lucide-react";
import { useRouter } from "next/navigation";

export function DeleteQuestionButton({ questionId }: { questionId: string }) {
    const router = useRouter();
    const [loading, setLoading] = useState(false);
    const supabase = createClient();

    const handleDelete = async () => {
        if (!confirm("本当にこの問題を削除しますか？この操作は取り消せません。")) return;

        setLoading(true);
        try {
            const { error } = await supabase
                .from("questions")
                .delete()
                .eq("id", questionId);

            if (error) throw error;

            router.refresh();
        } catch (error: any) {
            alert("削除に失敗しました: " + error.message);
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
