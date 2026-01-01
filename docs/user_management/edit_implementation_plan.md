# Admin User Editing Implementation Plan

管理画面からユーザーの名前やプランを変更する機能を実装します。

## Database Policies
- `profiles` テーブルに対する管理者(admin)のUPDATE権限を確認・追加する。

## Component: `UserEditDialog`
- **Path**: `src/components/admin/UserEditDialog.tsx`
- **Features**:
  - Dialog (Modal) UI showing current details.
  - Inputs for `Name` (Text) and `Plan` (Select: Free/Pro/Admin).
  - Submit button to update Supabase `profiles`.
  - Refresh list upon success.

## Integration
- **Path**: `src/app/admin/users/page.tsx`
- **Changes**:
  - Add "Edit" button to the user list columns.
- [x] Integrate `UserEditDialog`.

## Verification
- [x] Login as Admin.
- [x] Open User Management.
- [x] Edit a user's name and plan.
- [x] Verify changes are reflected in the list and database.
