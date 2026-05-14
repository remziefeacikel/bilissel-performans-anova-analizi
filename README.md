# bilissel-performans-anova-analizi
Hacettepe Üniv. İstatistik Bölümü - ANOVA Tasarımları ve R Uygulamaları Ödevi
# Veri Toplama ve Deney Tasarıım
Bu projedeki veri setleri hazır kaynaklardan alınmamıştır. Tüm veriler; deney tasarımlarının bizzat kurgulanması ve gönüllü katılımcılar (öğrenciler) üzerinde gerçek zamanlı ölçümler yapılmasıyla, yani birincil veri toplama (primary data collection) yöntemiyle sıfırdan oluşturulmuştur. Bu yönüyle çalışma, sadece veri analizini değil; aynı zamanda uçtan uca deney tasarımı sürecini de kapsamaktadır.
# Bilişsel Performansı Etkileyen Faktörlerin İstatistiksel Analizi (ANOVA Uygulamaları)

Bu proje, Hacettepe Üniversitesi İstatistik Bölümü "İstatistiksel Yöntemler II" dersi kapsamında hazırlanmış bir dönem ödevidir. Çalışmanın temel amacı; okuma, anlama ve hatırlama gibi bilişsel performansları etkileyen çevresel (ses, ışık) ve bireysel (zaman, kafein, akademik seviye) faktörleri istatistiksel olarak incelemektir.

## 🛠 Kullanılan Yöntemler ve Araçlar

Veri analizi ve modelleme süreçleri **R** programlama dili kullanılarak gerçekleştirilmiş olup, varsayım kontrolleri için Shapiro-Wilk normallik testi uygulanmıştır. Çalışma kapsamında 4 farklı deney tasarımı incelenmiştir:

* **Tek Yönlü ANOVA:** Ses düzeyinin (sessiz, orta, yüksek gürültü) okuma hızı üzerindeki etkisi.
* **Tekrarlı Ölçümlü ANOVA:** Öğrenilen bilginin üzerinden geçen zamanın (hemen sonra, 1 saat sonra, 1 gün sonra) hatırlama düzeyine etkisi.
* **Rastgele Blok Düzeni:** Okuma materyalinin (dijital vs. kağıt) anlama skoruna etkisi, öğrencilerin akademik durumu (1. ve 3. sınıf) blok değişkeni olarak alınarak incelenmiştir.
* **Çok Etkenli (2x2) Faktöriyel ANOVA:** Işık düzeyi ve kafein tüketiminin odaklanma süresi üzerindeki ana ve etkileşim etkileri test edilmiştir.

## 📊 Temel Bulgular

Uygulanan istatistiksel testler sonucunda şu bulgulara ulaşılmıştır:

* Ses düzeyinin artması, metin okuma sürelerini anlamlı derecede uzatmaktadır.
* Bilginin üzerinden geçen zaman, hatırlama skorlarında dramatik bir düşüşe neden olmaktadır.
* Kağıttan okuma yapmak, dijital ekrana kıyasla daha yüksek bir anlama skoru sağlamaktadır.
* Işık ve kafein kullanımının her ikisi de odaklanma süresini artırsa da, bu iki faktörün ortak (etkileşim) etkisinin istatistiksel olarak anlamlı olmadığı görülmüştür.

## 📂 Dosyalar

* Projenin tüm teorik arka planını, R çıktılarını ve detaylı hipotez testlerini içeren rapora `Parametrik Analiz.pdf` dosyasından ulaşabilirsiniz.
* Uygulanan tüm istatistiksel testlerin kaynak kodlarını ve Excel veri çıktılarını repodaki diğer dosyalardan inceleyebilirsiniz.
