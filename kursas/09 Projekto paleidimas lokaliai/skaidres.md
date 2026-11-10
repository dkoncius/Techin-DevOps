=== titulinė | Projekto paleidimas lokaliai
09 pamoka · 1 etapas
- Paleisti projektą viena komanda ir patikrinti `/health`, `/status`
- Keisti elgesį per `.env`, nekeliant jo į Git
- Parašyti `paleisti.sh`, kuris paleidžia ir patikrina projektą
Pastaba: ~10 min pasitikrinimas po 08. Kitą pamoką atsiskaitymas 1: `paleisti.sh` yra jo dalis.

=== pagalvokime
Parsisiuntėte svetimą projektą.
# Kaip sužinoti, kad jis veikia?
> Kaip naujas automobilis: ne tik užvedate, bet pažiūrite, ar rodikliai tvarkoje.
Pastaba: ~3 min. Paleiskite `./run.sh` pradžioje ir parodykite puslapį.

=== schema | Projekto žemėlapis
```excalidraw
file: projekto-zemelapis
box app | app.py\nFlask serveris | 1.3,0 | blue
box req | requirements.txt | 0,0 | gray
box run | run.sh | 0,1 | green
box env | .env.example → .env | 2.6,0 | yellow
box testai | tests/ | 2.6,1 | purple
box db | schema.sqlite.sql | 1.3,1 | orange
arrow req -> app | priklausomybės
arrow run -> app | paleidžia
arrow env -> app | nustatymai
arrow testai -> app | tikrina
arrow db -> app | duomenys
```
Pastaba: ~8 min. Maršrutai: `/`, `/health`, `/status`, `/items`. SQLite pagal numatymą, MySQL nuo 18 pamokos. Kitas pavyzdys: mažas Flask failas iš kito aplanko.

=== komanda | Paleidimas ir patikra
```bash
./run.sh
```
```bash+
curl localhost:5001/health
curl localhost:5001/status
```
- Numatytasis portas 5001 (Mac užima 5000)
- Dažna klaida: paleista ne projekto aplanke; `python3-venv` Ubuntu
Pastaba: ~7 min.

=== tekstas | Nustatymai per `.env`
| Kintamasis | Poveikis |
|---|---|
| `APP_COLOR` | ?Pakeičia puslapio juostos spalvą |
| `APP_VERSION` | ?Rodoma `/status` atsakyme |
| `APP_ENV` | ?Aplinkos ženkliukas puslapyje |
> Ta pati programa, skirtingi nustatymai skirtingose aplinkose.
Pastaba: ~15 min. `.env` į Git nekeliamas: `git check-ignore -v .env`. Dažna klaida: `.env` jau `git add` (`git rm --cached .env`); serveris nepaleistas iš naujo.

=== komanda | Testai
```bash
.venv/bin/pytest
```
+ Žalia: viskas veikia; raudona: perskaitykite klaidos eilutę
+ Naudokite `.venv/bin/pytest`, ne sistemos `pytest`
Pastaba: ~10 min. Sugadinkite `/health` ir parodykite raudoną rezultatą.

=== schema | paleisti.sh: kas jame vyksta
>>+ Python 3.9+ | .venv ir paketai | Paleidimas fone | Laukia /health 200 | Sustabdo
Pastaba: ~10 min. Naudoja 04 (`if`, `for`, išėjimo kodas) ir 05 (`curl`) pamokų žinias.

=== komanda | paleisti.sh: pagrindinės eilutės
```bash
.venv/bin/flask --app app run --port "$PORT" >/dev/null 2>&1 &
pid=$!
trap 'kill "$pid" 2>/dev/null || true' EXIT

for _ in $(seq 1 20); do
  kodas=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:$PORT/health" || true)
  [ "$kodas" = "200" ] && { echo "OK"; exit 0; }
  sleep 1
done
exit 1
```
Pastaba: ~15 min. `&` fone, `$!` PID, `trap` sustabdo išėjus, `|| true` kad `set -e` nenutrauktų, kai niekas neklauso porto.

=== klaida | Dažnos klaidos
:: | Projektas ne tame aplanke | `cd ~/devops/devops-projektas`
:: | `.env` pakeitimas neveikia | Paleiskite serverį iš naujo
:: | `kill` po `exit` nesustabdo | Reikia `trap ... EXIT`
:: | `set -e` nutraukia skriptą | `curl ... \|\| true`
Pastaba: ~3 min.

=== uzduotys | Užduotys
@uzduotys: auto
Pastaba: Skelbkite po vieną. `main` apsaugotas (08): darbas per šaką ir PR.

=== kita | Kita pamoka
Atsiskaitymas 1: testas ir praktika
