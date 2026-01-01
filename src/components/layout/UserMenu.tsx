"use client";

import { useAuth } from "@/context/AuthContext";
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/components/ui/DropdownMenu";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/Avatar";
import { User, LogOut, Settings, LayoutDashboard, CreditCard, Trophy } from "lucide-react";
import Link from "next/link";
import { createClient } from "@/lib/supabase/client";
import { useEffect, useState } from "react";

export function UserMenu() {
    const { user, logout } = useAuth();
    const [name, setName] = useState<string>("");
    const [avatarUrl, setAvatarUrl] = useState<string | null>(null);
    const supabase = createClient();

    useEffect(() => {
        if (user) {
            // Fetch profile name and avatar
            const fetchProfile = async () => {
                const { data } = await supabase
                    .from("profiles")
                    .select("name, avatar_url")
                    .eq("id", user.id)
                    .single();
                if (data) {
                    if (data.name) setName(data.name);
                    if (data.avatar_url) setAvatarUrl(data.avatar_url);
                }
            };
            fetchProfile();
        }
    }, [user, supabase]);

    if (!user) return null;

    // Get initials
    const displayName = name || user.email || "User";
    const initials = displayName.slice(0, 2).toUpperCase();

    return (
        <DropdownMenu>
            <DropdownMenuTrigger className="outline-none">
                <Avatar className="h-9 w-9 border-2 border-rose-200 hover:border-rose-400 transition-colors cursor-pointer ring-offset-2 ring-offset-white focus:ring-2 focus:ring-rose-500">
                    <AvatarImage
                        src={avatarUrl || "/default-avatar.png"}
                        className={`object-cover ${!avatarUrl ? 'scale-[1.8]' : ''}`}
                    />
                    <AvatarFallback className="bg-rose-50 text-xs font-bold text-rose-600">
                        {initials}
                    </AvatarFallback>
                </Avatar>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end" className="w-56 glass border-stone-100 bg-white/90">
                <DropdownMenuLabel className="font-normal">
                    <div className="flex flex-col space-y-1">
                        <p className="text-sm font-medium leading-none text-stone-800">{displayName}</p>
                        <p className="text-xs leading-none text-stone-500">
                            {user.email}
                        </p>
                    </div>
                </DropdownMenuLabel>
                <DropdownMenuSeparator className="bg-stone-100" />
                <DropdownMenuItem asChild>
                    <Link href="/dashboard" className="cursor-pointer text-stone-600 focus:text-stone-900 focus:bg-stone-50">
                        <LayoutDashboard className="mr-2 h-4 w-4" />
                        <span>ダッシュボード</span>
                    </Link>
                </DropdownMenuItem>
                <DropdownMenuItem asChild>
                    <Link href="/profile" className="cursor-pointer text-stone-600 focus:text-stone-900 focus:bg-stone-50">
                        <User className="mr-2 h-4 w-4" />
                        <span>プロフィール編集</span>
                    </Link>
                </DropdownMenuItem>
                <DropdownMenuSeparator className="bg-stone-100" />
                <DropdownMenuItem asChild>
                    <Link href="/pricing" className="cursor-pointer text-stone-600 focus:text-stone-900 focus:bg-stone-50">
                        <CreditCard className="mr-2 h-4 w-4" />
                        <span>プラン変更・確認</span>
                    </Link>
                </DropdownMenuItem>
                <DropdownMenuSeparator className="bg-stone-100" />
                <DropdownMenuItem asChild>
                    <Link href="/ranking" className="cursor-pointer text-stone-600 focus:text-stone-900 focus:bg-stone-50">
                        <Trophy className="mr-2 h-4 w-4" />
                        <span>ランキング</span>
                    </Link>
                </DropdownMenuItem>
                {/* Admin Link if role is admin - could be added here if needed context access */}
                <DropdownMenuSeparator className="bg-stone-100" />
                <DropdownMenuItem onClick={() => logout()} className="cursor-pointer text-red-400 focus:text-red-300 focus:bg-red-900/20">
                    <LogOut className="mr-2 h-4 w-4" />
                    <span>ログアウト</span>
                </DropdownMenuItem>
            </DropdownMenuContent>
        </DropdownMenu>
    );
}
