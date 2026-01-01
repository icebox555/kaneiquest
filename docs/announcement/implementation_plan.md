# Announcement Display Implementation Plan

## Goal
Display the global announcement message configured in Admin Settings on the user dashboard.

## Component: `AnnouncementBanner`
- **Path**: `src/components/dashboard/AnnouncementBanner.tsx`
- **Features**:
  - Fetches `app_settings` with key `announcement`.
  - Checks if `active` is true.
  - Displays the message in a dismissible or static banner.
  - Styling: Warning/Info gradient or solid color to stand out, using `lucide-react` icons (Megaphone or Bell).

## Integration
- **Path**: `src/app/dashboard/page.tsx`
- **Placement**: Top of the dashboard content, below the header.
- **Data Fetching**: Server-side fetching in `DashboardPage` and passing props, or internal fetching in the component (Server Component).

## Database Access
- Use `supabase.from('app_settings').select('*')`.
- Ensure `public` read policy exists (already verified in previous step).
