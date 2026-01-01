# Dashboard Realization & XP Logic Implementation

## Goal Description
Connect the User Dashboard (`/dashboard`) to the real Supabase database to display actual learning history and stats. Implement the XP and Level update logic upon quiz completion.

## Proposed Changes

### Dashboard (`src/app/dashboard/page.tsx`)
#### [MODIFY] [page.tsx](file:///c:/Users/notos/kanei_quest/src/app/dashboard/page.tsx)
-   Remove hardcoded stats and history.
-   Fetch `exam_attempts` for the current user, ordered by `completed_at` descending.
-   Display real "Level" and "XP" from the `profiles` table.
-   Display real "Recent Learning History" from `exam_attempts`.
-   Calculate "Learning Completion Rate" (total unique questions solved / total questions available).

### Quiz Logic (`src/components/quiz/QuizPlayer.tsx`)
#### [MODIFY] [QuizPlayer.tsx](file:///c:/Users/notos/kanei_quest/src/components/quiz/QuizPlayer.tsx)
-   Implement `updateUserStats` function.
-   On quiz completion:
    -   Fetch current profile XP/Level.
    -   Calculate gained XP (e.g., 10 XP per correct answer).
    -   Update `profiles` table with new XP and Level.

### Admin Question Edit (`src/app/admin/questions/[id]/page.tsx`)
#### [NEW] [page.tsx](file:///c:/Users/notos/kanei_quest/src/app/admin/questions/[id]/page.tsx)
-   Fetch existing question data with options.
-   Render `QuestionForm` with initial data.

#### [MODIFY] [QuestionForm.tsx](file:///c:/Users/notos/kanei_quest/src/components/admin/QuestionForm.tsx)
-   Accept optional `initialData` prop.
-   If `initialData` is present:
    -   Populate form state.
    -   Switch submit logic to `bupdate` instead of `insert`.
    -   Handle options update (upsert or delete/re-insert).

#### [MODIFY] [page.tsx](file:///c:/Users/notos/kanei_quest/src/app/admin/questions/page.tsx)
-   Link "Edit" button to `/admin/questions/[id]`.

## Verification Plan

### Manual Verification
1.  **XP Update**:
    -   Check current XP in Dashboard.
    -   Complete a quiz (e.g., 1 question).
    -   Check Dashboard again to verify XP increased.
2.  **History**:
    -   Verify the completed quiz appears in "Recent Learning History".
3.  **Edit Question**:
    -   Go to Admin Questions list.
    -   Click "Edit" on a question.
    -   Modify content and save.
    -   Verify the change is reflected in the list and the actual quiz.
