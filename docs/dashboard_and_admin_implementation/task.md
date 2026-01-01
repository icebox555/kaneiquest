# タスク管理: バックエンド実装 (Supabase)

- [x] セットアップ・環境構築 <!-- id: 0 -->
    - [x] **Supabase MCPサーバーの連携** <!-- id: 15 -->
    - [x] ライブラリのインストール (`@supabase/supabase-js` 等) <!-- id: 1 -->
    - [x] 環境変数の設定 (`.env.local`) <!-- id: 2 -->
    - [x] Supabaseクライアントの作成 (`lib/supabase`) <!-- id: 3 -->
- [x] 認証機能の実装 <!-- id: 4 -->
    - [x] `AuthContext` の書き換え (Supabase Auth連携) <!-- id: 5 -->
    - [x] ミドルウェアでのルート保護 (`middleware.ts`) <!-- id: 6 -->
    - [x] ログイン・サインアップページのロジック接続 <!-- id: 7 -->
- [x] データベース設計・接続 <!-- id: 8 -->
    - [x] テーブル設計 (`users`, `questions`, `results`) <!-- id: 9 -->
    - [x] Admin機能実装 (一覧, 作成, 削除) <!-- id: 10 -->
- [x] UIへの組込み (リアルデータ化) <!-- id: 11 -->
    - [x] **ユーザー画面: 学習履歴のリアル化 (Dashboard)** <!-- id: 13 -->
    - [x] **XP/レベル更新ロジックの実装** (Quiz完了時)
    - [x] Admin画面: 問題編集機能 (Optional)
- [x] 動作確認 (Walkthrough) <!-- id: 14 -->
