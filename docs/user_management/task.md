# User Management Enhancement Task List

- [x] Database Schema Updates <!-- id: 0 -->
    - [x] Add `name` (Display Name) column to `profiles` table <!-- id: 1 -->
    - [x] Update `handle_new_user` trigger function to save metadata `name` <!-- id: 2 -->
    - [x] Generate Types <!-- id: 3 -->
- [x] Signup Flow Updates <!-- id: 4 -->
    - [x] Update `src/app/signup/page.tsx` with Name input <!-- id: 5 -->
    - [x] Pass `name` to `supabase.auth.signUp` metadata <!-- id: 6 -->
- [x] Admin Dashboard Updates <!-- id: 7 -->
    - [x] Update User List to display Name instead of Email <!-- id: 8 -->
- [x] Verification <!-- id: 9 -->
