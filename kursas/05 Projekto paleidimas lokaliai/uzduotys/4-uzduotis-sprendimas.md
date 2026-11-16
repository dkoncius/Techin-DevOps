# 4 užduotis, sprendimas (dėstytojui): paleisti.sh ir Pull Request

Numeriai atitinka užduoties žingsnius. Demonstracijoje projekto vardas `demo-projektas`, `PORT=5004`.

**2.** Failas:

```bash
cd ~/devops/devops-projektas
nano paleisti.sh
chmod +x paleisti.sh
```

**3.** Pirma versija (`&`, `$!`, ciklas):

```bash
#!/usr/bin/env bash
set -euo pipefail

.venv/bin/flask --app app run --port 5001 >/dev/null 2>&1 &
pid=$!

for _ in $(seq 1 20); do
  kodas=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:5001/health" || true)
  if [ "$kodas" = "200" ]; then
    echo "OK: /health atsakė 200"
    kill "$pid"
    exit 0
  fi
  sleep 1
done

echo "Nepavyko: /health neatsakė per 20 s" >&2
kill "$pid" 2>/dev/null || true
exit 1
```

**4.** Antra versija (`cd "$(dirname "$0")"`, `PORT`):

```bash
#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
PORT="${PORT:-5001}"

.venv/bin/flask --app app run --port "$PORT" >/dev/null 2>&1 &
pid=$!

for _ in $(seq 1 20); do
  kodas=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:$PORT/health" || true)
  if [ "$kodas" = "200" ]; then
    echo "OK: /health atsakė 200"
    kill "$pid"
    exit 0
  fi
  sleep 1
done

echo "Nepavyko: /health neatsakė per 20 s" >&2
kill "$pid" 2>/dev/null || true
exit 1
```

**5.** Trečia versija (`.env`):

```bash
#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
PORT="${PORT:-5001}"

[ -f .env ] && { set -a; . ./.env; set +a; }

.venv/bin/flask --app app run --port "$PORT" >/dev/null 2>&1 &
pid=$!

for _ in $(seq 1 20); do
  kodas=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:$PORT/health" || true)
  if [ "$kodas" = "200" ]; then
    echo "OK: /health atsakė 200"
    kill "$pid"
    exit 0
  fi
  sleep 1
done

echo "Nepavyko: /health neatsakė per 20 s" >&2
kill "$pid" 2>/dev/null || true
exit 1
```

**6.** Ketvirta versija (`trap`, be rankinių `kill`):

```bash
#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
PORT="${PORT:-5001}"

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

**7.** Galutinė versija (Python patikra ir `.venv`):

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

Laukiama kiekvienoje versijoje:

```bash
./paleisti.sh; echo "kodas: $?"
PORT=5002 ./paleisti.sh; echo "kodas: $?"
```

`OK: /health atsakė 200` ir `kodas: 0`. Po ketvirtos versijos `lsof -nP -i :5001` nieko neišveda.

**8.** Užimtas portas:

```bash
python3 -m http.server 5003
PORT=5003 ./paleisti.sh; echo "kodas: $?"
```

Laukiama: po ~20 s `Nepavyko: /health neatsakė per 20 s` ir `kodas: 1` (iš 5003 atsakys `http.server` su 404, ne 200).

**9–13.** Git ir Pull Request:

```bash
git add paleisti.sh
git commit -m "Pridėtas paleisti.sh"
git add README.md docs
git commit -m "Paleidimo užrašai"
git status
git push -u origin pamoka-05
gh pr create --title "Paleidimas lokaliai" --body "paleisti.sh, .env ir testai."
gh pr merge --merge
git switch main
git pull
git branch -d pamoka-05
git push origin --delete pamoka-05
```

Dažnos klaidos: `&` pamirštas (skriptas užstringa ties serveriu), `$!` priskirtas po kitos komandos, `"localhost:$PORT"` vienose kabutėse, `.env` eilutė prieš `PORT=...` (`.env` negali pakeisti `PORT` dar nenustatytam), `trap` pridėtas prieš `pid=$!`, vienu metu likę ir `trap`, ir `kill`.
