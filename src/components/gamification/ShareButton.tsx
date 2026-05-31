"use client";

import { useState } from "react";
import { Share2, Check, Link, Heart } from "lucide-react";
import { earnHeart } from "@/lib/actions/heart";
import { motion, AnimatePresence } from "framer-motion";

interface ShareButtonProps {
    userId: string;
}

export function ShareButton({ userId }: ShareButtonProps) {
    const [isOpen, setIsOpen] = useState(false);
    const [copied, setCopied] = useState(false);
    const [heartEarned, setHeartEarned] = useState(false);

    const referralUrl = typeof window !== 'undefined'
        ? `${window.location.origin}/signup?ref=${userId}`
        : `/signup?ref=${userId}`;

    const shareText = '管理栄養士国家試験の対策はKanei Questで！\uD83D\uDCDA 一緒に合格を目指そう\uD83D\uDC47';

    const handleShare = async (platform: 'twitter' | 'line' | 'copy') => {
        const result = await earnHeart('share');
        if (result.success) {
            setHeartEarned(true);
            setTimeout(() => setHeartEarned(false), 2500);
        }

        const encodedUrl = encodeURIComponent(referralUrl);
        const encodedText = encodeURIComponent(shareText);

        if (platform === 'twitter') {
            window.open(`https://twitter.com/intent/tweet?text=${encodedText}&url=${encodedUrl}`, '_blank');
        } else if (platform === 'line') {
            window.open(`https://social-plugins.line.me/lineit/share?url=${encodedUrl}&text=${encodedText}`, '_blank');
        } else {
            await navigator.clipboard.writeText(referralUrl);
            setCopied(true);
            setTimeout(() => setCopied(false), 2000);
        }
    };

    return (
        <div className="relative">
            <button
                onClick={() => setIsOpen(prev => !prev)}
                className="flex items-center gap-1.5 text-sm font-medium px-3 py-1.5 rounded-full border border-rose-200 text-rose-500 hover:bg-rose-50 transition-colors"
            >
                <Share2 className="w-3.5 h-3.5" />
                シェアで❤️+1
            </button>

            {/* Floating heart animation */}
            <AnimatePresence>
                {heartEarned && (
                    <motion.div
                        initial={{ opacity: 1, y: 0 }}
                        animate={{ opacity: 0, y: -36 }}
                        exit={{ opacity: 0 }}
                        transition={{ duration: 1.2 }}
                        className="absolute -top-2 left-1/2 -translate-x-1/2 text-rose-500 font-bold text-sm pointer-events-none select-none"
                    >
                        ❤️ +1
                    </motion.div>
                )}
            </AnimatePresence>

            {/* Dropdown */}
            <AnimatePresence>
                {isOpen && (
                    <>
                        {/* Backdrop */}
                        <div
                            className="fixed inset-0 z-40"
                            onClick={() => setIsOpen(false)}
                        />
                        <motion.div
                            initial={{ opacity: 0, scale: 0.95, y: 4 }}
                            animate={{ opacity: 1, scale: 1, y: 0 }}
                            exit={{ opacity: 0, scale: 0.95, y: 4 }}
                            transition={{ duration: 0.15 }}
                            className="absolute top-full mt-2 right-0 bg-white rounded-2xl shadow-xl border border-stone-100 p-4 w-72 z-50"
                        >
                            <div className="flex items-center gap-2 mb-2">
                                <Heart className="w-4 h-4 text-rose-500 fill-rose-500" />
                                <p className="text-sm font-bold text-stone-800">シェアしてハートを増やそう</p>
                            </div>
                            <p className="text-xs text-stone-500 mb-3 leading-relaxed">
                                シェアするたびに❤️+1（最大3回/日）<br />
                                このリンクから登録した友達ごとに❤️+1
                            </p>

                            {/* Referral URL */}
                            <div className="bg-stone-50 rounded-lg px-3 py-2 text-[11px] text-stone-400 font-mono break-all mb-3 select-all">
                                {referralUrl}
                            </div>

                            {/* Share buttons */}
                            <div className="grid grid-cols-3 gap-2">
                                <button
                                    onClick={() => handleShare('twitter')}
                                    className="flex flex-col items-center gap-1.5 p-2 rounded-xl hover:bg-stone-50 transition-colors"
                                >
                                    <div className="w-10 h-10 bg-black rounded-full flex items-center justify-center">
                                        <svg className="w-4 h-4 fill-white" viewBox="0 0 24 24">
                                            <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
                                        </svg>
                                    </div>
                                    <span className="text-[10px] text-stone-500">X (Twitter)</span>
                                </button>

                                <button
                                    onClick={() => handleShare('line')}
                                    className="flex flex-col items-center gap-1.5 p-2 rounded-xl hover:bg-stone-50 transition-colors"
                                >
                                    <div className="w-10 h-10 bg-[#06C755] rounded-full flex items-center justify-center">
                                        <span className="text-white text-[11px] font-extrabold tracking-tight">LINE</span>
                                    </div>
                                    <span className="text-[10px] text-stone-500">LINE</span>
                                </button>

                                <button
                                    onClick={() => handleShare('copy')}
                                    className="flex flex-col items-center gap-1.5 p-2 rounded-xl hover:bg-stone-50 transition-colors"
                                >
                                    <div className="w-10 h-10 bg-stone-600 rounded-full flex items-center justify-center">
                                        {copied
                                            ? <Check className="w-4 h-4 text-white" />
                                            : <Link className="w-4 h-4 text-white" />
                                        }
                                    </div>
                                    <span className="text-[10px] text-stone-500">
                                        {copied ? 'コピー済!' : 'リンクコピー'}
                                    </span>
                                </button>
                            </div>
                        </motion.div>
                    </>
                )}
            </AnimatePresence>
        </div>
    );
}
