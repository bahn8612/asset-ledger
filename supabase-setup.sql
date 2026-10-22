-- 내 자산 장부: Supabase SQL Editor에 통째로 붙여 넣고 Run 하세요.
-- 모든 표는 로그인한 본인 행만 읽고 쓸 수 있습니다 (Row Level Security).

create table if not exists public.assets (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  name text not null,
  category text not null,
  amount bigint not null default 0,
  memo text not null default '',
  example boolean not null default false,
  updated_at timestamptz not null default now()
);

create table if not exists public.history (
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  date date not null,
  assets bigint not null,
  debts bigint not null,
  net bigint not null,
  primary key (user_id, date)
);

create table if not exists public.expenses (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  date date not null,
  amount bigint not null,
  category text not null,
  title text not null default '',
  method text not null default '',
  created_at timestamptz not null default now()
);
create index if not exists expenses_user_date on public.expenses (user_id, date);

create table if not exists public.statements (
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  month text not null,   -- 'YYYY-MM'
  card text not null,    -- 'hyundai' | 'hana'
  amount bigint not null,
  primary key (user_id, month, card)
);

do $$
declare t text;
begin
  foreach t in array array['assets','history','expenses','statements'] loop
    execute format('alter table public.%I enable row level security', t);
    execute format('drop policy if exists own_rows on public.%I', t);
    execute format('create policy own_rows on public.%I for all to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid())', t);
  end loop;
end $$;
