# Dermanım Ol: Ürün ve Altyapı Kararları

> Durum: Taslak v1 · Tarih: 2026-11-02
> Kaynak: `stitch_smart_pharmacy_prescription_marketplace` tasarımları, mevzuat araştırması ve ürün görüşmeleri

---

## 1. Ürün tanımı

**Dermanım Ol**, kullanıcının ihtiyaç duyduğu ilaç ve kişisel bakım ürünlerini çevresindeki eczanelere **sorduğu** ve eczacıların **"var / muadili var / yok"** diye cevapladığı bir **talep-yanıt** uygulamasıdır.

**Slogan:** *İlacın, bakım ürünün yakında mı, rafta mı? Sor.*

### Marka kararı

| | |
|---|---|
| Ad | **Dermanım Ol** (mağazada ayrı yazılır). Teknik kısa ad: `dermanimol` |
| Anlamı | "Çarem ol." *Derman* (TDK): çare, ilaç |
| Alan adları | `dermanimol.com` ve `dermanimol.app` boş (2026-11-02 kontrolü) |
| TÜRKPATENT (2026-11-02) | "dermanımol" için birebir kayıt yok. "dermanım": tek kayıt, 2019/54235, sınıf 29/35 (gıda). "derman" içeren geçerli kayıtlar var: 42 (Uludağ Bilişim), 35/44 ("derman eczanesi"), 05 ve 44 (çeşitli sağlık markaları). Bu yüzden **itiraz riski orta düzeyde** |
| Tescil stratejisi | 09, 35, 42 ve 44. sınıflarda, ayırt edici bir logo ile **şekil marka** olarak başvurulacak. Başvurudan önce marka vekiline ön inceleme yaptırılacak |
| Elenen isimler | Uygun Eczanem, Ecza Dolabım, Reçetenet (ünvan ve reçete riski). Arasta ve Medar (aynı kelime 05, 09, 35, 42 ve 44. sınıflarda tescilli). Dermanbul (`.com` dolu, risk daha yüksek) |
| İletişim kuralı | İsim "çare" çağrıştırdığı için uygulama içinde ve reklamlarda **tedavi ya da şifa vaadi kullanılmaz**. Uygulama sadece stok ve fiyat bilgisi verir |
| Logo ve ikon (2026-11-02 kararı) | Lacivert kare içinde **kırmızı zeminli beyaz "E"**, konum pini. Dosyalar: `docs/assets/marka/`. **Mavi onay rozeti kaldırılacak.** Açılış ekranındaki "T.C. Sağlık Bakanlığı İTS" ibaresi kaldırılacak |
| Bilinen risk (kabul edildi) | Kırmızı zeminli beyaz "E", TİTCK denetim kılavuzunda eczanelerin asmak zorunda olduğu standart levha olarak geçiyor. Eczane olmayanların kullanımını yasaklayan bir hüküm bulunamadı, ancak oda itirazı ve marka tescilinde ret riski var. Marka vekiline bu nokta özellikle sorulacak |
| Renkler | Lacivert `#12223e` (yazı, ana buton), kırmızı `#ca3a31` (E, vurgu, nöbetçi), mavi `#3982c2` (bağlantı, seçili durum), zemin `#eef5fd` |

Uygulama üç soruya cevap verir:

| Problem | Dermanım Ol'daki karşılığı |
|---|---|
| **En yakın** | Yanıtlar mesafeye göre gösterilir, yol tarifi verilir |
| **Stok durumu** | Eczacının anlık teyidi: "Var", "Muadili var" ya da "Yok". Sepetin tamamı tek bir eczanede bulunamıyorsa birden fazla eczanenin kombinasyonu önerilir |
| **Uygun fiyat** | Fiyat **sadece ilaç dışı ürünlerde** (bakım, dermokozmetik, takviye) sorulur. İlaç fiyatlarını devlet belirler |

**Aktörler:** Kullanıcı, eczacı ve platform yöneticisi (admin).

---

## 2. Bilinçli olarak YAPILMAYANLAR

Bunların her biri mevzuat araştırmasında bir kısıta karşılık geliyor.

