# 03 Bash skriptai

Data: 2026-11-17 (antradienis)

## Klasės darbas

Anksčiau mokėsi: Bash skriptus su kintamaisiais ir `if` (kaip veikia sąlyga, jie jau žino), `wc -l`, 02 pamokoje `ataskaita.sh`. Argumentų `$1` ir `$#`, išėjimo kodo ir `set -euo pipefail` dar nemokėsi; `for` pas ankstesnį dėstytoją gal buvo, bet reikia pasitikrinti.

Prisiminsime kintamuosius ir `if`, o mokysimės argumentų, išėjimo kodo ir `for` ciklo. Demonstracijoje sukursime aplinkos patikros skriptą `sveikas.sh` (išėjimo kodas leidžia jį naudoti kituose skriptuose ir automatizacijoje; 04 pamokoje tą patį principą naudosime `http-kodas.sh`, 05 pamokoje `paleisti.sh`), o užduotyse mokiniai patys rašo paprastus skriptus su automatine patikra. Pabaigoje išmoksime atšaukti pakeitimus.

1. Pasitikrinimas po 02: parodykite 02 užduotis. Kam neveikė `export`, `tree` ar Pull Request, kartu randame priežastį
2. Pasikartojimas terminale vyksta demonstracijoje (lapo skyriai 1–6: kintamieji, `command -v`, `$?`, `-f`, `-d`, `set --`), atskiros užduoties jam nėra
3. Bash teorija: [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/03%20Bash%20skriptai/skaidres/skaidres.html) 1–9: pristatymas apie Bash skriptus: kas tai yra, kam reikalingi, kaip paleidžiami, skripto sandara, keturios pagrindinės dalys (kintamieji, argumentai, sąlyga, ciklas), išėjimo kodas, gero skripto taisyklės
4. Demonstracija pagal lapą `bash komandos.md` (skaidrė 10): skyriai 0–9, skriptas `sveikas.sh`, sulaužyti ir sutaisyti, Git; patikra `tests/check.sh` rodoma tik prieš užduotis
5. Pertrauka
6. Užduotis 1 (skaidrė 11: aplankas `bash-lesson` iš Teams ir `bash tests/check.sh 1`), Užduotis 2 ir Užduotis 3: mokiniai dirba patys pagal užduočių failus (komandos jau juose)
7. Git pakeitimų atšaukimas (skaidrė 12), tada Užduotis 4: pakeitimų atšaukimas, Pull Request
8. Kita paskaita: Tinklų pagrindai: IP, portai, DNS, HTTP

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `4-uzduotis.md` (pasikartojimas terminale vyksta demonstracijoje). Skelbiate Teams'e po vieną: pirma demonstracija, tada darbas. 1–3 užduotys yra paprasti atskiri skriptai iš aplanko `bash-lesson` (6 pratimai `exercises/01_greet.sh` … `06_backup.sh`, patikra `tests/check.sh N`): 1 užduotis – pratimai 1–2, 2 užduotis – 3–4, 3 užduotis – 5 (6 papildomai). Į Teams keliate zip su aplanku `bash-lesson` be `solutions/` ir be `.git` (modeliniai atsakymai lieka jums); mokiniai išarchyvuoja jį į `~/Desktop/devops`, 1 užduotyje daro `git init` ir sukuria savo GitHub repozitoriją, po kiekvienos užduoties daro commit ir push. Modeliniai atsakymai yra `bash-lesson/solutions/` (4 užduotis be sprendimo failo). 4 užduotis daroma `git-bandymas` projekte, šaka `pamoka-03`. Testai tikrina stdout, klaidų kanalą ir išėjimo kodą, veikia macOS ir Linux/WSL. Užduotyse yra tik tai, ką padaryti, ir „Turi būti“; visos komandos ir pavyzdžiai yra lape `uzduotys/bash komandos.md`.

## Pamokos eiga (dėstytojui)

Pamoka vedama pagal lapą `uzduotys/bash komandos.md` (README tipo: skyriai eina ta pačia tvarka kaip skaidrės, po jų užduočių lentelė, šablonai ir patikra). Skaidrės rodo tik pagrindą, mokiniai lapą atsidaro patys.

Patikrinta (2026-11-12, tos pačios komandos, dabar užduotyse): macOS (Bash 3.2) su tikru šablonu ir laikina nuotoline repozitorija vietoj GitHub. Patikrinta (2026-11-17): `bash-lesson/tests/check.sh` su modeliniais atsakymais macOS Bash 3.2 (30/30). Nepatikrinta: Ubuntu (WSL, Bash 5) ir Pull Request GitHub svetainėje.

### Demonstracijos žingsniai

Prieš paskaitą (ir po repeticijos) paleiskite `demo-atstatyti.sh` (pamokos aplanke): jis ištrina `~/devops/demo-bash` ir `~/devops/demo-git`, kad demonstracija prasidėtų švariai. Norėdami išbandyti užduotis patys, paleiskite (iš bet kur):

```bash
bash ~/Desktop/"Techin DevOps"/"kursas/03 Bash skriptai/testuoti-uzduotis.sh"
```

Jis sukuria `~/Desktop/devops/git-bandymas-test` tokioje būsenoje, kokia yra po 02 pamokos (be GitHub, tikras `git-bandymas` neliečiamas). Užduotyse vietoj `git-bandymas` rašykite `git-bandymas-test`, o 4 užduotyje vietoj Pull Request `git merge`. Pirma demonstracija eina pagal lapo `uzduotys/bash komandos.md` skyrius 1–9 su `scripts/sveikas.sh`: komandos terminale (1–6), skriptas (7), „Sulaužykite ir sutaisykite“ (8): sugadinkite skriptą vienu pakeitimu, paleiskite ir parodykite, ką pamatote, paskui Git (9). Patikros skripto demonstracijoje nėra. Tik tada skelbkite 1 užduotį (10 skyrius: lentelė, patikra `tests/check.sh` ir kaip skaityti ❌). Demonstracijų komandos yra skaidrėse. Rodykite kitu pavyzdžiu nei užduotyje (įrankis `python3`, ne `git`). Užduoties komandos yra `uzduotys/N-uzduotis.md`. Kasdienių darbų netikrinate. Tikrinimas yra atsiskaityme.
