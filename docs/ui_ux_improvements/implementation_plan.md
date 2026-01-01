# UI/UX Implementation Plan

UI/UXの改善として、デザインの一貫性を保ちつつ開発効率を向上させるための共通コンポーネントの導入を行います。
また、既存のページ（ログイン、サインアップ、LP）をこれらのコンポーネントを使用するようにリファクタリングし、より洗練された「Premium」な体験を提供します。

## User Review Required

> [!NOTE]
> 既存のページデザインを大きく変更するわけではありませんが、内部構造（コンポーネント化）を変更し、細部のデザイン（ホバーエフェクト、フォーカス状態など）を統一します。

## Proposed Changes

### UI Components (`src/components/ui`)
以下の共通コンポーネントを新規作成し、`globals.css` のデザインシステム（Glassmorphism, Tailwind）を適用します。

#### [NEW] [Button.tsx](file:///c:/Users/notos/kanei_quest/src/components/ui/Button.tsx)
- `variant`: `default` (Primary), `secondary`, `outline`, `ghost`, `link`
- `size`: `default`, `sm`, `lg`, `icon`
- ローディング状態のサポート
- プレミアムなホバーエフェクト（Glow effectなど）

#### [NEW] [Input.tsx](file:///c:/Users/notos/kanei_quest/src/components/ui/Input.tsx)
- 共通のスタイル（Glass background, border colors）
- フォーカス時のリングエフェクト

#### [NEW] [Card.tsx](file:///c:/Users/notos/kanei_quest/src/components/ui/Card.tsx)
- `.glass` クラスをベースにしたコンテナコンポーネント

#### [NEW] [Label.tsx](file:///c:/Users/notos/kanei_quest/src/components/ui/Label.tsx)
- フォームラベルの共通スタイル

### Pages Refactoring
作成したコンポーネントを使用して、以下のページのコードを削減し、一貫性を高めます。

#### [MODIFY] [login/page.tsx](file:///c:/Users/notos/kanei_quest/src/app/login/page.tsx)
- 直書きされた `<input>` と `<button>` を `Input`, `Button` コンポーネントに置き換え。

#### [MODIFY] [signup/page.tsx](file:///c:/Users/notos/kanei_quest/src/app/signup/page.tsx)
- 同上。

#### [MODIFY] [page.tsx](file:///c:/Users/notos/kanei_quest/src/app/page.tsx)
- ヒーローセクション等のボタンを共通コンポーネントに置き換え。

## Verification Plan

### Automated Tests
- 現状、UIテストは導入されていないため、ビルドが通ること (`npm run build`) を確認します。

### Manual Verification
- `npm run dev` でローカルサーバーを起動し、以下の項目を目視で確認します。
    - **ログイン/サインアップ**: フォームの入力、フォーカスリング、エラー表示、ボタンのローディング状態が正しく機能し、デザインが崩れていないこと。
    - **LP**: ボタンのデザインが意図した通り（グラデーション、影など）になっていること。
    - **全体**: コンポーネント間で色味や書体が統一されていること。
