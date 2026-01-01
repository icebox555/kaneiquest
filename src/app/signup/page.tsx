'use client';

import Link from "next/link";
import { Mail, Lock, Hexagon, AlertCircle, User } from "lucide-react";
import { Button } from "@/components/ui/Button";
import { Input } from "@/components/ui/Input";
import { Label } from "@/components/ui/Label";
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/Card";
import { createClient } from "@/lib/supabase/client";
import { useRouter } from "next/navigation";
import { useState } from "react";

export default function SignupPage() {
    const router = useRouter();
    const supabase = createClient();
    const [name, setName] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [error, setError] = useState("");
    const [loading, setLoading] = useState(false);

    const handleSignup = async (e: React.FormEvent) => {
        e.preventDefault();
        setError("");
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
                setError(error.message);
            } else {
                // Success: Usually Supabase sends a confirmation email.
                // For this demo, check if auto-confirm is on or warn user.
                alert("登録確認メールを送信しました。メールボックスを確認してください。");
                router.push('/login');
            }
        } catch (err) {
            setError("予期せぬエラーが発生しました");
            console.error(err);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="container relative flex-col items-center justify-center grid lg:max-w-none lg:grid-cols-2 lg:px-0 h-[calc(100vh-64px)] overflow-hidden">
            {/* Left Side (Visual) */}
            <div className="relative hidden h-full flex-col p-10 text-white lg:flex border-r border-slate-800">
                <div className="absolute inset-0 bg-slate-900">
                    <div className="absolute top-0 left-0 w-full h-full bg-[radial-gradient(ellipse_at_top_right,_var(--tw-gradient-stops))] from-slate-800 via-slate-900 to-black opacity-80" />
                    {/* Abstract Shapes */}
                    <div className="absolute bottom-0 left-0 w-[500px] h-[500px] bg-primary/10 rounded-full blur-[120px]" />
                </div>

                <div className="relative z-20 flex items-center gap-2 text-lg font-medium">
                    <Hexagon className="h-6 w-6 text-primary" />
                    <span className="font-bold text-xl tracking-tight text-white">Kanei Quest</span>
                </div>
                <div className="relative z-20 mt-auto space-y-4">
                    <blockquote className="space-y-2">
                        <p className="text-lg">
                            &ldquo;このアプリのおかげで、苦手だった生化学を克服できました。毎日の通学時間が、最高の学習時間に変わりました。&rdquo;
                        </p>
                        <footer className="text-sm text-slate-400">田中 美咲 さん (第38回管理栄養士国家試験 合格)</footer>
                    </blockquote>
                </div>
            </div>

            {/* Right Side (Form) */}
            <div className="lg:p-8 flex items-center justify-center relative w-full">
                <div className="absolute inset-0 bg-[radial-gradient(circle_at_center,_var(--tw-gradient-stops))] from-slate-900/50 to-transparent pointer-events-none lg:hidden" />

                <Card className="mx-auto w-full sm:w-[400px] bg-transparent border-0 shadow-none sm:bg-slate-900/40 sm:border-slate-800 sm:backdrop-blur-md">
                    <CardHeader className="space-y-1 text-center">
                        <CardTitle className="text-3xl font-bold tracking-tight">アカウント作成</CardTitle>
                        <CardDescription>
                            まずは無料で始めましょう
                        </CardDescription>
                    </CardHeader>
                    <CardContent className="grid gap-4">
                        <form onSubmit={handleSignup}>
                            <div className="grid gap-4">
                                {error && (
                                    <div className="bg-red-500/10 border border-red-500/20 p-3 rounded-lg flex items-center gap-2 text-red-400 text-sm">
                                        <AlertCircle className="w-4 h-4" />
                                        {error}
                                    </div>
                                )}
                                <div className="grid gap-2">
                                    <Label htmlFor="name">お名前 (表示名)</Label>
                                    <div className="relative">
                                        <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none z-10">
                                            <User className="h-4 w-4 text-slate-500" />
                                        </div>
                                        <Input
                                            id="name"
                                            placeholder="栄養 花子"
                                            type="text"
                                            autoCapitalize="none"
                                            autoCorrect="off"
                                            value={name}
                                            onChange={(e) => setName(e.target.value)}
                                            className="pl-10"
                                            required
                                        />
                                    </div>
                                </div>
                                <div className="grid gap-2">
                                    <Label htmlFor="email">Email</Label>
                                    <div className="relative">
                                        <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none z-10">
                                            <Mail className="h-4 w-4 text-slate-500" />
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
                                            className="pl-10"
                                            required
                                        />
                                    </div>
                                </div>
                                <div className="grid gap-2">
                                    <Label htmlFor="password">Password</Label>
                                    <div className="relative">
                                        <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none z-10">
                                            <Lock className="h-4 w-4 text-slate-500" />
                                        </div>
                                        <Input
                                            id="password"
                                            placeholder="パスワード"
                                            type="password"
                                            autoComplete="new-password"
                                            value={password}
                                            onChange={(e) => setPassword(e.target.value)}
                                            className="pl-10"
                                            required
                                        />
                                    </div>
                                </div>
                                <Button type="submit" className="w-full" variant="premium" loading={loading}>
                                    新規登録 (無料)
                                </Button>
                            </div>
                        </form>

                        <div className="relative">
                            <div className="absolute inset-0 flex items-center">
                                <span className="w-full border-t border-slate-800" />
                            </div>
                            <div className="relative flex justify-center text-xs uppercase">
                                <span className="bg-background px-2 text-slate-500">
                                    または
                                </span>
                            </div>
                        </div>

                        <Button variant="outline" type="button" className="w-full">
                            Googleで登録
                        </Button>
                    </CardContent>
                    <CardFooter>
                        <p className="px-8 text-center text-sm text-slate-500 w-full">
                            すでにアカウントをお持ちの場合は{" "}
                            <Link
                                href="/login"
                                className="underline underline-offset-4 hover:text-primary text-slate-400"
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
