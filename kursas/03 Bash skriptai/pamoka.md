# 03 Bash skriptai

Data: 2026-11-17 (antradienis)

## Klasės darbas

Anksčiau mokėsi: Bash skriptus su kintamaisiais ir `if` (kaip veikia sąlyga, jie jau žino), `wc -l`, 02 pamokoje `ataskaita.sh`. Argumentų `$1` ir `$#`, išėjimo kodo ir `set -euo pipefail` dar nemokėsi; `for` pas ankstesnį dėstytoją gal buvo, bet reikia pasitikrinti.

Prisiminsime kintamuosius ir `if`, o mokysimės argumentų, išėjimo kodo ir `for` ciklo. Iš jų per pamoką sukursime aplinkos patikros skriptą `scripts/patikra.sh`: viena komanda parodo, ar įrankiai ir projekto failai yra vietoje. Tokią patikrą komandos paleidžia prieš darbą ar paleidimą, o išėjimo kodas leidžia ją naudoti kituose skriptuose ir automatizacijoje (04 pamokoje tą patį principą naudosime `http-kodas.sh`, 05 pamokoje `paleisti.sh`). Pabaigoje išmoksime `.gitignore` ir atšaukti pakeitimus.

1. Pasitikrinimas po 02: parodykite 02 užduotis. Kam neveikė `export`, `tree` ar Pull Request, kartu randame priežastį
2. Pasikartojimas terminale, tada Užduotis 1: kintamieji, `command -v`, `$?`, `-f`, `-d`, `set --` (be skripto, žr. `bash komandos.md` ir `git komandos.md`)
3. Argumentai, sąlyga ir išėjimo kodas, tada Užduotis 2: [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/03%20Bash%20skriptai/skaidres/skaidres.html), 1–7 skaidrės; skriptas auga po vieną dalį, argumentai, sąlyga, išėjimo kodas
4. Ciklas ir saugus skriptas, tada Užduotis 3: skaidrė 8; masyvas, aritmetika, išėjimas pirmoje klaidoje
5. Pertrauka
6. Failų patikra, tada Užduotis 4: skaidrė 9; failų ir aplankų patikra, skriptas iš projekto šaknies
7. Tikras Bash ir Git, tada Užduotis 5: skaidrės 10–11; ignoravimas, pakeitimų atšaukimas, Pull Request
8. Kita paskaita: Tinklų pagrindai: IP, portai, DNS, HTTP

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `5-uzduotis.md`. Skelbiate Teams'e po vieną: pirma demonstracija, tada darbas. 1 užduotis yra pasikartojimas terminale, 2–4 užduotys plečia tą patį `scripts/patikra.sh`, 5 užduotis baigiama Pull Request. Mokiniai skriptus rašo patys pagal aprašą. Pilni skriptai ir laukiami rezultatai yra `uzduotys/1-uzduotis-sprendimas.md` … `4-uzduotis-sprendimas.md` (5 užduotis be sprendimo failo). Užduotyse yra tik tai, ką padaryti, ir „Turi būti“; visos komandos ir pavyzdžiai yra lape `uzduotys/bash komandos.md`, kurį mokiniai naudoja patys.

## Pamokos eiga (dėstytojui)

Patikrinta (2026-11-12, tos pačios komandos, dabar užduotyse): macOS (Bash 3.2) su tikru šablonu ir laikina nuotoline repozitorija vietoj GitHub. Nepatikrinta: Ubuntu (WSL, Bash 5) ir Pull Request GitHub svetainėje.

### Demonstracijos žingsniai

Prieš paskaitą (ir po repeticijos) paleiskite `demo-atstatyti.sh` (pamokos aplanke): jis ištrina `~/devops/demo-bash` ir `~/devops/demo-git`, kad demonstracija prasidėtų švariai. Norėdami išbandyti užduotis patys, paleiskite (iš bet kur):

```bash
bash ~/Desktop/"Techin DevOps"/"kursas/03 Bash skriptai/testuoti-uzduotis.sh"
```

Jis sukuria `~/Desktop/devops/git-bandymas-test` tokioje būsenoje, kokia yra po 02 pamokos (be GitHub, tikras `git-bandymas` neliečiamas). Užduotyse vietoj `git-bandymas` rašykite `git-bandymas-test`, o 5 užduotyje vietoj Pull Request `git merge`. Demonstracijų komandos yra skaidrėse. Rodykite kitu pavyzdžiu nei užduotyje (įrankis `python3`, ne `git`). Užduoties komandos yra `uzduotys/N-uzduotis.md`. Kasdienių darbų netikrinate. Tikrinimas yra atsiskaityme.
