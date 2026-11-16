# 2 užduotis: Ciklas per įrankius

**1.** **Tikslas:** pačiam išplėsti tą patį `scripts/patikra.sh`, kad jis patikrintų įrankių sąrašą ir suskaičiuotų, kiek trūksta.

**2.** Atidaryti skriptą:

- `nano scripts/patikra.sh`

**3.** Palikti pirmas dvi eilutes (`#!/usr/bin/env bash` ir `set -euo pipefail`), likusį turinį ištrinti ir pačiam parašyti pagal rėmą:

```bash
# 1. Jei yra argumentų: irankiai=("$@"). Jei nėra: irankiai=(git python3 curl)

truksta=0

# 2. for ciklas per "${irankiai[@]}":
#    jei įrankis yra: OK ir vardas
#    jei nėra: TRŪKSTA ir vardas, o truksta padidinti per 1: truksta=$((truksta + 1))

# 3. Jei truksta didesnis už 0: į klaidų kanalą "Trūksta: SKAIČIUS" ir exit 1
```

- Šį rėmą nereikia kopijuoti: tai aprašas, ką parašyti
- Užuominos: `[ "$#" -gt 0 ]`, `for irankis in "${irankiai[@]}"; do ... done`, `[ "$truksta" -gt 0 ]`. Žr. `bash komandos.md`
- Išsaugoti: `Ctrl+O`, `Enter`, `Ctrl+X`

**4.** Paleisti be argumentų:

- `./scripts/patikra.sh; echo "kodas: $?"`
- Turi būti: trys eilutės `OK` (`git`, `python3`, `curl`), kodas 0

**5.** Paleisti su trūkstamais:

- `./scripts/patikra.sh git neegzistuoja kitas; echo "kodas: $?"`
- Turi būti: dvi `TRŪKSTA`, klaidų kanale `Trūksta: 2`, kodas 1

**6.** Paleisti tik su `git`:

- `./scripts/patikra.sh git; echo "kodas: $?"`
- Turi būti: viena `OK`, kodas 0

**7.** Papildyti užrašus:

- `nano docs/bash.md`
- Gale parašyti pačiam: be argumentų kodas 0, su `git neegzistuoja kitas` kodas 1, tik su `git` kodas 0

**8.** Išsaugoti Git'e:

- `git add scripts docs`
- `git commit -m "Skriptas tikrina įrankių sąrašą"`
- Turi būti: `git log --oneline` viršuje `Skriptas tikrina įrankių sąrašą`

**9.** **Pateikimas:** terminalo nuotrauka su trimis kodais 0, 1 ir 0.

Jei užstrigote, pasižiūrėkite `bash komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
