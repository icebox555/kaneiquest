-- アバターの表示拡大率（丸の中での画像サイズ）をユーザーごとに保存
alter table public.profiles
  add column if not exists avatar_scale numeric default 1.5;

-- ランキング表示でも各ユーザーの拡大率を使えるようにビューを更新。
-- 既存の列名・並びは変更せず（create or replace の制約）、末尾に avatar_scale を追加する。
create or replace view public.leaderboard as
 select id as user_id,
    name,
    avatar_url,
    xp,
    level,
    plan,
    avatar_scale
   from public.profiles
  where (name is not null)
  order by xp desc;
