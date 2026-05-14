# ==============================================================================
# BILISSEL PERFORMANS VE OGRENME SURECLERI - ANOVA ANALAZLERI
# ==============================================================================

# Gerekli kutuphaneler
# install.packages("emmeans")
# install.packages("writexl")
library(emmeans)
library(writexl)

# ------------------------------------------------------------------------------
# 1. TEK YONLU ANOVA: Ses Duzeyinin Okuma H??z??na Etkisi
# ------------------------------------------------------------------------------
# Veri Yukleme
ses_duzeyi <- factor(c(rep("Sessiz", 10), rep("Orta", 10), rep("Yuksek", 10)))
okuma_suresi <- c(4.2, 3.8, 4.5, 4.0, 3.9, 4.1, 4.4, 3.7, 4.3, 4.1, 
                  5.1, 4.9, 5.5, 5.0, 5.2, 4.8, 5.4, 5.1, 5.3, 5.2,
                  6.8, 7.2, 6.5, 7.5, 8.0, 7.1, 6.9, 7.4, 7.8, 7.3)

ver_tek_yonlu <- data.frame(ses_duzeyi, okuma_suresi)

# Normallik ve Model C??kt??s??
tapply(ver_tek_yonlu$okuma_suresi, ver_tek_yonlu$ses_duzeyi, shapiro.test)
model_tek_yonlu <- aov(okuma_suresi ~ ses_duzeyi, data = ver_tek_yonlu)

summary(model_tek_yonlu)

# Hangi gruplar arasinda fark var? (Post-Hoc)
TukeyHSD(model_tek_yonlu)


# ------------------------------------------------------------------------------
# 2. TEKRARLI OLCUMLU ANOVA: Zaman??n Hat??rlama Uzerindeki Etkisi
# ------------------------------------------------------------------------------
# Veri Yukleme
id <- factor(rep(1:8, each = 3))
zaman <- factor(rep(c("Hemen", "1Saat", "1Gun"), 8))
skor <- c(19,15,8, 18,14,7, 20,17,10, 17,13,6, 19,16,9, 18,15,8, 16,12,5, 20,18,11)

ver_tekrarli <- data.frame(id, zaman, skor)

# Normallik ve Model C??kt??s??
tapply(ver_tekrarli$skor, ver_tekrarli$zaman, shapiro.test)
model_tekrarli <- aov(skor ~ zaman + Error(id/zaman), data = ver_tekrarli)

summary(model_tekrarli)

# Hangi zaman dilimleri aras??nda fark var? (Post-Hoc - Bonferroni d??zeltmesi ile)
model_tekrarli_lm <- aov(skor ~ zaman, data = ver_tekrarli) 
karsilastirma <- emmeans(model_tekrarli_lm, ~ zaman)
pairs(karsilastirma, adjust = "bonferroni")


# ------------------------------------------------------------------------------
# 3. RASTGELE BLOK DUZENI: Okuma Materyali ve Akademik Seviye
# ------------------------------------------------------------------------------
# Veri Yukleme
materyal <- factor(rep(c("Dijital", "Kagit"), 6))
sinif <- factor(rep(c("1.Sinif", "3.Sinif"), each = 6))
anlama_skoru <- c(65,72, 70,75, 68,74, 82,88, 85,90, 80,86)

ver_blok <- data.frame(materyal, sinif, anlama_skoru)

# Model C??kt??s??
model_blok <- aov(anlama_skoru ~ materyal + sinif, data = ver_blok)
summary(model_blok)


# ------------------------------------------------------------------------------
# 4. COK ETKENLI (2x2) FAKTORIYEL ANOVA: Is??k ve Kafein Etkilesimi
# ------------------------------------------------------------------------------
# Veri Yukleme
isik <- factor(rep(c("Dusuk", "Yuksek"), each = 10))
kafein <- factor(rep(c("Var", "Yok", "Var", "Yok"), each = 5))
odaklanma_suresi <- c(120,135,128,140,132, 90,85,95,88,92, 
                      180,175,190,185,178, 150,145,155,148,152)

ver_faktoriyel <- data.frame(isik, kafein, odaklanma_suresi)

# Normallik (Etkilesim gruplari icin)
tapply(ver_faktoriyel$odaklanma_suresi, 
       interaction(ver_faktoriyel$isik, ver_faktoriyel$kafein), 
       shapiro.test)

# Model C??kt??s??
model_faktoriyel <- aov(odaklanma_suresi ~ isik * kafein, data = ver_faktoriyel)
summary(model_faktoriyel)


# ------------------------------------------------------------------------------
# 5. VERI SETINI DISARI AKTARMA (EXCEL)
# ------------------------------------------------------------------------------
# Veri setlerini bir liste haline getiriyoruz
odev_sayfalari <- list(
  "Tek_Yonlu_ANOVA" = ver_tek_yonlu,
  "Tekrarli_Olcumlu" = ver_tekrarli,
  "Blok_Duzeni" = ver_blok,
  "Cok_Etkenli_Duzey" = ver_faktoriyel
)

# Excel dosyasi olarak kaydetme
write_xlsx(odev_sayfalari, "ANOVA_Analiz_Verileri.xlsx")

