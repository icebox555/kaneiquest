"use client";

import { useState } from "react";
import { updateUserProfile } from "@/lib/actions/admin";
import { Button } from "@/components/ui/Button";
import { Input } from "@/components/ui/Input";
import { Label } from "@/components/ui/Label";
import { Dialog, DialogContent, DialogDescription, DialogFooter, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/Dialog";
import { Edit, Loader2 } from "lucide-react";
import { useRouter } from "next/navigation";

interface UserEditDialogProps {
    user: {
        id: string;
        name: string;
        email: string;
        plan: string;
    };
}

export function UserEditDialog({ user }: UserEditDialogProps) {
    const router = useRouter();
    const [open, setOpen] = useState(false);
    const [loading, setLoading] = useState(false);
    const [name, setName] = useState(user.name);
    const [plan, setPlan] = useState(user.plan);

    const handleSave = async () => {
        setLoading(true);
        try {
            // Server Action: verifies admin role and validates plan server-side
            const result = await updateUserProfile(user.id, name, plan);
            if (result.error) throw new Error(result.error);

            setOpen(false);
            router.refresh();
        } catch (error: unknown) {
            const message = error instanceof Error ? error.message : "不明なエラー";
            alert("更新に失敗しました: " + message);
        } finally {
            setLoading(false);
        }
    };

    return (
        <Dialog open={open} onOpenChange={setOpen}>
            <DialogTrigger asChild>
                <Button variant="ghost" size="sm" className="h-8 w-8 p-0">
                    <Edit className="w-4 h-4 text-slate-400 hover:text-white" />
                </Button>
            </DialogTrigger>
            <DialogContent className="sm:max-w-[425px] bg-slate-900 border-slate-800 text-white">
                <DialogHeader>
                    <DialogTitle>ユーザー編集</DialogTitle>
                    <DialogDescription>
                        ユーザー情報（表示名、プラン）を変更します。
                    </DialogDescription>
                </DialogHeader>
                <div className="grid gap-4 py-4">
                    <div className="grid gap-2">
                        <Label htmlFor="email" className="text-slate-400">Email</Label>
                        <Input id="email" value={user.email} disabled className="bg-slate-800/50 border-slate-800 text-slate-500" />
                    </div>
                    <div className="grid gap-2">
                        <Label htmlFor="name">表示名</Label>
                        <Input
                            id="name"
                            value={name}
                            onChange={(e) => setName(e.target.value)}
                            className="bg-slate-800 border-slate-700 focus:border-primary"
                        />
                    </div>
                    <div className="grid gap-2">
                        <Label htmlFor="plan">プラン</Label>
                        <select
                            id="plan"
                            value={plan}
                            onChange={(e) => setPlan(e.target.value)}
                            className="flex h-10 w-full rounded-md border border-slate-700 bg-slate-800 px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                        >
                            <option value="free">Free</option>
                            <option value="pro">Pro</option>
                            {/* "admin" is intentionally excluded — role changes require DB-level operations */}
                        </select>
                    </div>
                </div>
                <DialogFooter>
                    <Button variant="outline" onClick={() => setOpen(false)} disabled={loading}>
                        キャンセル
                    </Button>
                    <Button variant="premium" onClick={handleSave} loading={loading}>
                        保存する
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    );
}
