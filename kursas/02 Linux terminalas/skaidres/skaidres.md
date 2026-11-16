=== titulinė | Linux terminalas
02 pamoka · 1 etapas
- Kam terminalas, kai serveryje nėra pelės
- Pagrindinės komandos: failai, skriptas, paketas
- Skriptas yra išsaugota komandų eilė
Pastaba: ~2 min. Pirma tęsiame 01 projektą kita šaka, tada komandos. Pull Request mokiniai pirmą kartą mato pamokos gale (demonstracija, tada 4 užduotis). `if` ir `for` yra 03 pamoka.

=== pagalvokime
Instrukcija prasideda: „atidarykite terminalą“.
# Kas yra terminalas?
+> Langas. Jame shell skaito jūsų eilutę ir paleidžia komandą.
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
Pastaba: ~8 min. Tas pats aplankas, naujo repo nėra. Ne `git-bandymas`, ne `pamoka-02`. `git status` prieš šaką turi būti švarus. Commit darote kitoje skaidrėje, kai failas jau yra. Prieš paskaitą: `demo-a` turi būti GitHub'e (`git remote -v` rodo `origin`, pvz. `gh repo create demo-a --private --source=. --remote=origin`, tada `git push -u origin main`), `main` švarus, šakos `demo-02` dar nėra, aplanko `juodrastis` ir `../demo-raktas.txt` nėra. Be `origin` `git push` rašo „Repository not found“. Po repeticijos viską atstato `demo-atstatyti.sh` pamokos aplanke (`kursas/02 Linux terminalas/`).

=== tekstas | nano: judėti ir taisyti
| Klavišai | Ką daro |
|---|---|
| Rodyklės | Juda po tekstą |
| `Ctrl+E` | Į eilutės galą |
| `Ctrl+A` | Į eilutės pradžią |
| `Ctrl+W` | Ieško teksto, tada `Enter` |
| `Ctrl+K` | Iškerpa visą eilutę |
| `Backspace` | Ištrina raidę kairėje |
| `Cmd+V` | Įklijuoja (Mac), Ubuntu: `Ctrl+Shift+V` |
| `Ctrl+O`, `Enter` | Išsaugo |
| `Ctrl+X` | Išeina iš `nano` |
Pastaba: ~3 min. Šie klavišai bus 1 užduotyje (5–7 žingsniai). Parodykite kiekvieną trumpai gyvai tuščiame faile, ne tik skaidrėje. Mac: `Ctrl` yra Control, ne Cmd. Jei apačioje rodomas `^X`, `^` reiškia Ctrl. `Ctrl+K` iškerpa eilutę, o ne tik raidę.

=== demonstracija | nano: prieš ir po
```bash
mkdir -p juodrastis
cd juodrastis
nano pradzia.env
```
+ Įklijuokite:
```output+
# Demo
app_name = demo-a
App_Name = demo-a
log level: info
workers 2
```
+ Ištaisykite, kad būtų taip, išsaugokite ir patikrinkite:
```bash+
cat pradzia.env
```
```output+
# Demo
APP_NAME=demo-a
LOG_LEVEL=info
WORKERS=2
```
+> Kaip juodraštis ant popieriaus: pirma surašomas, tada pataisomas ir tik tada rodomas kitiems.
Pastaba: ~6 min. Užduoties 1 žingsniai 4–8 su kitu turiniu: demonstracijoje `pradzia.env` (programos vardas, žurnalo lygis), užduotyje `serveriai.txt` (serverių vardai ir IP). Įklijuoti **Cmd+V** (Mac). Ištrinti `app_name = demo-a`: `Ctrl+W`, `app_name`, `Enter`, `Ctrl+K`. `App_Name = demo-a`: rodyklėmis pašalinti tarpus aplink `=`, vardą didžiosiomis. `log level: info` į `LOG_LEVEL=info`, `workers 2` į `WORKERS=2`. Išsaugoti `Ctrl+O`, `Enter`, `Ctrl+X`. Tokį failą naudosime vėlesnėse pamokose: jame bus laikomi slapti serverio nustatymai. Tikros `.env` reikšmės (slaptažodžiai) į Git nedėtinos, čia tik pavyzdys. Po to `cat pradzia.env` rodo „po“.

