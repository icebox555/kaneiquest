"use client"

import Link from "next/link";
import { BookOpen, Target, TrendingUp, CheckCircle, ArrowRight, Clock, Brain, Crown, Heart, Flame, Trophy, Zap, CalendarDays } from "lucide-react";
import { buttonVariants } from "@/components/ui/Button";
import { Card, CardContent } from "@/components/ui/Card";
import { cn } from "@/lib/utils";


const PAIN_POINTS = [
  "どの科目から手をつければいいかわからない",
  "勉強しているのに模試の点数が伸びない",
  "テキストを読むだけで問題演習が足りていない",
  "仕事しながらの受験で、学習時間が確保できない",
];

const HOW_IT_WORKS = [
  {
    step: "01",
    title: "無料登録して演習開始",
    desc: "メールアドレスだけで即スタート。最初の1問まで1分以内。",
    icon: BookOpen,
  },
  {
    step: "02",
    title: "AIが弱点を自動分析",
    desc: "解答データをもとにAIが苦手科目を特定。毎日最適な問題をレコメンド。",
    icon: Brain,
  },
  {
    step: "03",
    title: "模擬試験で合格を確信する",
    desc: "本番形式200問・時間制限つきで実力チェック。得点が可視化されモチベーション継続。",
    icon: Target,
  },
];

