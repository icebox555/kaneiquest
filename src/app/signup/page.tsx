'use client';

import Link from "next/link";
import { Mail, Lock, Hexagon, AlertCircle, CheckCircle, User } from "lucide-react";
import { Button } from "@/components/ui/Button";
import { Input } from "@/components/ui/Input";
import { Label } from "@/components/ui/Label";
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/Card";
import { createClient } from "@/lib/supabase/client";
import { useRouter, useSearchParams } from "next/navigation";
import { useState } from "react";

export default function SignupPage() {
    const router = useRouter();
    const searchParams = useSearchParams();
    const supabase = createClient();
    const [name, setName] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [message, setMessage] = useState<{ type: 'error' | 'success'; text: string } | null>(null);
    const [loading, setLoading] = useState(false);

    const handleSignup = async (e: React.FormEvent) => {
        e.preventDefault();
        setMessage(null);

        if (password.length < 6) {
            setMessage({ type: 'error', text: 'パスワードは6文字以上で入力してください' });
            return;
        }

        setLoading(true);

        try {
            const { error } = await supabase.auth.signUp({
                email,
                password,
                options: {
                    data: {
                        name: name,
                    },
                },
            });

            if (error) {
                setMessage({ type: 'error', text: error.message });
            } else {
                // Store referral code so HeartActionClaimer can process it after first login
                const ref = searchParams.get('ref');
                if (ref) {
                    localStorage.setItem('kanei_ref', ref);
                }
                setMessage({ type: 'success', text: '登録確認メールを送信しました。メールボックスを確認してください。' });
                setTimeout(() => router.push('/login'), 3000);
            }
        } catch (err) {
            setMessage({ type: 'error', text: '予期せぬエラーが発生しました' });
            console.error(err);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="container relative min-h-[calc(100vh-64px)] flex-col items-center justify-center grid lg:max-w-none lg:grid-cols-2 lg:px-0">
            {/* Left Side (Visual) */}
            <div className="relative hidden h-full flex-col bg-stone-50 p-10 text-stone-800 lg:flex dark:border-r border-stone-200">
                <div className="absolute inset-0 bg-stone-100/50">
                    <div className="absolute top-20 right-20 w-[400px] h-[400px] bg-primary/10 rounded-full blur-[100px]" />
                    <div className="absolute bottom-20 left-20 w-[300px] h-[300px] bg-secondary/10 rounded-full blur-[80px]" />
                </div>

                <div className="relative z-20 flex items-center gap-2 text-lg font-medium">
                    <Hexagon className="h-6 w-6 text-primary" />
                    <span className="font-bold text-xl tracking-tight text-stone-800">Kanei Quest</span>
                </div>
                <div className="relative z-20 mt-auto space-y-4">
                    <h2 className="text-3xl font-bold tracking-tight text-stone-800">一緒に合格を目指そう</h2>
                    <blockquote className="space-y-2">
                        <p className="text-lg text-stone-600 leading-relaxed">
                            &ldquo;このアプリのおかげで、苦手だった生化学を克服できました。毎日の通学時間が、最高の学習時間に変わりました。&rdquo;
                        </p>
                        <footer className="text-sm text-stone-500">田中 美咲 さん (第38回管理栄養士国家試験 合格)</footer>
                    </blockquote>
                </div>
            </div>

            {/* Right Side (Form) */}
            <div className="lg:p-8 flex items-center justify-center relative w-full py-12">
                <Card className="mx-auto w-full sm:w-[400px] glass border-stone-200 shadow-xl">
                    <CardHeader className="space-y-1 text-center">
                        <CardTitle className="text-2xl font-bold tracking-tight text-stone-800">アカウント作成</CardTitle>
                        <CardDescription className="text-stone-500">
                            まずは無料で始めましょう
                        </CardDescription>
                    </CardHeader>
                    <CardContent className="grid gap-4">
                        <form onSubmit={handleSignup}>
                            <div className="grid gap-4">
                                {message?.type === 'error' && (
                                    <div className="bg-red-50 border border-red-100 p-3 rounded-lg flex items-center gap-2 text-red-600 text-sm">
                                        <AlertCircle className="w-4 h-4" />
                                        {message.text}
                                    </div>
                                )}
                                {message?.type === 'success' && (
                                    <div className="bg-green-50 border border-green-100 p-3 rounded-lg flex items-center gap-2 text-green-600 text-sm">
                                        <CheckCircle className="w-4 h-4" />
                                        {message.text}
                                    </div>
                                )}
                                <div className="grid gap-2">
                                    <Label htmlFor="name" className="text-stone-700">お名前 (表示名)</Label>
                                    <div className="relative">
                                        <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none z-10">
                                            <User className="h-4 w-4 text-stone-400" />
                                        </div>
                                        <Input
                                            id="name"
                                            placeholder="栄養 花子"
                                            type="text"
                                            autoCapitalize="none"
                                            autoCorrect="off"
                                            value={name}
                                            onChange={(e) => setName(e.target.value)}
                                            className="pl-10 bg-white border-stone-200 text-stone-800 focus:ring-primary focus:border-primary placeholder:text-stone-300"
                                            required
                                        />
                                    </div>
                                </div>
                                <div className="grid gap-2">
                                    <Label htmlFor="email" className="text-stone-700">Email</Label>
                                    <div className="relative">
                                        <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none z-10">
                                            <Mail className="h-4 w-4 text-stone-400" />
                                        </div>
                                        <Input
                                            id="email"
                                            placeholder="name@example.com"
                                            type="email"
                                            autoCapitalize="none"
                                            autoComplete="email"
                                            autoCorrect="off"
                                            value={email}
                                            onChange={(e) => setEmail(e.target.value)}
                                            className="pl-10 bg-white border-stone-200 text-stone-800 focus:ring-primary focus:border-primary placeholder:text-stone-300"
                                            required
                                        />
                                    </div>
                                </div>
                                <div className="grid gap-2">
                                    <Label htmlFor="password" className="text-stone-700">Password</Label>
                                    <div className="relative">
                                        <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none z-10">
                                            <Lock className="h-4 w-4 text-stone-400" />
                                        </div>
                                        <Input
                                            id="password"
                                            placeholder="パスワード"
                                            type="password"
                                            autoComplete="new-password"
                                            value={password}
                                            onChange={(e) => setPassword(e.target.value)}
                                            className="pl-10 bg-white border-stone-200 text-stone-800 focus:ring-primary focus:border-primary placeholder:text-stone-300"
                                            required
                                        />
                                    </div>
                                </div>
                                <Button type="submit" className="w-full text-white" loading={loading}>
                                    新規登録 (無料)
                                </Button>
                            </div>
                        </form>
                    </CardContent>
                    <CardFooter>
                        <p className="px-8 text-center text-sm text-stone-500 w-full">
                            すでにアカウントをお持ちの場合は{" "}
                            <Link
                                href="/login"
                                className="underline underline-offset-4 hover:text-primary text-stone-600"
                            >
                                ログイン
                            </Link>
                            {" "}へ
                        </p>
                    </CardFooter>
                </Card>
            </div>
        </div>
    );
}
