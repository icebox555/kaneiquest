"use client";

import { useState, useEffect } from "react";
import { Star } from "lucide-react";
import { createClient } from "@/lib/supabase/client";

interface BookmarkButtonProps {
    questionId: string;
    initialBookmarked?: boolean;
    onToggle?: (isBookmarked: boolean) => void;
}

export function BookmarkButton({ questionId, initialBookmarked = false, onToggle }: BookmarkButtonProps) {
    const [isBookmarked, setIsBookmarked] = useState(initialBookmarked);
    const [isLoading, setIsLoading] = useState(false);
    const supabase = createClient();

    // Sync if initialBookmarked changes (e.g. from parent fetch)
    useEffect(() => {
        setIsBookmarked(initialBookmarked);
    }, [initialBookmarked]);

    const handleToggle = async (e: React.MouseEvent) => {
        e.stopPropagation(); // Prevent triggering parent click if any
        if (isLoading) return;

        setIsLoading(true);
        // Optimistic update
        const newState = !isBookmarked;
        setIsBookmarked(newState);

        try {
            const { data: { user } } = await supabase.auth.getUser();
            if (!user) return;

            if (newState) {
                // Add bookmark
                const { error } = await supabase
                    .from("bookmarks")
                    .insert({ user_id: user.id, question_id: questionId });

                if (error) throw error;
            } else {
                // Remove bookmark
                const { error } = await supabase
                    .from("bookmarks")
                    .delete()
                    .eq("user_id", user.id)
                    .eq("question_id", questionId);

                if (error) throw error;
            }

            if (onToggle) onToggle(newState);

        } catch (error) {
            console.error("Error toggling bookmark:", error);
            // Revert on error
            setIsBookmarked(!newState);
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <button
            onClick={handleToggle}
            className={`p-2 rounded-full transition-all duration-300 ${isBookmarked
                ? "text-yellow-400 bg-yellow-400/10 hover:bg-yellow-400/20"
                : "text-slate-400 hover:text-yellow-400 hover:bg-slate-700/50"
                }`}
            title={isBookmarked ? "Remove bookmark" : "Add bookmark"}
            disabled={isLoading}
        >
            <Star className={`w-5 h-5 ${isBookmarked ? "fill-yellow-400" : ""}`} />
        </button>
    );
}
