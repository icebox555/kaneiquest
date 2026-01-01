# User Management & Dashboard Enhancements Walkthrough

新規登録ユーザーのプロフィール名取得機能と、管理ダッシュボードの機能強化を行いました。

## Changes Implemented

### 1. User Profile Enhancement
- **Database**: `profiles` テーブルに `name` カラムと `created_at` カラムを追加し、新規ユーザー作成時にメタデータから `name` を保存するトリガーを更新しました。
  - `created_at` は `profiles` の登録順ソートに使用されます。
- **Signup Page**: 新規登録画面 (`/signup`) に「お名前」入力欄を追加しました。

### 2. Admin Dashboard (`/admin`)
- **User List**: ユーザー一覧に `Email` に加えて `Name` を表示するようにしました。
- **Filtering & Sorting**:
  - **Filter**: プラン別 (`Free`, `Pro`, `Admin`, `All`) で絞り込みが可能になりました。
  - **Sort**: 名前順 (`Name`)、登録順 (`Joined`) での並び替え（昇順・降順）が可能になりました。
  - これらはURLパラメータで管理されるため、特定のビューをブックマーク可能です。

## Verification Steps

### 1. New User Registration
1. ログアウトした状態で `/signup` にアクセスしてください。
2. 「お名前」欄が表示されていることを確認し、名前を入力して登録してください。
3. （重要）メール確認なしでログイン後、データベースの `profiles` テーブルを確認するか、次のステップの管理画面で名前が正しく保存されているか確認してください。

### 2. Admin Dashboard
1. Adminアカウント (`admin@kaneiquest.com`) でログインしてください。
2. `/admin` にアクセスしてください。
3. ユーザー一覧に先ほど登録したユーザーの名前が表示されていることを確認してください。
4. **フィルター操作**: プルダウンで「Pro」や「Free」を選択し、リストが絞り込まれるか確認してください。
5. **ソート操作**: 「登録日」「名前順」ボタンをクリックし、並び替えが機能するか確認してください。

## Notes
- 既存のユーザーの `name` は `null` のため、一覧ではEmailが代わりに表示される場合があります。
- `created_at` は既存ユーザーに対しては `updated_at` の値などでバックフィル（補填）されています。
