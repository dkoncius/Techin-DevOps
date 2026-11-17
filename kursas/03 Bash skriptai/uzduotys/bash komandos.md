**Kur dirbate:** demonstracija `~/devops/demo-bash`, užduotys `~/Desktop/devops/git-bandymas` · **Reikia:** Terminalas (Mac) arba WSL Ubuntu, įdiegtas Git

Eiga: kiekvieną komandą pirma išbandote terminale ir matote rezultatą, o skriptą rašote tik pabaigoje. Pavyzdžiuose kiti vardai nei užduotyse, todėl komandą reikia pritaikyti.

Skriptai paleidžiami su bash. Kad pavyzdžiai elgtųsi taip pat kaip skripte, terminale turi veikti bash:

| Sistema              | Ką daryti                                                    |
| -------------------- | ------------------------------------------------------------ |
| Mac                  | terminalas yra zsh, todėl parašykite `bash` (išeiti: `exit`) |
| Ubuntu / WSL / Linux | jau yra bash, nieko rašyti nereikia                          |

## Ko išmoksite

1. Naudoti kintamuosius ir argumentus.
2. Spręsti su `if` ir skaityti išėjimo kodą.
3. Kartoti darbą su `for` ir skaičiuoti.
4. Tikrinti failus ir aplankus.
5. Visa tai surašyti į skriptą ir paleisti.
6. Savo darbą pasitikrinti automatiškai ir išmokti skaityti ❌.
7. Išsaugoti darbą Git'e.
8. Atlikti užduotis: pakeisti `TODO` ir pasitikrinti su `tests/check.sh`.

---

## 0. Pasiruošimas: demonstracijos aplankas

Demonstracijai naudojame atskirą aplanką, kad neliestume `git-bandymas`:

```bash
mkdir -p ~/devops/demo-bash    # aplankas (jei jo nėra)
cd ~/devops/demo-bash          # įeiti į jį
pwd                            # patikra: kelias baigiasi demo-bash

```

Visas komandas žemiau vykdykite šiame aplanke. Git čia dar nenaudojame: jį įjungsime 10 skyriuje.

## 1. Kintamieji

```bash
vardas=Ona                   # be tarpų aplink =
echo "Sveiki, $vardas"       # Sveiki, Ona
echo "${vardas}_2026"        # Ona_2026 (riestiniai, kai prie vardo yra tekstas)
data=$(date +%F)             # komandos rezultatas į kintamąjį (nieko neparodo)
echo "$data"                 # 2026-11-16

```

Kintamąjį visada rašykite kabutėse: `"$vardas"`.

Terminale (ne skripte) nerašykite `!` kabutėse: terminalas (zsh, o kartais ir bash) jį laiko istorijos komanda ir laukia `dquote>` arba rašo `event not found`. Jei užstrigote, paspauskite `Ctrl+C`.

Masyvai skirtingose terminaluose skaičiuojami skirtingai (zsh nuo 1, bash nuo 0), todėl pavyzdžiuose naudojame tik `"${vardai[@]}"` (visi nariai) be numerio.

## 2. Argumentai

```bash
set -- ona jonas             # nustato argumentus (kaip paleidus skriptą su: ona jonas)
echo "$1"                    # ona
echo "$2"                    # jonas
echo "$#"                    # 2
echo "$@"                    # ona jonas

```

| Rašote | Reiškia           |
| ------ | ----------------- |
| `"$1"` | pirmas argumentas |
| `"$2"` | antras argumentas |
| `$#`   | kiek argumentų    |
| `"$@"` | visi argumentai   |

## 3. Sąlyga `if`

Kelių eilučių forma (skripte rašysite būtent taip; terminale ją galima įklijuoti):

```bash
set --                              # argumentų nėra
if [ "$#" -lt 1 ]; then
  echo "nėra argumentų"
else
  echo "yra: $1"
fi

```

Turi būti: `nėra argumentų`. Tą patį paleiskite po `set -- ona`: turi būti `yra: ona`.

Tarpai aplink `[` ir `]` privalomi.

Kelios sąlygos iš eilės (`elif`):

```bash
skaicius=15                                   # keiskite reikšmę ir paleiskite iš naujo
if [ "$skaicius" -gt 10 ]; then
  echo "daug"
elif [ "$skaicius" -eq 10 ]; then
  echo "lygiai dešimt"
else
  echo "mažai"
fi

```

| `skaicius` | Turi būti       |
| ---------- | --------------- |
| `15`       | `daug`          |
| `10`       | `lygiai dešimt` |
| `5`        | `mažai`         |

