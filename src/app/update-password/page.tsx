'use client';

import { useState, useEffect } from "react";
import { createClient } from "@/lib/supabase/client";
import { Button } from "@/components/ui/Button";
import { Input } from "@/components/ui/Input";
import { Label } from "@/components/ui/Label";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/Card";
import { useRouter } from "next/navigation";
import { Lock, Loader2, AlertCircle, CheckCircle } from "lucide-react";

export default function UpdatePasswordPage() {
    const router = useRouter();
    const supabase = createClient();
    const [password, setPassword] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");
    const [loading, setLoading] = useState(false);
    const [verifying, setVerifying] = useState(true);
    const [error, setError] = useState("");
    const [success, setSuccess] = useState(false);

    // Verify session on mount
    useEffect(() => {
        const checkSession = async () => {
            const { data: { session } } = await supabase.auth.getSession();
            if (!session) {
                // Redirect to login if no session (link expired or invalid)
                router.replace("/login?error=invalid_link");
            } else {
                setVerifying(false);
            }
        };
        checkSession();
    }, [supabase, router]);

    const handleUpdate = async (e: React.FormEvent) => {
        e.preventDefault();
        setError("");

        if (password !== confirmPassword) {
            setError("パスワードが一致しません");
            return;
        }

        if (password.length < 6) {
            setError("パスワードは6文字以上である必要があります");
            return;
        }

        setLoading(true);

        try {
            const { error } = await supabase.auth.updateUser({
                password: password,
            });

            if (error) {
                setError("パスワードの更新に失敗しました: " + error.message);
            } else {
                setSuccess(true);
                setTimeout(() => router.push("/dashboard"), 2000);
            }
        } catch (err: any) {
            setError("予期せぬエラーが発生しました");
        } finally {
            setLoading(false);
        }
    };

    if (verifying) {
        return (
            <div className="flex h-screen items-center justify-center">
                <Loader2 className="h-8 w-8 animate-spin text-primary" />
            </div>
        );
    }

    return (
        <div className="container relative min-h-[calc(100vh-64px)] flex items-center justify-center py-12">
            <div className="w-full max-w-md">
                <Card className="glass border-stone-200 shadow-xl">
                    <CardHeader>
                        <CardTitle className="text-2xl font-bold text-stone-800 text-center">新しいパスワードの設定</CardTitle>
                        <CardDescription className="text-stone-500 text-center">
                            新しいパスワードを入力してください。
                        </CardDescription>
                    </CardHeader>
                    <CardContent>
                        <form onSubmit={handleUpdate} className="space-y-4">
                            {success && (
                                <div className="bg-green-50 p-3 rounded-lg flex items-center gap-2 text-green-700 text-sm border border-green-100">
                                    <CheckCircle className="w-4 h-4 shrink-0" />
                                    パスワードを更新しました。ダッシュボードへ移動します...
                                </div>
                            )}
                            {error && (
                                <div className="bg-red-50 p-3 rounded-lg flex items-center gap-2 text-red-600 text-sm border border-red-100">
                                    <AlertCircle className="w-4 h-4 shrink-0" />
                                    {error}
                                </div>
                            )}
                            <div className="space-y-2">
                                <Label htmlFor="password" className="text-stone-700">新しいパスワード</Label>
                                <div className="relative">
                                    <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                        <Lock className="h-4 w-4 text-stone-400" />
                                    </div>
                                    <Input
                                        id="password"
                                        type="password"
                                        placeholder="••••••••"
                                        value={password}
                                        onChange={(e) => setPassword(e.target.value)}
                                        className="pl-10 bg-white border-stone-200 text-stone-800 focus:ring-primary focus:border-primary placeholder:text-stone-300"
                                        required
                                    />
                                </div>
                            </div>
                            <div className="space-y-2">
                                <Label htmlFor="confirmPassword" className="text-stone-700">パスワード（確認）</Label>
                                <div className="relative">
                                    <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                        <Lock className="h-4 w-4 text-stone-400" />
                                    </div>
                                    <Input
                                        id="confirmPassword"
                                        type="password"
                                        placeholder="••••••••"
                                        value={confirmPassword}
                                        onChange={(e) => setConfirmPassword(e.target.value)}
                                        className="pl-10 bg-white border-stone-200 text-stone-800 focus:ring-primary focus:border-primary placeholder:text-stone-300"
                                        required
                                    />
                                </div>
                            </div>
                            <Button type="submit" className="w-full text-white" loading={loading} disabled={success}>
                                パスワードを変更してログイン
                            </Button>
                        </form>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
