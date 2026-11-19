#!/usr/bin/env bash
# 5 užduotis. Testas visada žalias (README 10 skyrius)
# Šis testas tikrina scripts/patikra.sh. Su teisingu skriptu jis žalias,
# bet jis žalias ir su sugadintu. Raskite TRIS priežastis ir pataisykite testą.
# Kaip ieškoti: sugadinkite scripts/patikra.sh (README 10 skyrius), paleiskite
#   ./uzduotys/05_zalias_testas.sh; echo "kodas: $?"
# ir pažiūrėkite, ko testas nepastebi. Tada git restore scripts/patikra.sh.
# TODO: pataisykite testą, tada ištrinkite šią eilutę

S="${1:-./scripts/patikra.sh}"
PASS=0
FAIL=0

OUT=$("$S" neegzistuoja 2>/dev/null)
KODAS=$?
if printf '%s\n' "$OUT" | grep -qF -- "neegzistuoja"; then
  echo "  ✅ neegzistuoja tikrinamas"
  PASS=$((PASS + 1))
else
  echo "  ❌ neegzistuoja tikrinamas"
  FAIL=$((FAIL + 1))
fi

echo "Išlaikyta $PASS / $((PASS + FAIL))"