Tikrinama iš eilės: pirma tinkama šaka vykdoma, likusios praleidžiamos. Su `$1` ir `exit` (kaip skripte) tas pats pavyzdys veiktų tik faile, nes terminale `exit` uždarytų langą.

| Testas      | Reiškia                     | Testas        | Reiškia                 |
| ----------- | --------------------------- | ------------- | ----------------------- |
| `-eq` `-ne` | skaičiai lygūs / nelygūs    | `=` `!=`      | tekstas lygus / nelygus |
| `-lt` `-le` | mažiau / mažiau arba lygu   | `-z "$x"`     | tekstas tuščias         |
| `-gt` `-ge` | daugiau / daugiau arba lygu | `-x failas`   | failas vykdomas         |
| `-f failas` | yra failas                  | `-d aplankas` | yra aplankas            |

Ar įrankis yra:

```bash
irankis=ls                                  # išbandykite ir su: nerasta
if command -v "$irankis" >/dev/null 2>&1; then
  echo "OK      $irankis"
else
  echo "TRŪKSTA $irankis"
fi

```

Turi būti: `OK ls`, o su `nerasta`: `TRŪKSTA nerasta`.  
`>/dev/null 2>&1` paslepia komandos išvestį, lieka tik jūsų `echo`.

## 4. Išėjimo kodas

```bash
command -v ls; echo "kodas: $?"          # kelias iki ls ir kodas: 0
command -v nerasta; echo "kodas: $?"     # kodas: 1
(exit 2); echo "kodas: $?"               # kodas: 2

```

| Kodas | Reiškia                          |
| ----- | -------------------------------- |
| `0`   | sėkmė                            |
| `1`   | klaida                           |
| `2`   | bloga įvestis (mūsų susitarimas) |
| `$?`  | paskutinės komandos kodas        |

`$?` rodykite iškart po komandos, kitaip jis jau bus kitos komandos. Skripte kodą nustato `exit 1`. Terminale `exit` uždarytų langą, todėl čia naudojame `(exit 2)`.

Kitos programos (CI, `&&`) žiūri į kodą, o ne į tekstą.

## 5. Masyvas, ciklas, skaičiavimas

```bash
vardai=(ona jonas rasa)                   # sąrašas
kiekis=0                                  # skaitiklis
for v in "${vardai[@]}"; do               # kartoja kiekvienam sąrašo nariui
  echo "Sveiki, $v"
  kiekis=$((kiekis + 1))                  # skaičiaus didinimas
done
echo "Pasveikinta: $kiekis"

```

Turi būti: trys `Sveiki` eilutės ir `Pasveikinta: 3`.

```bash
set -- a b c
sarasas=("$@")                            # masyvas iš visų argumentų
echo "${sarasas[@]}"                      # a b c

```

- `"${vardai[@]}"` rašykite su kabutėmis ir `@`
- Mac turi Bash 3.2, Ubuntu naujesnį. Kad skriptas veiktų abiejuose, nenaudokite `mapfile`, `declare -A`, `${var,,}`

## 6. Failai ir aplankai

```bash
touch README.md                           # sukuria tuščią failą
if [ -f README.md ]; then echo "OK      README.md"; else echo "TRŪKSTA README.md"; fi
if [ -d src ]; then echo "OK      src/"; else echo "TRŪKSTA src/"; fi    # TRŪKSTA src/
mkdir -p src                              # sukuria aplanką
ls -d src                                 # src

```

Failas ieškomas tame aplanke, kuriame esate (`pwd` parodo kur).

## 7. Viską į skriptą

Kai komandos veikia terminale, jas įrašote į failą (viename faile, ne daug mažų).

```bash
mkdir -p scripts
rm -f scripts/sveikas.sh       # ištrina seną failą, jei jis jau yra (kad nelikų senų eilučių)
nano scripts/sveikas.sh        # išsaugoti Ctrl+O, Enter, išeiti Ctrl+X

```

Antroje eilutėje po `#!` rašome `set -euo pipefail`. Tai saugus režimas: skriptas sustoja pirmoje klaidoje (`-e`), nenustatytame kintamajame (`-u`) ir nepavykusiame vamzdyje (`pipefail`).

Skripte sujungiame argumentą, `if`, ciklą ir skaitiklį iš ankstesnių skyrių:

