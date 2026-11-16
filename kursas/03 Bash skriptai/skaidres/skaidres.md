=== titulinė | Bash skriptai
03 pamoka · 1 etapas
- Parašyti skriptą su argumentais ir `if`
- Naudoti `for` ir grąžinti teisingą išėjimo kodą
- Parašyti `.gitignore` ir atšaukti pakeitimą su `git restore`
Pastaba: ~10 min pasitikrinimas po 02. Dirbame `git-bandymas`. `run.sh` bus 05 pamokoje. Užduotys plečia `scripts/patikra.sh`.

=== pagalvokime
Tą pačią komandų seką reikia paleisti dvidešimt kartų.
# Ar rašysime ją ranka kaskart?
> Kaip virtuvės receptas: parašai vieną kartą, o gamini kiekvieną dieną vienodai.
Pastaba: ~3 min. Jie jau moka paprastus skriptus, todėl klauskite, ką jau yra parašę.

=== tekstas | Skriptas auga po vieną dalį
@kelias
:: 1 | Kintamasis ir if | `irankis=python3` ir `if command -v`: tai jau moka
+:: 2 | Argumentas | vietoj `python3` imame `irankis="$1"`
+:: 3 | Išėjimo kodas | `exit 1` kai trūksta, `set -euo pipefail`
+:: 4 | Naudojimas | `if [ "$#" -lt 1 ]`, žinutė į klaidų kanalą ir `exit 2`
Pastaba: ~4 min. Tai užduoties 2 eiga (kintamasis ir `if` pasikartoti 1 užduotyje): tą patį `scripts/patikra.sh` auginame po vieną dalį, o ne rašome iš karto. Demonstracijoje įrankis `python3`, užduotyje `git`. Skriptus rašome `nano`.

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
nano scripts/pridek.sh
```
```bash+
#!/usr/bin/env bash
echo $(($1 + $2))
```
+ `$1` pirmas argumentas, `$#` kiek jų, `"$@"` visi
+ Kintamuosius rašykite kabutėse: `"$1"`
```bash+
chmod +x scripts/pridek.sh
./scripts/pridek.sh 2 3
```
Pastaba: ~8 min. Kitas pavyzdys nei užduotyje: `pridek.sh` sudeda du skaičius per `$(($1 + $2))`. Antras kodo blokas yra failo turinys, rašomas nano ir išsaugomas `Ctrl+O`, `Enter`, `Ctrl+X`. Pakartojimas: `#!`, `chmod +x`, kintamieji.

=== komanda | Sąlygos: pakartojame ir pridedame `$#`
```bash
nano pasveikink.sh
```
```bash+
#!/usr/bin/env bash
if [ "$#" -lt 1 ]; then
  echo "Naudojimas: $0 <vardas>" >&2
  exit 1
fi
echo "Sveiki, $1!"
```
- Failui: `-e`, `-f`, `-d`; tekstui: `=`, `-z`; skaičiams: `-eq`, `-gt`, `-lt`
- Ar komanda yra: `command -v git`
```bash+
chmod +x pasveikink.sh
./pasveikink.sh; echo $?
./pasveikink.sh Ona
```
Pastaba: ~8 min. Jie `if` jau žino, todėl tik trumpai pakartokite ir pereikite prie `$#`. Antras kodo blokas yra failo turinys. Dažna klaida: trūksta tarpų aplink `[` ir `]`; `=` vietoj `-eq`; `$x` be kabučių, kai tuščias.

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
Pastaba: ~5 min. Kitos programos (CI, `&&`) žiūri į kodą, o ne į tekstą. Po kitos skaidrės (šablonas) paskelbkite 2 užduotį.

=== komanda | Kaip dirbsite su užduotimis
```bash
nano scripts/patikra.sh
bash testai/tikrinti.sh 2
```
- Šabloną rasite lape `bash komandos.md` (11 skyrius), įklijuokite į `nano`
- Pakeiskite kiekvieną `TODO` savo kodu
- Komandų ieškokite `bash komandos.md` ir `git komandos.md`
- Testas parodo, kas nepavyko ir ką tikėtasi
- Dar neišėjo? Dokumentacija ir paieška, o po to klauskite dirbtinio intelekto
Pastaba: ~3 min. Pagrindinė mintis: skaidrėse tik bazinės komandos, skriptus kuria mokiniai patys. Patikros skriptas `testai/tikrinti.sh` jau įkeltas per demonstraciją (lapo 8 skyrius). Šablonas pradžioje tuščias ir testas krenta: tai normalu. Testą paleiskite iš projekto šaknies (ten, kur yra `scripts`). Testas tikrina tekstą, klaidų kanalą ir išėjimo kodą, bet ne kaip parašyta. 3 ir 4 užduotyse tas pats su `3` ir `4`. Dirbtinio intelekto naudojimą nukreipkite: prašyti paaiškinti klaidą ar komandą, o ne parašyti visą skriptą.

=== komanda | Ciklas, masyvas ir skaitiklis
```bash
for failas in *.sh; do
  echo "$failas"
done
```
- Tas pats su sąrašu: `vardai=(ona jonas)` ir `"${vardai[@]}"`
- Skaičiavimas: `klaidu=$((klaidu + 1))`
```bash+
vardai=(ona jonas rasa)
for v in "${vardai[@]}"; do
  echo "Sveiki, $v"
done
kiekis=0
kiekis=$((kiekis + 1))
echo "$kiekis"
```
- `set -euo pipefail`: sustoja klaidoje, nenustatytame kintamajame ir nepavykusiame vamzdyje
- Mac Bash 3.2: be `${var,,}`, `mapfile`, `declare -A`
Pastaba: ~6 min. Tik bazinės dalys: masyvas, ciklas, skaičiaus didinimas. Skripto, kuris juos sujungia, neberašykite: tai užduotis 3, mokiniai kuria patys pagal aprašą, `bash komandos.md` ir šabloną. Dažna klaida: `for f in *.md`, kai failų nėra (cikle lieka pats šablonas); `"${vardai[@]}"` be kabučių ar be `@`; `kiekis=$kiekis+1` vietoj `$(( ))`.

=== komanda | Failų patikra
```bash
touch README.md
for failas in README.md package.json; do
  if [ -f "$failas" ]; then echo "OK      $failas"; else echo "TRŪKSTA $failas"; fi
done
if [ -d src ]; then echo "OK      src/"; else echo "TRŪKSTA src/"; fi
```
- `-f` yra failas, `-d` yra aplankas
Pastaba: ~5 min. Kito projekto failai (`package.json`, `README.md`): tas pats `if`, bet su `-f` ir `-d`. Dažna klaida: skriptas paleistas ne projekto šaknyje ir viskas „TRŪKSTA“; `-f` vietoj `-d` aplankui. Paskelbkite 4 užduotį.

=== tekstas | Kas bus 05 pamokoje
- `run.sh` ir `paleisti.sh` atsiras, kai bus šablonas
- Šiandien tik `patikra.sh`, `.gitignore` ir `git restore`
Pastaba: ~2 min. Neatidarykite `run.sh`. Jo dar nėra.

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
Pastaba: Skelbkite po vieną. Užduotys: pasikartojimas terminale (1), `patikra.sh` auga po vieną dalį (2), sąrašas ir ciklas (3), failų ir aplankų patikra (4), `.gitignore`, `git restore` ir PR (5). Skriptus mokiniai rašo patys pagal aprašą; pilni skriptai tik dėstytojo `*-sprendimas.md`.

=== kita | Kita pamoka
Tinklų pagrindai: IP, portai, DNS, HTTP, `curl`
