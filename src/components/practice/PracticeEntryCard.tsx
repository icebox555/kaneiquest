"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { consumeHeart } from "@/lib/actions/heart";
import { ArrowRight, Lock, Loader2, Heart, BookOpen, Activity, Beaker, Apple, Users, LucideIcon, XCircle, Bookmark, RefreshCw, AlertCircle } from "lucide-react";

const ICON_MAP: Record<string, LucideIcon> = {
    BookOpen,
    Activity,
    Beaker,
    Apple,
    Users,
    XCircle,
    Bookmark,
    RefreshCw
};

interface PracticeEntryCardProps {
    href: string;
    title: string;
    description?: string;
    iconName: string; // Key of ICON_MAP
    badgeText?: string | number;
    badgeColorClass?: string;
    accentColorClass?: string;
    bgClass?: string;
    isLocked?: boolean;
    buttonText?: string;
    requiresHeart?: boolean;
}

export function PracticeEntryCard({
    href,
    title,
    description,
    iconName,
    badgeText,
    badgeColorClass = "bg-stone-100 text-stone-400",
    accentColorClass = "text-stone-800 group-hover:text-primary",
    bgClass = "bg-primary/10 text-primary",
    isLocked = false,
    buttonText = "START",
    requiresHeart = true
}: PracticeEntryCardProps) {
    const router = useRouter();
    const [loading, setLoading] = useState(false);
    const [errorMsg, setErrorMsg] = useState<string | null>(null);

    const Icon = ICON_MAP[iconName] || BookOpen;

    const handleClick = async (e: React.MouseEvent) => {
        e.preventDefault();
        if (isLocked) return;

        setLoading(true);
        setErrorMsg(null);

        if (!requiresHeart) {
            router.push(href);
            return;
        }

        try {
            const result = await consumeHeart();
            if (result.success) {
                router.push(href);
            } else {
                setErrorMsg(result.message || "ハートが足りません！");
                setLoading(false);
            }
        } catch (error) {
            console.error("Error starting practice:", error);
            setErrorMsg("エラーが発生しました。");
            setLoading(false);
        }
    };

    return (
        <div
            onClick={handleClick}
            className={`glass glass-hover h-full rounded-2xl p-1 transition-all duration-300 group cursor-pointer relative ${!isLocked ? 'hover:-translate-y-1' : 'opacity-60 cursor-not-allowed'}`}
        >
            <div className="h-full rounded-xl bg-white/60 p-6 flex flex-col text-left relative overflow-hidden">
                {/* Background Decoration */}
                <div className="absolute top-0 right-0 p-3 opacity-10 pointer-events-none">
                    <Icon className="w-24 h-24" />
                </div>

                <div className={`mb-4 inline-flex p-3 rounded-xl w-fit transition-transform ${!isLocked && 'group-hover:scale-110'} ${bgClass}`}>
                    <Icon className="w-8 h-8" />
                </div>

                <div className="mb-2">
                    <h3 className={`text-xl font-bold transition-colors ${!isLocked ? accentColorClass : 'text-stone-400'}`}>
                        {title}
                    </h3>
                    {badgeText !== undefined && (
                        <span className={`text-xs font-mono px-2 py-1 rounded-full ${badgeColorClass}`}>
                            {badgeText}
                        </span>
                    )}
                </div>

                <p className="text-sm text-stone-500 mb-6 flex-1">
                    {description}
                </p>

                <div className={`flex items-center text-sm font-bold transition-opacity ${!isLocked ? 'opacity-80 group-hover:opacity-100' : 'text-stone-400'}`}>
                    {loading ? (
                        <span className="flex items-center gap-2 text-primary">
                            <Loader2 className="w-4 h-4 animate-spin" /> 準備中...
                        </span>
                    ) : isLocked ? (
                        <span className="flex items-center gap-2">
                            <Lock className="w-4 h-4" /> LOCKED
                        </span>
                    ) : (
                        <span className={`flex items-center gap-2 ${accentColorClass.split(' ').pop()}`}>
                            {buttonText} <ArrowRight className="ml-1 w-4 h-4 transition-transform group-hover:translate-x-1" />
                            {requiresHeart && (
                                <span className="ml-2 text-[10px] bg-rose-100 text-rose-500 px-1.5 py-0.5 rounded-full flex items-center gap-0.5">
                                    <Heart className="w-3 h-3 fill-current" /> 1
                                </span>
                            )}
                        </span>
                    )}
                </div>
                {errorMsg && (
                    <div className="mt-3 flex items-center gap-1.5 text-xs text-red-600 bg-red-50 border border-red-200 rounded-lg px-2.5 py-1.5">
                        <AlertCircle className="w-3.5 h-3.5 shrink-0" />
                        {errorMsg}
                    </div>
                )}
            </div>
        </div>
    );
}