```bash
#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Naudojimas: ./scripts/sveikas.sh vardas..." >&2   # >&2 = į klaidų kanalą
  exit 2
fi

kiekis=0
for vardas in "$@"; do
  echo "Sveiki, $vardas"
  kiekis=$((kiekis + 1))
done
echo "Pasveikinta: $kiekis"

```

```bash
chmod +x scripts/sveikas.sh                    # leidžia vykdyti (vieną kartą)
./scripts/sveikas.sh Ona Jonas; echo "kodas: $?"
./scripts/sveikas.sh; echo "kodas: $?"

```

Turi būti: pirmu atveju `Sveiki, Ona`, `Sveiki, Jonas`, `Pasveikinta: 2`, `kodas: 0`; antru `Naudojimas: ...` ir `kodas: 2`.

- `#!/usr/bin/env bash` sako, kuo paleisti failą; `#` pradeda komentarą
- Skripto kelias rašomas nuo vietos, kurioje esate: iš projekto šaknies `./scripts/sveikas.sh`
- `./scripts/sveikas.sh > rezultatas.txt` išvestį įrašo į failą (klaidos lieka ekrane)
- `mkdir -p docs` ir tada `(cd docs && ../scripts/sveikas.sh Ona)` paleidžia iš kito aplanko, vietos nekeičia (jei `docs` jau yra, `mkdir -p` nieko nedaro)

Dvi klaidos su saugiu režimu:

- `set -u`: jei `$1` panaudosite prieš patikrinimą `if [ "$#" -lt 1 ]`, skriptas nulūš su `unbound variable`. Saugiai: `${1:-}` (tuščia, jei argumento nėra).
- `set -e`: `((kiekis++))`, kai `kiekis` yra 0, grąžina kodą 1. Naujesniame bash (Ubuntu) skriptas tyliai sustoja, Mac Bash 3.2 to nedaro, todėl skirtingose sistemose elgsis skirtingai. Naudokite `kiekis=$((kiekis + 1))`: jis veikia visur.

## 8. Patikra

Kad nereikėtų spėlioti, ar skriptas teisingas, naudojame patikros skriptą. Pirmą kartą jį reikia įkelti. Naujas failas `testai/tikrinti.sh`:

```bash
mkdir -p testai
nano testai/tikrinti.sh        # įklijuokite kodą žemiau, išsaugokite Ctrl+O, Enter, išeikite Ctrl+X

```

