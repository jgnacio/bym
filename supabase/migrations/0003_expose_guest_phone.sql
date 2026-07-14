-- User explicitly requested guest phone numbers be shown publicly on the
-- gift status page, so contact can be made with whoever gave a gift.

create or replace view gift_items_availability as
select
  gi.id,
  gi.category_id,
  gi.name,
  gi.sort_order,
  gr.id is not null as is_reserved,
  gr.guest_name as reserved_by,
  gr.guest_phone as reserved_phone
from gift_items gi
left join gift_reservations gr on gr.item_id = gi.id;

drop view if exists gift_custom_reservations_public;

create view gift_custom_reservations_public as
select
  id,
  custom_item_name,
  guest_name,
  created_at,
  guest_phone
from gift_reservations
where item_id is null
order by created_at desc;

grant select on gift_custom_reservations_public to anon, authenticated;