=== demonstracija | Commit ir push
```bash
cd ..
git add juodrastis/pradzia.env
git commit -m "Demo: pradžia"
git log --oneline
git push -u origin demo-02
```
+> Commit įrašo pakeitimą į istoriją, push nusiunčia į GitHub.
Pastaba: ~4 min. Užduoties 1 žingsnis 9 be `merge`: `main` kol kas nekeičiate. Šaka jau `demo-02`. Paskelbkite 1 užduotį. Joje yra ir nano: rasti eilutę, ištrinti, pataisyti.

=== demonstracija | Žodžio failas
```bash
cd ..
echo Demo > demo-raktas.txt
chmod 600 demo-raktas.txt
cat demo-raktas.txt
ls -l demo-raktas.txt
cd demo-a
```
```output+
Demo
-rw-------  1 vardas  staff  5 ... demo-raktas.txt
```
+> Raktas guli už projekto ribų, todėl niekada nepateks į Git.
Pastaba: ~4 min. Tai užduoties 2 žingsniai 4–5 su kitais vardais: ne `slaptas.txt`, ne `db1`. `demo-raktas.txt` turi vieną žodį `Demo`, tada `chmod 600`. Failas yra aplanke `devops`, vienu lygiu aukščiau už `demo-a`. Čia nėra `if` ir `for`.

=== demonstracija | Tos pačios komandos terminale
```bash
pwd
basename "$(pwd)"
echo "Eilutės:"
grep -n -f ../demo-raktas.txt juodrastis/pradzia.env
```
```output+
/Users/vardas/Desktop/devops/demo-a
demo-a
Eilutės:
1:# Demo
```
+ `grep` ieško žodžio faile: `-f` žodį ima iš failo `demo-raktas.txt`, `-n` prieš radinį parašo eilutės numerį (`1:`).
+ Tos pačios komandos, kurios kitoje skaidrėje bus viename faile.
Pastaba: ~4 min. Komandas rašote po vieną, ne faile. `pwd` ir `echo` jie jau moka. Nauja: `basename` (palieka tik paskutinę kelio dalį, `$(...)` įrašo vidinės komandos rezultatą) ir `grep -f`: žodį ima iš failo, `-n` rodo eilutės numerį, `../` yra vienas aplankas aukščiau. Kelias `/Users/vardas/...` yra pavyzdinis. Žodžio komandoje nėra, jis `demo-raktas.txt`.

=== komanda | Skriptas: komandos viename faile
Naujas failas `scripts/labas.sh`, atidaromas su `nano scripts/labas.sh`:
```bash
#!/usr/bin/env bash
echo "Aplankas: $(basename "$(pwd)")"
echo "Eilutės:"
grep -n -f ../demo-raktas.txt juodrastis/pradzia.env
```
+ **1.** `#!/usr/bin/env bash`: kas paleidžia failą. `env` randa `bash` ir Mac, ir Ubuntu.
+ **2.** `$(basename "$(pwd)")`: `pwd` rodo, kur esate, `basename` palieka tik aplanko vardą.
+ **3.** `echo "Eilutės:"`: užrašas ekrane prieš radinį.
+ **4.** `grep -n -f ../demo-raktas.txt ...`: `-f` žodį ima iš failo, `-n` rodo eilutės numerį, `../` yra vienas aplankas aukščiau.
+ Išsaugoti ir išeiti: `Ctrl+O`, `Enter`, `Ctrl+X`.
+> Kaip receptas: žingsniai užrašyti, o kas juos vykdo, pasako pirma eilutė.
Pastaba: ~5 min. Tos pačios keturios komandos iš ankstesnės skaidrės, dabar viename faile. Nauja tik pirma eilutė: liepkite pasakyti garsiai šauktukas, env, bash. Kodėl ne `/bin/bash`: kelias Mac ir Ubuntu gali skirtis, `env` pats suranda. Tai užduoties 2 žingsniai 6–7, tik kiti vardai. Failą sukurkite čia pat: `mkdir -p scripts`, `nano scripts/labas.sh`, įrašykite skriptą, išsaugokite. Kitoje skaidrėje jį tik paleidžiate.

