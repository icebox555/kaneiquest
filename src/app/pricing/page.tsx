'use client';

import { Button } from "@/components/ui/Button";
import { Check, Sparkles } from "lucide-react";
import Link from "next/link";
import { useState, useEffect } from "react";
import { STRIPE_CONFIG } from "@/lib/stripe/config";
import { createClient } from "@/lib/supabase/client";

export default function PricingPage() {
    const [loading, setLoading] = useState<string | null>(null);
    const [isPro, setIsPro] = useState<boolean | null>(null);

    useEffect(() => {
        const checkStatus = async () => {
            const supabase = createClient();
            const { data: { user } } = await supabase.auth.getUser();
            if (user) {
                const { data: profile } = await supabase.from('profiles').select('plan').eq('id', user.id).single();
                setIsPro(profile?.plan === 'pro');
            }
        };
        checkStatus();
    }, []);

    const handleCheckout = async (priceId: string) => {
        setLoading(priceId);
        try {
            if (!priceId) {
                alert("Configuration Error: Price ID is missing.");
                setLoading(null);
                return;
            }

            const res = await fetch("/api/checkout", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ priceId }),
            });

            if (!res.ok) {
                const errorText = await res.text();
                if (res.status === 401) {
                    window.location.href = "/login?next=/pricing";
                    return;
                }
                throw new Error("Checkout failed: " + errorText);
            }

            const data = await res.json();
            window.location.href = data.url;
        } catch (error) {
            alert("決済の開始に失敗しました。しばらく経ってから再度お試しください。");
            setLoading(null);
        }
    };

    const handlePortal = async () => {
        setLoading("portal");
        try {
            const res = await fetch("/api/portal", { method: "POST" });
            if (!res.ok) throw new Error("Portal failed");
            const data = await res.json();
            window.location.href = data.url;
        } catch {
            alert("カスタマーポータルの起動に失敗しました。");
            setLoading(null);
        }
    };

    return (
        <div className="container py-24 px-4 md:px-6">
            <div className="mx-auto max-w-3xl text-center mb-16 space-y-4">
                <h1 className="text-4xl font-bold tracking-tight text-stone-800 sm:text-5xl">
                    合格への最短ルートを選ぶ
                </h1>
                <p className="mx-auto max-w-[700px] text-lg text-stone-600">
                    あなたの学習スタイルに合わせて、最適なプランをお選びください。<br />
                    すべてのプランで、過去問演習と基本機能をご利用いただけます。
                </p>
            </div>

            <div className="grid md:grid-cols-2 gap-8 max-w-4xl mx-auto">
                {/* Free Plan */}
                <div className="relative flex flex-col p-8 bg-white border border-stone-200 rounded-2xl shadow-sm hover:shadow-md transition-shadow">
                    <div className="mb-6">
                        <h3 className="text-2xl font-bold text-stone-800">Free</h3>
                        <p className="text-stone-500 mt-2">基本的な学習を始めたい方へ</p>
                    </div>
                    <div className="mb-6">
                        <span className="text-4xl font-bold text-stone-800">¥0</span>
                        <span className="text-stone-500 ml-2">/ month</span>
                    </div>
                    <ul className="space-y-4 mb-8 flex-1">
                        <li className="flex items-center text-stone-600">
                            <Check className="h-5 w-5 text-green-500 mr-2" />
                            過去問演習（制限あり）
                        </li>
                        <li className="flex items-center text-stone-600">
                            <Check className="h-5 w-5 text-green-500 mr-2" />
                            学習履歴の保存
                        </li>
                        <li className="flex items-center text-stone-400">
                            <Check className="h-5 w-5 text-stone-300 mr-2" />
                            解説の閲覧
                        </li>
                        <li className="flex items-center text-stone-400">
                            <Check className="h-5 w-5 text-stone-300 mr-2" />
                            AIコーチング
                        </li>
                    </ul>
                    <Button variant="outline" className="w-full border-stone-200 text-stone-700 hover:bg-stone-50" asChild>
                        <Link href="/dashboard">無料で始める</Link>
                    </Button>
                </div>

                {/* Pro Plan */}
                <div className="relative flex flex-col p-8 bg-stone-900 border border-stone-800 rounded-2xl shadow-xl ring-1 ring-orange-500/20">
                    <div className="absolute -top-4 left-1/2 -translate-x-1/2">
                        <span className="bg-gradient-to-r from-orange-400 to-rose-400 text-white px-3 py-1 text-xs font-bold rounded-full shadow-lg">
                            RECOMMENDED
                        </span>
                    </div>
                    <div className="mb-6">
                        <h3 className="text-2xl font-bold text-white">Pro</h3>
                        <p className="text-stone-400 mt-2">本格的に合格を目指す方へ</p>
                    </div>
                    <div className="mb-6">
                        <span className="text-4xl font-bold text-white">¥980</span>
                        <span className="text-stone-400 ml-2">/ month</span>
                    </div>
                    <ul className="space-y-4 mb-8 flex-1">
                        <li className="flex items-center text-stone-300">
                            <Check className="h-5 w-5 text-orange-400 mr-2" />
                            <span className="font-bold text-white">無制限</span>の過去問演習
                        </li>
                        <li className="flex items-center text-stone-300">
                            <Check className="h-5 w-5 text-orange-400 mr-2" />
                            詳細な解説と根拠
                        </li>
                        <li className="flex items-center text-stone-300">
                            <Check className="h-5 w-5 text-orange-400 mr-2" />
                            AIによる弱点分析・コーチング
                        </li>
                        <li className="flex items-center text-stone-300">
                            <Check className="h-5 w-5 text-orange-400 mr-2" />
                            模擬試験モード
                        </li>
                    </ul>

                    {isPro ? (
                        <div className="space-y-3">
                            <div className="w-full bg-green-500/10 border border-green-500/20 rounded-lg p-3 text-center mb-2">
                                <p className="text-green-400 font-bold text-sm">現在契約中 (Active)</p>
                            </div>
                            <Button
                                onClick={handlePortal}
                                className="w-full bg-white text-stone-900 hover:bg-stone-100"
                                disabled={!!loading}
                            >
                                {loading === "portal" ? "処理中..." : "契約内容の確認・解約"}
                            </Button>
                        </div>
                    ) : (
                        <div className="space-y-3">
                            <Button
                                onClick={() => handleCheckout(STRIPE_CONFIG.PRICES.PRO_MONTHLY)}
                                className="w-full bg-white text-stone-900 hover:bg-stone-100"
                                disabled={!!loading}
                            >
                                {loading === STRIPE_CONFIG.PRICES.PRO_MONTHLY ? "処理中..." : "月額プランで始める"}
                            </Button>
                            <Button
                                onClick={() => handleCheckout(STRIPE_CONFIG.PRICES.PRO_YEARLY)}
                                variant="ghost"
                                className="w-full text-stone-300 hover:text-white hover:bg-stone-800 underline decoration-stone-600 underline-offset-4"
                                disabled={!!loading}
                            >
                                {loading === STRIPE_CONFIG.PRICES.PRO_YEARLY ? "処理中..." : `年額プランなら ¥10,584/年 (10% OFF)`}
                            </Button>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}
