=== titulinė | Bash skriptai
04 pamoka · 1 etapas
- Parašyti skriptą su argumentais ir `if`
- Naudoti `for` ir grąžinti teisingą išėjimo kodą
- Perskaityti realų projekto `run.sh`
Pastaba: ~10 min pasitikrinimas po 03: parodykite 03 sprendimą gyvai. Ritmas: skaidrės → jūsų demonstracija → užduotis Teams'e → jie daro patys. Visos užduotys plečia vieną skriptą `scripts/patikra.sh`, kuris taps `paleisti.sh` (atsiskaitymui) pagrindu.

=== pagalvokime
Tą pačią komandų seką reikia paleisti dvidešimt kartų.
# Ar rašysime ją ranka kaskart?
> Kaip virtuvės receptas: parašai vieną kartą, o gamini kiekvieną dieną vienodai.
Pastaba: ~3 min. Jie jau moka paprastus skriptus, todėl klauskite, ką jau yra parašę.

=== schema | Kaip skriptas nusprendžia
```excalidraw
file: skripto-eiga
box start | ./skriptas.sh | 0,0.5 | blue
box arg | Ar yra argumentas? | 1.3,0.5 | yellow
box klaida | Naudojimas į stderr\nexit 1 | 2.6,0 | orange
box ciklas | for per elementus | 2.6,1 | green
box ok | exit 0 | 3.9,1 | teal
arrow start -> arg
arrow arg -> klaida | ne
arrow arg -> ciklas | taip
arrow ciklas -> ok
```
Pastaba: ~5 min. Pradėkite nuo vaizdo, tada kodas.

=== komanda | Skriptas ir argumentai
```bash
#!/usr/bin/env bash
echo "Sveiki, $1!"
```
+ `$1` pirmas argumentas, `$#` kiek jų, `"$@"` visi
+ Kintamuosius rašykite kabutėse: `"$1"`
```bash+
chmod +x scripts/pridek.sh
./scripts/pridek.sh 2 3
```
Pastaba: ~8 min. Kitas pavyzdys nei užduotyje: `pridek.sh` sudeda du skaičius per `$(($1 + $2))`. Pakartojimas: `#!`, `chmod +x`, kintamieji.

=== komanda | `if` ir testai
```bash
if [ "$#" -lt 1 ]; then
  echo "Naudojimas: $0 <vardas>" >&2
  exit 1
fi
```
- Failui: `-e`, `-f`, `-d`; tekstui: `=`, `-z`; skaičiams: `-eq`, `-gt`, `-lt`
- Ar komanda yra: `command -v git`
Pastaba: ~15 min. Dažna klaida: trūksta tarpų aplink `[` ir `]`; `=` vietoj `-eq`; `$x` be kabučių, kai tuščias.

=== tekstas | Išėjimo kodas
| Kodas | Reiškia |
|---|---|
| `exit 0` | ?Sėkmė |
| `exit 1` | ?Klaida |
| `exit 2` | ?Bloga įvestis (mūsų susitarimas) |
| `$?` | ?Paskutinės komandos kodas |
Pastaba: ~5 min. Kitos programos (CI, `&&`) žiūri į kodą, o ne į tekstą.

=== komanda | `for` ir saugus skriptas
```bash
for failas in docs/*.md; do
  echo "$failas"
done
```
- `set -euo pipefail`: sustoja klaidoje, nenustatytame kintamajame ir nepavykusiame vamzdyje
- Mac Bash 3.2: be `${var,,}`, `mapfile`, `declare -A`
Pastaba: ~10 min. Dažna klaida: `for f in *.md`, kai failų nėra (cikle lieka pats šablonas).

=== demonstracija | Realus skriptas: run.sh
| Eilutė | Ką daro |
|---|---|
| `set -euo pipefail` | ?Sustoja pirmoje klaidoje |
| `python3 -m venv .venv` | ?Sukuria virtualią aplinką, bet tik jei `.venv` dar nėra |
| `[ -f .env ] && { set -a; . ./.env; set +a; }` | ?Jei yra `.env`, įkelia kintamuosius |
| `exec ... --port "${PORT:-5001}"` | ?Paleidžia serverį porte iš `PORT` arba 5001 |
Pastaba: ~10 min. Eikite eilutė po eilutės; jie jau matė aplinkos kintamuosius 03 pamokoje.

=== tekstas | Git: `.gitignore` ir atšaukimas
| Situacija | Komanda |
|---|---|
| Failas neturi patekti į Git | ?Eilutė `.gitignore` |
| Atšaukti pakeitimą faile | ?`git restore failas` |
| Atšaukti `git add` | ?`git restore --staged failas` |
| Ištrinti visą darbą | ?`git reset --hard` (pavojinga) |
Pastaba: ~10 min. Pakartojimas. Dažna klaida: failas jau buvo `git add` ir `.gitignore` nebeveikia (`git rm --cached`).

=== klaida | Dažnos klaidos
:: | Permission denied | Pamirštas `chmod +x`
:: | `[ $x = a ]` | Kabutės aplink `$x`: `[ "$x" = a ]`
:: | `${var,,}`, `mapfile` | Neveikia Mac Bash 3.2
:: | Skripto kelias | Naudokite `cd "$(dirname "$0")"`
Pastaba: ~3 min.

=== uzduotys | Užduotys
@uzduotys: auto, tik sąrašas
Pastaba: Skelbkite po vieną Teams'e: kiekvieną užduotį po demonstracijos, kitą tik kai baigia. Užduotys eina viena gija: vienas įrankis (1), įrankių sąrašas (2), projekto failai (3), `run.sh`, `.gitignore` ir PR (4). Atsakymus į „Kodėl“ rašo `docs/bash.md`.

=== kita | Kita pamoka
Tinklų pagrindai: IP, portai, DNS, HTTP, `curl`