=== demonstracija | Paleidimas ir teisės
```bash
./scripts/labas.sh
```
```output+
zsh: permission denied: ./scripts/labas.sh
```
```bash+
chmod +x scripts/labas.sh
./scripts/labas.sh > rezultatas.txt
cat rezultatas.txt
```
```output+
Aplankas: demo-a
Eilutės:
1:# Demo
```
+> Kaip dokumentas be „leista skaityti“ spaudo: failas yra, bet sistema jo nepaleis, kol neleisite.
Pastaba: ~5 min. Užduoties 2 žingsniai 8–11. Skriptas jau išsaugotas ankstesnėje skaidrėje. Pirma `permission denied`, tik tada `chmod +x`. `rezultatas.txt` rodo `Aplankas: demo-a`, `Eilutės:` ir `1:# Demo`. Skriptą leiskite iš `demo-a`, nes `../` skaičiuojamas nuo ten. Be rakto failo `grep` neturi ko ieškoti.

=== demonstracija | Į commit tik skriptas
```bash
git add scripts/labas.sh
git status
git commit -m "Demo: labas.sh"
git log --oneline
```
+ `rezultatas.txt` lieka „Untracked“, kaip `ataskaita.txt` užduotyje: į commit eina tik skriptas.
Pastaba: ~3 min. Užduoties 2 žingsnis 12. `git status`: paruoštas tik `scripts/labas.sh`, `rezultatas.txt` Untracked, `demo-raktas.txt` nerodomas. Paskelbkite 2 užduotį.

=== demonstracija | Kintamasis skripte
```bash
mkdir -p docs
nano scripts/spalva.sh
chmod +x scripts/spalva.sh
./scripts/spalva.sh > docs/spalva.txt
cat docs/spalva.txt
```
```output+
SPALVA: nenustatyta
```
+ Į `spalva.sh` pirma `#!/usr/bin/env bash`, tada `echo "SPALVA: ${SPALVA:-nenustatyta}"`.
+> `${SPALVA:-nenustatyta}`: jei kintamasis nenustatytas, rodoma `nenustatyta`.
Pastaba: ~5 min. Užduoties 3 žingsniai 3–6 su kitais vardais (ne `aplinka.sh`, ne `PROJEKTO_VARDAS`). Čia `permission denied` jau matyta, todėl `chmod +x` iškart.

=== demonstracija | export ir naujas langas
```bash
export SPALVA=raudona
./scripts/spalva.sh
```
```output+
SPALVA: raudona
```
+ Naujas langas (Mac: Cmd+N), tas pats projektas:
```bash+
cd ~/Desktop/devops/demo-a
./scripts/spalva.sh
```
```output+
SPALVA: nenustatyta
```
+> Kaip lipdukas ant vieno lango: kitas langas jo nemato.
Pastaba: ~5 min. Užduoties 3 žingsniai 7–8. Naują langą atidarykite gyvai. Senajame lange `export` vis dar galioja. Dažna klaida: `export` viename lange, skriptas kitame.

=== demonstracija | Paketas ir commit
```bash
brew install jq
jq --version
which jq
```
+ Ubuntu / WSL: `sudo apt update`, tada `sudo apt install jq`.
```bash+
git add scripts/spalva.sh docs
git status
git commit -m "Demo: spalva"
git log --oneline
```
+> `sudo brew` neveikia. Paketas demonstracijoje `jq`, užduotyje bus `tree`.
Pastaba: ~6 min. Užduoties 3 žingsniai 9–12. `ps` ir `kill` čia nerodote: tai jau pas Edgarą, 04 vėl prireiks prie porto. Užduotyje `tree` rodo projekto medį; čia jo neįdiegiate, kad nesutaptų. Prieš 3 užduotį parodykite kitą skaidrę: jei Mac `brew` stringa, taisome ten.

=== klaida | Kas stringa
+:: | `sudo brew` | Mac `brew` be `sudo`
+:: | `/opt/homebrew` | Neįrašomas: kopijuokite `sudo chown -R` eilutę, kurią parašė brew
+:: | Naujas langas | `export` ten tuščias — taip ir turi būti
+:: | `PWD` | Rašykite `pwd`. Didžiosios raidės yra kita komanda
Pastaba: ~4 min. Mac. Jei `brew` rašo `/opt/homebrew is not writable` ir `Permission denied`, po klaidos yra eilutė `sudo chown -R`, mokinio vardas ir `/opt/homebrew`. Liepkite nukopijuoti tą eilutę. `sudo brew` ne. Slaptažodžio rašant nematyti. Tada vėl `brew install`. Ilgas tekstas (`Auto-updating Homebrew`, analytics, `Downloading`, pabaigoje `Extracting`) nėra klaida: laukti, kol grįš `%`. `brew: command not found` reiškia, kad Homebrew neįdiegtas (brew.sh). Tada skelbkite 3 užduotį.

