# AuthContext Fix Implementation Plan

## Problem
The `AuthContext` is currently using mock data and does not synchronize with the actual Supabase session. This causes the Header to show "Login" even when the user is authenticated server-side and viewing protected pages.

## Proposed Changes
Rewrite `src/context/AuthContext.tsx` to:
1.  Use `createClient` from `@/lib/supabase/client`.
2.  On mount, fetch the current session/user from Supabase.
3.  Set up an `onAuthStateChange` listener to keep the state in sync.
4.  Expose the `User` object (mapping Supabase `User` to the app's `User` type if necessary, or just using Supabase's user).
5.  Update `logout` to call `supabase.auth.signOut()`.

## Type Compatibility
- Check `src/lib/types.ts` for `User` interface.
- If it differs significantly from Supabase `User`, implement a mapper or update the type.
