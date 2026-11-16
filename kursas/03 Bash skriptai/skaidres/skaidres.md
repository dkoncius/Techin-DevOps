=== titulinė | Bash skriptai
03 pamoka · 1 etapas
- Paaiškinti, kas yra Bash skriptas ir kaip jį paleisti
- Naudoti argumentus, `if`, `for` ir išėjimo kodą
- Savo skriptą pasitikrinti automatiškai ir išsaugoti Git'e
Pastaba: ~10 min pasitikrinimas po 02. Skaidrės yra teorija ir pagrindinės komandos, o kūrimas vyksta lape `uzduotys/bash komandos.md`. Dirbame `~/devops/demo-bash`, užduotyse `git-bandymas`. `run.sh` bus 05 pamokoje.

=== pagalvokime
Tą pačią komandų seką reikia paleisti dvidešimt kartų.
# Ar rašysime ją ranka kaskart?
> Kaip virtuvės receptas: parašai vieną kartą, o gamini kiekvieną dieną vienodai.
Pastaba: ~3 min. Jie jau moka paprastus skriptus, todėl klauskite, ką jau yra parašę.

=== tekstas | Kas yra Bash skriptas
@plokštelės
:: 01 | Terminalas | langas, kuriame rašote komandas
:: 02 | Bash | programa terminale: ji supranta komandas ir jas vykdo
:: 03 | Skriptas | tos pačios komandos, surašytos į failą
+ Skriptas yra komandos, kurias kompiuteris vykdo iš eilės be jūsų pagalbos.
Pastaba: ~4 min. Kalbėkite žodžiais, be komandų. Terminalas yra tik langas, o komandas supranta Bash (Mac: terminalas pagal nutylėjimą zsh, todėl rašome `bash`). Skriptas nieko naujo nemoko: ta pati komanda iš terminalo, tik išsaugota faile. Paklauskite, ką jie jau paleido: `ls`, `cd`, `git status`.

=== tekstas | Kam reikalingi skriptai
@plokštelės
:: 01 | Aplinkos patikra | ar reikalingi įrankiai ir failai yra vietoje
:: 02 | Paleidimas | viena komanda vietoj dešimties
:: 03 | Automatizacija | kiti skriptai ir CI žiūri į išėjimo kodą
:: 04 | Pasikartojantys darbai | ataskaitos, atsarginės kopijos, valymas
+ DevOps taisyklė: ką darote du kartus, verta paversti skriptu.
Pastaba: ~3 min. Susiekite su kursu: 04 pamokoje `http-kodas.sh`, 05 pamokoje `paleisti.sh`. Šiandien rašome aplinkos patikros skriptą, kurį po pamokos galima paleisti prieš bet kurį projektą.

=== tekstas | Kaip paleidžiamas skriptas
>> skriptas.sh | #! pasako: vykdo bash | bash vykdo eilutes iš eilės | išėjimo kodas
> Pirma eilutė `#!/usr/bin/env bash` yra užrašas ant dėžės: kas turi ją atidaryti.
```bash
chmod +x skriptas.sh
./skriptas.sh
```
+ `chmod +x` leidžia failą paleisti, `./` reiškia „šiame aplanke“
Pastaba: ~4 min. Rodykite vaizdą, tada dvi komandas. Be `chmod +x` bus `Permission denied`. Skriptą rašyti dar nereikia: tai bus demonstracijoje.

=== tekstas | Skripto sandara
```bash
#!/usr/bin/env bash
set -euo pipefail

failas="$1"
if [ -f "$failas" ]; then
  echo "Yra: $failas"
else
  echo "Nėra: $failas" >&2
  exit 1
fi
```
- `#!` ir `set -euo pipefail`: kuo vykdyti ir sustoti klaidoje
- `failas="$1"`: kintamasis iš argumento
- `if ... fi`: sąlyga, kad skriptas rinktųsi
- `exit 1`: išėjimo kodas, o `>&2`: žinutė į klaidų kanalą
Pastaba: ~5 min. Nuskaitykite skriptą iš viršaus į apačią kaip receptą. Nereikia aiškinti kiekvieno simbolio: pakanka suprasti, kad kiekviena eilutė turi vaidmenį. Kitas pavyzdys nei užduotyse (failo patikra, ne įrankio). Visa tai išbandysime demonstracijoje.

=== tekstas | Keturios pagrindinės dalys
@plokštelės
:: 01 | Kintamieji | dėžutė su vardu: `vardas=Ona`, `"$vardas"`
:: 02 | Argumentai | duomenys iš komandos eilutės: `$1`, `$#`, `"$@"`
:: 03 | Sąlyga | skriptas renkasi: `if [ -f failas ]`
:: 04 | Ciklas | kartoja per sąrašą: `for v in "${vardai[@]}"`
+ Šias keturias dalis sudėsime į vieną skriptą demonstracijoje.
Pastaba: ~6 min. Po vieną mintį: kintamasis = dėžutė su vardu; argumentas = duomenys iš komandos eilutės (kaip `git commit -m "..."`); sąlyga = šviesoforas; ciklas = kasos juosta. `if` jie jau žino, tik pakartokite. Detalės (testų ženklai, masyvai, `$(( ))`) yra lape ir demonstracijoje, ne čia. Dažna klaida: tarpai aplink `=` ir kintamasis be kabučių.