export default function Home() {
  return (
    <div className="flex flex-col min-h-screen">

      {/* ===== Hero ===== */}
      <section className="relative w-full py-24 md:py-32 lg:py-40 overflow-hidden">
        <div className="absolute top-0 left-1/2 -translate-x-1/2 w-full h-full max-w-7xl pointer-events-none">
          <div className="absolute top-20 left-10 w-96 h-96 bg-primary/10 rounded-full blur-[100px] animate-pulse" />
          <div className="absolute bottom-20 right-10 w-96 h-96 bg-secondary/20 rounded-full blur-[100px] animate-pulse delay-1000" />
        </div>

        <div className="container relative z-10 px-4 md:px-6 flex flex-col items-center text-center space-y-8 mx-auto">
          <div className="space-y-5 max-w-4xl">
            <div className="flex items-center justify-center gap-2 flex-wrap">
              <span className="inline-flex items-center gap-1.5 px-4 py-1.5 rounded-full border border-primary/30 bg-primary/10 text-primary text-sm font-semibold backdrop-blur-md">
                管理栄養士国家試験対策 No.1
              </span>
              <span className="inline-flex items-center gap-1.5 px-4 py-1.5 rounded-full border border-green-300/50 bg-green-50 text-green-700 text-sm font-semibold">
                <CheckCircle className="h-3.5 w-3.5" />
                無料で始められる
              </span>
            </div>

            <h1 className="text-4xl md:text-6xl lg:text-7xl font-extrabold tracking-tight leading-tight text-stone-800">
              管理栄養士国家試験に
              <br className="md:hidden" />
              <span className="text-gradient-gold block mt-2">最短で合格する</span>
            </h1>

            <p className="mx-auto max-w-[700px] text-stone-500 text-lg md:text-xl leading-relaxed">
              5,000問超の過去問 ＋ AI弱点分析 ＋ 本番形式の模擬試験。<br className="hidden md:block" />
              <strong className="text-stone-700">合格者が選んだ</strong>、最短ルートへの学習プラットフォームです。
            </p>

            <div className="flex items-center justify-center gap-6 text-sm text-stone-400 pt-2">
              <span className="flex items-center gap-1"><CheckCircle className="h-4 w-4 text-green-500" />クレジットカード不要</span>
              <span className="flex items-center gap-1"><CheckCircle className="h-4 w-4 text-green-500" />いつでも解約可能</span>
              <span className="flex items-center gap-1"><CheckCircle className="h-4 w-4 text-green-500" />スマホ対応</span>
            </div>
          </div>

          <div className="flex flex-col sm:flex-row gap-4 w-full justify-center">
            <Link
              href="/signup"
              className={cn(buttonVariants({ variant: "premium", size: "lg" }), "h-14 px-10 text-lg rounded-full shadow-lg shadow-primary/25")}
            >
              今すぐ無料で始める
              <ArrowRight className="ml-2 h-5 w-5" />
            </Link>
            <Link
              href="/pricing"
              className={cn(buttonVariants({ variant: "outline", size: "lg" }), "h-14 px-10 text-lg rounded-full border-stone-200 bg-white/50 hover:bg-stone-50")}
            >
              料金プランを見る
            </Link>
          </div>

          <p className="text-xs text-stone-400">登録30秒 • 今日から演習スタート</p>
        </div>
      </section>

      {/* ===== Pain Points ===== */}
      <section className="w-full py-16 bg-stone-900 relative overflow-hidden">
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_top_left,rgba(230,136,139,0.15),transparent_60%)]" />
        <div className="container mx-auto px-4 md:px-6 relative z-10">
          <div className="text-center mb-10">
            <h2 className="text-2xl md:text-3xl font-bold text-white mb-3">
              こんな悩み、ありませんか？
            </h2>
            <p className="text-stone-400">多くの受験生が同じ壁にぶつかっています。</p>
          </div>
          <div className="grid sm:grid-cols-2 gap-4 max-w-3xl mx-auto">
            {PAIN_POINTS.map((point, i) => (
              <div key={i} className="flex items-start gap-3 bg-white/5 border border-white/10 rounded-xl px-5 py-4">
                <span className="mt-0.5 h-5 w-5 rounded-full bg-primary/20 text-primary flex items-center justify-center text-xs font-bold flex-shrink-0">✕</span>
                <p className="text-stone-300 text-sm leading-relaxed">{point}</p>
              </div>
            ))}
          </div>
          <p className="text-center text-primary font-semibold mt-8 text-lg">
            → Kanei Quest なら、すべて解決できます。
          </p>
        </div>
      </section>

      {/* ===== How It Works ===== */}
      <section className="w-full py-20 bg-stone-50/50">
        <div className="container mx-auto px-4 md:px-6">
          <div className="text-center mb-14 space-y-3">
            <h2 className="text-3xl md:text-4xl font-bold text-stone-800">
              <span className="border-b-4 border-primary/60 pb-1">3ステップで合格へ</span>
            </h2>
            <p className="text-muted-foreground text-lg max-w-xl mx-auto">
              複雑な設定は一切なし。登録したその日から学習を始められます。
            </p>
          </div>

          <div className="grid md:grid-cols-3 gap-8 max-w-4xl mx-auto">
            {HOW_IT_WORKS.map(({ step, title, desc, icon: Icon }) => (
              <div key={step} className="flex flex-col items-center text-center space-y-4">
                <div className="relative">
                  <div className="w-16 h-16 rounded-2xl bg-primary/10 flex items-center justify-center">
                    <Icon className="h-8 w-8 text-primary" />
                  </div>
                  <span className="absolute -top-2 -right-2 w-6 h-6 rounded-full bg-primary text-white text-xs font-bold flex items-center justify-center">
                    {step.slice(-1)}
                  </span>
                </div>
                <h3 className="text-xl font-bold text-stone-800">{title}</h3>
                <p className="text-muted-foreground text-sm leading-relaxed">{desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ===== Features ===== */}
      <section className="w-full py-20 relative">
        <div className="container px-4 md:px-6 mx-auto">
          <div className="text-center mb-14 space-y-3">
            <h2 className="text-3xl md:text-4xl font-bold text-stone-800">
              <span className="border-b-4 border-primary/60 pb-1">合格を支える機能</span>
            </h2>
            <p className="text-muted-foreground text-lg max-w-2xl mx-auto">
              ただの問題集ではありません。合格から逆算した機能がそろっています。
            </p>
          </div>

          <div className="grid gap-6 md:grid-cols-3">
            <Card className="p-8 rounded-2xl glass-hover border-stone-200/60 bg-white/40">
              <CardContent className="p-0 flex flex-col items-center text-center space-y-4">
                <div className="p-4 bg-primary/20 rounded-2xl text-primary">
                  <Crown className="h-10 w-10" />
                </div>
                <h3 className="text-xl font-bold text-stone-800">5,000問超の過去問バンク</h3>
                <p className="text-muted-foreground text-sm leading-relaxed">
                  過去10年分以上の良問を完全収録。解説つきで「なぜ正解か」まで徹底理解。分野別・難易度別に絞り込み演習も可能。
                </p>
              </CardContent>
            </Card>

            <Card className="p-8 rounded-2xl glass-hover border-primary/20 bg-primary/5 ring-1 ring-primary/20">
              <CardContent className="p-0 flex flex-col items-center text-center space-y-4">
                <div className="p-4 bg-secondary/20 rounded-2xl text-secondary">
                  <Brain className="h-10 w-10" />
                </div>
                <div className="inline-block px-2 py-0.5 bg-primary/10 text-primary text-xs font-bold rounded-full">POPULAR</div>
                <h3 className="text-xl font-bold text-stone-800">AI弱点コーチング</h3>
                <p className="text-muted-foreground text-sm leading-relaxed">
                  解答データを解析して苦手分野をスコア化。「今日はここを重点的に」と最適な学習プランを毎日提案します。
                </p>
              </CardContent>
            </Card>

            <Card className="p-8 rounded-2xl glass-hover border-stone-200/60 bg-white/40">
              <CardContent className="p-0 flex flex-col items-center text-center space-y-4">
                <div className="p-4 bg-purple-500/20 rounded-2xl text-purple-500">
                  <Target className="h-10 w-10" />
                </div>
                <h3 className="text-xl font-bold text-stone-800">本番形式の模擬試験</h3>
                <p className="text-muted-foreground text-sm leading-relaxed">
                  200問・時間制限つきの模擬試験で試験本番の緊張感を体験。得点推移グラフで成長が一目でわかります。
                </p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* ===== Stats ===== */}
      <section className="w-full py-16 bg-gradient-to-r from-stone-900 to-stone-800 relative overflow-hidden">
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_bottom_right,rgba(230,136,139,0.2),transparent_60%)]" />
        <div className="container px-4 md:px-6 mx-auto relative z-10">
          <div className="grid gap-8 md:grid-cols-4 text-center">
            <div className="p-4">
              <div className="text-4xl md:text-5xl font-extrabold text-gradient-gold mb-2">5,000+</div>
              <div className="text-stone-400 text-sm uppercase tracking-wider">収録問題数</div>
            </div>
            <div className="p-4">
              <div className="text-4xl md:text-5xl font-extrabold text-gradient-gold mb-2">98%</div>
              <div className="text-stone-400 text-sm uppercase tracking-wider">利用者満足度</div>
            </div>
            <div className="p-4">
              <div className="text-4xl md:text-5xl font-extrabold text-gradient-gold mb-2">10年</div>
              <div className="text-stone-400 text-sm uppercase tracking-wider">分の過去問を収録</div>
            </div>
            <div className="p-4">
              <div className="text-4xl md:text-5xl font-extrabold text-gradient-gold mb-2">¥0</div>
              <div className="text-stone-400 text-sm uppercase tracking-wider">無料で始められる</div>
            </div>
          </div>
        </div>
      </section>


      {/* ===== Gamification ===== */}
      <section className="w-full py-20 bg-stone-50/50">
        <div className="container mx-auto px-4 md:px-6">
          <div className="text-center mb-14 space-y-3">
            <h2 className="text-3xl md:text-4xl font-bold text-stone-800">
              <span className="border-b-4 border-primary/60 pb-1">続けられる仕組みがある</span>
            </h2>
            <p className="text-muted-foreground text-lg max-w-2xl mx-auto">
              ゲームのような達成感で、毎日の学習が習慣になります。
            </p>
          </div>

          <div className="grid md:grid-cols-2 gap-8 max-w-5xl mx-auto items-center">
            {/* Left: visual mock */}
            <div className="space-y-4">
              {/* Hearts */}
              <div className="bg-white rounded-2xl p-5 shadow-sm border border-stone-100 flex items-center gap-4">
                <div className="p-3 bg-rose-50 rounded-xl">
                  <Heart className="h-7 w-7 text-rose-500 fill-rose-400" />
                </div>
                <div className="flex-1">
                  <p className="font-bold text-stone-800">ハートシステム</p>
                  <p className="text-sm text-stone-500">正解でハートを守り、仲間から送ってもらおう</p>
                </div>
                <div className="flex gap-1">
                  {[...Array(5)].map((_, i) => (
                    <Heart key={i} className={`h-5 w-5 ${i < 3 ? "text-rose-400 fill-rose-400" : "text-stone-200 fill-stone-100"}`} />
                  ))}
                </div>
              </div>

              {/* Streak */}
              <div className="bg-white rounded-2xl p-5 shadow-sm border border-stone-100 flex items-center gap-4">
                <div className="p-3 bg-orange-50 rounded-xl">
                  <Flame className="h-7 w-7 text-orange-500 fill-orange-300" />
                </div>
                <div className="flex-1">
                  <p className="font-bold text-stone-800">連続学習ストリーク</p>
                  <p className="text-sm text-stone-500">毎日続けるほど、炎が燃え上がる</p>
                </div>
                <div className="text-right">
                  <span className="text-2xl font-extrabold text-orange-500">14</span>
                  <span className="text-xs text-stone-400 block">日連続</span>
                </div>
              </div>

              {/* XP & Level */}
              <div className="bg-white rounded-2xl p-5 shadow-sm border border-stone-100 flex items-center gap-4">
                <div className="p-3 bg-yellow-50 rounded-xl">
                  <Zap className="h-7 w-7 text-yellow-500" />
                </div>
                <div className="flex-1">
                  <p className="font-bold text-stone-800">XP ＆ レベルアップ</p>
                  <div className="flex items-center gap-2 mt-1">
                    <div className="flex-1 h-2 bg-stone-100 rounded-full overflow-hidden">
                      <div className="h-full w-3/4 bg-gradient-to-r from-yellow-400 to-orange-400 rounded-full" />
                    </div>
                    <span className="text-xs text-stone-500">Lv.7</span>
                  </div>
                </div>
              </div>
            </div>

            {/* Right: copy */}
            <div className="space-y-6">
              <h3 className="text-2xl md:text-3xl font-bold text-stone-800 leading-snug">
                「また明日もやろう」と<br />
                <span className="text-primary">自然に思える</span>学習体験
              </h3>
              <ul className="space-y-4">
                {[
                  { icon: Flame, text: "連続学習ストリークでモチベーションを維持" },
                  { icon: Zap, text: "XP獲得＆レベルアップで達成感を可視化" },
                  { icon: Heart, text: "ハートを仲間に送り合いコミュニティ形成" },
                  { icon: CalendarDays, text: "試験日カウントダウンで逆算学習" },
                ].map(({ icon: Icon, text }) => (
                  <li key={text} className="flex items-start gap-3 text-stone-600">
                    <Icon className="h-5 w-5 text-primary mt-0.5 shrink-0" />
                    <span>{text}</span>
                  </li>
                ))}
              </ul>
              <Link
                href="/signup"
                className={cn(buttonVariants({ variant: "premium", size: "lg" }), "rounded-full")}
              >
                無料で体験する <ArrowRight className="ml-2 h-4 w-4" />
              </Link>
            </div>
          </div>
        </div>
      </section>

      {/* ===== Ranking ===== */}
      <section className="w-full py-20 bg-stone-900 relative overflow-hidden">
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_top_right,rgba(230,136,139,0.15),transparent_60%)]" />
        <div className="container mx-auto px-4 md:px-6 relative z-10">
          <div className="grid md:grid-cols-2 gap-12 items-center max-w-5xl mx-auto">
            {/* Copy */}
            <div className="space-y-6">
              <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full border border-yellow-500/30 bg-yellow-500/10 text-yellow-400 text-sm font-semibold">
                <Trophy className="h-4 w-4" />
                週間ランキング
              </div>
              <h3 className="text-3xl md:text-4xl font-extrabold text-white leading-tight">
                仲間と競い合って<br />
                <span className="text-gradient-gold">合格への本気度が上がる</span>
              </h3>
              <p className="text-stone-400 leading-relaxed">
                週間ランキングでXPを競い合おう。他の受験生が頑張っているとわかるから、自分も頑張れる。一人で戦わなくていい。
              </p>
              <Link
                href="/signup"
                className="inline-flex items-center gap-2 text-sm font-semibold text-primary hover:underline"
              >
                ランキングに挑戦する <ArrowRight className="h-4 w-4" />
              </Link>
            </div>

            {/* Ranking Mock */}
            <div className="bg-white/5 border border-white/10 rounded-2xl overflow-hidden">
              <div className="px-5 py-4 border-b border-white/10 flex items-center justify-between">
                <span className="text-white font-bold text-sm">今週のランキング</span>
                <span className="text-xs text-stone-500">XP 順</span>
              </div>
              {[
                { rank: 1, name: "栄養士Aさん", xp: 3240, medal: "🥇" },
                { rank: 2, name: "管理栄養士Bさん", xp: 2810, medal: "🥈" },
                { rank: 3, name: "受験生Cさん", xp: 2450, medal: "🥉" },
                { rank: 4, name: "あなた", xp: 1200, medal: "4" },
              ].map(({ rank, name, xp, medal }) => (
                <div
                  key={rank}
                  className={`flex items-center gap-4 px-5 py-3.5 border-b border-white/5 last:border-0 ${name === "あなた" ? "bg-primary/10" : ""}`}
                >
                  <span className="text-lg w-8 text-center">{medal}</span>
                  <span className={`flex-1 text-sm font-medium ${name === "あなた" ? "text-primary" : "text-stone-300"}`}>{name}</span>
                  <span className="text-xs text-stone-400 font-semibold">{xp.toLocaleString()} XP</span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* ===== Final CTA ===== */}
      <section className="w-full py-24 relative overflow-hidden">
        <div className="absolute inset-0 bg-gradient-to-br from-primary/10 via-transparent to-secondary/10" />
        <div className="container mx-auto px-4 md:px-6 relative z-10 text-center space-y-8">
          <div className="space-y-4 max-w-3xl mx-auto">
            <h2 className="text-3xl md:text-5xl font-extrabold text-stone-800 leading-tight">
              今日から始める人が、
              <br />
              <span className="text-gradient-gold">来年の合格者になる。</span>
            </h2>
            <p className="text-stone-500 text-lg max-w-xl mx-auto">
              試験まであと何日ありますか？<br />
              後悔しない選択を、今日してください。
            </p>
          </div>

          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              href="/signup"
              className={cn(buttonVariants({ variant: "premium", size: "lg" }), "h-14 px-12 text-lg rounded-full shadow-xl shadow-primary/30")}
            >
              無料で学習を始める
              <ArrowRight className="ml-2 h-5 w-5" />
            </Link>
          </div>

          <div className="flex items-center justify-center gap-6 text-sm text-stone-400">
            <span className="flex items-center gap-1.5"><Clock className="h-4 w-4" />登録30秒</span>
            <span className="flex items-center gap-1.5"><CheckCircle className="h-4 w-4 text-green-500" />完全無料から</span>
            <span className="flex items-center gap-1.5"><TrendingUp className="h-4 w-4 text-primary" />今すぐ演習開始</span>
          </div>
        </div>
      </section>

    </div>
  );
}
