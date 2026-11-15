=== titulinė | Linux terminalas
02 pamoka · 1 etapas
- Kam terminalas, kai serveryje nėra pelės
- Pagrindinės komandos: failai, skriptas, paketas
- Skriptas yra išsaugota komandų eilė
Pastaba: ~2 min. Pirma tęsiame 01 projektą kita šaka, tada komandos. Pull Request lieka 4 užduotyje. `if` ir `for` yra 04 pamoka.

=== pagalvokime
Instrukcija prasideda: „atidarykite terminalą“.
# Kas yra terminalas?
> Langas. Jame shell skaito jūsų eilutę ir paleidžia komandą.
Pastaba: ~4 min. Be diagramos. Shell pas mus yra bash, ir Mac, ir Ubuntu. Prompt yra eilutė, kuri laukia. Jei po komandos iškart naujas prompt ir nėra teksto, dažniausiai pavyko.

=== tekstas | Terminale nėra pelės
- Renkatės eilute, ne paspaudimu
- Serveris dažnai neturi langų
- Komandos trumpos: `cd`, `ls`, `mv`
Pastaba: ~3 min. Anksčiau terminalas buvo klaviatūra ir ekranas. Siuntė klavišus, atgal gavo tekstą. Todėl vardai liko trumpi. Schemos čia nerodykite.

=== schema | Kaip veikia terminalas?
```excalidraw
file: terminalas-kaip-veikia
box komanda | Terminalo\nkomanda | 0,0 | blue
box skriptas | Bash\nskriptas | 1,0 | purple
box programa | Programa\npaleidžiama | 2,0 | orange
arrow komanda -> skriptas
arrow skriptas -> programa
```
Pastaba: ~3 min. Komanda terminale gali būti bash skriptas. Skriptas paleidžia programą, pavyzdžiui `grep`. `if` ir `for` čia dar nėra: skriptas tik išsaugo komandas.

=== demonstracija | Tęsiame tą patį projektą
```bash
cd ~/Desktop/devops/demo-a
git switch main
git pull
git status
git switch -c demo-02
git branch
```
```output+
* demo-02
  main
```
+ Kodėl šaka? `main` lieka kaip po 01 pamokos. Šios dienos failai jo neliečia, kol nesujungsite.
Pastaba: ~8 min. Tas pats aplankas, naujo repo nėra. Ne `git-bandymas`, ne `pamoka-02`. `git status` prieš šaką turi būti švarus. Commit darote kitoje skaidrėje, kai failas jau yra.

=== demonstracija | Failas, paieška, commit
```bash
pwd
ls
mkdir -p juodrastis
nano pradzia.md
grep -n "Demo" pradzia.md
```
```output+
1:# Demo
```
```bash+
git add pradzia.md
git status
git commit -m "Demo: pradžia"
git log --oneline
```
+ Faile tik `# Demo`. Išsaugoti `Ctrl+O`, `Enter`, `Ctrl+X` (Mac Control, ne Cmd).
> `grep` randa eilutę. `pwd` ir `ls` tik patikrina, kur esate.
Pastaba: ~10 min. Šaka jau `demo-02`. Ne `produktai.txt`. `mkdir` ir `grep` jie moka, čia jie ruošia commit. Paskelbkite 1 užduotį. Joje yra ir nano: rasti eilutę, ištrinti, pataisyti.

=== tekstas | Pirmoji skripto eilutė
@plokštelės
+:: #! | Paleisk | Šauktukas: šitą failą vykdyti
+:: env | Surask | `/usr/bin/env` randa `bash` ir Mac, ir Ubuntu
+:: bash | Programa | Komandas faile skaito bash
+ Atsiminkite tris dalis iš eilės: `#!/usr/bin/env bash`
> Kaip užrašas ant viršelio: atidaryti su bash.
Pastaba: ~3 min. Liepkite pasakyti garsiai: šauktukas, env, bash. Tada visa eilutė. Tai pirma failo eilutė, ne komanda prompt'e. Kodėl ne `/bin/bash`: kelias Mac ir Ubuntu gali skirtis, `env` pats suranda. Kitą skaidrę pradėkite įrašydami būtent šią eilutę į `labas.sh`.

=== demonstracija | Nuo komandos iki skripto
```bash
echo Demo > ~/Desktop/devops/demo-raktas.txt
chmod 600 ~/Desktop/devops/demo-raktas.txt
nano labas.sh
./labas.sh
```
```output+
permission denied
```
```bash+
chmod +x labas.sh
./labas.sh > rezultatas.txt
cat rezultatas.txt
```
```output+
1:# Demo
```
+ Į `labas.sh` pirma `#!/usr/bin/env bash` (šauktukas, `env`, `bash`). Tada `echo` aplanko ir `grep -n -f ~/Desktop/devops/demo-raktas.txt pradzia.md`. Žodžio `Demo` skripte nėra. Ne `ataskaita.sh`.
> Kodėl skriptas? Žodį saugo atskiras failas. Skriptas jį perskaito ir paleidžia paiešką dar kartą.
Pastaba: ~12 min. Pirma eilutė ta, kurią ką tik išskaidėte. `demo-raktas.txt` turi vieną žodį `Demo`, tada `chmod 600`. Ne `slaptas.txt` ir ne `kava`. Tada `permission denied`, tik po to `chmod +x`. `rezultatas.txt` rodo `1:# Demo`. Be rakto failo `grep` neturi ko ieškoti. Čia nėra `if` ir `for`. Paskelbkite 2 užduotį.

=== demonstracija | Langas ir paketas
```bash
export SPALVA=raudona
echo "SPALVA yra $SPALVA"
```
```output+
SPALVA yra raudona
```
+ Naujas langas, tas pats aplankas: `echo $SPALVA` tuščia. `export` liko senajame.
+ Mac: `brew install jq`. Ubuntu: `sudo apt update`, tada `sudo apt install jq`.
> `sudo brew` neveikia. Paketas demonstracijoje `jq`, užduotyje bus `tree`.
Pastaba: ~12 min. `ps` ir `kill` čia nerodote: tai jau pas Edgarą, 05 vėl prireiks prie porto. Prieš 3 užduotį parodykite kitą skaidrę: jei Mac `brew` stringa, taisome ten. Pull Request lieka 4 užduotyje.

=== klaida | Kas stringa
:: | `sudo brew` | Mac `brew` be `sudo`
:: | `/opt/homebrew` | Neįrašomas: kopijuokite `sudo chown -R` eilutę, kurią parašė brew
:: | Naujas langas | `export` ten tuščias — taip ir turi būti
:: | `PWD` | Rašykite `pwd`. Didžiosios raidės yra kita komanda
Pastaba: ~4 min. Mac. Jei `brew` rašo `/opt/homebrew is not writable` ir `Permission denied`, po klaidos yra eilutė `sudo chown -R`, mokinio vardas ir `/opt/homebrew`. Liepkite nukopijuoti tą eilutę. `sudo brew` ne. Slaptažodžio rašant nematyti. Tada vėl `brew install`. Ilgas tekstas (`Auto-updating Homebrew`, analytics, `Downloading`, pabaigoje `Extracting`) nėra klaida: laukti, kol grįš `%`. `brew: command not found` reiškia, kad Homebrew neįdiegtas (brew.sh). Tada skelbkite 3 užduotį.

=== uzduotys | Užduotys
@uzduotys: auto, tik sąrašas

=== kita | 04 Bash skriptai
Čia skriptas tik kartoja komandas.
- Ten jis sprendžia: argumentas, `if`, `for`, išėjimo kodas
- `.gitignore`
