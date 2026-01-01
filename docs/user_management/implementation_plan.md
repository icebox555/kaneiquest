# User Management Enhancement Plan

新規登録時にユーザーのプロフィール情報（名前）を入力できるようにし、管理画面等で識別しやすくします。

## Database Schema / Trigger

### [MODIFY] `profiles` table
- `name`: TEXT (Nullable, default null) を追加。

### [MODIFY] `handle_new_user` Function
ユーザー作成時のトリガー関数を更新し、`raw_user_meta_data->>'name'` の値を `profiles.name` に挿入するようにします。

```sql
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, email, name, role, plan, level, xp)
  values (
    new.id,
    new.email,
    new.raw_user_meta_data->>'name', -- Extract name from metadata
    'user',
    'free',
    1,
    0
  );
  return new;
end;
$$ language plpgsql security definer;
```

## Proposed Changes

### Application Code

#### [MODIFY] [src/app/signup/page.tsx](file:///c:/Users/notos/kanei_quest/src/app/signup/page.tsx)
- UI: `名前` (`name`) 入力欄を追加。
- Logic: `supabase.auth.signUp` の第2引数 `options` に `data: { name: formData.name }` を追加。

#### [MODIFY] [src/app/admin/page.tsx](file:///c:/Users/notos/kanei_quest/src/app/admin/page.tsx)
- **Display Name**: ユーザー一覧テーブルで `profile.name` を表示。
- **Filtering & Sorting**:
  - URL Query Parameters (`?sort=name&order=asc&plan=pro`) を使用してデータ取得を制御。
  - **Sort**: 登録順 (`created_at`), 名前順 (`name`)
  - **Filter**: プラン別 (`free`, `pro`, `admin`)
  - AdminPageコンポーネントで `searchParams` を受け取り、Supabaseクエリに適用。
- **UI**: フィルタリング・ソート用のUIコンポーネント（セレクトボックス等）を追加。

## Verification Plan
1. **Migration**: `name` カラム追加とトリガー更新が成功すること。
2. **Signup**: 新規ユーザー登録時に名前を入力し、登録後に `profiles` テーブルに反映されていること。
3. **Admin**:
    - 管理画面でユーザー名が表示されること。
    - 「名前順」「登録順」でソートできること。
    - 「Proプランのみ」などで絞り込みができること。
