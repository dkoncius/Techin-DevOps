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
mkdir -p ~/devops/demo-bash/scripts
cd ~/devops/demo-bash
cat > scripts/pridek.sh <<'EOS'
#!/usr/bin/env bash
echo $(($1 + $2))
EOS
```
+ `$1` pirmas argumentas, `$#` kiek jų, `"$@"` visi
+ Kintamuosius rašykite kabutėse: `"$1"`
```bash+
chmod +x scripts/pridek.sh
./scripts/pridek.sh 2 3
```
Pastaba: ~8 min. Kitas pavyzdys nei užduotyje: `pridek.sh` sudeda du skaičius per `$(($1 + $2))`. Pakartojimas: `#!`, `chmod +x`, kintamieji.

=== komanda | Sąlygos ir testai
```bash
cat > pasveikink.sh <<'EOS'
#!/usr/bin/env bash
if [ "$#" -lt 1 ]; then
  echo "Naudojimas: $0 <vardas>" >&2
  exit 1
fi
echo "Sveiki, $1!"
EOS
```
- Failui: `-e`, `-f`, `-d`; tekstui: `=`, `-z`; skaičiams: `-eq`, `-gt`, `-lt`
- Ar komanda yra: `command -v git`
```bash+
chmod +x pasveikink.sh
./pasveikink.sh; echo $?
./pasveikink.sh Ona
```
Pastaba: ~15 min. Dažna klaida: trūksta tarpų aplink `[` ir `]`; `=` vietoj `-eq`; `$x` be kabučių, kai tuščias.

=== tekstas | Išėjimo kodas
| Kodas | Reiškia |
|---|---|
| `exit 0` | ?Sėkmė |
| `exit 1` | ?Klaida |
| `exit 2` | ?Bloga įvestis (mūsų susitarimas) |
| `$?` | ?Paskutinės komandos kodas |
```bash+
command -v git; echo $?
command -v neegzistuoja; echo $?
```
Pastaba: ~5 min. Kitos programos (CI, `&&`) žiūri į kodą, o ne į tekstą.

=== komanda | Ciklas ir saugus skriptas
```bash
for failas in *.sh; do
  echo "$failas"
done
```
- `set -euo pipefail`: sustoja klaidoje, nenustatytame kintamajame ir nepavykusiame vamzdyje
- Mac Bash 3.2: be `${var,,}`, `mapfile`, `declare -A`
Pastaba: ~10 min. Dažna klaida: `for f in *.md`, kai failų nėra (cikle lieka pats šablonas).

=== komanda | Failų patikra
```bash
touch README.md
for failas in README.md package.json; do
  if [ -f "$failas" ]; then echo "OK      $failas"; else echo "TRŪKSTA $failas"; fi
done
if [ -d src ]; then echo "OK      src/"; else echo "TRŪKSTA src/"; fi
```
- `-f` yra failas, `-d` yra aplankas
Pastaba: ~5 min. Kito projekto failai (`package.json`, `README.md`): tas pats `if`, bet su `-f` ir `-d`. Dažna klaida: skriptas paleistas ne projekto šaknyje ir viskas „TRŪKSTA“; `-f` vietoj `-d` aplankui. Paskelbkite 3 užduotį.

=== demonstracija | Realus skriptas: run.sh
| Eilutė | Ką daro |
|---|---|
| `set -euo pipefail` | ?Sustoja pirmoje klaidoje |
| `python3 -m venv .venv` | ?Sukuria virtualią aplinką, bet tik jei `.venv` dar nėra |
| `[ -f .env ] && { set -a; . ./.env; set +a; }` | ?Jei yra `.env`, įkelia kintamuosius |
| `exec ... --port "${PORT:-5001}"` | ?Paleidžia serverį porte iš `PORT` arba 5001 |
```bash+
cd ~/devops/devops-projektas
cat run.sh
```
Pastaba: ~10 min. Eikite eilutė po eilutės; jie jau matė aplinkos kintamuosius 03 pamokoje.

=== tekstas | Git: ignoravimas ir atšaukimas
| Situacija | Komanda |
|---|---|
| Failas neturi patekti į Git | ?Eilutė `.gitignore` |
| Atšaukti pakeitimą faile | ?`git restore failas` |
| Atšaukti `git add` | ?`git restore --staged failas` |
| Ištrinti visą darbą | ?`git reset --hard` (pavojinga) |
```bash+
mkdir -p ~/devops/demo-git
cd ~/devops/demo-git
git init -q
echo "b" > b.txt
git add b.txt
git commit -qm "Pradinis"
```
```bash+
echo "*.tmp" > .gitignore
touch a.tmp
git status --short
echo "pakeista" >> b.txt
git restore b.txt
```

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
