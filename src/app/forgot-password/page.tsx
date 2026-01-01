'use client';

import { useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { Button } from "@/components/ui/Button";
import { Input } from "@/components/ui/Input";
import { Label } from "@/components/ui/Label";
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/Card";
import Link from "next/link";
import { Mail, AlertCircle, CheckCircle, ArrowLeft } from "lucide-react";

export default function ForgotPasswordPage() {
    const supabase = createClient();
    const [email, setEmail] = useState("");
    const [loading, setLoading] = useState(false);
    const [success, setSuccess] = useState(false);
    const [error, setError] = useState("");

    const handleReset = async (e: React.FormEvent) => {
        e.preventDefault();
        setError("");
        setLoading(true);

        try {
            const { error } = await supabase.auth.resetPasswordForEmail(email, {
                redirectTo: `${window.location.origin}/auth/callback?next=/update-password`,
            });

            if (error) {
                if (error.message.includes("Too many requests")) {
                    setError("リクエストが多すぎます。しばらく待ってから再試行してください。");
                } else {
                    setError("パスワードリセットメールの送信に失敗しました: " + error.message);
                }
            } else {
                setSuccess(true);
            }
        } catch (err: any) {
            setError("予期せぬエラーが発生しました");
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="container relative min-h-[calc(100vh-64px)] flex items-center justify-center py-12">
            <div className="w-full max-w-md">
                <Card className="glass border-stone-200 shadow-xl">
                    <CardHeader>
                        <CardTitle className="text-2xl font-bold text-stone-800 text-center">パスワードをお忘れの方</CardTitle>
                        <CardDescription className="text-stone-500 text-center">
                            登録したメールアドレスを入力してください。<br />
                            パスワード再設定用のリンクをお送りします。
                        </CardDescription>
                    </CardHeader>
                    <CardContent>
                        {success ? (
                            <div className="text-center space-y-4">
                                <div className="flex justify-center">
                                    <div className="p-3 bg-green-100 rounded-full">
                                        <CheckCircle className="w-8 h-8 text-green-600" />
                                    </div>
                                </div>
                                <h3 className="text-lg font-bold text-stone-800">送信完了</h3>
                                <p className="text-stone-600">
                                    {email} 宛に再設定メールを送信しました。メール内のリンクからパスワードの再設定を行ってください。
                                </p>
                                <Button asChild className="w-full mt-4" variant="outline">
                                    <Link href="/login">ログイン画面に戻る</Link>
                                </Button>
                            </div>
                        ) : (
                            <form onSubmit={handleReset} className="space-y-4">
                                {error && (
                                    <div className="bg-red-50 p-3 rounded-lg flex items-center gap-2 text-red-600 text-sm border border-red-100">
                                        <AlertCircle className="w-4 h-4 shrink-0" />
                                        {error}
                                    </div>
                                )}
                                <div className="space-y-2">
                                    <Label htmlFor="email" className="text-stone-700">メールアドレス</Label>
                                    <div className="relative">
                                        <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <Mail className="h-4 w-4 text-stone-400" />
                                        </div>
                                        <Input
                                            id="email"
                                            type="email"
                                            placeholder="name@example.com"
                                            value={email}
                                            onChange={(e) => setEmail(e.target.value)}
                                            className="pl-10 bg-white border-stone-200 text-stone-800 focus:ring-primary focus:border-primary placeholder:text-stone-300"
                                            required
                                        />
                                    </div>
                                </div>
                                <Button type="submit" className="w-full text-white" disabled={loading}>
                                    {loading ? "送信中..." : "再設定メールを送信"}
                                </Button>
                            </form>
                        )}
                    </CardContent>
                    <CardFooter className="justify-center">
                        <Link href="/login" className="flex items-center text-sm text-stone-500 hover:text-stone-800 transition-colors">
                            <ArrowLeft className="w-4 h-4 mr-1" />
                            ログイン画面に戻る
                        </Link>
                    </CardFooter>
                </Card>
            </div>
        </div>
    );
}
