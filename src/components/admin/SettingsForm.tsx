"use client";

import { useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { Button } from "@/components/ui/Button";
import { Input } from "@/components/ui/Input";
import { Label } from "@/components/ui/Label";
import { Switch } from "@/components/ui/Switch";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/Card";
import { Save, AlertCircle, CheckCircle } from "lucide-react";
import { useRouter } from "next/navigation";

interface SettingsFormProps {
    initialSettings: {
        maintenance_mode: boolean;
        announcement: {
            message: string;
            active: boolean;
        };
    };
}

export function SettingsForm({ initialSettings }: SettingsFormProps) {
    const router = useRouter();
    const [loading, setLoading] = useState(false);
    const [maintenanceMode, setMaintenanceMode] = useState(initialSettings.maintenance_mode);
    const [announcement, setAnnouncement] = useState(initialSettings.announcement);
    const [msg, setMsg] = useState<{ type: 'success' | 'error'; text: string } | null>(null);
    const supabase = createClient();

    const handleSave = async () => {
        setLoading(true);
        setMsg(null);
        try {
            // Update Maintenance Mode
            const { error: maintenanceError } = await supabase
                .from("app_settings")
                .upsert({
                    key: "maintenance_mode",
                    value: maintenanceMode
                });

            if (maintenanceError) throw maintenanceError;

            // Update Announcement
            const { error: announcementError } = await supabase
                .from("app_settings")
                .upsert({
                    key: "announcement",
                    value: announcement
                });

            if (announcementError) throw announcementError;

            setMsg({ type: 'success', text: '設定を保存しました。' });
            router.refresh();
        } catch (error: any) {
            setMsg({ type: 'error', text: '保存に失敗しました: ' + error.message });
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="space-y-6">
            {/* Maintenance Mode */}
            <Card className="admin-glass border-red-500/20">
                <CardHeader>
                    <CardTitle className="text-white flex items-center gap-2">
                        メンテナンスモード
                    </CardTitle>
                    <CardDescription className="text-slate-400">
                        有効にすると、管理者以外のすべてのアクセスを遮断し、メンテナンス画面を表示します。
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <div className="flex items-center space-x-2">
                        <Switch
                            id="maintenance-mode"
                            checked={maintenanceMode}
                            onCheckedChange={setMaintenanceMode}
                            className="data-[state=checked]:bg-red-500"
                        />
                        <Label htmlFor="maintenance-mode" className="text-white">
                            {maintenanceMode ? "メンテナンス中" : "通常稼働中"}
                        </Label>
                    </div>
                </CardContent>
            </Card>

            {/* Announcement */}
            <Card className="admin-glass border-blue-500/20">
                <CardHeader>
                    <CardTitle className="text-white">システムお知らせ</CardTitle>
                    <CardDescription className="text-slate-400">
                        ユーザー全体に向けたアナウンスメッセージを設定します。
                    </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className="flex items-center space-x-2">
                        <Switch
                            id="announcement-active"
                            checked={announcement.active}
                            onCheckedChange={(checked) => setAnnouncement({ ...announcement, active: checked })}
                            className="data-[state=checked]:bg-blue-500"
                        />
                        <Label htmlFor="announcement-active" className="text-white">
                            アナウンスを表示する
                        </Label>
                    </div>
                    <div className="grid gap-2">
                        <Label htmlFor="announcement-message" className="text-slate-300">メッセージ内容</Label>
                        <Input
                            id="announcement-message"
                            value={announcement.message}
                            onChange={(e) => setAnnouncement({ ...announcement, message: e.target.value })}
                            placeholder="例: 只今システムメンテナンスを予定しております..."
                            className="bg-slate-800 border-slate-700 text-white"
                        />
                    </div>
                </CardContent>
            </Card>

            {msg && (
                <div className={`flex items-center gap-2 text-sm rounded-lg p-3 border ${msg.type === 'success' ? 'bg-green-500/10 border-green-500/20 text-green-400' : 'bg-red-500/10 border-red-500/20 text-red-400'}`}>
                    {msg.type === 'success' ? <CheckCircle className="w-4 h-4 shrink-0" /> : <AlertCircle className="w-4 h-4 shrink-0" />}
                    {msg.text}
                </div>
            )}
            <div className="flex justify-end">
                <Button variant="premium" onClick={handleSave} loading={loading} className="w-full sm:w-auto">
                    <Save className="mr-2 h-4 w-4" />
                    設定を保存
                </Button>
            </div>
        </div>
    );
}
