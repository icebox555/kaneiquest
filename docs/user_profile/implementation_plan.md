# User Profile & Header Update Implementation Plan

## Goal
Replace the header login/logout/email display with a user avatar dropdown menu. This menu will provide access to a new "Profile Edit" page and "Logout" functionality.

## UI Components
### 1. `Header` Update
- **Path**: `src/components/layout/Header.tsx`
- **Logic**: Use `useAuth` context. If `user` exists, show `UserMenu` instead of the email/logout/login button.
- **Component**: `UserMenu.tsx` (New) - Client component utilizing `@radix-ui/react-dropdown-menu` and `@radix-ui/react-avatar`.
    - **Trigger**: User Avatar (with fallback to initials).
    - **Content**:
        - Item: "プロフィール編集" -> Link to `/profile`
        - Separator
        - Item: "ログアウト" -> Function call

### 2. Profile Page
- **Path**: `src/app/profile/page.tsx`
- **Features**:
    - Protected route (redirect to login if not authenticated).
    - Displays current user information (Name, Email).
    - Form to update Name.
    - (Future) Change password, update email.

### 3. Dependencies
- `@radix-ui/react-dropdown-menu`
- `@radix-ui/react-avatar`

## Database Access
- **Profile Page**: Fetch from `profiles` table. Update `profiles` table.
- RLS Check: `profiles` usually allows users to update `own` rows. Need to verify.

## Verification
- User logs in.
- Header shows Avatar.
- Clicking Avatar shows Dropdown.
- "プロフィール編集" navigates to `/profile`.
- Updating name in `/profile` works and reflects in the UI (and Header if reloaded).
- "ログアウト" works.
