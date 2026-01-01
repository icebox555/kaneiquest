# Admin Settings Page Implementation Plan

## Goal
Implement a functional `/admin/settings` page to replace the 404 error. The page will allow admins to manage system-wide settings.

## Database Schema (`app_settings` table)
| Column | Type | Description |
|Data Type| Name | Description |
|---|---|---|
| `key` | text (PK) | Configuration key (e.g., 'maintenance_mode') |
| `value` | jsonb | Configuration value |
| `description` | text | Human-readable description |
| `updated_at` | timestamp | Last updated time |

## Initial Settings to Implement
1.  **Maintenance Mode**: Boolean toggle.
2.  **System Announcement**: Text area for a global announcement banner.

## UI Components
1.  **`src/app/admin/settings/page.tsx`**: Main page layout, fetches data server-side.
2.  **`SettingsForm`**: Client component for handling form state and submission.

## Security (RLS)
- **Select**: Allow `public` (for checking maintenance mode) or `authenticated`? (Starting with `public` read for maintenance, `admin` write).
- **Update**: Allow `admin` only.
