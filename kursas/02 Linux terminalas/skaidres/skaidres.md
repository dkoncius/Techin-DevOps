=== titulinė | Linux terminalas
02 pamoka · 1 etapas
- Kam terminalas, kai serveryje nėra pelės
- Pagrindinės komandos: failai, skriptas, paketas
- Skriptas yra išsaugota komandų eilė

=== pagalvokime
Instrukcija prasideda: „atidarykite terminalą“.
# Kas yra terminalas?
+> Langas. Jame shell skaito jūsų eilutę ir paleidžia komandą.

=== tekstas | Terminale nėra pelės
- Renkatės eilute, ne paspaudimu
- Serveris dažnai neturi langų
- Komandos trumpos: `cd`, `ls`, `mv`

=== schema | Kaip veikia terminalas?
```excalidraw
file: terminalas-kaip-veikia
box komanda | Terminalo\nkomanda | 0,0 | blue
box skriptas | Bash\nskriptas | 1,0 | purple
box programa | Programa\npaleidžiama | 2,0 | orange
arrow komanda -> skriptas
arrow skriptas -> programa
```

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
Pastaba: prieš paskaitą paleiskite `demo-atstatyti.sh` (pamokos aplanke `kursas/02 Linux terminalas/`). Jis atstato `demo-a`: švarus `main`, be šakos `demo-02`, be `juodrastis` ir `demo-raktas.txt`, su `origin` GitHub'e. Be `origin` `git push` rašo „Repository not found“.

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

=== demonstracija | nano: prieš ir po
```bash
mkdir -p juodrastis
cd juodrastis
nano pradzia.env
```
+ Įklijuokite (Mac: `Cmd+V`):
```output+
# Demo
app_name = demo-a
App_Name = demo-a
log level: info
workers 2
```
+ Ištaisykite pagal rezultatą, išsaugokite ir patikrinkite:
```bash+
cat pradzia.env
```
```output+
# Demo
APP_NAME=demo-a
LOG_LEVEL=info
WORKERS=2
```
+ Tokį failą naudosime vėliau serverio nustatymams.
+> Kaip juodraštis ant popieriaus: pirma surašomas, tada pataisomas ir tik tada rodomas kitiems.

=== demonstracija | Commit ir push
```bash
cd ..
git add juodrastis/pradzia.env
git commit -m "Demo: pradžia"
git log --oneline
git push -u origin demo-02
```
+> Commit įrašo pakeitimą į istoriją, push nusiunčia į GitHub.

=== demonstracija | Žodžio failas
```bash
cd ..
echo Demo > demo-raktas.txt
cat demo-raktas.txt
ls -l demo-raktas.txt
```
```output+
Demo
-rw-r--r--  1 vardas  staff  5 ... demo-raktas.txt
```
+ Užrakiname, bandome skaityti ir žiūrime teises:
```bash+
chmod 000 demo-raktas.txt
cat demo-raktas.txt
ls -l demo-raktas.txt
```
```output+
cat: demo-raktas.txt: Permission denied
----------  1 vardas  staff  5 ... demo-raktas.txt
```
+> Kaip užrakinta spintelė: be rakto net savininkas neatidarys.
Pastaba: jei repeticijoje failas liko su `000`, `echo` nepavyks: paleiskite `demo-atstatyti.sh`.

=== demonstracija | Atrakintas failas
```bash
chmod 600 demo-raktas.txt
cat demo-raktas.txt
ls -l demo-raktas.txt
cd demo-a
```
```output+
Demo
-rw-------  1 vardas  staff  5 ... demo-raktas.txt
```
+ Prieigos teisės `-rw-------`, tai yra `600`:
| Rodoma | Skaičius | Kam | Teisė |
|---|---|---|---|
| `rw-` | `6` | jums | ?skaityti ir rašyti |
| `---` | `0` | grupei | ?nieko |
| `---` | `0` | visiems kitiems | ?nieko |
+> Grąžinome raktą tik sau: kiti jo neatidarys.
Pastaba: jei repeticijoje failas liko su `000`, `echo` nepavyks: paleiskite `demo-atstatyti.sh`.

=== schema | Kaip kurti shell skriptus?
**Shell skriptas** yra tekstinis failas su komandomis, kurias terminalas vykdo iš eilės.
```excalidraw
file: kaip-kurti-sh-skriptus
box k1 | 1. Išbandome\nkomandas po vieną | 0,0 | blue
box k2 | 2. Sukuriame\nfailą .sh | 1,0 | purple
box k3 | 3. Įklijuojame\nkodą ir išsaugome | 2,0 | orange
box k4 | 4. Paleidžiame\nvienu kartu | 3,0 | green
arrow k1 -> k2
arrow k2 -> k3
arrow k3 -> k4
```
+> Kaip receptas: žingsniai užrašyti viename lape, o kas juos vykdo, pasako pirma eilutė.

=== komanda | Komandos atskirai ir viename skripte
Išbandykime komandas atskirai, o paskui sujunkime į vieną skriptą.
```bash
pwd
basename "$(pwd)"
grep -n -f ../demo-raktas.txt juodrastis/pradzia.env
```
```output+
/Users/vardas/Desktop/devops/demo-a
demo-a
1:# Demo
```
+ Sukurkite skriptą ir išsaugokite:
```bash+
mkdir -p scripts
nano scripts/labas.sh
```
```bash+
#!/usr/bin/env bash
echo "Aplankas: $(basename "$(pwd)")"
echo "Eilutės:"
grep -n -f ../demo-raktas.txt juodrastis/pradzia.env
```
+ Pirma eilutė sako, kad skriptą vykdys `bash`. Kitos eilutės yra tos pačios komandos.

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

