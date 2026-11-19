#!/usr/bin/env bash
# 3 užduotis. Pirmas testas faile (README 8–9 skyriai)
# Tikrina scripts/patikra.sh. Paleidžiamas iš projekto šaknies:
#   ./uzduotys/3-uzduotis.sh
# Teste nerašykite set -euo pipefail. Jei buvo FAIL — exit 1 pabaigoje (README 9).
# Testas turi būti žalias su teisingu patikra.sh ir raudonas, kai patikra.sh sugadintas.

PASS=0
FAIL=0

echo "Testas: ./scripts/patikra.sh"

# 1 patikra (pavyzdys, jau parašyta): git -> išvestyje "OK      git", kodas 0
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

# TODO 1: paleiskite skriptą su argumentu neegzistuoja (OUT ir KODAS, kaip aukščiau)

# TODO 2: patikra: išvestyje yra "TRŪKSTA neegzistuoja" ir kodas 1
#         (✅ arba ❌ ir PASS arba FAIL, kaip 1 patikroje)

# TODO 3: patikra: išvestyje NĖRA "Trūksta:" (README 6 skyrius, ženklas !)

echo
echo "Išlaikyta $PASS / $((PASS + FAIL))"
# TODO 4: jei FAIL didesnis už 0, baikite su kodu 1