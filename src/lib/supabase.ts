import { createClient } from '@supabase/supabase-js';

export const supabase = createClient(
  import.meta.env.PUBLIC_SUPABASE_URL,
  import.meta.env.PUBLIC_SUPABASE_ANON_KEY,
);

export interface GiftCategory {
  id: string;
  name: string;
  icon: string;
  sort_order: number;
}

export interface GiftItem {
  id: string;
  category_id: string;
  name: string;
  sort_order: number;
  is_reserved: boolean;
  reserved_by: string | null;
  reserved_phone: string | null;
}

export interface CustomReservation {
  id: string;
  custom_item_name: string;
  guest_name: string;
  created_at: string;
  guest_phone: string | null;
}