```bash
#!/usr/bin/env bash
# Automatinė užduočių 2, 3 ir 4 patikra (veikia macOS ir Linux/WSL).
#   bash testai/tikrinti.sh demo                   # tikrina demonstracijos scripts/sveikas.sh
#   bash testai/tikrinti.sh 2                      # tikrina scripts/patikra.sh pagal 2 užduotį
#   bash testai/tikrinti.sh 3
#   bash testai/tikrinti.sh 4
#   bash testai/tikrinti.sh 2 kelias/iki/skripto   # kitas skriptas
# Paleiskite iš projekto šaknies (ten, kur yra aplankas scripts).

N="${1:-}"
case "$N" in
  demo|2|3|4) ;;
  *) echo "Naudojimas: bash testai/tikrinti.sh demo|2|3|4 [skriptas]" >&2; exit 2 ;;
esac

if [ "$N" = demo ]; then
  SCRIPT="${2:-scripts/sveikas.sh}"
else
  SCRIPT="${2:-scripts/patikra.sh}"
fi
if [ ! -f "$SCRIPT" ]; then
  echo "Nerastas skriptas: $SCRIPT (paleiskite iš projekto šaknies)" >&2
  exit 2
fi
S="$(cd "$(dirname "$SCRIPT")" && pwd)/$(basename "$SCRIPT")"

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

PASS=0
FAIL=0
green() { printf '\033[32m%s\033[0m\n' "$*"; }
red()   { printf '\033[31m%s\033[0m\n' "$*"; }
ok()    { green "  ✅ $1"; PASS=$((PASS + 1)); }
bad()   { red "  ❌ $1"; shift; for l in "$@"; do echo "     $l"; done; FAIL=$((FAIL + 1)); }

# run <katalogas> [argumentai...]  ->  OUT, ERR, CODE
run() {
  local dir=$1
  shift
  OUT=$(cd "$dir" && bash "$S" "$@" 2>"$TMP/err")
  CODE=$?
  ERR=$(cat "$TMP/err")
}

# eq <aprašas> <tikėtas stdout> <tikėtas kodas>   (naudoja paskutinį run)
eq() {
  if [ "$OUT" = "$2" ] && [ "$CODE" -eq "$3" ]; then
    ok "$1"
  else
    bad "$1" "tikėtasi (kodas $3): $(printf '%s' "$2" | tr '\n' '|')" \
             "gauta    (kodas $CODE): $(printf '%s' "$OUT" | tr '\n' '|')"
  fi
}

# has <aprašas> <tikėtas kodas> <tekstas>...   (išvestyje turi būti kiekvienas tekstas, tikslus žodžių tekstas nesvarbus)
has() {
  local desc=$1 want_code=$2 miss="" t
  shift 2
  for t in "$@"; do
    case "$OUT" in *"$t"*) ;; *) miss="$miss $t" ;; esac
  done
  if [ -z "$miss" ] && [ "$CODE" -eq "$want_code" ]; then
    ok "$desc"
  else
    bad "$desc" "tikėtasi (kodas $want_code), išvestyje turi būti: $*" \
             "gauta    (kodas $CODE): $(printf '%s' "$OUT" | tr '\n' '|')"
  fi
}

# err_eq <aprašas> <tikėtas stderr>
err_eq() {
  if [ "$ERR" = "$2" ]; then
    ok "$1"
  else
    bad "$1" "klaidų kanale tikėtasi: $2" "klaidų kanale gauta:   $ERR"
  fi
}

# err_has <aprašas>  -> stderr netuščias
err_has() {
  if [ -n "$ERR" ]; then ok "$1"; else bad "$1" "į klaidų kanalą (>&2) nieko neparašyta"; fi
}

# bendros patikros
echo "Skriptas $SCRIPT"
if head -n 1 "$SCRIPT" | grep -q '^#!.*bash'; then ok "pirma eilutė nurodo bash"; else bad "pirma eilutė turi būti #!/usr/bin/env bash"; fi
if [ -x "$SCRIPT" ]; then ok "skriptas vykdomas (chmod +x)"; else bad "skriptas nevykdomas: chmod +x $SCRIPT"; fi
if grep -q 'set -euo pipefail' "$SCRIPT"; then ok "yra set -euo pipefail"; else bad "trūksta set -euo pipefail"; fi
if grep -q 'TODO' "$SCRIPT"; then bad "dar liko TODO komentarų (ištrinkite juos, kai atliksite)"; fi

# tikėtas rezultatas dabartinėje sistemoje
exp_tool() { if command -v "$1" >/dev/null 2>&1; then echo "OK      $1"; else echo "TRŪKSTA $1"; fi; }

# ---------- demonstracija ----------
if [ "$N" = demo ]; then
  run "$TMP" Ona Jonas
  has "Ona Jonas -> kodas 0, išvestyje Ona ir Jonas" 0 Ona Jonas
  run "$TMP" Ona
  has "Ona -> kodas 0, išvestyje Ona" 0 Ona
  run "$TMP"
  eq "be argumento -> nieko stdout, kodas 2" "" 2
  err_has "naudojimo žinutė eina į klaidų kanalą"
fi

# ---------- 2 užduotis ----------
if [ "$N" = 2 ]; then
  echo "2 užduotis: argumentai ir išėjimo kodas"
  run "$TMP" git
  eq "git -> OK, kodas 0" "OK      git" 0
  run "$TMP" neegzistuoja
  eq "neegzistuoja -> TRŪKSTA, kodas 1" "TRŪKSTA neegzistuoja" 1
  run "$TMP"
  eq "be argumento -> nieko stdout, kodas 2" "" 2
  err_has "naudojimo žinutė eina į klaidų kanalą"
  if grep -q 'Tikrinu' "$SCRIPT"; then bad "eilutę 'Tikrinu: ...' reikėjo ištrinti"; fi
fi

# ---------- 3 užduotis ----------
if [ "$N" = 3 ]; then
  echo "3 užduotis: ciklas per įrankius"
  want=$(for t in git python3 curl; do exp_tool "$t"; done)
  code=0
  echo "$want" | grep -q TRŪKSTA && code=1
  run "$TMP"
  eq "be argumentų tikrina git, python3, curl" "$want" "$code"
  run "$TMP" git neegzistuoja kitas
  eq "git neegzistuoja kitas -> kodas 1" $'OK      git\nTRŪKSTA neegzistuoja\nTRŪKSTA kitas' 1
  err_eq "klaidų kanale: Trūksta: 2" "Trūksta: 2"
  run "$TMP" git
  eq "tik git -> kodas 0" "OK      git" 0
  run "$TMP" git git
  eq "du argumentai -> abu tikrinami" $'OK      git\nOK      git' 0
fi

# ---------- 4 užduotis ----------
if [ "$N" = 4 ]; then
  echo "4 užduotis: projekto failų patikra"
  P="$TMP/projektas"
  mkdir -p "$P/uzrasai" "$P/scripts" "$P/docs"
  touch "$P/uzrasai/serveriai.txt" "$P/scripts/ataskaita.sh"

  run "$P" git
  eq "iš šaknies su git: OK, du failai, docs/" $'OK      git\nOK      uzrasai/serveriai.txt\nOK      scripts/ataskaita.sh\nOK      docs/' 0

  run "$P"
  want=$(for t in git python3 curl; do exp_tool "$t"; done; printf 'OK      uzrasai/serveriai.txt\nOK      scripts/ataskaita.sh\nOK      docs/')
  code=0
  echo "$want" | grep -q TRŪKSTA && code=1
  eq "iš šaknies be argumentų: įrankiai, failai, docs/" "$want" "$code"

  run "$P/docs" git
  eq "iš docs: failai ir docs/ TRŪKSTA, kodas 1" $'OK      git\nTRŪKSTA uzrasai/serveriai.txt\nTRŪKSTA scripts/ataskaita.sh\nTRŪKSTA docs/' 1
  err_eq "klaidų kanale: Trūksta: 3" "Trūksta: 3"

  rm "$P/scripts/ataskaita.sh"
  run "$P" git
  eq "trūksta vieno failo -> kodas 1" $'OK      git\nOK      uzrasai/serveriai.txt\nTRŪKSTA scripts/ataskaita.sh\nOK      docs/' 1
  err_eq "klaidų kanale: Trūksta: 1" "Trūksta: 1"

  touch "$P/scripts/ataskaita.sh"
  rmdir "$P/docs"
  run "$P" git
  eq "nėra aplanko docs -> kodas 1" $'OK      git\nOK      uzrasai/serveriai.txt\nOK      scripts/ataskaita.sh\nTRŪKSTA docs/' 1
fi

echo
TOTAL=$((PASS + FAIL))
if [ "$FAIL" -eq 0 ]; then
  green "Viskas gerai: $TOTAL / $TOTAL patikrų 🎉"
  exit 0
else
  red "Išlaikyta $PASS / $TOTAL patikrų"
  exit 1
fi

```

