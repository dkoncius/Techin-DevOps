#!/usr/bin/env bash
# 3 užduotis. Pirmas testas faile

PASS=0
FAIL=0

echo "Testas: ./scripts/patikra.sh"

OUT=$(./scripts/patikra.sh git 2>/dev/null)
KODAS=$?
if printf '%s\n' "$OUT" | grep -qF -- "OK      git" && [ "$KODAS" -eq 0 ]; then
  echo "  ✅ git -> OK, kodas 0"
  PASS=$((PASS + 1))
else
  echo "  ❌ git -> OK, kodas 0"
  echo "     gauta (kodas $KODAS): $OUT"
  FAIL=$((FAIL + 1))
fi

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

if ! printf '%s\n' "$OUT" | grep -qF -- "Trūksta:"; then
  echo "  ✅ Trūksta: nepateko į išvestį"
  PASS=$((PASS + 1))
else
  echo "  ❌ Trūksta: nepateko į išvestį"
  echo "     išvestyje: $OUT"
  FAIL=$((FAIL + 1))
fi

echo
echo "Išlaikyta $PASS / $((PASS + FAIL))"
if [ "$FAIL" -gt 0 ]; then
  exit 1
fi