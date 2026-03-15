"use client";

import { useState, useRef, useCallback } from "react";
import { createClient } from "@/lib/supabase/client";
import { Button } from "@/components/ui/Button";
import { Input } from "@/components/ui/Input";
import { Label } from "@/components/ui/Label";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/Card";
import { Loader2, Save, Upload, Camera, ZoomIn, X, Check } from "lucide-react";
import { useRouter } from "next/navigation";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/Avatar";
import imageCompression from "browser-image-compression";
import Cropper from "react-easy-crop";
import getCroppedImg from "@/lib/utils/cropImage";
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
    };
}

export function ProfileForm({ initialProfile }: ProfileFormProps) {
    const router = useRouter();
    const [loading, setLoading] = useState(false);
    const [name, setName] = useState(initialProfile.name || "");
    const [avatarUrl, setAvatarUrl] = useState<string | null>(initialProfile.avatar_url || null);

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
            alert("JPEG、PNG、WebP 形式の画像のみアップロードできます。");
            return;
        }

        // Validate file size before processing
        if (file.size > MAX_FILE_SIZE_MB * 1024 * 1024) {
            alert(`ファイルサイズは ${MAX_FILE_SIZE_MB}MB 以下にしてください。`);
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
            alert("画像の処理に失敗しました。");
        }
    };

    const handleSave = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);

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

            const updates: any = { name };
            if (avatarFile) {
                updates.avatar_url = publicUrl;
            } else if (avatarUrl === null) {
                updates.avatar_url = null;
            }

            const { error } = await supabase
                .from("profiles")
                .update(updates)
                .eq("id", initialProfile.id);

            if (error) throw error;

            alert("プロフィールを更新しました。");
            router.refresh();
        } catch (error: any) {
            alert("更新に失敗しました: " + error.message);
        } finally {
            setLoading(false);
        }
    };

    const handlePasswordUpdate = async (e: React.FormEvent) => {
        e.preventDefault();
        if (newPassword !== confirmPassword) {
            alert("パスワードが一致しません。");
            return;
        }
        if (newPassword.length < 8) {
            alert("パスワードは8文字以上で入力してください。");
            return;
        }

        setPasswordLoading(true);
        try {
            const { error } = await supabase.auth.updateUser({
                password: newPassword
            });

            if (error) throw error;

            alert("パスワードを更新しました。");
            setNewPassword("");
            setConfirmPassword("");
        } catch (error: any) {
            alert("パスワード更新に失敗しました: " + error.message);
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
                                        src={avatarUrl || "/default-avatar.png"}
                                        className={`object-cover ${!avatarUrl ? 'scale-[1.8]' : ''}`}
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
                                            if (confirm("アイコン画像を削除してデフォルトに戻しますか？")) {
                                                setAvatarUrl(null);
                                                setAvatarFile(null);
                                            }
                                        }}
                                    >
                                        <X className="w-3 h-3" />
                                        画像を削除してデフォルトに戻す
                                    </Button>
                                )}
                            </div>
                        </div>

                        <div className="flex justify-end pt-4">
                            <Button type="submit" className="w-full sm:w-auto text-white" disabled={loading}>
                                {loading ? (
                                    <>
                                        <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                                        保存中...
                                    </>
                                ) : (
                                    <>
                                        <Save className="mr-2 h-4 w-4" />
                                        変更を保存
                                    </>
                                )}
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

                        <div className="flex justify-end">
                            <Button type="submit" variant="outline" disabled={passwordLoading} className="w-full sm:w-auto border-stone-300 text-stone-700 hover:bg-stone-50">
                                {passwordLoading ? (
                                    <>
                                        <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                                        更新中...
                                    </>
                                ) : (
                                    "パスワードを更新"
                                )}
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
