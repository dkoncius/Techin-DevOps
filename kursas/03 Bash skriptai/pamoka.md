# 03 Bash skriptai

Data: 2026-11-17 (antradienis)

## Klasės darbas

Anksčiau mokėsi: Bash skriptus su kintamaisiais ir `if` (kaip veikia sąlyga, jie jau žino), `wc -l`, 02 pamokoje `ataskaita.sh`. Argumentų `$1` ir `$#`, išėjimo kodo ir `set -euo pipefail` dar nemokėsi; `for` pas ankstesnį dėstytoją gal buvo, bet reikia pasitikrinti.

Prisiminsime kintamuosius ir `if`, o mokysimės argumentų, išėjimo kodo ir `for` ciklo. Iš jų per pamoką sukursime aplinkos patikros skriptą `scripts/patikra.sh`: viena komanda parodo, ar įrankiai ir projekto failai yra vietoje. Tokią patikrą komandos paleidžia prieš darbą ar paleidimą, o išėjimo kodas leidžia ją naudoti kituose skriptuose ir automatizacijoje (04 pamokoje tą patį principą naudosime `http-kodas.sh`, 05 pamokoje `paleisti.sh`). Pabaigoje išmoksime `.gitignore` ir atšaukti pakeitimus.

1. Pasitikrinimas po 02: parodykite 02 užduotis. Kam neveikė `export`, `tree` ar Pull Request, kartu randame priežastį
2. Pasikartojimas terminale vyksta demonstracijoje (lapo skyriai 1–6: kintamieji, `command -v`, `$?`, `-f`, `-d`, `set --`), atskiros užduoties jam nėra
3. Bash teorija: [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/03%20Bash%20skriptai/skaidres/skaidres.html) 1–9: pristatymas apie Bash skriptus: kas tai yra, kam reikalingi, kaip paleidžiami, skripto sandara, keturios pagrindinės dalys (kintamieji, argumentai, sąlyga, ciklas), išėjimo kodas, gero skripto taisyklės
4. Demonstracija pagal lapą `bash komandos.md` (skaidrė 10): skyriai 0–10, skriptas `sveikas.sh`, patikra, sulaužyti ir sutaisyti, Git
5. Pertrauka
6. Užduotis 1 (skaidrė 11: šablonas ir `bash testai/tikrinti.sh 1`), Užduotis 2 ir Užduotis 3: mokiniai dirba patys pagal lapo 11 skyrių
7. Git ignoravimas ir atšaukimas (skaidrė 12), tada Užduotis 4: pakeitimų atšaukimas, Pull Request
8. Kita paskaita: Tinklų pagrindai: IP, portai, DNS, HTTP

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `4-uzduotis.md` (pasikartojimas terminale vyksta demonstracijoje, o šaką `pamoka-03` mokiniai susikuria pagal lapo 11 skyrių). Skelbiate Teams'e po vieną: pirma demonstracija, tada darbas. 1–3 užduotys plečia tą patį `scripts/patikra.sh`, 4 užduotis baigiama Pull Request. Mokiniai skriptus rašo patys pagal aprašą. Pilni skriptai ir laukiami rezultatai yra `uzduotys/1-uzduotis-sprendimas.md` … `3-uzduotis-sprendimas.md` (4 užduotis be sprendimo failo). Visi gauna šablonus (komentarai `TODO`, kuriuos reikia pakeisti kodu): jie yra lapo `uzduotys/bash komandos.md` 11 skyriuje prie kiekvienos užduoties (kopijos `starteris/1-patikra.sh`, `2-patikra.sh`, `3-patikra.sh` yra pamokos aplanke), mokinys įklijuoja į `scripts/patikra.sh` ir užpildo. Pasitikrina pats iš projekto šaknies: `bash testai/tikrinti.sh 1` (arba 2, 3); patikros kodas yra to paties lapo 8 skyriuje. Testai tikrina stdout, klaidų kanalą ir išėjimo kodą, veikia macOS ir Linux/WSL. Užduotyse yra tik tai, ką padaryti, ir „Turi būti“; visos komandos ir pavyzdžiai yra lape `uzduotys/bash komandos.md`, kurį mokiniai naudoja patys.

## Pamokos eiga (dėstytojui)

Pamoka vedama pagal lapą `uzduotys/bash komandos.md` (README tipo: skyriai eina ta pačia tvarka kaip skaidrės, po jų užduočių lentelė, šablonai ir patikra). Skaidrės rodo tik pagrindą, mokiniai lapą atsidaro patys.

Patikrinta (2026-11-12, tos pačios komandos, dabar užduotyse): macOS (Bash 3.2) su tikru šablonu ir laikina nuotoline repozitorija vietoj GitHub. Patikrinta (2026-11-16): `bash komandos.md` pavyzdžiai ir `testai/tikrinti.sh` (`demo`, 2, 3, 4) macOS Bash 3.2. Nepatikrinta: Ubuntu (WSL, Bash 5) ir Pull Request GitHub svetainėje.

### Demonstracijos žingsniai

Prieš paskaitą (ir po repeticijos) paleiskite `demo-atstatyti.sh` (pamokos aplanke): jis ištrina `~/devops/demo-bash` ir `~/devops/demo-git`, kad demonstracija prasidėtų švariai. Norėdami išbandyti užduotis patys, paleiskite (iš bet kur):

```bash
bash ~/Desktop/"Techin DevOps"/"kursas/03 Bash skriptai/testuoti-uzduotis.sh"
```

Jis sukuria `~/Desktop/devops/git-bandymas-test` tokioje būsenoje, kokia yra po 02 pamokos (be GitHub, tikras `git-bandymas` neliečiamas). Užduotyse vietoj `git-bandymas` rašykite `git-bandymas-test`, o 4 užduotyje vietoj Pull Request `git merge`. Pirma demonstracija eina pagal lapo `uzduotys/bash komandos.md` skyrius 1–10 su `scripts/sveikas.sh`: komandos terminale (1–6), skriptas (7), patikra `bash testai/tikrinti.sh demo` (8), „Sulaužykite ir sutaisykite“ (9): sugadinkite skriptą vienu pakeitimu, parodykite ❌ ir sutaisykite, paskui Git (10). Tik tada skelbkite 1 užduotį (11 skyrius: lentelė, šablonai ir patikros). Demonstracijų komandos yra skaidrėse. Rodykite kitu pavyzdžiu nei užduotyje (įrankis `python3`, ne `git`). Užduoties komandos yra `uzduotys/N-uzduotis.md`. Kasdienių darbų netikrinate. Tikrinimas yra atsiskaityme.
