# 4 užduotis: paleisti.sh ir Pull Request

1. **Tikslas:** parašyti skriptą, kuris paleidžia projektą, palaukia `/health` 200 ir jį sustabdo, tada pateikti Pull Request.
2. `nano paleisti.sh` ir įrašykite:

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

`chmod +x paleisti.sh`.
3. Sėkmė: `./paleisti.sh; echo "kodas: $?"`. Išvestis `OK: /health atsakė 200`, kodas 0. Kitas portas: `PORT=5002 ./paleisti.sh; echo "kodas: $?"`. Vėl 0.
4. Užimtas portas: kitame lange `python3 -m http.server 5003`. Tada `PORT=5003 ./paleisti.sh; echo "kodas: $?"`. Po maždaug 20 sekundžių klaida ir kodas 1. Serverį sustabdykite `Ctrl+C`.
5. `README.md` pridėkite skyrių „Paleidimas“: paleisti `./paleisti.sh`, patikrinti `/health`, spalvą ir versiją keisti faile `.env` (jo į Git nekelti).
6. Į `docs/paleidimas.md` skyrių „paleisti.sh“ įrašykite tris kodus: sėkmė 0, `PORT=5002` kodas 0, užimtas portas kodas 1.
7. Commit'ai: `git add paleisti.sh`, `git commit -m "Pridėtas paleisti.sh"`. `git add README.md docs`, `git commit -m "Paleidimo užrašai"`. `git status` nerodo `.env`.
8. `git push -u origin pamoka-05`. Pull Request į `main`, pavadinimas „Paleidimas lokaliai“. **Merge pull request**. `gh pr create --title "Paleidimas lokaliai" --body "paleisti.sh, .env ir testai."`, `gh pr merge --merge`.
9. `git switch main`, `git pull`, `git branch -d pamoka-05`, `git push origin --delete pamoka-05`.
10. **Papildomai:** `cd /tmp && ~/devops/devops-projektas/paleisti.sh`. Kodas 0, nes skriptas pats pereina į savo aplanką (`dirname`).
11. **Pateikimas:** `./paleisti.sh` nuotrauka su `OK` ir sulietas Pull Request.

Jei užstrigote, pasižiūrėkite `paleidimas komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