=== schema | Kam Pull Request, jei galima `push`?
```excalidraw
file: pull-request-kam
box k1 | Be PR | 0,0 | pink
box m1 | main | 1,0 | pink
arrow k1 -> m1
box k2 | Su PR | 0,1.1 | blue
box pr | Peržiūra | 1,1.1 | orange
box m2 | main | 2,1.1 | green
arrow k2 -> pr
arrow pr -> m2
```
+ Be PR: klaida iškart patenka į `main`, kurį naudoja visi.
+ Su PR: kas nors pirma peržiūri pakeitimus ir tik tada jie patenka į `main`.
+ Nepainiokite: `git push` nusiunčia šaką, Pull Request yra prašymas GitHub'e (ne komanda), `git pull` parsisiunčia sulietą `main`.
+> Kaip straipsnis redakcijoje: pirma redaktorius perskaito, tik tada spausdina.
Pastaba: ~3 min. Dabar jūs vieni, bet darbe PR yra norma, o vėliau (CI/CD) PR paleis automatinius testus. `push` ir PR nekonkuruoja: pirma `push` šakos, tada PR, merge, ir tik tada `git pull`. PR pavadinimas reiškia „prašau, kad `main` pasiimtų (pull) mano pakeitimus“, todėl žodis painiojamas su `git pull`. Jie `git pull` jau naudojo 1 užduotyje.

=== demonstracija | Pull Request
```bash
git branch
git status
git log --oneline main..HEAD
git diff --stat main..HEAD
grep -rniE "password|token|secret" juodrastis scripts docs
```
```output+
(tuščia: slaptažodžių nėra)
```
```bash+
git push -u origin demo-02
gh pr create --base main --title "Demo 02: pradžia ir skriptai" --body "Pirmas failas, labas.sh ir spalva.sh."
```
```output+
https://github.com/<vartotojas>/demo-a/pull/1
```
+ Atidarykite nuorodą, skiltis **Files changed**: tie patys keturi failai kaip `git diff --stat`.
+> PR yra prašymas sulieti šaką į `main`. Kol kas nors neperžiūrėjo, `main` nesikeičia.
Pastaba: ~10 min. Pull Request pirmą kartą kurse: 01 pamokoje merge buvo vietinis, čia tas pats per GitHub su peržiūra. Rodykite kitu pavyzdžiu nei užduotyje: `demo-a`, šaka `demo-02`, tos pačios komandos kaip 4 užduoties 2–6 žingsniuose. Trys commit'ai (`Demo: pradžia`, `Demo: labas.sh`, `Demo: spalva`), keturi failai: `juodrastis/pradzia.env`, `scripts/labas.sh`, `scripts/spalva.sh`, `docs/spalva.txt`. `rezultatas.txt` neįeina. Naršyklės kelias: Compare & pull request, base `main`, compare `demo-02`. Nesakykite pirmą kartą „merge“: tai kita skaidrė.

=== demonstracija | Sulieti ir sutvarkyti
```bash
gh pr merge --merge
git switch main
git pull
git branch -d demo-02
git push origin --delete demo-02
git branch
git log --oneline -5
```
```output+
* main
```
+ `git log` viršuje `Merge pull request #1 ...`, po juo trys demonstracijos commit'ai.
+> Kaip laiškas, kuris nueina į tikrą dėžutę tik po patvirtinimo: PR sulietas, tada šaką galima išmesti.
Pastaba: ~8 min. Jei `gh` klausia „Delete the branch locally and on GitHub?“, atsakykite N: šaką trinate patys, kaip 4 užduoties 8 žingsnyje. Naršyklėje: **Create a merge commit** (ne Squash, ne Rebase), **Merge pull request**, **Confirm merge**, mygtuko **Delete branch** dar nespausti. Dažna klaida: `git branch -d` rašo „not fully merged“, nes suliejote su Squash arba Rebase (tada `git branch -D`). Paskelbkite 4 užduotį.

=== uzduotys | Užduotys
@uzduotys: auto, tik sąrašas

=== kita | 03 Bash skriptai
Čia skriptas tik kartoja komandas.
- Ten jis sprendžia: argumentas, `if`, `for`, išėjimo kodas
- `.gitignore`
