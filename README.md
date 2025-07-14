# 🎬 SINFLIX

SINFLIX, Flutter ile geliştirilmiş modern bir film keşfetme ve favorilere ekleme uygulamasıdır. Clean Architecture, Bloc, Localization, Firebase ve daha fazlasını barındırır.

---

## 🚀 Özellikler

### ✅ Temel Gereksinimler

- [x] **Kimlik Doğrulama**
  - [x] Kullanıcı girişi ve kayıt işlevselliği
  - [x] Oturum token'ının güvenli şekilde saklanması
  - [x] Başarılı girişte otomatik ana sayfa yönlendirmesi

- [x] **Ana Sayfa Özellikleri**
  - [x] Sonsuz kaydırma (Infinite Scroll)
  - [x] Her sayfada 5 film gösterimi
  - [x] Otomatik yükleme göstergesi
  - [x] Pull-to-refresh özelliği
  - [x] Favori film işlemlerinde anlık UI güncellemesi

- [x] **Profil Sayfası**
  - [x] Kullanıcı bilgilerinin görüntülenmesi
  - [x] Favori filmler listesi
  - [x] Profil fotoğrafı yükleme

- [x] **Navigasyon**
  - [x] Bottom Navigation Bar ile sayfa geçişleri
  - [x] Ana sayfa state yönetimi ve korunması

- [x] **Kod Yapısı**
  - [x] Clean Architecture
  - [x] MVVM
  - [x] Bloc State Management

---

## ✨ Bonus Özellikler

- [x] Custom Theme (Dark Theme)
- [x] Navigation Service
- [x] Localization (Türkçe, English)
- [x] Logger Service
- [x] Firebase Crashlytics ve Analytics entegrasyonu
- [x] Lottie Animasyonları
- [x] Güvenli token yönetimi
- [x] Splash screen ve uygulama ikonu
- [x] Logger implementasyonu

---

## 📸 Ekran Görüntüleri

| Giriş | Kayıt | Ana Sayfa |
|-------|--------|-----------|
| ![Login](screenshots/login.png) | ![Signup](screenshots/signup.png) | ![Home](screenshots/home.png) |

| Teklif | Dil Seçimi | Profil (Verili) |
|--------|------------|-----------------|
| ![Offer](screenshots/offer.png) | ![Language Dialog](screenshots/language_dialog.png) | ![Profile Data](screenshots/profile_data.png) |

| Profil (Boş) | Profil Fotoğrafı (1) | Profil Fotoğrafı (2) |
|--------------|----------------------|----------------------|
| ![Profile Empty](screenshots/profile_no_data.png) | ![Profile Photo](screenshots/profile_photo.png) | ![Profile Photo 2](screenshots/profile_photo2.png) |

---

## 🛠️ Kurulum

```bash
git clone https://github.com/kullaniciadi/sinflix.git
cd sinflix
flutter pub get
flutter run
