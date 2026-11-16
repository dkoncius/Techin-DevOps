# 2 užduotis: Argumentai ir išėjimo kodas

**1.** **Tikslas:** pradėti aplinkos patikros skriptą `scripts/patikra.sh` nuo to, ką išbandėte terminale, ir žingsnis po žingsnio paversti jį skriptu, kuris tikrina įrankį pagal argumentą ir grąžina išėjimo kodą. Per 3 ir 4 užduotis jis pasidarys visos aplinkos patikra.

**2.** Tai, ką bandėte terminale, įrašyti į skriptą ir pačiam parašyti `if`:

- Sukurkite aplanką `scripts` (jei jo nėra) ir skriptą `scripts/patikra.sh` nano
- Pirma eilutė nurodo `bash`, toliau kintamasis `irankis=git` ir eilutė `Tikrinu: git`
- Toliau pagal aprašą: jei įrankis yra, parašykite `OK` ir vardą, kitaip `TRŪKSTA` ir vardą (po `OK` paliekami 6 tarpai, kad išsilygiuotų)
- Išsaugokite, leiskite skriptą vykdyti ir paleiskite
- Turi būti: `Tikrinu: git` ir `OK      git`

**3.** Vietoj pastovaus vardo imti pirmą argumentą:

- Kintamojo `irankis` reikšmė turi būti pirmas argumentas iš komandos eilutės
- Paleiskite skriptą su `python3`, tada su `neegzistuoja`
- Turi būti: `OK      python3`, tada `TRŪKSTA neegzistuoja`

**4.** Grąžinti išėjimo kodą:

- Antroje eilutėje įjunkite griežtą režimą (`set -euo pipefail`)
- Kai įrankio nėra, po `TRŪKSTA` eilutės baikite skriptą su kodu 1
- Paleiskite su `git` ir su `neegzistuoja`, po kiekvieno iškart parodykite išėjimo kodą
- Turi būti: `OK      git` ir `kodas: 0`, tada `TRŪKSTA neegzistuoja` ir `kodas: 1`
- Kodą rodykite iškart po paleidimo, ne po kitos komandos

**5.** Apsaugoti nuo trūkstamo argumento:

- Skripto pradžioje patikrinkite, ar yra bent vienas argumentas
- Jei nėra, į klaidų kanalą parašykite `Naudojimas: ./scripts/patikra.sh įrankis` ir baikite su kodu 2
- Eilutę `Tikrinu: ...` ištrinkite
- Turi būti: skriptas be argumento nebepaleidžia tikrinimo

**6.** Paleisti visus tris atvejus ir po kiekvieno parodyti išėjimo kodą:

- Su `git`, su `neegzistuoja`, be argumento
- Turi būti: `OK      git` ir kodas 0
- Turi būti: `TRŪKSTA neegzistuoja` ir kodas 1
- Turi būti: naudojimo žinutė ir kodas 2

**7.** Užrašyti rezultatą:

- Sukurkite aplanką `docs` ir failą `docs/bash.md`
- Parašykite pačiam: `./scripts/patikra.sh git` baigėsi kodu 0, `neegzistuoja` kodu 1, be argumento kodu 2

**8.** Išsaugoti Git'e:

- Įtraukite `scripts` ir `docs` į commit su žinute `Pridėtas patikra.sh`
- Turi būti: `git log --oneline` viršuje `Pridėtas patikra.sh`

**9.** **Pateikimas:** terminalo nuotrauka su trimis paleidimais ir kodais 0, 1 ir 2.

Jei užstrigote, pasižiūrėkite `bash komandos.md` ir `git komandos.md`. Daugiau Git komandų: [Git cheat sheet](https://git-scm.com/cheat-sheet).
