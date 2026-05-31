"use client";

import Link from "next/link";
import { Menu, X, Hexagon } from "lucide-react";
import { usePathname } from "next/navigation";
import { useAuth } from "@/context/AuthContext";
import { UserMenu } from "@/components/layout/UserMenu";
import { NotificationMenu } from "@/components/common/NotificationMenu";
import { HeartDisplay } from "@/components/gamification/HeartDisplay";
import { useState } from "react";
import { cn } from "@/lib/utils";

const GUEST_LINKS = [
    { href: "/pricing", label: "料金プラン" },
];

export function Header() {
    const { user, logout } = useAuth();
    const pathname = usePathname();
    const [menuOpen, setMenuOpen] = useState(false);

    if (pathname.startsWith("/admin")) return null;

    return (
        <>
            <header className="sticky top-0 z-50 w-full glass">
                <div className="container mx-auto flex h-14 items-center justify-between px-4">
                    {/* Logo */}
                    <Link
                        href={user ? "/dashboard" : "/"}
                        className="flex items-center gap-2 group"
                    >
                        <Hexagon className="h-7 w-7 text-primary transition-transform group-hover:rotate-180 duration-500" />
                        <span className="text-lg font-bold tracking-tight text-gradient-gold">
                            Kanei Quest
                        </span>
                    </Link>

                    {/* Desktop Nav — guest */}
                    {!user && (
                        <nav className="hidden md:flex gap-8 items-center text-sm font-medium text-slate-500">
                            {GUEST_LINKS.map(({ href, label }) => (
                                <Link key={href} href={href} className="hover:text-primary transition-colors">
                                    {label}
                                </Link>
                            ))}
                        </nav>
                    )}

                    {/* Desktop Nav — logged in */}
                    {user && (
                        <nav className="hidden md:flex gap-6 items-center text-sm font-medium text-slate-500">
                            <Link href="/dashboard" className="hover:text-primary transition-colors">ダッシュボード</Link>
                            <Link href="/schedule" className="hover:text-primary transition-colors">カレンダー</Link>
                            <Link href="/practice" className="hover:text-primary transition-colors">過去問演習</Link>
                        </nav>
                    )}

                    {/* Actions */}
                    <div className="flex items-center gap-3">
                        {user ? (
                            <div className="flex items-center gap-3">
                                <HeartDisplay />
                                <NotificationMenu />
                                <UserMenu />
                            </div>
                        ) : (
                            <>
                                <Link
                                    href="/login"
                                    className="hidden md:inline-flex items-center justify-center rounded-full bg-white border border-slate-200 px-5 py-2 text-sm font-medium text-primary shadow-sm hover:bg-primary hover:text-white transition-all"
                                >
                                    ログイン
                                </Link>

                                {/* Mobile hamburger — guest only */}
                                <button
                                    className="md:hidden p-2 text-muted-foreground hover:text-primary"
                                    onClick={() => setMenuOpen(prev => !prev)}
                                    aria-label="メニュー"
                                >
                                    {menuOpen ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
                                </button>
                            </>
                        )}
                    </div>
                </div>
            </header>

            {/* Mobile drawer — guest */}
            {!user && menuOpen && (
                <div className="fixed inset-0 z-40 md:hidden" onClick={() => setMenuOpen(false)}>
                    <div
                        className="absolute top-14 left-0 right-0 bg-white/95 backdrop-blur-md border-b border-stone-200 shadow-lg"
                        onClick={e => e.stopPropagation()}
                    >
                        <nav className="flex flex-col py-2">
                            {GUEST_LINKS.map(({ href, label }) => (
                                <Link
                                    key={href}
                                    href={href}
                                    className={cn(
                                        "px-6 py-4 text-base font-medium border-b border-stone-100 last:border-0",
                                        pathname === href ? "text-primary" : "text-stone-700 hover:text-primary"
                                    )}
                                    onClick={() => setMenuOpen(false)}
                                >
                                    {label}
                                </Link>
                            ))}
                            <Link
                                href="/login"
                                className="mx-4 my-3 flex items-center justify-center rounded-full bg-primary text-white py-3 text-sm font-semibold"
                                onClick={() => setMenuOpen(false)}
                            >
                                ログイン
                            </Link>
                            <Link
                                href="/signup"
                                className="mx-4 mb-3 flex items-center justify-center rounded-full border border-primary text-primary py-3 text-sm font-semibold"
                                onClick={() => setMenuOpen(false)}
                            >
                                無料で始める
                            </Link>
                        </nav>
                    </div>
                </div>
            )}
        </>
    );
}
