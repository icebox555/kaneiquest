# Announcement Display Feature Walkthrough

ダッシュボード (`/dashboard`) にお知らせ機能を追加しました。

## Implemented Features

### 1. Announcement Banner
- **Component**: `src/components/dashboard/AnnouncementBanner.tsx`
- **Logic**: `app_settings` テーブルから設定を取得し、有効 (`active: true`) な場合にのみ表示します。
- **Styling**: 青系のグラデーションとメガホンアイコンを使用し、他の要素と調和しつつ目立つデザインにしました。

## Verification Steps

1. **Configure Announcement**
   - Go to Admin Settings (`/admin/settings`).
   - Turn ON "アナウンスを表示する".
   - Enter a test message (e.g., "年末年始のメンテナンスについて").
   - Click "設定を保存".

2. **Check Dashboard**
   - Access User Dashboard (`/dashboard`).
   - Confirm the banner appears at the top with the updated message.

3. **Verify Toggle**
   - Go back to Admin Settings and turn OFF "アナウンスを表示する".
   - Reload Dashboard.
   - Confirm the banner is hidden.