Patikrinkite skriptą, kurį ką tik parašėte:

```bash
bash testai/tikrinti.sh demo   # tikrina scripts/sveikas.sh

```

Turi būti:

```
Skriptas scripts/sveikas.sh
  ✅ pirma eilutė nurodo bash
  ✅ skriptas vykdomas (chmod +x)
  ✅ yra set -euo pipefail
  ✅ Ona Jonas -> kodas 0, išvestyje Ona ir Jonas
  ✅ Ona -> kodas 0, išvestyje Ona
  ✅ be argumento -> nieko stdout, kodas 2
  ✅ naudojimo žinutė eina į klaidų kanalą

Viskas gerai: 7 / 7 patikrų

```

Jei matote ❌, skaitykite taip: `tikėtasi` yra tai, ką skriptas turi parašyti ir kokį kodą grąžinti, `gauta` yra tai, ką parašė jūsų skriptas. Dažna priežastis: po įklijavimo liko senų eilučių failo gale. Požymis: `gauta` pabaigoje yra keista eilutė, pavyzdžiui `Pasveikinta: 1#!/usr/bin/env bash`, arba kodas 1 vietoj 0. Tada atidarykite failą (`nano scripts/sveikas.sh`), ištrinkite viską po paskutinės `echo "Pasveikinta: $kiekis"` eilutės (`Ctrl+K` kiekvienai eilutei), išsaugokite ir paleiskite testą iš naujo. Greičiausia išeitis: `rm scripts/sveikas.sh` ir parašyti iš naujo.

## 9. Sulaužykite ir sutaisykite

Kai viskas žalia (7 / 7), išmokite skaityti ❌: sulaužykite skriptą vienu pakeitimu, paleiskite testą, pažiūrėkite, ką jis parodo, ir sutaisykite. Keiskite tik vieną dalyką, tada grąžinkite atgal.

