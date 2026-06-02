-- Add full_name column to store the user's real name.
-- This is collected ONLY at Pro checkout (from Stripe's billing name) and is
-- never shown publicly — the public display name lives in profiles.name (nickname).
alter table public.profiles
  add column if not exists full_name text;

comment on column public.profiles.full_name is
  'Real name collected from Stripe at Pro checkout. Private — never displayed publicly. Public display name is profiles.name (nickname).';
