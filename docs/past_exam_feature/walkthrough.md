# 過去問演習機能 (第39回) 実装詳細

## 1. 概要
第39回管理栄養士国家試験のデータを取り込み、ユーザーが年度別に過去問演習を行える機能を実装しました。
また、管理者がこれらの問題を管理できるようにAdmin機能を拡張しました。

## 2. 実施内容

### A. データベース・スキーマ更新
- `questions` テーブルに `exam_year` (実施年度 - integer) と `question_number` (問題番号 - integer) を追加。
- `exam_attempts` テーブルに `exam_year` を追加し、`category_id` をNullableに変更（年度別演習に対応）。
- `src/lib/database.types.ts` の型定義を更新し、Lintエラーを解消。

### B. 過去問データの解析と正答キー統合
- **PDF解析**: `docs/past_exam_feature/extracted_text/kokushi39.txt` から200問を抽出。
- **正答データの統合**: 厚生労働省および受験情報サイトから第39回試験の正答キー (`answers_39.json`) を取得し、解析スクリプトに統合。
- **SQL生成**:
    - `scripts/parse_to_sql.js`: テキストと正答JSONから、Supabase用のINSERT文 (`import_39.sql`) を生成。
    - `is_correct` フラグ、カテゴリ、解説（テキストベース）を含む完全なデータを生成済み。
    - **成果物**: `docs/past_exam_feature/import_39.sql`

### C. UIの実装
- **演習画面 (`/practice`)**:
    - 「過去問に挑戦 (年度別)」セクションを追加。
    - 「第39回 管理栄養士国家試験」カードを実装。
- **年度別クイズプレイヤー (`/practice/year/[year]`)**:
    - 指定された年度の問題をランダムに20問出題するモードを実装。
- **Admin管理画面 (`/admin/questions`)**:
    - 一覧テーブルに「年度」「No.」カラムを追加。
    - URLパラメータによる年度フィルタリング (`?year=39`) 機能を追加。
    - 編集画面で「実施年度」「問題番号」を編集可能に更新。

### D. Lintエラー修正
- Admin編集ページでの暗黙的 `any` エラーを修正。
- `database.types.ts` におけるインデックス型エラーを修正 (`__InternalSupabase` の除外)。

## 3. 次のステップ (データインポート手順)
生成されたSQLファイルはサイズが大きいため、SupabaseのSQLエディタ等を使用してインポートしてください。

1. **Supabaseダッシュボード** にログイン。
2. **SQL Editor** を開く。
3. `New Query` を作成。
4. `docs/past_exam_feature/import_39.sql` の内容をコピー＆ペースト（またはファイルアップロード）。
5. 実行 (`Run`) してデータを投入。
6. `/practice` 画面から第39回試験を選択して動作確認。

---
## 変更ファイル一覧
- `src/lib/database.types.ts`
- `src/app/admin/questions/page.tsx`
- `src/app/admin/questions/[id]/page.tsx`
- `src/app/practice/page.tsx`
- `src/app/practice/year/[year]/page.tsx`
- `src/components/quiz/QuizPlayer.tsx`
- `scripts/parse_to_sql.js` (および生成された `import_39.sql`)
