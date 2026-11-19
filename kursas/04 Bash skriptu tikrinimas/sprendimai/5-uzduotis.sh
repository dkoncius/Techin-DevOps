#!/usr/bin/env bash
# 5 užduotis. Testas visada žalias: sprendimas

PASS=0
FAIL=0

OUT=$(./scripts/patikra.sh neegzistuoja 2>/dev/null)
KODAS=$?
if printf '%s\n' "$OUT" | grep -qF -- "TRŪKSTA neegzistuoja" && [ "$KODAS" -eq 1 ]; then
  echo "  ✅ neegzistuoja -> TRŪKSTA, kodas 1"
  PASS=$((PASS + 1))
else
  echo "  ❌ neegzistuoja -> TRŪKSTA, kodas 1"
  echo "     gauta (kodas $KODAS): $OUT"
  FAIL=$((FAIL + 1))
fi

echo "Išlaikyta $PASS / $((PASS + FAIL))"
if [ "$FAIL" -gt 0 ]; then
  exit 1
fi