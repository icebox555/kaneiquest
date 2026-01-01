"use client"

import Link from "next/link";
import { Zap, BarChart, Crown } from "lucide-react";
import { buttonVariants } from "@/components/ui/Button";
import { Card, CardContent } from "@/components/ui/Card";
import { cn } from "@/lib/utils";

export default function Home() {
  return (
    <div className="flex flex-col min-h-screen">
      {/* Hero Section */}
      <section className="relative w-full py-24 md:py-32 lg:py-40 overflow-hidden">
        {/* Background Glows */}
        <div className="absolute top-0 left-1/2 -translate-x-1/2 w-full h-full max-w-7xl pointer-events-none">
          <div className="absolute top-20 left-10 w-96 h-96 bg-primary/10 rounded-full blur-[100px] animate-pulse" />
          <div className="absolute bottom-20 right-10 w-96 h-96 bg-secondary/20 rounded-full blur-[100px] animate-pulse delay-1000" />
        </div>

        <div className="container relative z-10 px-4 md:px-6 flex flex-col items-center text-center space-y-8 mx-auto">
          <div className="space-y-4 max-w-4xl">
            <div className="inline-block px-4 py-1.5 rounded-full border border-primary/30 bg-primary/10 text-primary text-sm font-semibold tracking-wide uppercase mb-4 backdrop-blur-md">
              The Ultimate Exam Prep
            </div>
            <h1 className="text-4xl md:text-6xl lg:text-7xl font-extrabold tracking-tight leading-tight text-stone-800">
              管理栄養士国家試験に
              <br className="md:hidden" />
              <span className="text-gradient-gold block mt-2">最短で合格する</span>
            </h1>
            <p className="mx-auto max-w-[800px] text-stone-500 text-lg md:text-xl leading-relaxed">
              過去問演習、AI弱点分析、そして実践形式の模擬試験。<br className="hidden md:block" />
              あなたのキャリアを輝かせるための、<span className="text-primary font-medium">最高峰の学習プラットフォーム</span>です。
            </p>
          </div>
          <div className="flex flex-col sm:flex-row gap-4 w-full justify-center pt-8">
            <Link
              href="/signup"
              className={cn(buttonVariants({ variant: "premium", size: "lg" }), "h-14 px-10 text-lg rounded-full")}
            >
              今すぐ始める (無料)
            </Link>
            <Link
              href="/about"
              className={cn(buttonVariants({ variant: "outline", size: "lg" }), "h-14 px-10 text-lg rounded-full border-stone-200 bg-white/50 hover:bg-stone-50")}
            >
              機能を見る
            </Link>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="w-full py-20 bg-stone-50/50 relative">
        <div className="container px-4 md:px-6 mx-auto relative z-10">
          <div className="text-center mb-16 space-y-4">
            <h2 className="text-3xl md:text-4xl font-bold text-stone-800">
              <span className="border-b-4 border-primary/60 pb-1">合格への3つの鍵</span>
            </h2>
            <p className="text-muted-foreground text-lg max-w-2xl mx-auto">
              効率を極めた学習システムが、あなたの努力を確実に成果に変えます。
            </p>
          </div>

          <div className="grid gap-8 md:grid-cols-3">
            {/* Feature 1 */}
            <Card className="p-8 rounded-2xl glass-hover border-stone-200/60 bg-white/40">
              <CardContent className="p-0 flex flex-col items-center text-center space-y-4">
                <div className="p-4 bg-primary/20 rounded-2xl text-primary shadow-inner shadow-primary/10">
                  <Crown className="h-10 w-10" />
                </div>
                <h3 className="text-2xl font-bold text-stone-800">圧倒的な問題数</h3>
                <p className="text-muted-foreground leading-relaxed">
                  過去5年分以上の良問を完全収録。出題傾向を徹底分析し、重要問題をピックアップ。
                </p>
              </CardContent>
            </Card>

            {/* Feature 2 */}
            <Card className="p-8 rounded-2xl glass-hover border-stone-200/60 bg-white/40">
              <CardContent className="p-0 flex flex-col items-center text-center space-y-4">
                <div className="p-4 bg-secondary/20 rounded-2xl text-secondary shadow-inner shadow-secondary/10">
                  <BarChart className="h-10 w-10" />
                </div>
                <h3 className="text-2xl font-bold text-stone-800">精密なデータ分析</h3>
                <p className="text-muted-foreground leading-relaxed">
                  あなたの学習履歴をリアルタイムで可視化。苦手分野をAIが特定し、克服をサポートします。
                </p>
              </CardContent>
            </Card>

            {/* Feature 3 */}
            <Card className="p-8 rounded-2xl glass-hover border-stone-200/60 bg-white/40">
              <CardContent className="p-0 flex flex-col items-center text-center space-y-4">
                <div className="p-4 bg-purple-500/20 rounded-2xl text-purple-400 shadow-inner shadow-purple-500/10">
                  <Zap className="h-10 w-10" />
                </div>
                <h3 className="text-2xl font-bold text-stone-800">高速 & 快適</h3>
                <p className="text-muted-foreground leading-relaxed">
                  ストレスフリーな操作性。スマホ・PC・タブレット、どこでも最高の学習体験を。
                </p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* Trust/Stats Section */}
      <section className="w-full py-20 relative overflow-hidden">
        <div className="absolute inset-0 bg-primary/5 clip-path-slant" />
        <div className="container px-4 md:px-6 mx-auto relative z-10">
          <div className="grid gap-8 md:grid-cols-4 text-center divide-y md:divide-y-0 md:divide-x divide-stone-200">
            <div className="p-4">
              <div className="text-4xl font-bold text-gradient-gold mb-2">5,000+</div>
              <div className="text-sm text-muted-foreground uppercase tracking-wider">収録問題数</div>
            </div>
            <div className="p-4">
              <div className="text-4xl font-bold text-gradient-gold mb-2">98%</div>
              <div className="text-sm text-muted-foreground uppercase tracking-wider">利用者満足度</div>
            </div>
            <div className="p-4">
              <div className="text-4xl font-bold text-gradient-gold mb-2">24h</div>
              <div className="text-sm text-muted-foreground uppercase tracking-wider">いつでも学習可能</div>
            </div>
            <div className="p-4">
              <div className="text-4xl font-bold text-gradient-gold mb-2">No.1</div>
              <div className="text-sm text-muted-foreground uppercase tracking-wider">選ばれる理由</div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
