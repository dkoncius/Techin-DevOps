# 03 Bash skriptai

Data: 2026-11-17 (antradienis)

## Klasės darbas

Anksčiau mokėsi: Bash skriptus su kintamaisiais ir `if`, `wc -l`, 02 pamokoje `ataskaita.sh`. Argumentų `$1` ir `$#`, išėjimo kodo ir `set -euo pipefail` dar nemokėsi.

Prisiminsime kintamuosius ir `if`, o mokysimės argumentų, išėjimo kodo ir `for` ciklo. Demonstracijoje `~/devops/demo-bash` sukursime `scripts/sveikas.sh`; užduotyse `git-bandymas` kuriate `exercises/*.sh` ir tikrinsite su `tests/check.sh` (04 pamokoje `http-kodas.sh`, 05 pamokoje `paleisti.sh`).

1. Pasitikrinimas po 02: kam neveikė `export`, `tree` ar Pull Request — kartu randame priežastį
2. Bash teorija: [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/03%20Bash%20skriptai/skaidres/skaidres.html), 1–9
3. Demonstracija — lapas `uzduotys/bash komandos.md`: skyriai 0–10 (terminale, `sveikas.sh`, sulaužyti, Git), skaidrė 10 tik planas
4. Pertrauka
5. Užduotys 1–6: po vieną `exercises/*.sh`, `tests/check.sh` — skaidrė 11
6. Užduotis 7 (Git: `git restore`, Pull Request): `uzduotys/git komandos.md`, skaidrė 12
7. Kita paskaita: Tinklų pagrindai — IP, portai, DNS, HTTP

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `7-uzduotis.md`. Skelbiate Teams'e po vieną: šeši pratimai, tada Git. Mokiniams duodate `tests/check.sh`. Komandų lapas: `bash komandos.md`. Git: `git komandos.md`.

## Pamokos eiga (dėstytojui)

Nepatikrinta: Ubuntu (WSL, Bash 5) ir Pull Request GitHub svetainėje.

### Prieš pamoką

Prieš demonstraciją paleiskite:

```bash
bash ~/Desktop/"Techin DevOps"/"kursas/03 Bash skriptai/demo-atstatyti.sh"
```

Skriptas ištrina `~/devops/demo-bash` ir `~/devops/demo-git`, kad demonstracija prasidėtų švariai.

### Demonstracijos žingsniai

Komandų žingsnių čia nėra: demonstraciją sekite `uzduotys/bash komandos.md` skyriuose 0–10. Skaidrėse — teorija (1–9), demonstracijos planas (10), kaip dirbti su pratimais (11) ir Git atšaukimas (12). Užduotyse mokiniai kuria `exercises/*.sh` ir tikrina `bash tests/check.sh N`. Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose.