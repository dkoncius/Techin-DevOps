#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

[ -f .env ] && { set -a; . ./.env; set +a; }
PORT="${PORT:-5001}"

if ! python3 -c 'import sys; sys.exit(0 if sys.version_info >= (3, 9) else 1)'; then
  echo "Reikia Python 3.9 ar naujesnio" >&2
  exit 1
fi

[ -d .venv ] || python3 -m venv .venv
.venv/bin/pip install -q -r requirements.txt

.venv/bin/flask --app app run --port "$PORT" >/dev/null 2>&1 &
pid=$!
trap 'kill "$pid" 2>/dev/null || true' EXIT

for _ in $(seq 1 20); do
  kodas=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:$PORT/health" || true)
  if [ "$kodas" = "200" ]; then
    echo "OK: /health atsakė 200"
    curl -s "http://localhost:$PORT/status"
    echo
    exit 0
  fi
  sleep 1
done

echo "Nepavyko: /health neatsakė per 20 s" >&2
exit 1
