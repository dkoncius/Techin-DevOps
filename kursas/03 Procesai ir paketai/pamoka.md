# 03 Procesai ir paketai

Data: 2026-11-16 (pirmadienis)

## Klasės darbas

3 val. Skaidrėse **N** rodo pastabas. Kiekviena tema: skaidrės → jūsų demonstracija kitu pavyzdžiu → užduotis Teams'e → mokiniai daro savo. Užduotys eina viena gija viename `devops-projekte`: procesas → skriptas su kintamuoju → paketas → kodas → Pull Request.

1. Pasitikrinimas po 02 (~10 min): parodykite 02 užduotis (komandos yra pačiose užduotyse); kam neveikė teisės ar Pull Request, kartu randame priežastį
2. Procesai (~10 min), tada Užduotis 1 (~15 min): [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/03%20Procesai%20ir%20paketai/skaidres/skaidres.html), 1–5 skaidrės; procesai, PID, fonas, sustabdymas, signalai
3. Aplinkos kintamieji (~10 min), tada Užduotis 2 (~25 min): skaidrės 6–8; aplinkos kintamieji, kelių sąrašas, kodėl nustatymai kintamuosiuose
4. Pertrauka (~15 min)
5. Paketų tvarkyklė (~10 min), tada Užduotis 3 (~20 min): skaidrė 9; Ubuntu (WSL) ir Mac paketų tvarkyklės, įdiegimas, versija
6. Programa skaito aplinką, Pull Request (~10 min), tada Užduotis 4 (~25 min): skaidrės 10–11; programa skaito aplinką, aplinkos failas ir jo pavyzdys
7. Kita paskaita: Bash skriptai: kintamieji, sąlygos, ciklai

Nuorodos: [APT](https://wiki.debian.org/Apt), [Homebrew](https://docs.brew.sh/), [GNU Bash: aplinka](https://www.gnu.org/software/bash/manual/bash.html#Environment)

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `4-uzduotis.md`. Skelbiate Teams'e po vieną: pirma demonstracija, tada darbas. Gija: procesas → skriptas su kintamuoju → paketas → kodas → Pull Request. Komandos yra pačiose užduotyse. Atskiro sprendimo failo nėra.

## Pamokos eiga (dėstytojui)

Patikrinta (2026-11-12, tos pačios komandos, dabar užduotyse): macOS (bash 3.2) su tikru šablonu ir laikina nuotoline repozitorija vietoj GitHub. Nepatikrinta: `apt` (Ubuntu / WSL2), `brew install`, `dpkg -s`, Pull Request GitHub svetainėje.

### Demonstracijos žingsniai

Demonstracijų komandos yra skaidrėse. Rodykite kitu pavyzdžiu nei užduotyje (`sleep 60`, kintamasis `DEMO_VARDAS`, paketas kurį jau turite). Užduoties komandos yra `uzduotys/N-uzduotis.md`. Kasdienių darbų netikrinate, tik rodote eigą. Tikrinimas yra atsiskaityme.
