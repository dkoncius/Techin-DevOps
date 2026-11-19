# 04 Bash skripto tikrinimas

## Klasės darbas

Anksčiau mokėsi: Bash skriptą, argumentus, `if`, išėjimo kodą ir stderr (03 pamoka, `scripts/patikra.sh`).

Prisiminsime paleidimą ir išėjimo kodą, o mokysimės užfiksuoti išvestį, palyginti rezultatą ir parašyti testą. Detalus gidas — `README.md`; skaidrės rodo kelią ir gyvą demonstraciją.

1. Skaidrės 1–7: schema, demonstracija, sugadintas skriptas, dažnos klaidos
2. Užduotys 1–6: `uzduotys/*.sh`, `./testai/check.sh`; komandos — README ir užduočių komentarai
3. Užduočių skaidrė: 8
3. Kita paskaita: Git būsenos tikrinimas

## Užduotys

Užduotys yra `uzduotys/01_out_kodas.sh` … `06_raudonas_testas.sh`. Skelbiate Teams'e po vieną. Tikrintuvas: `./testai/check.sh`. Sprendimai dėstytojui: `sprendimai/` (mokiniams neduoti).

### 1 Išvestis ir kodas

1. **Tikslas:** Paleisti `scripts/patikra.sh` du kartus ir parodyti išvestį, kodą ir pirmą išvesties eilutę (`2>/dev/null`).

### 2 Palyginimai

1. **Tikslas:** Tris patikras su viena išvesties eilute ✅ arba ❌ (`=`, `-eq`, `grep -qF`).

### 3 Pirmas testas faile

1. **Tikslas:** Testas `scripts/patikra.sh` su `PASS`, `FAIL` ir `exit 1`, kai yra ❌.

### 4 Testas skaiciuok.sh

1. **Tikslas:** Nuo nulio parašyti testą `scripts/skaiciuok.sh` (teisingi ir blogi atvejai).

### 5 Visada žalias testas

1. **Tikslas:** Rasti, kodėl testas lieka žalias su sugadintu skriptu, ir sutaisyti.

### 6 Raudonas testas su geru skriptu

1. **Tikslas:** Rasti dvi klaidas teste ir sutaisyti, kad su geru skriptu būtų žalias.

## Pamokos eiga (dėstytojui)

Demonstracija seka skaidres 4–9: `scripts/sveikas.sh`, `pavyzdziai/sveikas-testas.sh`, vienas pakeitimas ir `git restore`. Užduotyse tikrinamas `scripts/patikra.sh` ir `scripts/skaiciuok.sh`.