| Ką pakeisti `scripts/sveikas.sh`          | Ką rodo testas                                         | Kaip sutaisyti                |
| ----------------------------------------- | ------------------------------------------------------ | ----------------------------- |
| `chmod -x scripts/sveikas.sh`             | `❌ skriptas nevykdomas`                                | `chmod +x scripts/sveikas.sh` |
| ištrinkite eilutę `set -euo pipefail`     | `❌ trūksta set -euo pipefail`                          | grąžinkite eilutę po `#!`     |
| ištrinkite eilutę `exit 2`                | `❌ be argumento`, `gauta (kodas 0): Pasveikinta: 0`    | grąžinkite `exit 2`           |
| `>&2` pašalinkite iš `Naudojimas` eilutės | du `❌`: žinutė pateko į ekraną vietoj klaidų kanalo    | grąžinkite `>&2`              |
| `-lt 1` pakeiskite į `-gt 1`              | trys `❌`: su argumentais kodas 2, be argumento kodas 0 | grąžinkite `-lt 1`            |
| `in "$@"` pakeiskite į `in "$1"`          | `❌ Ona Jonas`: gauta tik `Ona`, kodas 0                | grąžinkite `"$@"`             |

Prieš kiekvieną bandymą paleiskite `bash testai/tikrinti.sh demo`, po sutaisymo vėl: turi būti `7 / 7`.

## 10. Išsaugokite Git'e

Komandos yra `git komandos.md`. Esame demonstracijos aplanke `~/devops/demo-bash`. Kai patikra žalia, darbą išsaugome ir nusiunčiame į GitHub, kaip darėte anksčiau.

Prieš pradedant patikrinkite, ar esate prisijungę prie GitHub: `gh auth status` (jei ne, `gh auth login`, kaip 01 pamokoje).

**1. Paversti aplanką Git repozitorija:**

Pirma patikrinkite, kur esate. `git init` ir `git add .` paveikia **visą** aplanką, todėl kelias turi baigtis `demo-bash`:

```bash
pwd                            # turi baigtis /devops/demo-bash, kitaip: cd ~/devops/demo-bash
ls                             # turi būti tik scripts ir testai

```

Jei `ls` rodo ir kitus aplankus (pavyzdžiui `git-bandymas`), esate ne ten. Nevykdykite toliau.

```bash
git init                       # sukuria repozitoriją šiame aplanke
git branch -M main             # pagrindinė šaka vadinasi main
git status --short             # ?? scripts/ ir ?? testai/ (nauji, Git jų dar nesaugo)

```

**2. Išsaugoti (commit):**

```bash
git add .                      # įtraukia visus failus
git commit -m "Pridėtas sveikas.sh"    # išsaugo su žinute
git log --oneline              # viena eilutė: Pridėtas sveikas.sh

```

**3. Nusiųsti į GitHub:**

```bash
gh repo create demo-bash --private --source=. --remote=origin   # sukuria GitHub repozitoriją ir prijungia origin
git push -u origin main        # nusiunčia šaką main
git status                     # On branch main, up to date with 'origin/main'

```

**4. Pakeisti ir vėl nusiųsti:**

```bash
echo "# demonstracija" >> scripts/sveikas.sh    # prideda eilutę failo gale
bash testai/tikrinti.sh demo   # turi likti 7 / 7
git add .
git commit -m "Pridėtas komentaras"
git push                       # pakanka tik jei 3 žingsnyje jau vykdėte git push -u origin main

```

Taisyklė: pirma patikra žalia, tada `git add .`, `git commit` su aiškia žinute ir `git push`. Atšaukti pakeitimą (`git restore`), ignoruoti failus (`.gitignore`) ir Pull Request mokysitės 7 užduotyje.

---

## 11. Užduotys

Detaliau: `uzduotys/1-uzduotis.md` … `7-uzduotis.md` (6 pratimai + Git). Iš Teams: užduoties tekstas ir `tests/check.sh`.

Kiekvienam `.sh` failui: **aplankas** → **failas** (`nano`) → **įklijuoti kodą** → **atlikti `TODO`** → **testuoti** (`bash tests/check.sh N`) → **commit į GitHub** (`git add`, `commit`, `push`).

| Užd. | Failas | Patikra |
| --- | --- | --- |
| 1 | `01_greet.sh` | `1` |
| 2 | `02_even_odd.sh` | `2` |
| 3 | `03_countdown.sh` | `3` |
| 4 | `04_file_report.sh` | `4` |
| 5 | `05_grade.sh` | `5` |
| 6 | `06_backup.sh` | `6` |
| 7 | Git | `git komandos.md` |

Bash komandos: skyriai 1–7. ❌ — skaitykite testo žinutę.