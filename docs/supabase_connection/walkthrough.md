# Connect UI/UX to Supabase Walkthrough

UI/UXコンポーネントをSupabaseデータベースと接続しました。
これにより、ユーザーごとの学習データやプラン情報が管理可能になりました。

## Changes

### Database (`public.profiles`)
- **Schema**: `id`, `email`, `role`, `plan`, `level`, `xp` カラムを持つテーブルを作成。
- **Trigger**: ユーザー登録時に自動的にプロファイルを作成するトリガーを設定。
- **Security**: Row Level Security (RLS) を有効化。

### UI Connections
- **Dashboard (`/dashboard`)**:
    - Supabaseからユーザーのプロファイル情報を取得し、レベル、XP、プランを表示するように変更。
- **Admin (`/admin`)**:
    - `role` が `admin` のユーザーのみアクセス可能に制限。
    - 全ユーザーのプロファイルリストを表示（現在は上位10件）。
- **Header**:
    - ログイン中のユーザーのメールアドレスを表示。

## Verification Results

### Automated Tests
- `npm run build`: [Passed] - 型安全性とビルドの成功を確認済み。

### Manual Verification Required
1. **Dashboard**: ログインして自分の情報が表示されるか確認（初期値: Lv.1, XP:0）。
2. **Admin**: `role` を `admin` に変更したユーザーでアクセスし、リストが表示されるか確認。
   - ※ `role` の変更はSupabaseのTable Editorから手動で行うか、SQLを実行してください。