| Yapılmayan | Gerekçe |
|---|---|
| Ödeme, sanal POS, sepet ve satış | 6197 sayılı Kanun md. 24: ilaç internetten satılamaz. Disiplin Yönetmeliği (RG 10.12.2024) md. 15(c) bent 8: eczacı internet üzerinden ürün satamaz |
| Reçetenin eczaneye iletilmesi (fotoğraf, numara, TC kimlik) | Kanun md. 24 reçete toplama ve yönlendirmeyi yasaklar, cezayı aracı kuruluşa da keser. Disiplin bent 6: internet üzerinden reçete kabulü yasak |
| Kurye ve teslimat | Yönetmelik md. 28/5 ve TEB/İEO'nun 2024 yazıları |
| Eczanenin ödeme yapıp öne çıkması, eczane reklamı | Kanun md. 24'teki iş birliği yasağı ve Disiplin bent 7'deki reklam yasağı |
| Eczaneden talep başı ücret ya da abonelik | İş birliği riski taşıyor, ayrıca eczanenin katılımını zorlaştırır |
| Apple Wallet, iade ve İTS akışları | Bu modelde satış olmadığı için gereksiz |
| Resmi onay iddiaları ("T.C. Sağlık onaylı", "T.C. Sağlık Bakanlığı İTS", "İEO resmi verisi" vb.) ve "doğrulanmış" anlamı taşıyan mavi onay rozeti | Gerçek değil, yanıltıcı. Logodan, ikondan ve tüm ekranlardan çıkarılacak |
| Adında "eczane" ya da "ecza" geçen isim | Ünvan karışıklığı riski |

---

## 3. Temel iş kuralları

1. **Talep** en fazla **10 kalemden** oluşur. Her kalem için kullanıcı "muadil olur" seçeneğini açıp kapatabilir.
2. Yarıçap varsayılan olarak **3 km**, en fazla **15 km**. Filtreler: "Şimdi açık" ve "Nöbetçi".
3. **Yanıt süresi** gündüz **10 dakika**, gece (22:00–08:00) **15 dakika**. Admin bu süreleri değiştirebilir. Süre dolduğunda yanıt vermeyen eczane "yanıt yok" sayılır. Eczacı süre dolana kadar yanıtını düzeltebilir.
4. **Eczacı hastanın kimliğini görmez.** Sadece talep kodunu (ör. `#482`), mesafeyi ve kalemleri görür.
5. **İlaç kalemlerinde fiyat alanı yoktur.** Bakım ürünlerinde fiyat (birim fiyat) sadece katalogda tanımlı ürünlerde girilebilir; serbest metinle eklenen kalemlerde fiyat sorulmaz. Bu özellik `feature.price_quotes` bayrağıyla yönetilir.
6. **"Geliyorum"** bağlayıcı değildir. Ödeme ya da rezervasyon garantisi içermez, eczacıya sadece hazırlık sinyali verir. Talebi kapatmaz; talep başına en fazla 2 eczaneye "Geliyorum" denebilir.
7. **Sıralama:** Önce tam stok, sonra mesafe. Kullanıcı "fiyata göre" sıralamayı kendisi seçebilir (sadece bakım ürünlerinde). Para karşılığı sıralama yoktur.
8. **Anonimleştirme:** 24 saat sonra talep ile kullanıcı arasındaki bağ koparılır, istatistik için anonim kalem verisi kalır.
9. **Kötüye kullanım önlemleri:** Talep göndermek için telefon doğrulaması zorunlu (Apple ya da Google ile girenlerden ilk talepte bir kez istenir), günlük talep limiti (varsayılan 10), sahte "Geliyorum" sayacı, serbest metinde TC kimlik ve telefon kalıpları engelli, eczacının "Bu talebi bildir" butonu.
10. **Eczane doğrulama:** GLN, ruhsat ve oda sicil bilgisi kontrol edilir, admin onayı olmadan eczane talep alamaz.

---

## 4. Gelir modeli

