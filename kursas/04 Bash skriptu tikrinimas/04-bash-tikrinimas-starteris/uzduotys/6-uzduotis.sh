#!/usr/bin/env bash
# 6 užduotis — žingsnius žiūrėkite Teams (uzduotys/6-uzduotis.md).
# patikra.sh geras, bet testas raudonas — raskite dvi klaidas, patikrų neištrinkite.

PASS=0
FAIL=0

OUT=$(./scripts/patikra.sh git 2>/dev/null)
if printf '%s\n' "$OUT" | grep -qF -- "OK git"; then
  echo "  ✅ git -> OK"
  PASS=$((PASS + 1))
else
  echo "  ❌ git -> OK"
  FAIL=$((FAIL + 1))
fi

OUT=$(./scripts/patikra.sh neegzistuoja 2>/dev/null)
echo "paleista: neegzistuoja"
KODAS=$?
if [ "$KODAS" -eq 1 ]; then
  echo "  ✅ neegzistuoja -> kodas 1"
  PASS=$((PASS + 1))
else
  echo "  ❌ neegzistuoja -> kodas 1 (gauta $KODAS)"
  FAIL=$((FAIL + 1))
fi

echo "Išlaikyta $PASS / $((PASS + FAIL))"
if [ "$FAIL" -gt 0 ]; then
  exit 1
fi