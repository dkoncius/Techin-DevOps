#!/usr/bin/env bash
cd "$(dirname "$0")"

.venv/bin/flask --app app run --port 5001 >/dev/null 2>&1 &

for _ in $(seq 1 20); do
  kodas=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:5001/health")
  if [ "$kodas" = "200" ]; then
    echo "OK"
    exit 0
  fi
  sleep 1
done

echo "Nepavyko"
exit 0
