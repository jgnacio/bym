-- Postgres RLS requires row visibility (a SELECT policy) for DELETE to
-- actually match rows, even when a DELETE-only policy with USING(true)
-- exists. Without this, DELETE silently affects 0 rows.
-- This doesn't expose anything new: guest_name/guest_phone are already
-- public via gift_items_availability and gift_custom_reservations_public.

create policy "public read reservations" on gift_reservations
  for select using (true);
