# Stripe Subscription Integration Plan

## 1. 料金プランの定義 (Stripe Products)
以下のプランをStripe上に作成します。

- **Pro Plan (月額)**
  - 金額: 980円 / 月
  - ID: (作成後決定)
- **Pro Plan (年額)**
  - 金額: 9,800円 / 年 (2ヶ月分お得)
  - ID: (作成後決定)

## 2. データベース設計 (Supabase)
ユーザーのサブスクリプション状態を管理するためのテーブルを作成します。

### Table: `subscriptions`
| Column | Type | Description |
|---|---|---|
| id | text | Stripe Subscription ID (Primary Key) |
| user_id | uuid | Supabase User ID (Foreign Key to profiles.id) |
| status | text | active, trialing, past_due, canceled, etc. |
| price_id | text | Stripe Price ID |
| current_period_end | timestamptz | 有効期限 |
| created_at | timestamptz | 作成日 |
| cancel_at_period_end | boolean | 期間終了後のキャンセル有無 |

※ `profiles` テーブルにも `is_pro` (boolean) フラグを追加し、簡単な権限チェックに使用します。

## 3. 実装機能

### A. チェックアウト機能
- **Pricing Page (`src/app/pricing/page.tsx`):** プラン選択画面。
- **Checkout API (`src/app/api/checkout/route.ts`):** Stripe Checkout Session を作成し、決済画面へリダイレクトするAPI。

### B. Webhook 処理
- **Webhook API (`src/app/api/webhooks/stripe/route.ts`):** Stripeからのイベントを受け取る。
  - `checkout.session.completed`: 初回決済完了。`subscriptions` テーブルへのレコード作成。
  - `invoice.payment_succeeded`: 更新決済成功。有効期限 (`current_period_end`) の更新。
  - `customer.subscription.updated`: ステータス変更やキャンセル予約の同期。
  - `customer.subscription.deleted`: 解約完了。`is_pro` フラグを false に。

### C. ポータル機能
- **Portal API (`src/app/api/portal/route.ts`):** ユーザーを Stripe カスタマーポータル（領収書発行・解約・カード変更）へ誘導するAPI。

## 4. 手順

1. **[MCP]** Stripe上に商品 (Product) と価格 (Price) を作成。
2. **[DB]** Supabaseに `subscriptions` テーブル作成のマイグレーション実行。
3. **[Env]** 環境変数 (`STRIPE_SECRET_KEY`, `STRIPE_WEBHOOK_SECRET` 等) の設定。
4. **[Code]** APIルートとフロントエンドの実装。
5. **[Testing]** Stripe CLI (またはMCP) を使用してWebhookの動作確認。

---
**確認事項:**
- プランの金額設定（月額980円）で問題ないでしょうか？
- 現在 Stripe の `Secret Key` (sk_test_...) と `Publishable Key` (pk_test_...) は環境変数に設定されていますか？まだの場合は `.env.local` への追加が必要です。
