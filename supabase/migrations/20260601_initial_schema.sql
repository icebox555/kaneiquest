-- ============================================================
-- Kanei Quest - Initial Schema
-- Run this in Supabase SQL Editor
-- ============================================================

-- UUID extension
create extension if not exists "uuid-ossp";

-- ============================================================
-- profiles (extends auth.users)
-- ============================================================
create table if not exists public.profiles (
  id uuid references auth.users on delete cascade primary key,
  email text,
  name text,
  avatar_url text,
  level integer default 1,
  xp integer default 0,
  hearts integer default 7,
  last_heart_regenerated_at timestamptz default now(),
  plan text default 'free',
  role text default 'user',
  is_pro boolean default false,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);
alter table public.profiles enable row level security;

create policy "Users can view own profile"
  on public.profiles for select using (auth.uid() = id);
create policy "Users can update own profile"
  on public.profiles for update using (auth.uid() = id);
create policy "Admins can view all profiles"
  on public.profiles for select using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- Auto-create profile on signup
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, email, name)
  values (new.id, new.email, new.raw_user_meta_data->>'name')
  on conflict (id) do nothing;
  return new;
end;
$$ language plpgsql security definer;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- ============================================================
-- categories
-- ============================================================
create table if not exists public.categories (
  id uuid default uuid_generate_v4() primary key,
  name text not null,
  description text,
  image_url text,
  slug text,
  "order" integer,
  created_at timestamptz default now()
);
alter table public.categories enable row level security;

create policy "Anyone can read categories"
  on public.categories for select using (true);
create policy "Admins can manage categories"
  on public.categories for all using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- ============================================================
-- questions
-- ============================================================
create table if not exists public.questions (
  id uuid default uuid_generate_v4() primary key,
  category_id uuid references public.categories on delete cascade not null,
  content text not null,
  explanation text,
  difficulty integer default 2,
  exam_year integer,
  question_number integer,
  question_type text default 'multiple_choice',
  image_url text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);
alter table public.questions enable row level security;

create policy "Anyone can read questions"
  on public.questions for select using (true);
create policy "Admins can manage questions"
  on public.questions for all using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- ============================================================
-- options
-- ============================================================
create table if not exists public.options (
  id uuid default uuid_generate_v4() primary key,
  question_id uuid references public.questions on delete cascade not null,
  content text not null,
  is_correct boolean default false,
  "order" integer
);
alter table public.options enable row level security;

create policy "Anyone can read options"
  on public.options for select using (true);
create policy "Admins can manage options"
  on public.options for all using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- ============================================================
-- exam_attempts
-- ============================================================
create table if not exists public.exam_attempts (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references auth.users on delete cascade not null,
  category_id uuid references public.categories on delete set null,
  exam_year integer,
  score integer,
  total_questions integer,
  is_completed boolean default false,
  started_at timestamptz default now(),
  completed_at timestamptz
);
alter table public.exam_attempts enable row level security;

create policy "Users can manage own exam_attempts"
  on public.exam_attempts for all using (auth.uid() = user_id);
create policy "Admins can view all exam_attempts"
  on public.exam_attempts for select using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- ============================================================
-- question_attempts (individual question tracking)
-- ============================================================
create table if not exists public.question_attempts (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references auth.users on delete cascade not null,
  question_id uuid references public.questions on delete cascade,
  exam_attempt_id uuid references public.exam_attempts on delete cascade,
  is_correct boolean,
  created_at timestamptz default now()
);
alter table public.question_attempts enable row level security;

create policy "Users can manage own question_attempts"
  on public.question_attempts for all using (auth.uid() = user_id);
create policy "Admins can view all question_attempts"
  on public.question_attempts for select using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- ============================================================
-- user_answers
-- ============================================================
create table if not exists public.user_answers (
  id uuid default uuid_generate_v4() primary key,
  attempt_id uuid references public.exam_attempts on delete cascade not null,
  question_id uuid references public.questions on delete cascade not null,
  selected_option_id uuid references public.options on delete set null,
  is_correct boolean,
  created_at timestamptz default now()
);
alter table public.user_answers enable row level security;

