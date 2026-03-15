"use client";

import Link from "next/link";
import { Link as LucideLink, Menu, LogOut, Hexagon } from "lucide-react"; // Renamed Link to avoid conflict if necessary, though next/link is used.
import { usePathname } from "next/navigation";
import { useAuth } from "@/context/AuthContext";
import { UserMenu } from "@/components/layout/UserMenu";
import { NotificationMenu } from "@/components/common/NotificationMenu";
import { HeartDisplay } from "@/components/gamification/HeartDisplay";

export function Header() {
  const { user, logout } = useAuth();

  const pathname = usePathname();

  if (pathname.startsWith("/admin")) return null;

  return (
    <header className="sticky top-0 z-50 w-full glass">
      <div className="container mx-auto flex h-16 items-center justify-between px-4">
        {/* Logo */}
        <div className="flex items-center gap-2">
          <Link href={user ? "/dashboard" : "/"} className="flex items-center gap-2 group">
            <Hexagon className="h-8 w-8 text-primary transition-transform group-hover:rotate-180 duration-500" />
            <span className="text-xl font-bold tracking-tight text-gradient-gold">
              Kanei Quest
            </span>
          </Link>
        </div>

        {/* Desktop Nav */}
        {!user && (
          <nav className="hidden md:flex gap-8 items-center text-sm font-medium text-slate-500">
            <Link href="/practice" className="hover:text-primary transition-colors flex items-center gap-1 group">
              <span className="group-hover:translate-y-px transition-transform">過去問演習</span>
            </Link>
            <Link href="/mock-exam" className="hover:text-primary transition-colors">
              模擬試験
            </Link>
            <Link href="/pricing" className="hover:text-primary transition-colors">
              料金プラン
            </Link>
          </nav>
        )}

        {/* Logged-in nav */}
        {user && (
          <nav className="hidden md:flex gap-6 items-center text-sm font-medium text-slate-500">
            <Link href="/dashboard" className="hover:text-primary transition-colors">
              ダッシュボード
            </Link>
            <Link href="/schedule" className="hover:text-primary transition-colors">
              カレンダー
            </Link>
            <Link href="/practice" className="hover:text-primary transition-colors">
              過去問演習
            </Link>
          </nav>
        )}

        {/* Actions */}
        <div className="flex items-center gap-4">
          {user ? (
            <div className="flex items-center gap-4">
              <HeartDisplay />
              <NotificationMenu />
              <UserMenu />
            </div>
          ) : (
            <Link
              href="/login"
              className="hidden md:inline-flex items-center justify-center rounded-full bg-white border border-slate-200 px-6 py-2 text-sm font-medium text-primary shadow-sm hover:bg-primary hover:text-white hover:shadow-md transition-all"
            >
              ログイン
            </Link>
          )}

          <button className="md:hidden p-2 text-muted-foreground hover:text-primary">
            <Menu className="h-6 w-6" />
            <span className="sr-only">Menu</span>
          </button>
        </div>
      </div>
    </header>
  );
}
