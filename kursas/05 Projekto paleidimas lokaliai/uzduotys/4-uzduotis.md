# 4 užduotis: paleisti.sh ir Pull Request

**1.** **Tikslas:** pačiam parašyti skriptą `paleisti.sh`, kuris paleidžia projektą, palaukia `/health` 200 ir jį sustabdo, tada pateikti Pull Request. Skriptą auginsime po vieną dalį.

**2.** Atidaryti failą skriptui (projekto šaknyje):

- `cd ~/devops/devops-projektas`
- `nano paleisti.sh`
- `chmod +x paleisti.sh`

**3.** Pirma versija: paleisti projektą fone ir palaukti `/health`. Pačiam parašyti pagal rėmą:

```bash
#!/usr/bin/env bash
set -euo pipefail

# 1. Paleisti serverį fone (gale &) ir įsiminti jo PID: pid=$!
#    .venv/bin/flask --app app run --port 5001 >/dev/null 2>&1 &

# 2. Ciklas iki 20 kartų: for _ in $(seq 1 20); do ... done
#    kodas=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:5001/health" || true)
#    jei kodas lygus 200: parašyti "OK: /health atsakė 200", sustabdyti serverį (kill "$pid") ir exit 0
#    kitaip: sleep 1

# 3. Po ciklo: į klaidų kanalą parašyti "Nepavyko: /health neatsakė per 20 s", sustabdyti serverį ir exit 1
```

- Šį rėmą nekopijuokite: tai aprašas. Eilutes su `$(...)`, `&` ir `kill` galite nusikopijuoti iš komentarų
- Užuominos: `&` paleidžia komandą fone, `$!` yra to proceso PID, `seq 1 20` duoda skaičius nuo 1 iki 20, `sleep 1` palaukia sekundę
- `./paleisti.sh; echo "kodas: $?"`
- Turi būti: `OK: /health atsakė 200` ir kodas 0

**4.** Antra versija: porto pasirinkimas ir paleidimas iš bet kurio aplanko. Skriptas pats pereina į savo aplanką:

- `nano paleisti.sh`
- Po `set -euo pipefail` pridėti dvi eilutes (galite nukopijuoti): `cd "$(dirname "$0")"` ir `PORT="${PORT:-5001}"`
- Visur, kur buvo `5001`, rašyti `$PORT` (`--port "$PORT"` ir `localhost:$PORT`; adresą rašykite dvigubose kabutėse)
- `./paleisti.sh; echo "kodas: $?"`
- `PORT=5002 ./paleisti.sh; echo "kodas: $?"`
- Turi būti: abu kartus `OK: /health atsakė 200` ir kodas 0

**5.** Trečia versija: nustatymai iš `.env`:

- `nano paleisti.sh`
- Po `PORT=...` pridėti vieną eilutę (galite nukopijuoti): `[ -f .env ] && { set -a; . ./.env; set +a; }`
- Ji nuskaito `.env` kintamuosius ir juos padaro prieinamus paleistam serveriui (`set -a` pažymi kintamuosius eksportuoti)
- `./paleisti.sh; echo "kodas: $?"`
- Turi būti: `OK: /health atsakė 200` ir kodas 0, `git status` `.env` nerodo

**6.** Ketvirta versija: sustabdyti serverį, kad ir kaip baigtųsi skriptas:

- `nano paleisti.sh`
- Po `pid=$!` pridėti vieną eilutę (galite nukopijuoti): `trap 'kill "$pid" 2>/dev/null || true' EXIT`
- Ištrinti dvi ankstesnes `kill` eilutes (po `OK` ir po „Nepavyko“): `trap` sustabdys serverį pats, kai skriptas baigsis
- `./paleisti.sh; echo "kodas: $?"`
- `lsof -nP -i :5001`
- Turi būti: `OK: /health atsakė 200`, kodas 0 ir `lsof` nieko neišveda (serveris sustabdytas)

**7.** Penkta versija: Python ir `.venv` patikra (šį gabalą galite įklijuoti, tai ne bash pamoka):

- `nano paleisti.sh`
- Po `PORT=...` eilutės įklijuoti tekstą žemiau (`Cmd+V` Mac, `Ctrl+Shift+V` Ubuntu / WSL), tada išsaugoti: `Ctrl+O`, `Enter`, `Ctrl+X`

```bash
if ! python3 -c 'import sys; sys.exit(0 if sys.version_info >= (3, 9) else 1)'; then
  echo "Reikia Python 3.9 ar naujesnio" >&2
  exit 1
fi

[ -d .venv ] || python3 -m venv .venv
.venv/bin/pip install -q -r requirements.txt
```

- `./paleisti.sh; echo "kodas: $?"`
- Turi būti: `OK: /health atsakė 200` ir kodas 0

**8.** Paleisti, kai portas užimtas:

- Kitame lange: `python3 -m http.server 5003`
- `PORT=5003 ./paleisti.sh; echo "kodas: $?"`
- Turi būti: po maždaug 20 sekundžių klaida ir kodas 1
- Serverį sustabdyti: `Ctrl+C`

**9.** Papildyti `README.md`:

- `nano README.md`
- Pridėti skyrių „Paleidimas“: paleisti `./paleisti.sh`, patikrinti `/health`, spalvą ir versiją keisti faile `.env` (jo į Git nekelti)

**10.** Papildyti `docs/paleidimas.md`:

- `nano docs/paleidimas.md`
- Pridėti skyrių „paleisti.sh“ su trimis kodais: sėkmė 0, `PORT=5002` kodas 0, užimtas portas kodas 1

**11.** Išsaugoti Git'e dviem commit'ais:

- `git add paleisti.sh`
- `git commit -m "Pridėtas paleisti.sh"`
- `git add README.md docs`
- `git commit -m "Paleidimo užrašai"`
- `git status`
- Turi būti: `git status` nerodo `.env`

**12.** Nusiųsti šaką ir sukurti Pull Request:

- `git push -u origin pamoka-05`
- `gh pr create --title "Paleidimas lokaliai" --body "paleisti.sh, .env ir testai."`
- `gh pr merge --merge`
- Arba naršyklėje: pavadinimas „Paleidimas lokaliai“, tada **Merge pull request**

**13.** Atnaujinti `main` ir ištrinti šaką:

- `git switch main`
- `git pull`
- `git branch -d pamoka-05`
- `git push origin --delete pamoka-05`

**14.** **Papildomai:** paleisti iš kito aplanko:

- `cd /tmp && ~/devops/devops-projektas/paleisti.sh`
- Turi būti: kodas 0, nes skriptas pats pereina į savo aplanką (`dirname`)

**15.** **Pateikimas:** `./paleisti.sh` nuotrauka su `OK` ir sulietas Pull Request.

Jei užstrigote, pasižiūrėkite `paleidimas komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