=== tekstas | Išėjimo kodas: skriptas atsako skaičiumi
> Kiekviena komanda pabaigoje pasako vieną skaičių: 0 reiškia viskas gerai.
| Kodas | Reiškia |
|---|---|
| `exit 0` | ?Sėkmė |
| `exit 1` | ?Klaida |
| `exit 2` | ?Bloga įvestis (mūsų susitarimas) |
| `$?` | ?Paskutinės komandos kodas |
Pastaba: ~4 min. Kitos programos (CI, `&&`) žiūri į kodą, o ne į tekstą. Pavyzdys: `command -v git; echo $?` rodo 0, o `command -v neegzistuoja; echo $?` rodo 1 (bandymas bus demonstracijoje).

=== tekstas | Gero skripto taisyklės
@plokštelės
:: 01 | Kabutės | `"$vardas"`, ne `$vardas`
:: 02 | Griežtas režimas | `set -euo pipefail`
:: 03 | Klaidos į klaidų kanalą | `echo "..." >&2`
:: 04 | Teisingas kodas | 0 gerai, 1 klaida, 2 bloga įvestis
+ Ir pabaigoje: paleiskite savo skriptą ir pažiūrėkite, ką jis grąžina.
Pastaba: ~3 min. Santrauka prieš demonstraciją. Mac Bash 3.2: be `${var,,}`, `mapfile`, `declare -A`. Dažna klaida: pamirštas `chmod +x`.

=== tekstas | Demonstracija: pereiname į lapą
@kelias
:: 1 | Aplankas | `mkdir -p ~/devops/demo-bash` ir `cd`; patikrinkite `pwd`
+:: 2 | Komandos terminale | kintamieji, argumentai, `if`, išėjimo kodas, ciklas
+:: 3 | Skriptas | `scripts/sveikas.sh` per `nano`, `chmod +x`, paleidimas
+:: 4 | Sulaužykite ir sutaisykite | vienas pakeitimas, paleidžiate, matote klaidą, sutaisote
+:: 5 | Git | `git init`, `git add .`, `git commit`, `gh repo create`, `git push -u origin main`
Pastaba: ~35 min. Demonstracija vyksta ne skaidrėse: ši skaidrė tik parodo planą. Atidarykite savo Notion lapą (kopija `uzduotys/bash komandos.md`), rodykite savo ekraną ir eikite skyriais 0–9; mokiniai kartu rašo savo terminaluose. Prieš `git init` visada `pwd` ir `ls`. Tik pabaigoje skelbkite 1 užduotį (joje yra visos paruošimo komandos).

=== komanda | Kaip dirbsite su užduotimis
```bash
nano exercises/01_greet.sh
bash tests/check.sh 1
```
- Aplanką `bash-lesson` su pratimais ir patikra atsisiunčiate iš Teams (1 užduotis)
- Pakeiskite kiekvieną `TODO` savo kodu
- Komandų ieškokite `bash komandos.md` ir `git komandos.md`
- Testas parodo, kas nepavyko ir ką tikėtasi
- Dar neišėjo? Dokumentacija ir paieška, o po to klauskite dirbtinio intelekto
Pastaba: ~3 min. Pagrindinė mintis: skaidrėse tik teorija, skriptus rašo mokiniai patys. Pratimai yra `exercises/`, patikra `bash tests/check.sh N` (N = pratimo numeris). Pradžioje ❌ yra normalu. Testą paleiskite iš `pamoka-03` šaknies. Testas tikrina tekstą, klaidų kanalą ir išėjimo kodą, bet ne kaip parašyta. Dirbtinio intelekto naudojimą nukreipkite: prašyti paaiškinti klaidą ar komandą, o ne parašyti visą skriptą.

=== tekstas | Git: pakeitimų atšaukimas
| Situacija | Komanda |
|---|---|
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
echo "pakeista" >> b.txt
git restore b.txt
```
Pastaba: ~10 min. Rodoma prieš 4 užduotį.

=== klaida | Dažnos klaidos
:: | Permission denied | Pamirštas `chmod +x`
:: | `[ $x = a ]` | Kabutės aplink `$x`: `[ "$x" = a ]`
:: | `${var,,}`, `mapfile` | Neveikia Mac Bash 3.2
:: | `git add .` ne tame aplanke | Prieš `git init` patikrinkite `pwd` ir `ls`
Pastaba: ~3 min.

=== uzduotys | Užduotys
@uzduotys: auto, tik sąrašas
Pastaba: Skelbkite po vieną. Užduotys: paprasti skriptai: argumentai ir `if` (1), ciklai (2), funkcija (3), `git restore` ir PR (4). Pasikartojimas terminale vyksta demonstracijoje. Skriptus mokiniai rašo patys pagal aprašą; modeliniai atsakymai yra `bash-lesson/solutions/`, mokiniams jų neduokite.

=== kita | Kita pamoka
Tinklų pagrindai: IP, portai, DNS, HTTP, `curl`
