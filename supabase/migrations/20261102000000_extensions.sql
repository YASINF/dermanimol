-- Dermanım Ol: veritabanı eklentileri.
-- Tablolar sonraki migration'larda docs/03-veri-modeli.md'den üretilecek.

-- Konum: eczane eşleştirme (ST_DWithin), mesafe hesabı.
create extension if not exists postgis with schema extensions;

-- Ürün adında yazım hatasına dayanıklı arama.
create extension if not exists pg_trgm with schema extensions;
