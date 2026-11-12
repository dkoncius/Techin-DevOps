=== titulinė | Procesai ir paketai
03 pamoka · 1 etapas
- Parodyti procesus ir juos sustabdyti
- Nustatyti ir perskaityti aplinkos kintamąjį
- Įdiegti paketą su `apt` arba `brew`
Pastaba: ~10 min pasitikrinimas po 02: parodykite 02 sprendimą gyvai; kam neveikė `chmod` ar PR, kartu randame priežastį. Ritmas: skaidrės → jūsų demonstracija → užduotis Teams'e → jie daro patys. Užduotys eina viena gija: procesas → skriptas su kintamuoju → paketas → kodas → PR.

=== pagalvokime
Kompiuteryje vienu metu veikia šimtai programų.
# Kas jas visas valdo?
> Kaip darbuotojai biure: kiekvienas turi tabelio numerį, o vadovas gali kam nors liepti baigti darbą.
Pastaba: ~3 min. Jie jau moka `ps`; klauskite, ką prisimena iš Edgaro.

=== schema | Procesas ir jo aplinka
```excalidraw
file: procesas-ir-aplinka
box terminalas | Terminalas\nexport VARDAS=reiksme | 0,0.5 | blue
box procesas | Procesas\n(PID) | 1.4,0.5 | purple
box programa | Programa skaito kintamąjį | 2.8,0.5 | green
arrow terminalas -> procesas | paleidžia
arrow procesas -> programa | paveldi aplinką
```
Pastaba: ~4 min. Kintamasis gyvena tik tame terminale, kur jį nustatėte.

=== demonstracija | Procesai: paleisti, rasti, sustabdyti
```bash
sleep 600 &
ps aux | grep sleep
```
```bash+
kill <PID>
```
> `grep` eilutė irgi yra procesas: PID imkite iš `sleep` eilutės.
Pastaba: ~10 min. Kitas pavyzdys nei užduotyje: `python3 -m http.server 8000 &` ir `curl localhost:8000`, tada `kill`.

=== tekstas | Signalai: kaip sustabdyti procesą
| Komanda | Ką daro |
|---|---|
| `kill PID` | ?Prašo švelniai baigti (SIGTERM) |
| `kill -9 PID` | ?Priverstinai nutraukia (SIGKILL) |
| `Ctrl+C` | ?Nutraukia procesą šiame lange |
| `Ctrl+Z` | ?Pristabdo, bet nebaigia (lieka fone) |
Pastaba: ~4 min. Pirma bandykite švelniai.

=== komanda | Aplinkos kintamieji
```bash
export DEMO=1
echo $DEMO
env | grep DEMO
```
+ Naujas terminalo langas kintamojo nemato
+ `PATH` yra kelių sąrašas, kuriuose terminalas ieško komandų
Pastaba: ~10 min. Kitas nei mokinių kintamasis (ne `PROJEKTO_VARDAS`). Dažna klaida: `export` viename lange, skriptas kitame.

=== komanda | PATH: kaip terminalas randa komandas
```bash
echo $PATH
which ls
```
+ `PATH` yra aplankų sąrašas; terminalas ieško komandos juose paeiliui
+ Dabartinio aplanko ten nėra, todėl savo skriptą rašome `./skriptas.sh`
Pastaba: ~3 min. Susiejame su 02: kodėl `./scripts/ataskaita.sh` reikia `./`.

=== tekstas | Kodėl nustatymai kintamuosiuose
- Kode jie patektų į Git ir į visų kopijas
- Ta pati programa veikia skirtingai pagal aplinką (spalva, versija, duomenų bazė)
- Kintamasis lieka tik toje aplinkoje, kur programa paleista
- `.env` nekeliamas į Git; `.env.example` rodo, kokių kintamųjų reikia
Pastaba: ~3 min. Tai pagrindas Docker ir Kubernetes etapui: ten kintamieji perduodami konteineriui.

=== demonstracija | Paketai: Mac ir Ubuntu
| Veiksmas | Mac / Ubuntu (WSL) |
|---|---|
| Atnaujinti sąrašą | ?`brew update` / `sudo apt update` |
| Įdiegti `htop` | ?`brew install htop` / `sudo apt install htop` |
| Ar įdiegtas | ?`brew list htop` / `dpkg -s htop` |
| Versija ir vieta | ?`htop --version`, `which htop` |
Pastaba: ~15 min. Dažna klaida: `sudo apt install` be `apt update`; Mac studentas rašo `sudo brew`; Windows studentas diegia ne WSL.

=== komanda | Kaip programa skaito aplinką
```python
import os

color = os.environ.get("APP_COLOR", "blue")
```
```bash+
APP_COLOR=red python3 -c "import os; print(os.environ.get('APP_COLOR', 'blue'))"
python3 -c "import os; print(os.environ.get('APP_COLOR', 'blue'))"
```
+ Nenustatytas: numatytoji reikšmė `blue`; nustatytas: jūsų reikšmė
Pastaba: ~5 min. Jų `app.py` turi tokias eilutes (`grep -n "os.environ" app.py`). Kitas kintamasis nei užduotyje: `APP_VERSION`. Paklauskite: kas bus, jei `DB_HOST` nenustatytas.

=== klaida | Dažnos klaidos
:: | `kill` su `grep` PID | Paimtas paties `grep` PID, ne programos
:: | `Ctrl+Z` vietoj `Ctrl+C` | Procesas lieka fone: `ps`, `kill`
:: | „Unable to locate package“ | Pirma `sudo apt update`
:: | `sudo brew` | Mac `brew` be `sudo`
Pastaba: ~3 min.

=== uzduotys | Užduotys
@uzduotys: auto, tik sąrašas
Pastaba: Skelbkite po vieną Teams'e: kiekvieną užduotį po demonstracijos, kitą tik kai baigia. Užduotys eina viena gija viename projekte: procesas (1), skriptas su kintamuoju (2), paketas (3), kodas ir PR (4). Mac ir Ubuntu komandų lentelė 3 užduotyje: leiskite rašyti abi. Atsakymus į „Kodėl“ rašo `docs/procesai.md`.

=== kita | Kita pamoka
Bash skriptai: kintamieji, sąlygos, ciklai
