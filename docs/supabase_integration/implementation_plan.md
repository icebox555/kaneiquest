# Supabase Integration Implementation Plan

Supabaseを導入し、認証基盤をMockデータからSupabase Authへ移行します。また、Next.jsのSSR/Client Side Renderingに対応するための適切なクライアントセットアップを行います。

## User Review Required

> [!IMPORTANT]
> **Environment Variables**:
> 以下の環境変数を `.env.local` に設定してください。
> - `NEXT_PUBLIC_SUPABASE_URL`: Supabase Project URL
> - `NEXT_PUBLIC_SUPABASE_ANON_KEY`: Supabase Anon Key

## Proposed Changes

### Dependencies
- `@supabase/supabase-js`
- `@supabase/ssr` (Next.js App Routerでの推奨)

### Utilities
#### [NEW] [src/lib/supabase/client.ts](file:///c:/Users/notos/kanei_quest/src/lib/supabase/client.ts)
- Browser Client作成用ユーティリティ

#### [NEW] [src/lib/supabase/server.ts](file:///c:/Users/notos/kanei_quest/src/lib/supabase/server.ts)
- Server Component/Action用ユーティリティ (Cookie操作含む)

### Authentication Logic
#### [MODIFY] [src/context/AuthContext.tsx](file:///c:/Users/notos/kanei_quest/src/context/AuthContext.tsx)
- `MOCK_USERS` を廃止。
- Supabaseの `onAuthStateChange` をリッスンしてユーザー状態を管理。
- `login` 関数: `supabase.auth.signInWithPassword` をコール。
- `logout` 関数: `supabase.auth.signOut` をコール。
- `signup` 関数 (新規追加): `supabase.auth.signUp` をコール。

#### [MODIFY] [src/app/login/page.tsx](file:///c:/Users/notos/kanei_quest/src/app/login/page.tsx)
- `AuthProvider` (または直接Supabase) を使用してログイン処理を実行。

#### [MODIFY] [src/app/signup/page.tsx](file:///c:/Users/notos/kanei_quest/src/app/signup/page.tsx)
- アカウント作成処理を実装。

## Verification Plan

### Automated Tests
- 現状テストがないため、手動検証を主とします。

### Manual Verification
1. `.env.local` 設定後、アプリを起動。
2. Sign Upページで新規ユーザー登録 -> Supabase Dashboardでユーザーが作成されたか確認。
3. Loginページで登録したユーザーでログイン -> 成功し、ダッシュボードへリダイレクトされるか確認。
4. Logout -> 正しくログアウトされるか確認。
5. Reload -> セッションが維持されるか確認。
