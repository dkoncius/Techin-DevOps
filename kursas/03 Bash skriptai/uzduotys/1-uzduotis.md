# 1 užduotis: Argumentas ir sąlyga

**1.** **Tikslas:** pačiam parašyti skriptą, kuris tikrina vieną įrankį pagal argumentą ir grąžina išėjimo kodą.

**2.** Atnaujinti ir sukurti šaką:

- `cd ~/Desktop/devops/git-bandymas`
- `git switch main`
- `git pull`
- `git switch -c pamoka-03`
- Turi būti: `git branch` rodo žvaigždutę prie `pamoka-03`

**3.** Pasikartoti, ką jau mokėtės pas Edgarą (kintamasis ir `wc -l`) tiesiai terminale:

- `irankis=git`
- `echo "Tikrinu: $irankis"`
- `ls | wc -l`
- Turi būti: `Tikrinu: git` ir skaičius (kiek failų ir aplankų yra šiame aplanke)
- Toliau tą patį kintamąjį pakeisime argumentu `$1`: skriptas gaus įrankio vardą iš komandos eilutės

**4.** Atidaryti failą skriptui:

- `mkdir -p scripts`
- `nano scripts/patikra.sh`

**5.** Pačiam parašyti skriptą pagal aprašą:

- Pirma eilutė: `#!/usr/bin/env bash`, antra eilutė: `set -euo pipefail`
- Jei skriptas gavo mažiau nei vieną argumentą: į klaidų kanalą parašyti `Naudojimas: ./scripts/patikra.sh įrankis` ir baigti kodu 2
- Jei įrankis, kurio vardas yra pirmas argumentas, yra: parašyti `OK` ir to įrankio vardą
- Jei jo nėra: parašyti `TRŪKSTA` ir įrankio vardą, baigti kodu 1
- Užuominos: `$#` yra argumentų skaičius, `$1` yra pirmas argumentas, `command -v ĮRANKIS >/dev/null 2>&1` baigiasi kodu 0, kai įrankis yra, `echo "..." >&2` rašo į klaidų kanalą, `exit KODAS` baigia skriptą. Žr. `bash komandos.md`
- Išsaugoti: `Ctrl+O`, `Enter`, `Ctrl+X`

**6.** Leisti paleisti skriptą:

- `chmod +x scripts/patikra.sh`

**7.** Paleisti su `git`:

- `./scripts/patikra.sh git; echo "kodas: $?"`
- Turi būti: `OK      git`, kodas 0
- `echo $?` rašykite iškart, ne po kitos komandos

**8.** Paleisti su neegzistuojančiu įrankiu:

- `./scripts/patikra.sh neegzistuoja; echo "kodas: $?"`
- Turi būti: `TRŪKSTA neegzistuoja`, kodas 1

**9.** Paleisti be argumento:

- `./scripts/patikra.sh; echo "kodas: $?"`
- Turi būti: žinutė klaidų kanale, kodas 2
- Jei neveikia, palyginkite su dėstytojo parodytu sprendimu

**10.** Užrašyti rezultatą:

- `mkdir -p docs`
- `nano docs/bash.md`
- Parašyti pačiam: `./scripts/patikra.sh git` baigėsi kodu 0, `neegzistuoja` kodu 1, be argumento kodu 2

**11.** Išsaugoti Git'e:

- `git add scripts docs`
- `git commit -m "Pridėtas patikra.sh"`
- Turi būti: `git log --oneline` viršuje `Pridėtas patikra.sh`

**12.** **Pateikimas:** terminalo nuotrauka su trimis paleidimais ir kodais 0, 1 ir 2.

Jei užstrigote, pasižiūrėkite `bash komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
