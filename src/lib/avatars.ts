// アバター関連の共通ロジック
// public/avatars/ 配下に画像を追加したら AVATAR_PRESETS に追記してください。

export const AVATAR_PRESETS = [
    "/avatars/icon1.png",
    "/avatars/icon2.png",
    "/avatars/icon3.png",
    "/avatars/icon4.png",
    "/avatars/icon5.png",
    "/avatars/icon6.png",
    "/avatars/icon7.png",
    "/avatars/icon8.png",
    "/avatars/icon9.png",
];

// アバターの表示拡大率のデフォルト・範囲（丸の中での画像サイズ）
export const DEFAULT_AVATAR_SCALE = 1.5;
export const MIN_AVATAR_SCALE = 1.0;
export const MAX_AVATAR_SCALE = 2.5;

/**
 * アバター未設定ユーザーに、ユーザーIDから決定的に1枚を自動振り分けする。
 * 同じIDなら常に同じアイコンになり、後から avatar_url を設定すれば変更できる。
 */
export function getDefaultAvatar(id: string | null | undefined): string {
    if (!id) return AVATAR_PRESETS[0];
    let hash = 0;
    for (let i = 0; i < id.length; i++) {
        hash = (hash * 31 + id.charCodeAt(i)) >>> 0;
    }
    return AVATAR_PRESETS[hash % AVATAR_PRESETS.length];
}

/** 不正値を安全な範囲に丸める */
export function normalizeAvatarScale(scale: number | null | undefined): number {
    if (typeof scale !== "number" || Number.isNaN(scale)) return DEFAULT_AVATAR_SCALE;
    return Math.min(MAX_AVATAR_SCALE, Math.max(MIN_AVATAR_SCALE, scale));
}
