-- Allow deleting a reservation from the public gift-status page (no auth,
-- per explicit user decision: the link is only shared with the couple).

create policy "public delete reservations" on gift_reservations
  for delete using (true);

grant delete on gift_reservations to anon, authenticated;

-- Expose the reservation id so the UI can target a delete.
create or replace view gift_items_availability as
select
  gi.id,
  gi.category_id,
  gi.name,
  gi.sort_order,
  gr.id is not null as is_reserved,
  gr.guest_name as reserved_by,
  gr.guest_phone as reserved_phone,
  gr.id as reservation_id
from gift_items gi
left join gift_reservations gr on gr.item_id = gi.id;
