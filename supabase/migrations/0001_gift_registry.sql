-- Gift registry schema for the wedding gift wizard.
create extension if not exists pgcrypto;

create table gift_categories (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  icon text not null,
  sort_order int not null
);

create table gift_items (
  id uuid primary key default gen_random_uuid(),
  category_id uuid not null references gift_categories(id) on delete cascade,
  name text not null,
  sort_order int not null
);

create table gift_reservations (
  id uuid primary key default gen_random_uuid(),
  item_id uuid references gift_items(id) on delete cascade,
  custom_item_name text,
  guest_name text not null,
  guest_phone text,
  created_at timestamptz not null default now(),
  constraint gift_reservations_item_or_custom check (
    (item_id is not null and custom_item_name is null)
    or (item_id is null and custom_item_name is not null)
  )
);

-- One reservation per listed item. Custom (free-text) gifts are exempt
-- since they aren't drawn from a shared, limited pool.
create unique index gift_reservations_item_id_unique
  on gift_reservations (item_id)
  where item_id is not null;

-- Public-safe view: exposes only a reserved/available boolean, never
-- guest_name or guest_phone. Runs with the view owner's privileges, but
-- since it only returns a derived boolean, no guest data can leak through it.
create view gift_items_availability as
select
  gi.id,
  gi.category_id,
  gi.name,
  gi.sort_order,
  exists (
    select 1 from gift_reservations gr where gr.item_id = gi.id
  ) as is_reserved
from gift_items gi;

alter table gift_categories enable row level security;
alter table gift_items enable row level security;
alter table gift_reservations enable row level security;

create policy "public read categories" on gift_categories
  for select using (true);

create policy "public read items" on gift_items
  for select using (true);

-- No select/update/delete policy on gift_reservations: anon/authenticated
-- get zero read or write access beyond the insert below. Only the couple,
-- via the Supabase dashboard (service role), can view or release reservations.
create policy "public insert reservations" on gift_reservations
  for insert with check (true);

grant usage on schema public to anon, authenticated;
grant select on gift_categories, gift_items, gift_items_availability to anon, authenticated;
grant insert on gift_reservations to anon, authenticated;

-- Seed categories
insert into gift_categories (name, icon, sort_order) values
  ('Living / Sala', 'weekend', 1),
  ('Cocina', 'kitchen', 2),
  ('Lavadero', 'local_laundry_service', 3),
  ('Comedor', 'dining', 4),
  ('Dormitorio', 'bed', 5),
  ('Baño', 'bathtub', 6),
  ('Extras / Útiles', 'category', 7);

-- Seed items
with cat as (select id, name from gift_categories)
insert into gift_items (category_id, name, sort_order)
select cat.id, item.name, item.sort_order
from (values
  ('Living / Sala', 'Sofá', 1),
  ('Living / Sala', 'Sillones', 2),
  ('Living / Sala', 'Mesa de centro', 3),
  ('Living / Sala', 'Mueble para TV', 4),
  ('Living / Sala', 'Televisor', 5),
  ('Living / Sala', 'Lámparas', 6),
  ('Living / Sala', 'Cortinas', 7),
  ('Living / Sala', 'Alfombra', 8),

  ('Cocina', 'Cocina o anafe', 1),
  ('Cocina', 'Horno', 2),
  ('Cocina', 'Heladera', 3),
  ('Cocina', 'Microondas', 4),
  ('Cocina', 'Licuadora', 5),
  ('Cocina', 'Batidora', 6),
  ('Cocina', 'Ollas (varios tamaños)', 7),
  ('Cocina', 'Sartén', 8),
  ('Cocina', 'Utensilios (cucharones, espátulas, colador)', 9),
  ('Cocina', 'Freidora', 10),

  ('Lavadero', 'Lavarropas', 1),
  ('Lavadero', 'Canasto para ropa', 2),
  ('Lavadero', 'Tender', 3),
  ('Lavadero', 'Plancha', 4),
  ('Lavadero', 'Tabla de planchar', 5),

  ('Comedor', 'Mesa', 1),
  ('Comedor', 'Sillas', 2),
  ('Comedor', 'Mantel', 3),
  ('Comedor', 'Vajilla (platos postre)', 4),
  ('Comedor', 'Vasos y copas', 5),
  ('Comedor', 'Cubiertos completos', 6),
  ('Comedor', 'Jarras', 7),

  ('Dormitorio', 'Cama (base + colchón)', 1),
  ('Dormitorio', 'Almohadas', 2),
  ('Dormitorio', 'Sábanas', 3),
  ('Dormitorio', 'Acolchado / frazadas', 4),
  ('Dormitorio', 'Mesas de luz', 5),
  ('Dormitorio', 'Veladores', 6),
  ('Dormitorio', 'Placard o ropero', 7),

  ('Baño', 'Espejo', 1),
  ('Baño', 'Porta cepillos', 2),
  ('Baño', 'Jabonería', 3),
  ('Baño', 'Decoración', 4),
  ('Baño', 'Estantes o mueble', 5),

  ('Extras / Útiles', 'Perchero', 1),
  ('Extras / Útiles', 'Espejo de cuerpo', 2),
  ('Extras / Útiles', 'Organizadores', 3),
  ('Extras / Útiles', 'Estufa', 4),
  ('Extras / Útiles', 'Aire acondicionado', 5)
) as item(category_name, name, sort_order)
join cat on cat.name = item.category_name;