=== demonstracija | Į commit tik skriptas
```bash
git add scripts/labas.sh
git status
git commit -m "Demo: labas.sh"
git log --oneline
```
+ `rezultatas.txt` lieka „Untracked“, kaip `ataskaita.txt` užduotyje: į commit eina tik skriptas.

=== demonstracija | Kintamasis skripte
Į `scripts/labas.sh` gale pridėkite vieną eilutę:
```bash
echo "Spalva: ${SPALVA:-nenustatyta}"
```
+ Paleiskime:
```bash+
./scripts/labas.sh
```
```output+
Aplankas: demo-a
Eilutės:
1:# Demo
Spalva: nenustatyta
```
+> `${SPALVA:-nenustatyta}`: jei kintamasis nenustatytas, rodoma `nenustatyta`.

=== demonstracija | export ir naujas langas
```bash
export SPALVA=raudona
./scripts/labas.sh
```
```output+
Aplankas: demo-a
Eilutės:
1:# Demo
Spalva: raudona
```
+ Naujas langas (Mac: Cmd+N), tas pats projektas:
```bash+
cd ~/Desktop/devops/demo-a
./scripts/labas.sh
```
```output+
Aplankas: demo-a
Eilutės:
1:# Demo
Spalva: nenustatyta
```
+> Kaip lipdukas ant vieno lango: kitas langas jo nemato.

=== demonstracija | Paketas
```bash
brew install bat
which bat
bat scripts/labas.sh
```
```output+
/opt/homebrew/bin/bat
───────┬────────────────────────────────────────
       │ File: scripts/labas.sh
───────┼────────────────────────────────────────
   1   │ #!/usr/bin/env bash
   2   │ echo "Aplankas: $(basename "$(pwd)")"
   3   │ echo "Eilutės:"
   4   │ grep -n -f ../demo-raktas.txt juodrastis/pradzia.env
   5   │ echo "Spalva: ${SPALVA:-nenustatyta}"
───────┴────────────────────────────────────────
```
+ Ubuntu / WSL: `sudo apt install -y bat`, komanda `batcat`. Ilgas tekstas nėra klaida.
+> `bat` yra kaip `cat`, tik su numeriais. `sudo brew` neveikia.

=== klaida | Kas stringa
+:: | `sudo brew` | Mac `brew` be `sudo`
+:: | `/opt/homebrew` | Neįrašomas: kopijuokite `sudo chown -R` eilutę, kurią parašė brew
+:: | Naujas langas | `export` ten tuščias — taip ir turi būti
+:: | `PWD` | Rašykite `pwd`. Didžiosios raidės yra kita komanda

=== demonstracija | Pakeitimas į commit
```bash
git add scripts/labas.sh
git status
git commit -m "Demo: spalva"
git log --oneline
```
```output+
On branch demo-02
Changes to be committed:
        modified:   scripts/labas.sh

Untracked files:
        rezultatas.txt

a1b2c3d Demo: spalva
c5b9ddb Demo: labas.sh
b649f94 Demo: pradžia
7f5db4b Trumpas pakeitimas
```
+ `rezultatas.txt` lieka „Untracked“: į commit eina tik skriptas.

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
+ Nepainiokite: `push` siunčia šaką, PR yra prašymas GitHub'e, `pull` parsisiunčia `main`.
+> Kaip straipsnis redakcijoje: pirma redaktorius perskaito, tik tada spausdina.

=== demonstracija | Kas keliaus į GitHub
Šaka `demo-02` paruošta. Patikriname, kas keliaus į GitHub:
```bash
git branch
git status
git log --oneline main..HEAD
git diff --stat main..HEAD
```
```output+
* demo-02
  main
```
+ `git log` rodo tris commit'us, `git diff --stat` du failus: `juodrastis/pradzia.env` ir `scripts/labas.sh`.

=== demonstracija | Pull Request
```bash
git push -u origin demo-02
gh pr create --base main --title "Demo 02" --body "labas.sh su kintamuoju"
```
```output+
https://github.com/<vartotojas>/demo-a/pull/1
```
+ Atidarykite nuorodą, skiltis **Files changed**. Ten du failai: `juodrastis/pradzia.env` ir `scripts/labas.sh`.
+ Arba GitHub'e spauskite **Compare & pull request**.
+> PR yra prašymas sulieti šaką į `main`. Kol kas nors neperžiūrėjo, `main` nesikeičia.

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
+ Jei `gh` klausia „Delete the branch?“, atsakykite `N`. Naršyklėje: **Create a merge commit**, **Merge pull request**. **Delete branch** dar nespauskite.
+ `git log` viršuje `Merge pull request #1 ...`, po juo trys demonstracijos commit'ai.
+> Kaip laiškas, kuris nueina į dėžutę tik po patvirtinimo.

=== uzduotys | Užduotys
@uzduotys: auto, tik sąrašas

=== kita | 03 Bash skriptai
Čia skriptas tik kartoja komandas.
- Ten jis sprendžia: argumentas, `if`, `for`, išėjimo kodas
- `.gitignore`