| # | Model | Faz | Not |
|---|---|---|---|
| 1 | **Bekleme ekranı reklamı** | MVP sonrası | Kullanıcı yanıt beklerken gösterilir. Kişiselleştirilmemiş, ilaç kategorisi engelli, **gece (22:00–08:00) ve nöbetçi taleplerinde kapalı**. Apple 5.1.3 ve Google'ın hassas kategori politikalarıyla uyumlu |
| 2 | **Marka sponsorluğu (bakım ürünleri)** | Faz 2 | Kozmetik ve takviye **markalarının** "Sponsorlu" etiketli önerileri. Reklamı eczane değil, marka yapar |
| 3 | **Talep ve yokluk verisi (B2B)** | Faz 2 | Anonim ve toplu veri. Eczanelere "bölgende aranan, stoğunda olmayan ürünler" raporu, depolara ve üreticilere bölgesel yokluk ve talep haritası |
| 4 | Kullanıcı premium | Faz 3 | Aile profilleri, tekrarlayan talepler, hatırlatıcı |

Eczacı tarafı **ücretsizdir**.

---

## 5. Uygulamalar

| Uygulama | Platform | Kullanıcı |
|---|---|---|
| **Dermanım Ol** | iOS, Android (Flutter) | Kullanıcı |
| **Dermanım Ol Eczacı** | Telefon, tablet, web (Flutter) | Eczacı ve eczane personeli |
| **Dermanım Ol Yönetim** | Web (Flutter Web) | Platform ekibi |

---

## 6. Teknik altyapı

- **Monorepo** (GitHub, private), Dart pub workspace ile yönetilir (kökte tek `flutter pub get`):
  - `apps/dermanimol`, `apps/dermanimol_eczaci`, `apps/dermanimol_yonetim`
  - `packages/` (ortak kod), `backend/`, `supabase/`, `docs/`
- **Ortak paketler:** `design_system`, `domain` (modeller), `data` (Supabase ve API istemcileri), `core` (hata yönetimi, DI, feature flag, yerelleştirme)
- **Supabase:**
  - Auth: telefon ve OTP
  - Postgres ve RLS
  - **Realtime:** talepler ve yanıtlar anlık taşınır
  - Storage
- **Backend:** FastAPI (Python). Talep yayını (eczane eşleştirme), süre yönetimi, kötüye kullanım kontrolleri, bildirimler, raporlama, admin işlemleri.
  - **Kural:** İstemci, durum değiştiren kayıtları doğrudan yazamaz.
- **Barındırma:** Prod ortamı **Türkiye'de self-hosted Supabase** üzerinde (KVKK md. 9 kapsamında yurt dışı aktarım olmaz). Dev ve staging ortamları Supabase Cloud'da, **yalnızca sentetik veri** ile.
- **Ortamlar:** dev, staging, prod. Migration'lar repoda tutulur, CI GitHub Actions ile çalışır.
- **Ürün verisi:** TİTCK'nin resmi ilaç ve eşdeğer listeleri, bakım ürünleri için ayrı bir katalog.
- **Reçete OCR:** **Cihaz üzerinde** çalışır (ör. Google ML Kit). Fotoğraf sunucuya gönderilmez, sadece ürün adları çıkarılır.

---

## 7. Backlog (MVP dışı, bayrakla açılacaklar)

- Eczane yazılımlarından otomatik stok yanıtı (VERA, İLON vb. entegrasyonu)
- Eczacıyla mesajlaşma (hukuki görüşten sonra)
- İlaç hatırlatıcı ve takip listesi
- Sanal POS, komisyon ekranı, mutabakat, kurye (sadece mevzuat değişirse; altyapıda yer bırakılır)

---

## 8. Açık işler

- [x] TÜRKPATENT ön araştırması (2026-11-02, sonuçlar Marka kararı bölümünde)
- [ ] Alan adlarını hemen almak: `dermanimol.com`, `dermanimol.app`, `dermanimol.com.tr` (nic.tr'den elle kontrol)
- [ ] Marka vekili ön incelemesi ve başvuru: 09, 35, 42, 44. sınıflar, şekil marka
- [ ] Logo, ikon ve açılış ekranı revizyonu (tasarımcı): mavi onay rozetini ve "T.C. Sağlık Bakanlığı İTS" ibaresini kaldırmak
- [ ] Sağlık hukuku avukatından kısa görüş: (a) ilaç adına göre stok sorgusu ve "Geliyorum", (b) bakım ürünlerinde fiyat bildirimi
- [ ] Pilot bölge seçimi (öneri: tek bir ilçede 30–50 eczane)
