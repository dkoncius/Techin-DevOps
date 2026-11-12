# 03 Procesai ir paketai

Data: 2026-11-16 (pirmadienis)

## Klasės darbas

3 val. Skaidrėse **N** rodo pastabas. Kiekviena tema: skaidrės → jūsų demonstracija kitu pavyzdžiu → užduotis Teams'e → mokiniai daro savo. Užduotys eina viena gija viename `devops-projekte`: procesas → skriptas su kintamuoju → paketas → kodas → Pull Request.

1. Pasitikrinimas po 02 (~10 min): dėstytojas parodo 02 sprendimą gyvai (02 `pamoka.md`, skyrius „Pamokos eiga“); kam neveikė teisės ar Pull Request, kartu randame priežastį
2. Procesai (~10 min), tada Užduotis 1 (~15 min): [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/03%20Procesai%20ir%20paketai/skaidres/skaidres.html), 1–5 skaidrės; procesai, PID, fonas, sustabdymas, signalai
3. Aplinkos kintamieji (~10 min), tada Užduotis 2 (~25 min): skaidrės 6–8; aplinkos kintamieji, kelių sąrašas, kodėl nustatymai kintamuosiuose
4. Pertrauka (~15 min)
5. Paketų tvarkyklė (~10 min), tada Užduotis 3 (~20 min): skaidrė 9; Ubuntu (WSL) ir Mac paketų tvarkyklės, įdiegimas, versija
6. Programa skaito aplinką, Pull Request (~10 min), tada Užduotis 4 (~25 min): skaidrės 10–11; programa skaito aplinką, aplinkos failas ir jo pavyzdys
7. Kita paskaita: Bash skriptai: kintamieji, sąlygos, ciklai

Nuorodos: [APT](https://wiki.debian.org/Apt), [Homebrew](https://docs.brew.sh/), [GNU Bash: aplinka](https://www.gnu.org/software/bash/manual/bash.html#Environment)

## Užduotys

Užduotys yra atskiruose failuose `uzduotys/1-uzduotis.md` … `4-uzduotis.md` (dėstytojas skelbia Teams'e po vieną: pirma demonstracija, tada darbas). Jos eina viena gija: procesas → skriptas su kintamuoju → paketas → kodas → Pull Request. Dėstytojo sprendimai su komandomis: `uzduotys/N-uzduotis-sprendimas.md`.

## Pamokos eiga (dėstytojui)

Patikrinta (2026-11-12): macOS (bash 3.2): `uzduotys/N-uzduotis-sprendimas.md` komandos ir skaidrių demonstracijos paleistos iš eilės su tikru šablonu `devops-projektas-starter-template` ir laikina nuotoline repozitorija vietoj GitHub. Nepatikrinta: **`apt` dalis (Ubuntu / WSL2)**, `brew install`, `dpkg -s`, `top -o`, Pull Request GitHub svetainėje; išbandyti ranka prieš pamoką abiejose sistemose.

### Demonstracijos žingsniai

Demonstracijų komandos su aprašais yra skaidrėse (`skaidres/skaidres.html`, šaltinis `skaidres/skaidres.md`); laikas, dažnos klaidos ir kada skelbti užduotį rašoma skaidrių pastabose (klavišas **N**). Rodykite viename terminalo lange, vieną komandą po kitos, KITU pavyzdžiu nei užduotyje. Demonstracijos ir sprendimai užduotims yra atskiruose failuose: `uzduotys/1-uzduotis-sprendimas.md` … `4-uzduotis-sprendimas.md`. Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaityme.
