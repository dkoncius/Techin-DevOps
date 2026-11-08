# 02 Linux terminalas: sprendimai (dėstytojui)

Patikrinta: `scripts/terminalas.sh` paleistas macOS (bash) fiktyviame Git repo; `check.sh` išbandytas macOS. Nepatikrinta: Ubuntu (WSL2), prieš pamoką išbandyti abiejose sistemose.

## Kas čia

Pavyzdinis mokinio rezultatas: `pavyzdys/scripts/terminalas.sh` (kur esu, kiek failų, 3 paskutiniai commit'ai) ir `pavyzdys/docs/terminalas.md` (teisių paaiškinimas, `find` komanda, `/items`). `projektas/` kol kas tik „bus papildyta“.

## Kaip rodyti klasėje

1. (~10 min) Praeitos pamokos (01) sprendimas gyvai: po `git pull` atidarykite `pamokos/01 Kas yra DevOps/sprendimai/` ir parodykite `pavyzdys/docs/devops.md`, tada GitHub'e sulietą PR su žyma **Merged**. Mokiniai lygina su savo.
2. (~15 min) Navigacija (komandos veikia ir Mac, ir Ubuntu; skirtumai lentelėje „Kur skiriasi“ pamoka.md): `pwd`, `ls -la`, `cd`. Pavyzdys ne mokinių: jūsų `/tmp/demo/` aplankas su kitais vardais. Dažna klaida: tarpas aplanko varde be kabučių (`cd Mano aplankas`). Windows: studentas WSL terminale pateko į `/mnt/c/...`, o ne į `~/`.
3. (~15 min) Failai: `mkdir -p`, `touch`, `cp`, `mv`, `cat`, `grep`, `>` ir `>>`. Dažna klaida: `>` perrašo failą, o `>>` prideda; mokiniai praranda turinį.
4. (~20 min) Teisės: `ls -l`, `chmod +x`. Sukurkite `labas.sh` (kitas nei mokinių `terminalas.sh`), paleiskite be `x` (`Permission denied`), pridėkite `x`. Dažna klaida: `bash labas.sh` veikia ir be `x`, mokiniai nesupranta skirtumo.
5. (~10 min) Skriptas: `#!/usr/bin/env bash`, `set -euo pipefail`, trys komandos. Dažna klaida: skriptas paleistas ne Git repo aplanke ir `git log` rodo klaidą. Dažna klaida (Windows): failas sukurtas Windows redaktoriumi turi CRLF ir meta `bad interpreter`; sprendimas: kurti WSL redaktoriumi arba `.gitattributes` su `*.sh text eol=lf`.
6. (~10 min) `/items` skaitymas: GET, JSON, 200.
7. Mokiniai daro užduotis (Užduotis 1, 2); pabaigoje `./kursas.sh patikrinti 02`.

## Sprendimas pagal darbus

| Darbas | Kur sprendime |
|---|---|
| Aplanko apžiūra terminale | `ls -la` rodo `.git`, `README.md` ir kt. |
| Šaka `pamoka-02` | `git branch` rodo `pamoka-02` |
| Skriptas `terminalas.sh` | `pavyzdys/scripts/terminalas.sh` |
| Vykdoma teisė ir paleidimas | `ls -l` rodo `x`; `./scripts/terminalas.sh` išveda 3 eilutes |
| Teisių paaiškinimas | `pavyzdys/docs/terminalas.md`, skyrius „Teisės“ |
| Failų sąrašas į `docs/failai.txt` | `pavyzdys/docs/terminalas.md`, skyrius „Failų sąrašas“ |
| `/items` skaitymas | `pavyzdys/docs/terminalas.md`, skyrius `/items` |
| ≥ 2 commit'ai ir sulietas PR | `git log --oneline` ir GitHub **Merged** |

DI, PR ir pateikimas: DI aprašytas (ką paklausė ir kaip patikrino), pateikta sulieto PR nuoroda. Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose (vertinimas.md).
