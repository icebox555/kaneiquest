# Quiz & Content System Implementation Plan

アプリの中核となる「問題演習機能」と、それを管理する「コンテンツ管理システム」を実装します。

## Database Schema

### 1. `categories`
演習の分野（例：「人体の構造」「臨床栄養学」）を管理します。
- `id`: UUID (PK)
- `name`: TEXT (Unique)
- `description`: TEXT
- `order`: INTEGER (表示順)

### 2. `questions`
個々の問題データ。
- `id`: UUID (PK)
- `category_id`: UUID (FK -> categories.id)
- `content`: TEXT (問題文)
- `explanation`: TEXT (解説)
- `created_at`: TIMESTAMP

### 3. `options`
問題の選択肢。
- `id`: UUID (PK)
- `question_id`: UUID (FK -> questions.id)
- `content`: TEXT (選択肢の文言)
- `is_correct`: BOOLEAN (正解フラグ)

### 4. `exam_attempts`
ユーザーの学習履歴（セッション単位）。
- `id`: UUID (PK)
- `user_id`: UUID (FK -> auth.users)
- `started_at`: TIMESTAMP
- `completed_at`: TIMESTAMP
- `score`: INTEGER
- `total_questions`: INTEGER

### 5. `user_answers`
各問題の回答履歴。
- `id`: UUID (PK)
- `attempt_id`: UUID (FK -> exam_attempts.id)
- `question_id`: UUID (FK -> questions.id)
- `selected_option_id`: UUID (FK -> options.id)
- `is_correct`: BOOLEAN

## Proposed Changes

### Database Setup (via MCP)
- 上記5つのテーブルを作成するSQLを実行。
- RLSポリシー設定:
    - Userは `questions`を閲覧可能。
    - Adminのみコンテンツの作成・編集が可能。
    - Userは自分の `attempts` のご書き込みが可能。

### Application Code

#### [NEW] [src/app/admin/questions/page.tsx](file:///c:/Users/notos/kanei_quest/src/app/admin/questions/page.tsx)
- 問題管理ページ。
- 分野ごとの問題一覧表示、新規追加ボタン。

#### [MODIFY] [src/app/practice/page.tsx](file:///c:/Users/notos/kanei_quest/src/app/practice/page.tsx)
- `categories` テーブルからデータを取得し、動的にカテゴリーカードを表示。

#### [NEW] [src/app/practice/[categoryId]/page.tsx](file:///c:/Users/notos/kanei_quest/src/app/practice/%5BcategoryId%5D/page.tsx)
- 選択したカテゴリーの問題をランダムに5~10問出題するUI。
- 1問一答形式、またはまとめて回答形式（要検討、まずは1問一答で進行）。

## Verification Plan
1. **Migrations**: テーブル作成が成功すること。
2. **Admin**: ダッシュボードから問題を作成できること。
3. **User**: 作成した問題が練習モードに表示され、回答して結果が保存されること。
