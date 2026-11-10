#!/usr/bin/env bash
# STATUSAS: išbandyta 2026-11-07 (paleista)
# Tie patys testai kaip azure/scripts/test.sh; skiriasi tik BASE_URL.
# Lokaliai (prieš tai: kubectl -n ingress-nginx port-forward svc/ingress-nginx-controller 8443:443 &):
#   ./local/scripts/test.sh
# Testinių įrašų (žyma TESTAS) šis skriptas NETRINA; trinti tik paklausus savininko.
set -u
BASE="${BASE_URL:-https://etalonas.example.lt:8443}"
CURL_OPTS="${CURL_OPTS:--k --resolve etalonas.example.lt:8443:127.0.0.1}"
# shellcheck disable=SC2086
C="curl -s --max-time 10 $CURL_OPTS"
FAIL=0
ok()  { echo "  PASS  $1"; }
bad() { echo "  FAIL  $1"; FAIL=1; }

code=$($C -o /dev/null -w '%{http_code}' "$BASE/health")
[ "$code" = 200 ] && ok "GET /health 200" || bad "GET /health grąžino $code"

code=$($C -o /dev/null -w '%{http_code}' -XPOST "$BASE/notes" -H 'Content-Type: application/json' -d '{"text":"TESTAS"}')
[ "$code" = 201 ] && ok "POST /notes (TESTAS) 201" || bad "POST /notes grąžino $code"

code=$($C -o /dev/null -w '%{http_code}' -XPOST "$BASE/notes" -H 'Content-Type: application/json' -d '{}')
[ "$code" = 400 ] && ok "POST /notes be teksto 400" || bad "POST be teksto grąžino $code (turi būti 400)"

body=$($C "$BASE/notes")
echo "$body" | grep -q 'TESTAS' && ok "GET /notes mato TESTAS" || bad "GET /notes nerado TESTAS"
echo "  INFO  įrašų su TESTAS: $(echo "$body" | grep -o 'TESTAS' | wc -l | tr -d ' ') (netrinama)"

[ "$FAIL" = 0 ] && echo "VISKAS GERAI" || { echo "YRA KLAIDŲ"; exit 1; }
