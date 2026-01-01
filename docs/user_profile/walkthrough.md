# User Profile Feature Walkthrough

ユーザー自身がプロフィールを管理できる機能と、ヘッダーのUX改善を実装しました。

## Implemented Features

### 1. Header User Menu
- **Component**: `src/components/layout/UserMenu.tsx`
- **UI**:
  - ログイン時、メールアドレスの代わりにユーザーアバター（初期設定はイニシャル）を表示。
  - アバタークリックでドロップダウンメニューを展開。
  - メニュー項目: 「プロフィール編集」「ログアウト」

### 2. Profile Page
- **Path**: `/profile`
- **Functionality**:
  - 現在の表示名とメールアドレスを確認。
  - 表示名 (Display Name) の変更が可能。
  - 変更は即座にデータベースとUIに反映されます。

## Verification Steps

1. **Check Header**
   - Log in to the application.
   - Confirm the header shows an avatar icon instead of raw email text.
   - Click the avatar to open the dropdown menu.

2. **Edit Profile**
   - Click "プロフィール編集" in the dropdown.
   - You should be redirected to `/profile`.
   - Update your "表示名" (Name).
   - Click "変更を保存".

3. **Verify Update**
   - Confirm the success message.
   - Check the User Menu again; the display name in the dropdown header should be updated.
   - The avatar initials should also update if the name initials changed.

4. **Verify Image Upload**
   - In Profile page, click on the avatar or camera icon.
   - Select an image file.
   - Verify the "Crop" dialog appears.
   - Adjust crop and click "決定する".
   - Verify the preview updates.
   - Click "変更を保存".
   - Refresh the page and ensure the avatar persists.

## Bug Fixes
- **Auth Sync Issue**: ヘッダーが常に「ログイン」ボタンを表示してしまう問題（クライアント側で認証状態が同期されていなかった問題）を修正しました。`AuthContext` を Supabase 連携版に書き換えました。
## Stripe連携 (プレミアムプラン)

サブスクリプション決済機能を実装しました。

### 機能実装
- **Checkout (決済)**: 月額 (¥980) および 年額 (¥9,800) プランの実装。
- **Webhooks**: 決済成功時に `subscriptions` テーブルと `profiles.is_pro` を自動更新。
- **Portal (ポータル)**: ユーザー自身による支払い方法の変更や解約機能。

### 検証手順 (Stripe)
**必須**: ローカル環境でWebhookを受け取るため、ターミナルで `stripe listen --forward-to localhost:3000/api/webhooks/stripe` を実行してください。

1. **購入テスト**
   - `/pricing` ページへ移動します。
   - 「月額プランで始める」等のボタンをクリックします。
   - Stripeテスト用カード (`4242 4242 4242 4242` 等) を使用して決済を行います。
   - ダッシュボードへリダイレクトされ、完了メッセージが表示されることを確認します。

2. **権限・データ確認**
   - ダッシュボード: ユーザー名の横などに "PRO" バッジが表示されているか確認します。
   - データベース: Supabaseの `subscriptions` テーブルに新しいレコードが作成されているか確認します。

3. **カスタマーポータル**
   - `/pricing` ページ（またはプロフィール）の「契約内容の確認・解約」ボタンをクリックします。
   - Stripeのカスタマーポータルへ遷移することを確認します。
   - ポータル上でプランのキャンセルを行い、データベースのステータスが更新されるか（Webhook経由）確認します。
