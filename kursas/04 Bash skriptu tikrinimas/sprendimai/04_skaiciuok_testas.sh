#!/usr/bin/env bash
# 4 užduotis. Testas nuo nulio
S="${1:-./scripts/skaiciuok.sh}"
PASS=0
FAIL=0

echo "Testas: $S"

# 1. 2 3 -> 5, kodas 0
OUT=$("$S" 2 3 2>/dev/null)
KODAS=$?
if [ "$OUT" = "5" ] && [ "$KODAS" -eq 0 ]; then
  echo "  ✅ 2 3 -> 5, kodas 0"
  PASS=$((PASS + 1))
else
  echo "  ❌ 2 3 -> 5, kodas 0"
  echo "     gauta (kodas $KODAS): $OUT"
  FAIL=$((FAIL + 1))
fi

# 2. be argumentų -> tuščia, kodas 2
OUT=$("$S" 2>/dev/null)
KODAS=$?
if [ -z "$OUT" ] && [ "$KODAS" -eq 2 ]; then
  echo "  ✅ be argumentų -> išvestis tuščia, kodas 2"
  PASS=$((PASS + 1))
else
  echo "  ❌ be argumentų -> išvestis tuščia, kodas 2"
  echo "     gauta (kodas $KODAS): $OUT"
  FAIL=$((FAIL + 1))
fi

# 3. abc 1 -> tuščia, kodas 2
OUT=$("$S" abc 1 2>/dev/null)
KODAS=$?
if [ -z "$OUT" ] && [ "$KODAS" -eq 2 ]; then
  echo "  ✅ abc 1 -> išvestis tuščia, kodas 2"
  PASS=$((PASS + 1))
else
  echo "  ❌ abc 1 -> išvestis tuščia, kodas 2"
  echo "     gauta (kodas $KODAS): $OUT"
  FAIL=$((FAIL + 1))
fi

# 4. neigiami skaičiai: -4 1 -> -3
OUT=$("$S" -4 1 2>/dev/null)
KODAS=$?
if [ "$OUT" = "-3" ] && [ "$KODAS" -eq 0 ]; then
  echo "  ✅ -4 1 -> -3, kodas 0"
  PASS=$((PASS + 1))
else
  echo "  ❌ -4 1 -> -3, kodas 0"
  echo "     gauta (kodas $KODAS): $OUT"
  FAIL=$((FAIL + 1))
fi

echo
echo "Išlaikyta $PASS / $((PASS + FAIL))"
if [ "$FAIL" -gt 0 ]; then
  exit 1
fi
