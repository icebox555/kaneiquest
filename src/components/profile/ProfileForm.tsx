"use client";

import { useState, useRef, useCallback } from "react";
import { createClient } from "@/lib/supabase/client";
import { Button } from "@/components/ui/Button";
import { Input } from "@/components/ui/Input";
import { Label } from "@/components/ui/Label";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/Card";
import { Save, Camera, ZoomIn, X, Check, AlertCircle, CheckCircle } from "lucide-react";
import { useRouter } from "next/navigation";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/Avatar";
import imageCompression from "browser-image-compression";
import Cropper from "react-easy-crop";
import getCroppedImg from "@/lib/utils/cropImage";
import {
    AVATAR_PRESETS,
    DEFAULT_AVATAR_SCALE,
    MIN_AVATAR_SCALE,
    MAX_AVATAR_SCALE,
    getDefaultAvatar,
    normalizeAvatarScale,
} from "@/lib/avatars";
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/Dialog";

interface ProfileFormProps {
    initialProfile: {
        id: string;
        name: string;
        email: string;
        avatar_url?: string | null;
        avatar_scale?: number | null;
    };
}

export function ProfileForm({ initialProfile }: ProfileFormProps) {
    const router = useRouter();
    const [loading, setLoading] = useState(false);
    const [name, setName] = useState(initialProfile.name || "");
    const [avatarUrl, setAvatarUrl] = useState<string | null>(initialProfile.avatar_url || null);
    const [avatarScale, setAvatarScale] = useState<number>(
        normalizeAvatarScale(initialProfile.avatar_scale ?? DEFAULT_AVATAR_SCALE)
    );

    // Cropper State
    const [crop, setCrop] = useState({ x: 0, y: 0 });
    const [zoom, setZoom] = useState(1);
    const [croppedAreaPixels, setCroppedAreaPixels] = useState<any>(null);
    const [isCropDialogOpen, setIsCropDialogOpen] = useState(false);
    const [tempImgSrc, setTempImgSrc] = useState<string | null>(null);
    const [avatarFile, setAvatarFile] = useState<File | null>(null); // Final file to upload

    // Password state
    const [newPassword, setNewPassword] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");
    const [passwordLoading, setPasswordLoading] = useState(false);

    // Message state
    type Msg = { type: 'success' | 'error'; text: string } | null;
    const [profileMsg, setProfileMsg] = useState<Msg>(null);
    const [passwordMsg, setPasswordMsg] = useState<Msg>(null);

    const fileInputRef = useRef<HTMLInputElement>(null);
    const supabase = createClient();

    const onCropComplete = useCallback((croppedArea: any, croppedAreaPixels: any) => {
        setCroppedAreaPixels(croppedAreaPixels);
    }, []);

    const ALLOWED_IMAGE_TYPES = ["image/jpeg", "image/jpg", "image/png", "image/webp"];
    const MAX_FILE_SIZE_MB = 10;

    const handleFileSelect = async (event: React.ChangeEvent<HTMLInputElement>) => {
        const file = event.target.files?.[0];
        if (!file) return;

        // Reset file input value to allow re-selecting same file
        event.target.value = '';

        // Validate MIME type (the `accept` attribute on the input can be bypassed)
        if (!ALLOWED_IMAGE_TYPES.includes(file.type)) {
            setProfileMsg({ type: 'error', text: 'JPEG、PNG、WebP 形式の画像のみアップロードできます。' });
            return;
        }

        // Validate file size before processing
        if (file.size > MAX_FILE_SIZE_MB * 1024 * 1024) {
            setProfileMsg({ type: 'error', text: `ファイルサイズは ${MAX_FILE_SIZE_MB}MB 以下にしてください。` });
            return;
        }

        const reader = new FileReader();
        reader.addEventListener("load", () => {
            setTempImgSrc(reader.result?.toString() || "");
            setIsCropDialogOpen(true);
        });
        reader.readAsDataURL(file);
    };

    const handleCropSave = async () => {
        try {
            if (!tempImgSrc || !croppedAreaPixels) return;

            const croppedBlob = await getCroppedImg(tempImgSrc, croppedAreaPixels);
            if (!croppedBlob) {
                console.error("Failed to crop image");
                return;
            }

            // Create a File object from the blob
            const file = new File([croppedBlob], "avatar.jpg", { type: "image/jpeg" });

            // Compress
            const options = {
                maxSizeMB: 0.5,
                maxWidthOrHeight: 800,
                useWebWorker: true,
            };
            const compressedFile = await imageCompression(file, options);

            setAvatarFile(compressedFile);
            setAvatarUrl(URL.createObjectURL(compressedFile)); // Preview
            setIsCropDialogOpen(false);
            setTempImgSrc(null); // Cleanup
        } catch (error) {
            console.error("Crop/Compress error:", error);
            setProfileMsg({ type: 'error', text: '画像の処理に失敗しました。' });
        }
    };

    const handleSelectPreset = (preset: string) => {
        setAvatarUrl(preset);
        setAvatarFile(null); // アップロードファイルは破棄してプリセットを使う
        setProfileMsg(null);
    };

    const handleSave = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);
        setProfileMsg(null);

        try {
            let publicUrl = avatarUrl;

            // If we have a new file prepared (from crop), upload it
            if (avatarFile) {
                const fileExt = 'jpg'; // We force jpeg in crop
                const fileName = `${initialProfile.id}/${Date.now()}.${fileExt}`;

                const { error: uploadError } = await supabase.storage
                    .from('avatars')
                    .upload(fileName, avatarFile, { upsert: true });

                if (uploadError) throw uploadError;

                const { data } = supabase.storage
                    .from('avatars')
                    .getPublicUrl(fileName);

                publicUrl = data.publicUrl;
            }

            // Update Profile
            // Do not update avatar_url if we didn't change it (avatarFile is null) and it was not cleared
            // If user has existing avatar and just changed name, publicUrl is the remote URL.
            // If User selected new image, publicUrl is new remote URL.

            // publicUrl は初期値が avatarUrl（プリセットパス / 既存URL / null）で、
            // 新規アップロード時のみ上書きされる。常に反映すれば全ケースをカバーできる。
            const updates: any = {
                name,
                avatar_url: publicUrl,
                avatar_scale: normalizeAvatarScale(avatarScale),
            };

            const { error } = await supabase
                .from("profiles")
                .update(updates)
                .eq("id", initialProfile.id);

            if (error) throw error;

            setProfileMsg({ type: 'success', text: 'プロフィールを更新しました。' });
            router.refresh();
        } catch (error: any) {
            setProfileMsg({ type: 'error', text: '更新に失敗しました: ' + error.message });
        } finally {
            setLoading(false);
        }
    };

    const handlePasswordUpdate = async (e: React.FormEvent) => {
        e.preventDefault();
        setPasswordMsg(null);
        if (newPassword !== confirmPassword) {
            setPasswordMsg({ type: 'error', text: 'パスワードが一致しません。' });
            return;
        }
        if (newPassword.length < 8) {
            setPasswordMsg({ type: 'error', text: 'パスワードは8文字以上で入力してください。' });
            return;
        }

        setPasswordLoading(true);
        try {
            const { error } = await supabase.auth.updateUser({
                password: newPassword
            });

            if (error) throw error;

            setPasswordMsg({ type: 'success', text: 'パスワードを更新しました。' });
            setNewPassword("");
            setConfirmPassword("");
        } catch (error: any) {
            setPasswordMsg({ type: 'error', text: 'パスワード更新に失敗しました: ' + error.message });
        } finally {
            setPasswordLoading(false);
        }
    };

    const initials = (name || initialProfile.email || "User").slice(0, 2).toUpperCase();

    return (
        <div className="space-y-8">
            <Card className="glass border-stone-200">
                <CardHeader>
                    <CardTitle className="text-stone-800">プロフィール設定</CardTitle>
                    <CardDescription className="text-stone-500">
                        ユーザー情報とアイコンを変更できます。
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <form onSubmit={handleSave} className="space-y-6">
                        {/* Avatar Section */}
                        <div className="flex flex-col items-center sm:flex-row gap-6">
                            <div className="relative group">
                                <Avatar className="h-24 w-24 border-4 border-white shadow-lg cursor-pointer" onClick={() => fileInputRef.current?.click()}>
                                    <AvatarImage
                                        src={avatarUrl || getDefaultAvatar(initialProfile.id)}
                                        className="object-cover"
                                        style={{ transform: `scale(${avatarScale})` }}
                                    />
                                    <AvatarFallback className="text-2xl font-bold bg-stone-100 text-stone-400">
                                        {initials}
                                    </AvatarFallback>
                                    <div className="absolute inset-0 bg-black/40 rounded-full flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity">
                                        <Camera className="w-8 h-8 text-white" />
                                    </div>
                                </Avatar>
                                <input
                                    type="file"
                                    ref={fileInputRef}
                                    className="hidden"
                                    accept="image/png, image/jpeg, image/jpg, image/webp"
                                    onChange={handleFileSelect}
                                />
                            </div>
                            <div className="flex-1 space-y-4 w-full">
                                <div className="space-y-2">
                                    <Label htmlFor="name" className="text-stone-700">表示名</Label>
                                    <Input
                                        id="name"
                                        value={name}
                                        onChange={(e) => setName(e.target.value)}
                                        placeholder="ユーザー名を入力"
                                        maxLength={50}
                                        className="bg-white border-stone-200 text-stone-800 focus:ring-primary focus:border-primary placeholder:text-stone-400"
                                    />
                                </div>
                                <div className="space-y-2">
                                    <Label htmlFor="email" className="text-stone-700">メールアドレス</Label>
                                    <Input
                                        id="email"
                                        value={initialProfile.email}
                                        disabled
                                        className="bg-stone-50 border-stone-200 text-stone-500 cursor-not-allowed"
                                    />
                                </div>
                                {avatarUrl && (
                                    <Button
                                        type="button"
                                        variant="ghost"
                                        size="sm"
                                        className="text-stone-500 hover:text-red-500 h-auto p-0 text-xs flex items-center gap-1"
                                        onClick={() => {
                                            setAvatarUrl(null);
                                            setAvatarFile(null);
                                        }}
                                    >
                                        <X className="w-3 h-3" />
                                        画像を削除して自動アイコンに戻す
                                    </Button>
                                )}
                            </div>
                        </div>

                        {/* デフォルトアバターから選ぶ */}
                        <div className="space-y-3">
                            <Label className="text-stone-700">デフォルトアイコンから選ぶ</Label>
                            <div className="flex flex-wrap gap-4">
                                {AVATAR_PRESETS.map((preset) => {
                                    const isSelected = avatarUrl === preset;
                                    return (
                                        <button
                                            key={preset}
                                            type="button"
                                            onClick={() => handleSelectPreset(preset)}
                                            aria-label="このアイコンを選択"
                                            aria-pressed={isSelected}
                                            className={`relative h-20 w-20 shrink-0 rounded-full overflow-hidden border-2 transition-all hover:scale-105 ${
                                                isSelected
                                                    ? "border-primary ring-2 ring-primary/40"
                                                    : "border-stone-200 hover:border-stone-300"
                                            }`}
                                        >
                                            {/* eslint-disable-next-line @next/next/no-img-element */}
                                            <img src={preset} alt="" className="w-full h-full object-cover scale-150" />
                                            {isSelected && (
                                                <div className="absolute inset-0 bg-primary/20 flex items-center justify-center">
                                                    <Check className="w-5 h-5 text-white drop-shadow" />
                                                </div>
                                            )}
                                        </button>
                                    );
                                })}
                            </div>
                            <p className="text-xs text-stone-400">
                                好きなアイコンをタップして選択し、「変更を保存」を押してください。
                            </p>
                        </div>

                        {/* アイコンの表示サイズ調整 */}
                        <div className="space-y-3">
                            <div className="flex items-center justify-between">
                                <Label className="text-stone-700">アイコンの表示サイズ</Label>
                                <span className="text-xs text-stone-400 tabular-nums">{avatarScale.toFixed(2)}x</span>
                            </div>
                            <div className="flex items-center gap-4">
                                <ZoomIn className="w-5 h-5 text-stone-400 shrink-0" />
                                <input
                                    type="range"
                                    value={avatarScale}
                                    min={MIN_AVATAR_SCALE}
                                    max={MAX_AVATAR_SCALE}
                                    step={0.05}
                                    aria-label="アイコンの表示サイズ"
                                    onChange={(e) => setAvatarScale(Number(e.target.value))}
                                    className="w-full h-2 bg-stone-200 rounded-lg appearance-none cursor-pointer accent-primary"
                                />
                                <Button
                                    type="button"
                                    variant="ghost"
                                    size="sm"
                                    className="text-stone-500 hover:text-stone-700 h-auto p-0 text-xs shrink-0"
                                    onClick={() => setAvatarScale(DEFAULT_AVATAR_SCALE)}
                                >
                                    リセット
                                </Button>
                            </div>
                            <p className="text-xs text-stone-400">
                                上のアイコンプレビューを見ながら、丸の中での画像の大きさを調整できます。
                            </p>
                        </div>

                        {profileMsg && (
                            <div className={`flex items-center gap-2 text-sm rounded-lg p-3 border ${profileMsg.type === 'success' ? 'bg-green-50 border-green-100 text-green-700' : 'bg-red-50 border-red-100 text-red-600'}`}>
                                {profileMsg.type === 'success'
                                    ? <CheckCircle className="w-4 h-4 shrink-0" />
                                    : <AlertCircle className="w-4 h-4 shrink-0" />
                                }
                                {profileMsg.text}
                            </div>
                        )}

                        <div className="flex justify-end pt-4">
                            <Button type="submit" className="w-full sm:w-auto text-white" loading={loading}>
                                <Save className="mr-2 h-4 w-4" />
                                変更を保存
                            </Button>
                        </div>
                    </form>
                </CardContent>
            </Card>

            <Card className="glass border-stone-200">
                <CardHeader>
                    <CardTitle className="text-stone-800">パスワード変更</CardTitle>
                    <CardDescription className="text-stone-500">
                        新しいパスワードを設定します。8文字以上で入力してください。
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <form onSubmit={handlePasswordUpdate} className="space-y-6">
                        <div className="grid gap-4 sm:grid-cols-2">
                            <div className="space-y-2">
                                <Label htmlFor="newPassword" className="text-stone-700">新しいパスワード</Label>
                                <Input
                                    id="newPassword"
                                    type="password"
                                    value={newPassword}
                                    onChange={(e) => setNewPassword(e.target.value)}
                                    placeholder="••••••••"
                                    className="bg-white border-stone-200 text-stone-800 focus:ring-primary focus:border-primary placeholder:text-stone-400"
                                />
                            </div>
                            <div className="space-y-2">
                                <Label htmlFor="confirmPassword" className="text-stone-700">パスワード確認</Label>
                                <Input
                                    id="confirmPassword"
                                    type="password"
                                    value={confirmPassword}
                                    onChange={(e) => setConfirmPassword(e.target.value)}
                                    placeholder="••••••••"
                                    className="bg-white border-stone-200 text-stone-800 focus:ring-primary focus:border-primary placeholder:text-stone-400"
                                />
                            </div>
                        </div>

                        {passwordMsg && (
                            <div className={`flex items-center gap-2 text-sm rounded-lg p-3 border ${passwordMsg.type === 'success' ? 'bg-green-50 border-green-100 text-green-700' : 'bg-red-50 border-red-100 text-red-600'}`}>
                                {passwordMsg.type === 'success'
                                    ? <CheckCircle className="w-4 h-4 shrink-0" />
                                    : <AlertCircle className="w-4 h-4 shrink-0" />
                                }
                                {passwordMsg.text}
                            </div>
                        )}

                        <div className="flex justify-end">
                            <Button type="submit" variant="outline" loading={passwordLoading} className="w-full sm:w-auto border-stone-300 text-stone-700 hover:bg-stone-50">
                                パスワードを更新
                            </Button>
                        </div>
                    </form>
                </CardContent>
            </Card>

            {/* Crop Dialog */}
            <Dialog open={isCropDialogOpen} onOpenChange={setIsCropDialogOpen}>
                <DialogContent className="sm:max-w-md">
                    <DialogHeader>
                        <DialogTitle>画像の位置調整</DialogTitle>
                        <DialogDescription>
                            円の中に顔が収まるように調整してください。
                        </DialogDescription>
                    </DialogHeader>

                    <div className="relative w-full h-[300px] bg-black rounded-lg overflow-hidden my-4">
                        {tempImgSrc && (
                            <Cropper
                                image={tempImgSrc}
                                crop={crop}
                                zoom={zoom}
                                aspect={1}
                                onCropChange={setCrop}
                                onCropComplete={onCropComplete}
                                onZoomChange={setZoom}
                                cropShape="round"
                                showGrid={false}
                                objectFit="vertical-cover"
                            />
                        )}
                    </div>

                    <div className="flex items-center gap-4 mb-4">
                        <ZoomIn className="w-5 h-5 text-stone-500" />
                        <input
                            type="range"
                            value={zoom}
                            min={1}
                            max={3}
                            step={0.1}
                            aria-labelledby="Zoom"
                            onChange={(e) => setZoom(Number(e.target.value))}
                            className="w-full h-2 bg-stone-200 rounded-lg appearance-none cursor-pointer accent-primary"
                        />
                    </div>

                    <DialogFooter className="flex gap-2 sm:justify-between w-full">
                        <Button
                            variant="outline"
                            onClick={() => {
                                setIsCropDialogOpen(false);
                                setTempImgSrc(null);
                                if (fileInputRef.current) fileInputRef.current.value = '';
                            }}
                            className="flex-1"
                        >
                            <X className="w-4 h-4 mr-2" />
                            キャンセル
                        </Button>
                        <Button onClick={handleCropSave} className="flex-1 text-white">
                            <Check className="w-4 h-4 mr-2" />
                            決定する
                        </Button>
                    </DialogFooter>
                </DialogContent>
            </Dialog>
        </div>
    );
}