create policy "Users can manage own user_answers"
  on public.user_answers for all using (
    exists (select 1 from public.exam_attempts where id = attempt_id and user_id = auth.uid())
  );

-- ============================================================
-- bookmarks
-- ============================================================
create table if not exists public.bookmarks (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references auth.users on delete cascade not null,
  question_id uuid references public.questions on delete cascade not null,
  created_at timestamptz default now(),
  unique(user_id, question_id)
);
alter table public.bookmarks enable row level security;

create policy "Users can manage own bookmarks"
  on public.bookmarks for all using (auth.uid() = user_id);

-- ============================================================
-- heart_logs
-- ============================================================
create table if not exists public.heart_logs (
  id uuid default uuid_generate_v4() primary key,
  sender_id uuid references auth.users on delete cascade not null,
  receiver_id uuid references auth.users on delete cascade not null,
  created_at timestamptz default now()
);
alter table public.heart_logs enable row level security;

create policy "Users can view own heart_logs"
  on public.heart_logs for select using (auth.uid() = sender_id or auth.uid() = receiver_id);
create policy "Users can insert heart_logs"
  on public.heart_logs for insert with check (auth.uid() = sender_id);

-- ============================================================
-- study_schedules
-- ============================================================
create table if not exists public.study_schedules (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references auth.users on delete cascade not null unique,
  exam_date date not null,
  daily_goal_minutes integer default 60,
  study_days integer[] default '{1,2,3,4,5}'::integer[],
  notification_pref text default 'inapp',
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);
alter table public.study_schedules enable row level security;

create policy "Users can manage own study_schedules"
  on public.study_schedules for all using (auth.uid() = user_id);

-- ============================================================
-- study_tasks
-- ============================================================
create table if not exists public.study_tasks (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references auth.users on delete cascade not null,
  category_id uuid references public.categories on delete set null,
  scheduled_date date not null,
  title text not null,
  description text,
  planned_minutes integer default 30,
  actual_minutes integer,
  status text default 'pending',
  pomodoros_planned integer default 1,
  pomodoros_done integer default 0,
  completed_at timestamptz,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);
alter table public.study_tasks enable row level security;

create policy "Users can manage own study_tasks"
  on public.study_tasks for all using (auth.uid() = user_id);

-- ============================================================
-- notifications
-- ============================================================
create table if not exists public.notifications (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references auth.users on delete cascade not null,
  title text not null,
  message text,
  type text default 'info',
  read boolean default false,
  created_at timestamptz default now()
);
alter table public.notifications enable row level security;

create policy "Users can manage own notifications"
  on public.notifications for all using (auth.uid() = user_id);

-- ============================================================
-- app_settings
-- ============================================================
create table if not exists public.app_settings (
  key text primary key,
  value jsonb not null,
  description text,
  updated_at timestamptz,
  updated_by uuid references public.profiles on delete set null
);
alter table public.app_settings enable row level security;

create policy "Anyone can read app_settings"
  on public.app_settings for select using (true);
create policy "Admins can manage app_settings"
  on public.app_settings for all using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- ============================================================
-- subscriptions (Stripe)
-- ============================================================
create table if not exists public.subscriptions (
  id text primary key,
  user_id uuid references auth.users not null,
  status text,
  price_id text,
  metadata jsonb,
  quantity integer,
  cancel_at_period_end boolean,
  created_at timestamptz default now(),
  current_period_start timestamptz default now(),
  current_period_end timestamptz default now(),
  ended_at timestamptz,
  cancel_at timestamptz,
  canceled_at timestamptz,
  trial_start timestamptz,
  trial_end timestamptz
);
alter table public.subscriptions enable row level security;

create policy "Users can view own subscriptions"
  on public.subscriptions for select using (auth.uid() = user_id);

-- ============================================================
-- leaderboard (view)
-- ============================================================
create or replace view public.leaderboard as
select
  p.id,
  p.name,
  p.avatar_url,
  p.xp,
  p.level,
  rank() over (order by p.xp desc) as rank
from public.profiles p;

-- ============================================================
-- Initial data
-- ============================================================
insert into public.app_settings (key, value, description)
values ('announcement', '{"message": "Kanei Quest へようこそ！", "active": false}', 'サイトアナウンスメント')
on conflict (key) do nothing;
