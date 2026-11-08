# 03 Procesai ir paketai: sprendimai (dėstytojui)

Patikrinta: `scripts/aplinka.sh` paleistas macOS (bash), `sleep` + `kill` išbandyta. Nepatikrinta: `apt` dalis (Ubuntu / WSL2), `dpkg -s tree`, `brew list tree` ir `top -o`. Išbandyti prieš pamoką abiejose sistemose.

## Kas čia

Pavyzdinis mokinio rezultatas: `pavyzdys/scripts/aplinka.sh` (`PROJEKTO_VARDAS` su numatytąja reikšme ir procesų skaičius) ir `pavyzdys/docs/procesai.md` (išvestys, paketas, `DB_HOST`). `projektas/` kol kas tik „bus papildyta“.

## Kaip rodyti klasėje

1. (~10 min) Praeitos pamokos (02) sprendimas gyvai: po `git pull` atidarykite `pamokos/02 Linux terminalas/sprendimai/` ir paleiskite `pavyzdys/scripts/terminalas.sh` jūsų demo repo. Parodykite `ls -l` su `x`.
2. (~20 min) Procesai: `sleep 600 &`, `ps`, `jobs`, `kill`. Kitas pavyzdys nei mokinių: rodykite `python3 -m http.server 8000 &` ir `curl` į jį, tada `kill`. Dažna klaida: `kill` su PID iš `grep` eilutės, kur PID yra paties `grep` procesas.
3. (~20 min) Aplinkos kintamieji: `export DEMO=1`, `echo $DEMO`, naujas terminalo langas jo nemato. Kitas nei mokinių kintamasis (ne `PROJEKTO_VARDAS`). Dažna klaida: `export` tame pačiame lange, o skriptas paleidžiamas kitame.
4. (~20 min) Paketas: įdiegti `htop` (ne `tree`) abiem būdais: Mac `brew install htop`, Ubuntu `sudo apt update` ir `sudo apt install htop`; parodyti `which`, `--version`. Dažna klaida: `sudo apt install` be `apt update` ir „Unable to locate package“; Mac studentas rašo `sudo brew`; Windows studentas diegia į PowerShell, ne WSL.
5. (~10 min) `os.environ.get("DB_HOST", "localhost")`: ką grąžina be kintamojo ir su juo.
6. Mokiniai daro užduotis; pabaigoje `./kursas.sh patikrinti 03`.

## Sprendimas pagal darbus

| Darbas | Kur sprendime |
|---|---|
| Procesas fone ir PID | `pavyzdys/docs/procesai.md`, skyrius „Procesas“ |
| Procesas sustabdytas | `ps` jo nebemato (`kill <PID>`) |
| Skriptas `aplinka.sh` | `pavyzdys/scripts/aplinka.sh` |
| Išvestis be kintamojo ir su juo | `pavyzdys/docs/procesai.md`, skyrius „Skripto išvestis“ |
| Paketo įdiegimas ir versija | `pavyzdys/docs/procesai.md`, skyrius „Paketas“ |
| Kuris paketas atitinka komandą | `pavyzdys/docs/procesai.md`, skyrius „Paketas“ |
| `DB_HOST` kodo skaitymas | `pavyzdys/docs/procesai.md`, skyrius `DB_HOST` |
| ≥ 2 commit'ai ir sulietas PR | `git log --oneline` ir GitHub **Merged** |

DI, PR ir pateikimas: DI aprašytas (ką paklausė ir kaip patikrino), pateikta sulieto PR nuoroda. Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose (vertinimas.md).
