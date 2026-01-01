"use client";

import { useState, useEffect } from "react";
import { Bell, Check, Info, Trophy, AlertTriangle, CheckCircle } from "lucide-react";
import { createClient } from "@/lib/supabase/client";
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/components/ui/DropdownMenu";
import { cn } from "@/lib/utils";
import { formatDistanceToNow } from "date-fns";
import { ja } from "date-fns/locale";

type Notification = {
    id: string;
    title: string;
    message: string;
    type: 'info' | 'success' | 'warning' | 'achievement';
    is_read: boolean;
    created_at: string;
};

export function NotificationMenu() {
    const [notifications, setNotifications] = useState<Notification[]>([]);
    const [unreadCount, setUnreadCount] = useState(0);
    const [isOpen, setIsOpen] = useState(false);
    const supabase = createClient();

    const fetchNotifications = async () => {
        const { data: { user } } = await supabase.auth.getUser();
        if (!user) return;

        const { data } = await supabase
            .from("notifications")
            .select("*")
            .eq("user_id", user.id)
            .order("created_at", { ascending: false })
            .limit(10); // Limit to recent 10

        if (data) {
            setNotifications(data as Notification[]);
            setUnreadCount(data.filter((n: Notification) => !n.is_read).length);
        }
    };

    // Initial fetch
    useEffect(() => {
        fetchNotifications();

        // Optional: Realtime subscription could go here
    }, []);

    const markAsRead = async (id: string) => {
        const { error } = await supabase
            .from("notifications")
            .update({ is_read: true })
            .eq("id", id);

        if (!error) {
            setNotifications(prev => prev.map(n => n.id === id ? { ...n, is_read: true } : n));
            setUnreadCount(prev => Math.max(0, prev - 1));
        }
    };

    const markAllAsRead = async () => {
        const { data: { user } } = await supabase.auth.getUser();
        if (!user) return;

        const { error } = await supabase
            .from("notifications")
            .update({ is_read: true })
            .eq("user_id", user.id)
            .eq("is_read", false);

        if (!error) {
            setNotifications(prev => prev.map(n => ({ ...n, is_read: true })));
            setUnreadCount(0);
        }
    };

    const getIcon = (type: string) => {
        switch (type) {
            case 'achievement': return <Trophy className="w-4 h-4 text-yellow-500" />;
            case 'success': return <CheckCircle className="w-4 h-4 text-green-500" />;
            case 'warning': return <AlertTriangle className="w-4 h-4 text-red-500" />;
            default: return <Info className="w-4 h-4 text-blue-500" />;
        }
    };

    return (
        <DropdownMenu open={isOpen} onOpenChange={(open) => {
            setIsOpen(open);
            if (open) fetchNotifications(); // Refresh on open
        }}>
            <DropdownMenuTrigger className="relative outline-none">
                <div className="p-2 rounded-full hover:bg-slate-100 transition-colors text-slate-500 hover:text-primary">
                    <Bell className="w-5 h-5" />
                    {unreadCount > 0 && (
                        <span className="absolute top-1 right-1 w-2.5 h-2.5 bg-red-500 rounded-full border-2 border-white animate-pulse" />
                    )}
                </div>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end" className="w-80 glass border-slate-200">
                <div className="flex items-center justify-between px-2 py-1.5">
                    <span className="text-sm font-semibold text-slate-800">通知</span>
                    {unreadCount > 0 && (
                        <button
                            onClick={markAllAsRead}
                            className="text-xs text-primary hover:text-primary/80 transition-colors flex items-center"
                        >
                            <Check className="w-3 h-3 mr-1" />
                            すべて既読にする
                        </button>
                    )}
                </div>
                <DropdownMenuSeparator className="bg-slate-200" />

                <div className="max-h-[300px] overflow-y-auto">
                    {notifications.length === 0 ? (
                        <div className="py-8 text-center text-slate-500 text-sm">
                            通知はありません
                        </div>
                    ) : (
                        notifications.map((notification) => (
                            <DropdownMenuItem
                                key={notification.id}
                                className={cn(
                                    "flex items-start gap-3 p-3 cursor-pointer focus:bg-slate-50",
                                    !notification.is_read ? "bg-primary/5" : ""
                                )}
                                onClick={() => !notification.is_read && markAsRead(notification.id)}
                            >
                                <div className="mt-1 shrink-0">
                                    {getIcon(notification.type)}
                                </div>
                                <div className="flex-1 space-y-1">
                                    <div className="flex justify-between items-start">
                                        <p className={cn("text-sm font-medium leading-none", !notification.is_read ? "text-slate-900" : "text-slate-500")}>
                                            {notification.title}
                                        </p>
                                        {!notification.is_read && (
                                            <span className="w-2 h-2 rounded-full bg-primary shrink-0 ml-2" />
                                        )}
                                    </div>
                                    <p className="text-xs text-slate-500 line-clamp-2">
                                        {notification.message}
                                    </p>
                                    <p className="text-[10px] text-slate-500">
                                        {formatDistanceToNow(new Date(notification.created_at), { addSuffix: true, locale: ja })}
                                    </p>
                                </div>
                            </DropdownMenuItem>
                        ))
                    )}
                </div>
            </DropdownMenuContent>
        </DropdownMenu>
    );
}
