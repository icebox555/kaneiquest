# Connect UI/UX to Supabase Implementation Plan

現在、DashboardやAdminページはモックデータを使用しています。
これをSupabaseのデータベースと連携させ、実際のユーザーデータを表示できるようにします。

## Database Schema (`public.profiles`)

Supabase Auth (`auth.users`) と 1:1 で紐づく `profiles` テーブルを作成し、アプリケーション固有のユーザー情報を管理します。

### Table Structure
- `id`: UUID (Primary Key, References `auth.users.id`)
- `email`: TEXT
- `role`: TEXT (default: 'user')
- `plan`: TEXT (default: 'free')
- `level`: INTEGER (default: 1)
- `xp`: INTEGER (default: 0)
- `created_at`: TIMESTAMP

### Automation
- **Trigger**: `auth.users` に新規ユーザーが作成された際、自動的に `public.profiles` にレコードを作成するFunctionとTriggerを設置します。

## Proposed Changes

### Database Setup (via MCP)
1. Create `profiles` table.
2. Enable RLS and add policies (Users can view own profile, Admins can view all).
3. Create trigger for auto-profile creation.

### Application Code
#### [MODIFY] [src/app/dashboard/page.tsx](file:///c:/Users/notos/kanei_quest/src/app/dashboard/page.tsx)
- `createClient()` (Server) を使用して、現在のユーザーの `profile` データを取得。
- モックデータの代わりに、取得した `level`, `xp` 等を表示。

#### [MODIFY] [src/app/admin/page.tsx](file:///c:/Users/notos/kanei_quest/src/app/admin/page.tsx)
- **Role Check**: ログインユーザーが `admin` ロールを持っているか確認。なければリダイレクト。
- `profiles` テーブルから全ユーザーのリストを取得して表示。

#### [NEW] [src/lib/database.types.ts](file:///c:/Users/notos/kanei_quest/src/lib/database.types.ts)
- Supabaseの型定義ファイルを作成（一旦手動定義、または `generate_typescript_types` を使用）。

## Verification Plan
1. **Migrations**: `supabase-mcp-server` でのSQL実行が成功することを確認。
2. **Dashboard**: ログイン後、自分のメールアドレスや初期レベル(1)が表示されるか確認。
3. **Admin**: `role` を `admin` に変更したユーザーでアクセスし、ユーザーリストが表示されるか確認。
