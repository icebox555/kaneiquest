"use client";

import { useState } from "react";
import { toggleQuestionStatus } from "@/lib/actions/admin";
import { Button } from "@/components/ui/Button";
import { useRouter } from "next/navigation";

interface PublishToggleButtonProps {
    questionId: string;
    currentStatus: 'draft' | 'published';
}

export function PublishToggleButton({ questionId, currentStatus }: PublishToggleButtonProps) {
    const router = useRouter();
    const [loading, setLoading] = useState(false);
    const [status, setStatus] = useState(currentStatus);

    const handleToggle = async () => {
        setLoading(true);
        const result = await toggleQuestionStatus(questionId, status);
        if (!result.error) {
            setStatus(prev => prev === 'published' ? 'draft' : 'published');
            router.refresh();
        }
        setLoading(false);
    };

    return (
        <Button
            variant="ghost"
            size="sm"
            onClick={handleToggle}
            loading={loading}
            className={`h-8 text-[11px] px-2 font-bold transition-all ${
                status === 'published'
                    ? 'text-green-400 hover:text-yellow-400 hover:bg-yellow-500/10'
                    : 'text-yellow-400 hover:text-green-400 hover:bg-green-500/10'
            }`}
            title={status === 'published' ? 'クリックで下書きに戻す' : 'クリックで公開する'}
        >
            {status === 'published' ? '公開中' : '下書き'}
        </Button>
    );
}
