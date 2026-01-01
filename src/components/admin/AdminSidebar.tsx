"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import {
    LayoutDashboard,
    FileQuestion,
    Users,
    Settings,
    LogOut,
    Shield
} from "lucide-react";

const navigation = [
    { name: "ダッシュボード", href: "/admin", icon: LayoutDashboard },
    { name: "問題管理", href: "/admin/questions", icon: FileQuestion },
    { name: "ユーザー管理", href: "/admin/users", icon: Users },
    { name: "設定", href: "/admin/settings", icon: Settings },
];

export function AdminSidebar() {
    const pathname = usePathname();

    return (
        <aside className="fixed left-0 top-0 z-40 h-screen w-64 bg-slate-900/50 backdrop-blur-xl border-r border-white/10 hidden lg:block">
            <div className="flex h-full flex-col px-3 py-4">
                <div className="mb-10 flex px-3 items-center gap-3">
                    <div className="p-2 bg-red-500/10 rounded-lg border border-red-500/20">
                        <Shield className="w-6 h-6 text-red-500" />
                    </div>
                    <div>
                        <h2 className="text-lg font-bold text-white tracking-wider">KANEI QUEST</h2>
                        <span className="text-xs font-bold text-red-500 tracking-widest px-1">ADMIN</span>
                    </div>
                </div>

                <ul className="space-y-2 font-medium flex-1">
                    {navigation.map((item) => {
                        const isActive = pathname === item.href;
                        return (
                            <li key={item.name}>
                                <Link
                                    href={item.href}
                                    className={`flex items-center p-3 rounded-lg transition-all duration-200 group ${isActive
                                            ? "bg-red-500/10 text-red-400 border border-red-500/20"
                                            : "text-slate-400 hover:bg-white/5 hover:text-white"
                                        }`}
                                >
                                    <item.icon className={`w-5 h-5 transition-colors ${isActive ? "text-red-400" : "text-slate-400 group-hover:text-white"
                                        }`} />
                                    <span className="ml-3">{item.name}</span>
                                    {isActive && (
                                        <div className="ml-auto w-1.5 h-1.5 rounded-full bg-red-500 shadow-[0_0_8px_rgba(239,68,68,0.6)]" />
                                    )}
                                </Link>
                            </li>
                        );
                    })}
                </ul>

                <div className="pt-4 border-t border-white/10">
                    <button className="flex w-full items-center p-3 text-slate-400 rounded-lg hover:bg-red-500/10 hover:text-red-400 transition-all group">
                        <LogOut className="w-5 h-5 text-slate-400 group-hover:text-red-400 transition-colors" />
                        <span className="ml-3">ログアウト</span>
                    </button>
                </div>
            </div>
        </aside>
    );
}
