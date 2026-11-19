#!/usr/bin/env bash
# Patikra: ar tikrinti-porta.sh veikia pagal aprašą ir ar Git būsena tvarkinga.
#   ./scripts/tikrinti.sh
# Teste NERAŠOME set -e: klaida yra tai, ko ieškome (04 pamoka).

cd "$(dirname "$0")/.." || exit 1

S=scripts/tikrinti-porta.sh
LAISVAS=5098
UZIMTAS=5099
PASS=0
FAIL=0

geras()  { echo "  ✅ $1"; PASS=$((PASS + 1)); }
blogas() { echo "  ❌ $1"; echo "     $2"; FAIL=$((FAIL + 1)); }

echo "Patikra: $S"

# 1. Laisvas portas -> kodas 0
OUT=$(bash "$S" "$LAISVAS" 2>/dev/null)
KODAS=$?
if [ "$OUT" = "Portas $LAISVAS laisvas" ] && [ "$KODAS" -eq 0 ]; then
  geras "laisvas portas -> kodas 0"
else
  blogas "laisvas portas -> kodas 0" "gauta (kodas $KODAS): $OUT"
fi

# 2. Užimtas portas -> kodas 1 (portą trumpam užima python3 http.server)
python3 -m http.server "$UZIMTAS" --bind 127.0.0.1 >/dev/null 2>&1 &
pid=$!
trap 'kill "$pid" 2>/dev/null' EXIT
for _ in $(seq 1 20); do
  lsof -nP -iTCP:"$UZIMTAS" -sTCP:LISTEN >/dev/null 2>&1 && break
  sleep 0.2
done
OUT=$(bash "$S" "$UZIMTAS" 2>/dev/null)
KODAS=$?
kill "$pid" 2>/dev/null
if [ "$OUT" = "Portas $UZIMTAS užimtas" ] && [ "$KODAS" -eq 1 ]; then
  geras "užimtas portas -> kodas 1"
else
  blogas "užimtas portas -> kodas 1" "gauta (kodas $KODAS): $OUT"
fi

# 3. Be argumento -> kodas 2, išvestis tuščia
OUT=$(bash "$S" 2>/dev/null)
KODAS=$?
if [ -z "$OUT" ] && [ "$KODAS" -eq 2 ]; then
  geras "be argumento -> kodas 2"
else
  blogas "be argumento -> kodas 2" "gauta (kodas $KODAS): $OUT"
fi

# 4. Ne skaičius -> kodas 2, išvestis tuščia
OUT=$(bash "$S" abc 2>/dev/null)
KODAS=$?
if [ -z "$OUT" ] && [ "$KODAS" -eq 2 ]; then
  geras "abc -> kodas 2"
else
  blogas "abc -> kodas 2" "gauta (kodas $KODAS): $OUT"
fi

echo "Patikra: Git"

# 5. .env nesekamas
if git ls-files --error-unmatch .env >/dev/null 2>&1; then
  blogas ".env nesekamas" "Git vis dar seka .env (git rm --cached .env)"
else
  geras ".env nesekamas"
fi

# 6. Darbinis medis švarus
if [ -z "$(git status --porcelain)" ]; then
  geras "darbinis medis švarus"
else
  blogas "darbinis medis švarus" "yra neįrašytų pakeitimų: $(git status --porcelain | tr '\n' ' ')"
fi

echo
echo "Išlaikyta $PASS / $((PASS + FAIL))"
if [ "$FAIL" -gt 0 ]; then
  exit 1
fi
