# Kanei Quest — モバイルUX改善計画

## 概要

主要ユーザーがスマートフォン利用者であることを前提に、アプリライクな操作体験を実現するための改善計画。

---

## 実装済み改善 (2026-06-01)

### 1. BottomNav — モバイル専用タブバー

**ファイル**: `src/components/layout/BottomNav.tsx`

ログイン済みユーザー向けに、画面下部に固定されるネイティブアプリライクなタブナビゲーションを実装。

| タブ | リンク | アイコン |
|------|--------|---------|
| ホーム | `/dashboard` | Home |
| 演習 | `/practice` | BookOpen |
| スケジュール | `/schedule` | CalendarDays |
| ランキング | `/ranking` | Trophy |
| プロフィール | `/profile` | User |

- アクティブなタブはプライマリカラーで強調表示
- `env(safe-area-inset-bottom)` で iPhone ホームインジケーター対応
- `/admin/*` では非表示

### 2. Header — モバイルドロワーメニュー

**ファイル**: `src/components/layout/Header.tsx`

未ログイン状態のモバイルユーザー向けに、ハンバーガーボタンで開閉できるドロワーメニューを実装。

- メニュー項目: 過去問演習 / 模擬試験 / 料金プラン / ログイン / 無料で始める
- オーバーレイクリックで閉じる
- ログイン済みユーザーはBottomNavを使用するため、ハンバーガーボタンは非表示

### 3. Footer — モバイルで非表示

**ファイル**: `src/components/layout/Footer.tsx`

モバイル画面では Footer を非表示（`hidden md:block`）にし、BottomNav の邪魔にならないようにした。

### 4. layout.tsx — BottomNav用パディング

**ファイル**: `src/app/layout.tsx`

`main` タグに `pb-16 md:pb-0` を追加し、コンテンツが BottomNav に隠れないよう余白を確保。

---

## 今後の改善案

### 優先度: 高

#### A. モバイル演習画面の最適化
- **ファイル**: `src/app/practice/[categoryId]/page.tsx`
- 選択肢ボタンを縦並びに統一（現在一部横並び）
- タッチターゲットを最低 44px 以上に
- 問題文のフォントサイズを `text-base` (16px) 以上に統一

#### B. ダッシュボードの縦スクロール最適化
- **ファイル**: `src/app/dashboard/page.tsx`
- グリッドを `md:grid-cols-2` のみ維持、モバイルは1カラム
- カードの padding を `p-4 md:p-6` に調整

#### C. PWA 対応 ✅ 実装済み
- `public/manifest.json` 作成済み
- `src/app/layout.tsx` に manifest + viewport + appleWebApp メタ追加済み
- `standalone` モードでのホーム画面インストール対応済み
- **残り**: アイコン画像の追加（`public/icon-192.png`, `public/icon-512.png`）

### 優先度: 中

#### D. スワイプジェスチャー（演習画面）
- 問題間をスワイプで移動できるよう `framer-motion` のドラッグを活用
- **対象**: `src/app/practice/quest/page.tsx`

#### E. ローカル学習進捗キャッシュ
- `localStorage` に直近の解答状況をキャッシュ
- オフライン中でも演習を継続できるようにする（Service Worker）

#### F. プッシュ通知 (Web Push)
- 学習リマインダーをプッシュ通知で送信
- Supabase Edge Functions + Web Push API

### 優先度: 低

#### G. ダークモード
- CSS変数でダーク用カラースキームを定義
- `prefers-color-scheme: dark` メディアクエリ対応

#### H. ハプティクスフィードバック
- 正解・不正解時に `navigator.vibrate()` を呼び出す

---

## 技術スタック

| 用途 | ライブラリ |
|------|-----------|
| アニメーション | framer-motion (既存) |
| ジェスチャー | framer-motion drag |
| PWA | next-pwa または手動実装 |
| プッシュ通知 | Web Push API + Supabase Edge Functions |

---

## 参考: ページ一覧とモバイル対応状況

| ページ | パス | モバイル対応 |
|--------|------|-------------|
| トップ | `/` | ✅ レスポンシブ済み |
| ダッシュボード | `/dashboard` | ⚠️ カード幅要確認 |
| 過去問演習 | `/practice` | ⚠️ タッチターゲット要改善 |
| 模擬試験 | `/mock-exam` | ⚠️ 未確認 |
| スケジュール | `/schedule` | ⚠️ カレンダー表示要確認 |
| ランキング | `/ranking` | ✅ ほぼ対応済み |
| プロフィール | `/profile` | ✅ ほぼ対応済み |
| 料金プラン | `/pricing` | ✅ 対応済み |
| ログイン | `/login` | ✅ 対応済み |
| 新規登録 | `/signup` | ✅ 対応済み |
