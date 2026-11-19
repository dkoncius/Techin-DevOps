#!/usr/bin/env bash
# 6 užduotis ⭐. Testas raudonas, nors skriptas geras (README 3 ir 6 skyriai)
# scripts/patikra.sh veikia teisingai, bet šis testas rodo ❌.
# Raskite ir pataisykite DVI klaidas teste. Patikrų neištrinkite.
# Kaip ieškoti: terminale pakartokite tą patį paleidimą rankiniu būdu
#   OUT=$(./scripts/patikra.sh git); echo "$OUT"; echo $?
# ir palyginkite su tuo, ko tikisi testas.
# TODO: pataisykite testą, tada ištrinkite šią eilutę

S="${1:-./scripts/patikra.sh}"
PASS=0
FAIL=0

OUT=$("$S" git 2>/dev/null)
if printf '%s\n' "$OUT" | grep -qF -- "OK git"; then
  echo "  ✅ git -> OK"
  PASS=$((PASS + 1))
else
  echo "  ❌ git -> OK"
  FAIL=$((FAIL + 1))
fi

OUT=$("$S" neegzistuoja 2>/dev/null)
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
