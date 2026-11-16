# 4 užduotis: paleisti.sh ir Pull Request

**1.** **Tikslas:** parašyti skriptą, kuris paleidžia projektą, palaukia `/health` 200 ir jį sustabdo, tada pateikti Pull Request.

**2.** Atidaryti failą skriptui:

- `nano paleisti.sh`
- Įklijuoti visą tekstą žemiau (**Mac: Cmd+V**; Ubuntu / WSL: `Ctrl+Shift+V`), tada `Ctrl+O`, `Enter`, `Ctrl+X`

```bash
#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
PORT="${PORT:-5001}"

if ! python3 -c 'import sys; sys.exit(0 if sys.version_info >= (3, 9) else 1)'; then
  echo "Reikia Python 3.9 ar naujesnio" >&2
  exit 1
fi

[ -d .venv ] || python3 -m venv .venv
.venv/bin/pip install -q -r requirements.txt

[ -f .env ] && { set -a; . ./.env; set +a; }
.venv/bin/flask --app app run --port "$PORT" >/dev/null 2>&1 &
pid=$!
trap 'kill "$pid" 2>/dev/null || true' EXIT

for _ in $(seq 1 20); do
  kodas=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:$PORT/health" || true)
  if [ "$kodas" = "200" ]; then
    echo "OK: /health atsakė 200"
    exit 0
  fi
  sleep 1
done

echo "Nepavyko: /health neatsakė per 20 s" >&2
exit 1
```

**3.** Leisti paleisti skriptą:

- `chmod +x paleisti.sh`

**4.** Paleisti sėkmės atveju:

- `./paleisti.sh; echo "kodas: $?"`
- `PORT=5002 ./paleisti.sh; echo "kodas: $?"`
- Turi būti: abi `OK: /health atsakė 200` ir kodas 0

**5.** Paleisti, kai portas užimtas:

- Kitame lange: `python3 -m http.server 5003`
- `PORT=5003 ./paleisti.sh; echo "kodas: $?"`
- Turi būti: po maždaug 20 sekundžių klaida ir kodas 1
- Serverį sustabdyti: `Ctrl+C`

**6.** Papildyti `README.md`:

- `nano README.md`
- Pridėti skyrių „Paleidimas“: paleisti `./paleisti.sh`, patikrinti `/health`, spalvą ir versiją keisti faile `.env` (jo į Git nekelti)

**7.** Papildyti `docs/paleidimas.md`:

- `nano docs/paleidimas.md`
- Pridėti skyrių „paleisti.sh“ su trimis kodais: sėkmė 0, `PORT=5002` kodas 0, užimtas portas kodas 1

**8.** Išsaugoti Git'e dviem commit'ais:

- `git add paleisti.sh`
- `git commit -m "Pridėtas paleisti.sh"`
- `git add README.md docs`
- `git commit -m "Paleidimo užrašai"`
- `git status`
- Turi būti: `git status` nerodo `.env`

**9.** Nusiųsti šaką ir sukurti Pull Request:

- `git push -u origin pamoka-05`
- `gh pr create --title "Paleidimas lokaliai" --body "paleisti.sh, .env ir testai."`
- `gh pr merge --merge`
- Arba naršyklėje: pavadinimas „Paleidimas lokaliai“, tada **Merge pull request**

**10.** Atnaujinti `main` ir ištrinti šaką:

- `git switch main`
- `git pull`
- `git branch -d pamoka-05`
- `git push origin --delete pamoka-05`

**11.** **Papildomai:** paleisti iš kito aplanko:

- `cd /tmp && ~/devops/devops-projektas/paleisti.sh`
- Turi būti: kodas 0, nes skriptas pats pereina į savo aplanką (`dirname`)

**12.** **Pateikimas:** `./paleisti.sh` nuotrauka su `OK` ir sulietas Pull Request.

Jei užstrigote, pasižiūrėkite `paleidimas komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
