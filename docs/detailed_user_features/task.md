# Detailed User Features Task List

## 1. Database Schema
- [x] Create `bookmarks` table <!-- id: 0 -->
    - Link `user_id` and `question_id`

## 2. Bookmarking Feature
- [x] Create `BookmarkButton` component <!-- id: 1 -->
- [x] Integrate into `QuizPlayer` <!-- id: 2 -->
- [x] Implement toggle logic (add/remove bookmark) <!-- id: 3 -->

## 3. Review Mode Implementation
- [x] Create Review Dashboard (`src/app/practice/review/page.tsx`) <!-- id: 4 -->
- [x] Implement "Wrong Answer Review" logic <!-- id: 5 -->
    - Fetch questions from `user_answers` where `is_correct` is false
- [x] Implement "Bookmarks Review" logic <!-- id: 6 -->
    - Fetch questions from `bookmarks`

## 4. Verification
- [x] Verify bookmark toggling works <!-- id: 7 -->
- [x] Verify review modes load correct questions <!-- id: 8 -->
