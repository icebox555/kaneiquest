"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

export function Footer() {
    const pathname = usePathname();

    if (pathname.startsWith("/admin")) return null;

    return (
        <footer className="w-full border-t border-stone-200 bg-stone-50 py-10">
            <div className="container mx-auto flex flex-col md:flex-row items-center justify-between gap-6 px-4">
                <div className="text-center md:text-left">
                    <p className="text-sm text-stone-500">
                        &copy; {new Date().getFullYear()} Kanei Quest.
                    </p>
                    <p className="text-xs text-stone-400 mt-1">
                        Empowering Dietitians with Technology.
                    </p>
                </div>

                <div className="flex gap-6 text-sm text-stone-500">
                    <Link href="/terms" className="hover:text-primary transition-colors">
                        利用規約
                    </Link>
                    <Link href="/privacy" className="hover:text-primary transition-colors">
                        プライバシーポリシー
                    </Link>
                </div>
            </div>
        </footer>
    );
}
