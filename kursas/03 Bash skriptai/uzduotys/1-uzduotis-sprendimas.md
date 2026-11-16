# 1 užduotis, sprendimas (dėstytojui): Bash pasikartojimas

Numeriai atitinka užduoties žingsnius. Tai pasikartojimas: kam nepavyksta, tą žingsnį kartu su juo išsiaiškinkite, o tada eikite toliau. Skriptas pradedamas tik 2 užduotyje.

**2.** Šaka:

```bash
cd ~/Desktop/devops/git-bandymas
git switch main
git pull
ls uzrasai scripts
git switch -c pamoka-03
git branch
```

Ką daro: `cd` nueina į projektą, `git switch main` grįžta į pagrindinę šaką, `git pull` atsisiunčia sulietus pakeitimus (čia ateina 02 pamokos darbas), `ls` parodo, ar failai atėjo, `git switch -c` sukuria naują šaką ir joje dirbama toliau, `git branch` parodo šakas.

Laukiama: `ls` rodo `serveriai.txt` ir `ataskaita.sh` (02 PR sulietas), žvaigždutė prie `pamoka-03`. Jei failų nėra, mokinio 02 Pull Request nesulietas: jį reikia sulieti GitHub'e ir vėl paleisti `git pull` (tada šaką `pamoka-03` geriausia sukurti iš naujo). Dažna klaida: komandos paleistos ne `git-bandymas` aplanke.

**3.** Kintamieji:

```bash
irankis=git
echo "Tikrinu: $irankis"
irankis=python3
echo "Tikrinu: $irankis"
```

Ką daro: `irankis=git` įrašo reikšmę (be tarpų aplink `=`), `$irankis` ją atspausdina, antrasis priskyrimas reikšmę pakeičia.

Laukiama: `Tikrinu: git`, tada `Tikrinu: python3`. Dažna klaida: tarpai aplink `=` (`irankis = git`), tada Bash bando paleisti programą `irankis`.

**4.** `command -v` ir išėjimo kodas:

```bash
command -v "$irankis"; echo "kodas: $?"
irankis=neegzistuoja
command -v "$irankis"; echo "kodas: $?"
```

Ką daro: `command -v` parodo kelią iki įrankio, jei jis yra, o jei nėra, nieko neparodo ir baigiasi kodu 1. `$?` yra paskutinės komandos išėjimo kodas (0 reiškia sėkmę, kitaip klaidą). Todėl `echo "kodas: $?"` rašomas iškart po komandos per `;`: tarp jų nebūtų jokios kitos komandos, kuri perrašytų `$?`.

Laukiama: kelias iki `python3` ir `kodas: 0`, tada tik `kodas: 1` (kelio nėra). Šitą patį principą 2 užduotyje naudos `if`.

**5.** Failai ir aplankai:

```bash
[ -f uzrasai/serveriai.txt ]; echo "kodas: $?"
[ -d scripts ]; echo "kodas: $?"
[ -f nera.txt ]; echo "kodas: $?"
[ -d nera ]; echo "kodas: $?"
```

Ką daro: `[ -f ... ]` tikrina, ar tai failas, `[ -d ... ]`, ar tai aplankas. Rezultatą rodo tik išėjimo kodas, todėl vėl `echo "kodas: $?"` iškart po jo.

Laukiama: `0`, `0`, `1`, `1`. Dažna klaida: be tarpų aplink `[` ir `]` (`[-f failas]` neveikia), arba `-f` aplankui (rodytų 1). 4 užduotyje tos pačios sąlygos bus `if` viduje.

**6.** Argumentai:

```bash
set -- ona jonas
echo "$1" "$#"
```

Ką daro: `set --` terminale nustato argumentus taip, lyg jie būtų paduoti skriptui. `$1` yra pirmas argumentas, `$#` yra jų skaičius.

Laukiama: `ona 2`. Skripte tą patį daro argumentai komandos eilutėje (`./patikra.sh git` → `$1` yra `git`); to prireiks 2 užduotyje.
