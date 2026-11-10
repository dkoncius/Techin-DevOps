# 02–06 pamokų suspaudimo pasiūlymas

Statusas: **pasirinktas variantas A** (2026-11-09). `kurso-planas.md` ir pamokų `pamoka.md` dar nekeisti, kol nepatvirtinta.

## Pagrindas

Šaltiniai: `medziaga/praeitos-temos/` (Edgaro 13 temų), paskutinis Edgaro atsiskaitymas (21 balas) ir 08 pamoka (Git, GitHub, VS Code).

| Jau moka (patikrinta atsiskaitymo užduotimis) | Nemokėjo |
|---|---|
| `useradd`, `usermod`, `gpasswd`, `su`, `chmod`, `ls -l` | `if`, `for`, argumentai Bash'e |
| `mkdir`, `touch`, `cp`, `mv`, `rm`, `find`, `grep`, `zip`, `file` | `curl`, HTTP kodai, DNS, portų paieška (`ss`, `lsof`) |
| `ps aux`, `ps -u`, zombiai, peradresavimas `>` | `ssh-keygen`, prisijungimas raktu, `~/.ssh/config` |
| Bash skriptas su `wc -l` ir kintamaisiais | `git switch`, `merge`, konfliktai, PR, `gh` |
| SSH prisijungimas, Apache, Docker su Dockerfile | WSL (jie dirbo VirtualBox Ubuntu) |
| Git: `init`, `add`, `commit`, `push`, `pull`, `restore`, `reset --hard`, `log` | Python skaitymas, Compose, volume, tinklai |

**Išvada:** 02–06 nebereikia mokyti nuo nulio. Reikia trumpo pasitikrinimo ir daugiau laiko naujovėms. Tikėtina Edgaro klaida: komandas jie moka, bet aplinką (WSL / Mac), šablono susikūrimą ir PR darbo eigą mato pirmą kartą.

## Pasiūlymas pagal pamoką

| Pamoka | Ką sutrumpinti (pakartojimas) | Kas lieka kaip naujiena | Pokytis |
|---|---|---|---|
| **02 Linux terminalas** (perkrauta, >3 val.) | Navigacija, failai, `cp`/`mv`/`find`/`grep`, `chmod` teorija: vietoj dviejų teorijų blokų viena ~10 min. „ar jau moka“ užduotis | Šablono susikūrimas ir klonavimas į `~/devops`; `Permission denied` ties `.sh` ir `.env`; `#!/usr/bin/env bash`; Python `/items` skaitymas ir pirmas PR | −45 min, telpa į 3 val. |
| **03 Procesai ir paketai** | `ps`, `top`, `kill`, `export`, `apt`: ~15 min viena užduotis; zombiai ir `systemctl` tik priminti | Mac `brew` ir WSL skirtumai; aplinkos kintamasis skripte; `DB_HOST` per PR | −1 val. Į atlaisvintą laiką: 10 min diagnostinis testas (2026-11-16) |
| **04 Bash skriptai** | Kintamieji, `read`, `$(...)`, `chmod u+x`, `apt` skripte: tik greita apžvalga | `if`/`[[ ]]`, `for`, argumentai `$1`/`$#`, išėjimo kodas `$?`/`exit`, `set -euo pipefail`, funkcijos | Pagrindinė naujiena, nesutrumpinti |
| **05 Tinklų pagrindai** | Apache/Nginx portą jie jau matė: panaudoti kaip pavyzdį, o ne aiškinti iš naujo | `curl`, HTTP kodai, DNS (`dig`/`nslookup`), kuris procesas klauso porto (`ss -ltnp`, `lsof -i`) | Nesutrumpinti |
| **06 SSH ir raktai** | Slaptažodžio prisijungimas ir `scp`: ~10 min | `ssh-keygen`, raktas GitHub'e, `chmod 600`, `~/.ssh/config`, kodėl privatus raktas nekeliamas į Git | −30 min |

## Ką daryti su atlaisvintu laiku (~2 val.)

Pasirinkti vieną:

1. **A. Perkelti iš 07 / 08:** merge konfliktai, `.gitignore`, `restore`/`reset` kartojimas jau 03–06 pabaigoje po 10–15 min. Tada 07 lieka konfliktams, o 08 PR ir review. Rekomenduoju, nes Git yra jų silpniausia vieta po 01.
2. **B. Pridėti DevOps temų, kurių Edgaras nemokė:** logai (`journalctl`, `tail -f`), `jq`, `cron`, `df`/`du`. Praktiška, bet planas turi būti papildytas.
3. **C. Nieko nepridėti:** kiekviena pamoka trumpesnė, užduotys su daugiau rezervo.

## Diagnostinis testas 2026-11-16 (10 min)

Imti 5–6 užduotis iš jų paskutinio atsiskaitymo ir patikrinti kiekvieną vienu klausimu, kad matytume, kas tikrai išlikę:

1. `ps aux | grep Z` (zombiai) arba procesų išrašymas į failą (užd. 7, 14).
2. `find /home -name "*mozilla*"` (užd. 13).
3. Bash skriptas, skaičiuojantis failus namuose: `find ~ -type f | wc -l` (užd. 15).
4. `chmod` ir `ls -l` skaitymas (užd. 11, 12).
5. Git: `init` → `commit` → `push` ir `restore` (08 pamoka).
6. Docker: `Dockerfile` su `FROM nginx` (užd. 18).

Pagal rezultatus 03–06 laiką galima dar perskirstyti.

## Plano pataisos, jei patvirtinsite

- 01 aprašas: „Git kelias nuo nulio“ → „greitas Git pakartojimas + šaka ir merge“ (pamoka `01 Kas yra DevOps/pamoka.md` jau perrašyta taip).
- 07: „Git pagrindai“ → „Šakos ir konfliktai“ (be `init`/`commit` kartojimo).
- 08: pirmas PR jau 02 pamokoje, todėl 08 pradėti nuo review ir branch apsaugos.
- 10 atsiskaitymo reikalavimai nesikeičia.

## Rizikos

- Atsiskaitymas buvo VirtualBox Ubuntu, o mes dirbame WSL / Mac: komandos gali elgtis kitaip, ypač `brew` ir `ls` parametrai.
- Atsiskaitymo atsakymai buvo screenshot'ais; neaišku, kiek kas padarė patys, todėl diagnostinis testas svarbus.
- 02 pamoka vis dar ilga dėl šablono susikūrimo; jei vėluosite, PR dalį galima perkelti į 03.
