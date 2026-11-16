# 2 užduotis: Ciklas per įrankius

**1.** **Tikslas:** pačiam išplėsti tą patį `scripts/patikra.sh`, kad jis patikrintų įrankių sąrašą ir suskaičiuotų, kiek trūksta.

**2.** Atidarykite `scripts/patikra.sh` nano. Palikti pirmas dvi eilutes (`#!/usr/bin/env bash` ir `set -euo pipefail`), likusį turinį ištrinti ir pačiam parašyti pagal rėmą:

```bash
# 1. Įrankių sąrašas: jei skriptas paleistas su argumentais, imti juos; jei ne, imti git, python3, curl

# 2. Skaitiklis trūkstamiems, pradžioje 0

# 3. Ciklas per sąrašą:
#    jei įrankis yra: OK ir vardas
#    jei nėra: TRŪKSTA ir vardas, o skaitiklį padidinti per 1

# 4. Jei skaitiklis didesnis už 0: į klaidų kanalą "Trūksta: SKAIČIUS" ir baigti su kodu 1
```

- Šį rėmą nereikia kopijuoti: tai aprašas, ką parašyti
- Arba pradėkite nuo šablono iš lapo `bash komandos.md` (11 skyrius, 2 užduotis): ištrinkite seną turinį, įklijuokite šabloną į `nano scripts/patikra.sh`, pakeiskite `TODO` kodu; pasitikrinkite `bash testai/tikrinti.sh 2`
- Sintaksė: `bash komandos.md` (masyvai, `for`, aritmetika, `$#`)
- Išsaugokite failą

**3.** Paleisti be argumentų ir parodyti išėjimo kodą:

- Turi būti: trys eilutės `OK` (`git`, `python3`, `curl`), kodas 0

**4.** Paleisti su trimis argumentais `git`, `neegzistuoja`, `kitas` ir parodyti išėjimo kodą:

- Turi būti: dvi `TRŪKSTA`, klaidų kanale `Trūksta: 2`, kodas 1

**5.** Paleisti tik su `git` ir parodyti išėjimo kodą:

- Turi būti: viena `OK`, kodas 0

**6.** Papildyti užrašus:

- Faile `docs/bash.md` gale parašykite pačiam: be argumentų kodas 0, su `git neegzistuoja kitas` kodas 1, tik su `git` kodas 0

**7.** Išsaugoti Git'e:

- Įtraukite `scripts` ir `docs` į commit su žinute `Skriptas tikrina įrankių sąrašą`
- Turi būti: `git log --oneline` viršuje `Skriptas tikrina įrankių sąrašą`

**8.** **Pateikimas:** terminalo nuotrauka su trimis kodais 0, 1 ir 0.

Jei užstrigote, pasižiūrėkite `bash komandos.md` ir `git komandos.md`. Daugiau Git komandų: [Git cheat sheet](https://git-scm.com/cheat-sheet).
