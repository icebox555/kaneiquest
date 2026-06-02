"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { Home, BookOpen, CalendarDays, Trophy, User } from "lucide-react";
import { useAuth } from "@/context/AuthContext";
import { cn } from "@/lib/utils";

const NAV_ITEMS = [
    { href: "/dashboard", label: "ホーム", icon: Home },
    { href: "/practice", label: "演習", icon: BookOpen },
    { href: "/schedule", label: "スケジュール", icon: CalendarDays },
    { href: "/ranking", label: "ランキング", icon: Trophy },
    { href: "/profile", label: "プロフィール", icon: User },
];

export function BottomNav() {
    const { user } = useAuth();
    const pathname = usePathname();

    if (!user) return null;
    if (pathname.startsWith("/admin")) return null;

    return (
        <nav className="fixed bottom-0 left-0 right-0 z-50 md:hidden bg-white/90 backdrop-blur-md border-t border-stone-200 safe-area-inset-bottom fixed-layer">
            <div className="flex items-center justify-around h-16 px-2">
                {NAV_ITEMS.map(({ href, label, icon: Icon }) => {
                    const isActive = pathname === href || pathname.startsWith(href + "/");
                    return (
                        <Link
                            key={href}
                            href={href}
                            className={cn(
                                "flex flex-col items-center justify-center gap-0.5 flex-1 h-full px-1 rounded-xl transition-colors",
                                isActive
                                    ? "text-primary"
                                    : "text-stone-400 hover:text-stone-600"
                            )}
                        >
                            <Icon className={cn("h-5 w-5", isActive && "fill-primary/10")} />
                            <span className={cn("text-[10px] font-medium", isActive && "font-semibold")}>
                                {label}
                            </span>
                        </Link>
                    );
                })}
            </div>
        </nav>
    );
}
