"use client";

import { useState } from "react";
import { ChevronDown } from "lucide-react";
import { cn } from "@/lib/utils";

interface Props {
    title: string;
    children: React.ReactNode;
    defaultOpen?: boolean;
    className?: string;
}

export function CollapsibleSection({ title, children, defaultOpen = false, className }: Props) {
    const [open, setOpen] = useState(defaultOpen);

    return (
        <div className={className}>
            <button
                type="button"
                onClick={() => setOpen((v) => !v)}
                aria-expanded={open}
                className="w-full flex items-center justify-between gap-2 mb-3 md:mb-4 group"
            >
                <h2 className="text-lg md:text-xl font-bold text-stone-800">{title}</h2>
                <span className="flex items-center gap-1 text-sm font-bold text-primary">
                    {open ? "閉じる" : "詳細を見る"}
                    <ChevronDown
                        className={cn(
                            "w-4 h-4 transition-transform duration-300",
                            open && "rotate-180"
                        )}
                    />
                </span>
            </button>

            {open && children}
        </div>
    );
}
