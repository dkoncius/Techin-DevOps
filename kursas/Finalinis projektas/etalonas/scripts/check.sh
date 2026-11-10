#!/usr/bin/env bash
# Automatinis patikrinimas: HTTP, saugumo antraštės, metrikų paslėpimas, DB įrašymas, kopija.
# Naudojimas: ./scripts/check.sh [BASE_URL]   (numatyta http://localhost:8080)
cd "$(dirname "$0")/.."
BASE="${1:-http://localhost:8080}"
C="curl -s ${CURL_OPTS:-}"   # k8s: CURL_OPTS="-k --resolve etalonas.example.lt:8443:127.0.0.1"
FAIL=0
ok()  { echo "  PASS  $1"; }
bad() { echo "  FAIL  $1"; FAIL=1; }

code=$($C -o /dev/null -w '%{http_code}' "$BASE/health")
[ "$code" = 200 ] && ok "/health 200" || bad "/health grąžino $code"

$C "$BASE/health" | grep -q '"db":"up"' && ok "DB pasiekiama" || bad "DB nepasiekiama"

hdr=$($C -I "$BASE/health")
echo "$hdr" | grep -qi 'x-content-type-options: nosniff' && ok "saugumo antraštės" || bad "trūksta saugumo antraščių"
echo "$hdr" | grep -qi '^server: nginx/' && bad "Nginx rodo versiją" || ok "Nginx neatskleidžia versijos"

code=$($C -o /dev/null -w '%{http_code}' "$BASE/metrics")
[ "$code" = 403 ] && ok "/metrics iš išorės uždarytas" || bad "/metrics grąžino $code (turi būti 403)"

code=$($C -o /dev/null -w '%{http_code}' -XPOST "$BASE/notes" -H 'Content-Type: application/json' -d '{"text":"check"}')
[ "$code" = 201 ] && ok "įrašymas į DB" || bad "POST /notes grąžino $code"

if [ -n "${SKIP_BACKUP:-}" ]; then echo "  SKIP  DB kopija (k8s: CronJob)"; elif [ -x backup/backup.sh ] && ./backup/backup.sh >/dev/null 2>&1; then ok "DB kopija sukuriama"; else bad "DB kopija nepavyko"; fi

[ "$FAIL" = 0 ] && echo "VISKAS GERAI" || { echo "YRA KLAIDŲ"; exit 1; }
