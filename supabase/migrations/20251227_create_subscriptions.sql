-- Create subscriptions table
create table if not exists public.subscriptions (
  id text not null primary key, -- Stripe Subscription ID
  user_id uuid references auth.users not null,
  status text, -- active, trialing, past_due, canceled, etc.
  price_id text,
  metadata jsonb,
  quantity integer,
  cancel_at_period_end boolean,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  current_period_start timestamp with time zone default timezone('utc'::text, now()) not null,
  current_period_end timestamp with time zone default timezone('utc'::text, now()) not null,
  ended_at timestamp with time zone default timezone('utc'::text, now()),
  cancel_at timestamp with time zone default timezone('utc'::text, now()),
  canceled_at timestamp with time zone default timezone('utc'::text, now()),
  trial_start timestamp with time zone default timezone('utc'::text, now()),
  trial_end timestamp with time zone default timezone('utc'::text, now())
);

-- Enable RLS
alter table public.subscriptions enable row level security;

-- Policies for subscriptions
create policy "Users can view own subscriptions" on public.subscriptions
  for select using (auth.uid() = user_id);

-- Add is_pro column to profiles
alter table public.profiles add column if not exists is_pro boolean default false;
