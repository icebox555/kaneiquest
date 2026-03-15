'use client';

import Link from "next/link";
import { Mail, Lock, Hexagon, AlertCircle } from "lucide-react";
import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { Button } from "@/components/ui/Button";
import { Input } from "@/components/ui/Input";
import { Label } from "@/components/ui/Label";
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/Card";

export default function LoginPage() {
    const router = useRouter();
    const supabase = createClient();
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [error, setError] = useState("");
    const [loading, setLoading] = useState(false);

    const handleLogin = async (e: React.FormEvent) => {
        e.preventDefault();
        setError("");
        setLoading(true);

        try {
            const { error } = await supabase.auth.signInWithPassword({
                email,
                password,
            });

            if (error) {
                if (error.message.includes("Invalid login credentials")) {
                    setError("メールアドレスまたはパスワードが正しくありません");
                } else {
                    setError(error.message);
                }
            } else {
                const { data: { user } } = await supabase.auth.getUser();
                if (user) {
                    const { data: profile } = await supabase
                        .from('profiles')
                        .select('role')
                        .eq('id', user.id)
                        .single();

                    const params = new URLSearchParams(window.location.search);
                    const next = params.get("next");

                    // Validate that `next` is an internal path to prevent open redirect attacks.
                    // Parse with current origin as base and verify the resulting origin matches.
                    if (next) {
                        try {
                            const url = new URL(next, window.location.origin);
                            if (url.origin === window.location.origin) {
                                window.location.href = url.pathname + url.search;
                                return;
                            }
                        } catch {
                            // Invalid URL — fall through to default redirect
                        }
                    }

                    if (profile?.role === 'admin') {
                        router.push('/admin');
                    } else {
                        router.push('/dashboard');
                    }
                    router.refresh();
                }
            }
        } catch {
            setError("予期せぬエラーが発生しました");
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="container relative min-h-[calc(100vh-64px)] flex-col items-center justify-center grid lg:max-w-none lg:grid-cols-2 lg:px-0">
            {/* Left Side (Visual - Natural Theme) */}
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
                    <h2 className="text-3xl font-bold tracking-tight text-stone-800">おかえりなさい</h2>
                    <p className="text-lg text-stone-600 leading-relaxed">
                        継続は力なり。今日の積み重ねが、<br />未来の合格を作ります。<br />
                        さあ、学習を再開しましょう。
                    </p>
                </div>
            </div>

            {/* Right Side (Form) */}
            <div className="lg:p-8 flex items-center justify-center relative w-full py-12">
                <Card className="mx-auto w-full sm:w-[400px] glass border-stone-200 shadow-xl">
                    <CardHeader className="space-y-1 text-center">
                        <CardTitle className="text-2xl font-bold tracking-tight text-stone-800">ログイン</CardTitle>
                        <CardDescription className="text-stone-500">
                            アカウント情報を入力してください
                        </CardDescription>
                    </CardHeader>
                    <CardContent className="grid gap-4">
                        <form onSubmit={handleLogin}>
                            <div className="grid gap-4">
                                {error && (
                                    <div className="bg-red-50 border border-red-100 p-3 rounded-lg flex items-center gap-2 text-red-600 text-sm">
                                        <AlertCircle className="w-4 h-4" />
                                        {error}
                                    </div>
                                )}
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
                                        />
                                    </div>
                                </div>
                                <div className="grid gap-2">
                                    <div className="flex items-center justify-between">
                                        <Label htmlFor="password" className="text-stone-700">Password</Label>
                                        <Link href="/forgot-password" className="text-sm text-primary hover:text-primary/80 transition-colors">
                                            パスワードをお忘れですか？
                                        </Link>
                                    </div>
                                    <div className="relative">
                                        <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none z-10">
                                            <Lock className="h-4 w-4 text-stone-400" />
                                        </div>
                                        <Input
                                            id="password"
                                            placeholder="パスワード"
                                            type="password"
                                            autoComplete="current-password"
                                            value={password}
                                            onChange={(e) => setPassword(e.target.value)}
                                            className="pl-10 bg-white border-stone-200 text-stone-800 focus:ring-primary focus:border-primary placeholder:text-stone-300"
                                        />
                                    </div>
                                </div>
                                <Button type="submit" className="w-full text-white" disabled={loading}>
                                    {loading ? "ログイン中..." : "ログイン"}
                                </Button>
                            </div>
                        </form>

                        <div className="relative hidden">
                            {/* Hidden Google Login until implemented */}
                            <div className="absolute inset-0 flex items-center">
                                <span className="w-full border-t border-stone-200" />
                            </div>
                            <div className="relative flex justify-center text-xs uppercase">
                                <span className="bg-white px-2 text-stone-400">
                                    または
                                </span>
                            </div>
                        </div>

                        {/* <Button variant="outline" type="button" className="w-full border-stone-200 text-stone-600 hover:bg-stone-50">
                            Googleでログイン
                        </Button> */}
                    </CardContent>
                    <CardFooter>
                        <p className="px-8 text-center text-sm text-stone-500 w-full">
                            アカウントをお持ちでない場合は{" "}
                            <Link
                                href="/signup"
                                className="underline underline-offset-4 hover:text-primary text-stone-600"
                            >
                                新規登録
                            </Link>
                            {" "}へ
                        </p>
                    </CardFooter>
                </Card>
            </div>
        </div>
    );
}
