# Admin Settings Feature Walkthrough

管理画面に「システム設定」機能 (`/admin/settings`) を実装し、404エラーを解消しました。

## Features Implemented

### 1. System Settings Page
- **Path**: `/admin/settings`
- **Component**: `src/app/admin/settings/page.tsx`
- **Functionality**:
  - **メンテナンスモード**: システム全体のメンテナンス状態を切り替えるスイッチ（現在はDB値の保存のみ）。
  - **システムお知らせ**: ユーザー向けのアナウンスメッセージと表示有無の設定（現在はDB値の保存のみ）。

### 2. Database Schema
- **Table**: `app_settings`
  - `key`: 設定キー (`maintenance_mode`, `announcement`)
  - `value`: JSONB形式の設定値
  - **RLS**: 管理者のみが更新可能 (`update` policy)

## Verification Steps

1. **Access Settings Page**
   - Log in as Admin.
   - Click "設定" (Settings) in the sidebar.
   - Confirm the page loads correctly (no 404).

2. **Update Settings**
   - Toggle "メンテナンスモード".
   - Enter a message in "システムお知らせ" and toggle "アナウンスを表示する".
   - Click "設定を保存".
   - Refresh the page to ensure values persist.
