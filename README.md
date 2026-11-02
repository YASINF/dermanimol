# Dermanım Ol

Kullanıcının aradığı ilaç ve bakım ürünlerini çevresindeki eczanelere sorduğu, eczacıların "var / muadili var / yok" diye yanıtladığı talep-yanıt uygulaması. Alışveriş eczanede yapılır; uygulamada ödeme, kurye ya da reçete aktarımı yoktur.

Ürün kararları, mevzuat gerekçeleri ve tasarım: [`docs/`](docs/)

| Doküman | İçerik |
|---|---|
| [01-urun-kararlari.md](docs/01-urun-kararlari.md) | Ürün tanımı, yapılmayanlar ve gerekçeleri, iş kuralları, marka, gelir modeli |
| [02-ekran-akis-haritasi.md](docs/02-ekran-akis-haritasi.md) | Üç uygulamanın ekranları ve akışları |
| [03-veri-modeli.md](docs/03-veri-modeli.md) | Tablolar, erişim kuralları, talep yaşam döngüsü |
| [04-teknik-mimari.md](docs/04-teknik-mimari.md) | Katmanlar, ortamlar, güvenlik, dağıtım |

## Depo yapısı

```
apps/
  dermanimol/           Kullanıcı uygulaması (iOS, Android)
  dermanimol_eczaci/    Eczacı uygulaması (iOS, Android, web)
  dermanimol_yonetim/   Yönetim paneli (web)
packages/
  design_system/        Marka renkleri, tema, ortak bileşenler
  core/                 Ortam ayarları, feature flag anahtarları
  domain/               Alan modelleri ve enum'lar
  data/                 API ve Supabase istemcileri
backend/                FastAPI (Python 3.12, uv)
supabase/               Yerel Supabase ayarı ve migration'lar
docs/                   Ürün ve teknik dokümanlar, marka dosyaları
```

Flutter tarafı bir **Dart pub workspace**'tir: kökte tek `flutter pub get` tüm uygulama ve paketlerin bağımlılıklarını çözer.

## Gereksinimler

- Flutter 3.47+ (Dart 3.13+)
- [uv](https://docs.astral.sh/uv/) (backend için; Python 3.12'yi kendisi kurar)
- Supabase CLI (yerel veritabanı için ayrıca Docker gerekir)

## Başlarken

```bash
# Flutter bağımlılıkları (tüm workspace)
flutter pub get

# Kullanıcı uygulamasını çalıştır
cd apps/dermanimol && flutter run --dart-define=APP_ENV=dev

# Testler
flutter test apps/dermanimol
flutter test packages/design_system

# Backend
cd backend && uv sync && uv run fastapi dev src/dermanimol_backend/main.py
cd backend && uv run pytest
```

## Ortam ayarları

Flutter uygulamaları ayarları `--dart-define` ile alır: `APP_ENV`, `API_BASE_URL`, `SUPABASE_URL`, `SUPABASE_ANON_KEY`. Backend ayarları ortam değişkenlerinden okunur, örnek: [`backend/.env.example`](backend/.env.example). Gerçek anahtarlar depoya konmaz.

## Kurallar

- Durum değiştiren her işlem backend'den geçer; istemciler veritabanına doğrudan yazmaz.
- Supabase **service role** anahtarı sadece backend'de bulunur.
- İlaç kalemlerinde fiyat alanı yoktur. Ayrıntılar: [docs/01-urun-kararlari.md](docs/01-urun-kararlari.md).
