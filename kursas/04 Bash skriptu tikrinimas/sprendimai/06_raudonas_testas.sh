#!/usr/bin/env bash
# 6 užduotis ⭐. Testas raudonas: sprendimas
# Dvi klaidos:
#   1. "OK git" su vienu tarpu, o skriptas rašo "OK      git" (šeši tarpai).
#   2. echo "paleista..." stovėjo tarp komandos ir KODAS=$?, todėl KODAS buvo echo kodas (0).

S="${1:-./scripts/patikra.sh}"
PASS=0
FAIL=0

OUT=$("$S" git 2>/dev/null)
if printf '%s\n' "$OUT" | grep -qF -- "OK      git"; then
  echo "  ✅ git -> OK"
  PASS=$((PASS + 1))
else
  echo "  ❌ git -> OK"
  FAIL=$((FAIL + 1))
fi

OUT=$("$S" neegzistuoja 2>/dev/null)
KODAS=$?
echo "paleista: neegzistuoja"
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
