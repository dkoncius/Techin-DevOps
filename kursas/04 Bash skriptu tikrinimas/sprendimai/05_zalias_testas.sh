#!/usr/bin/env bash
# 5 užduotis. Testas visada žalias: sprendimas
# Trys priežastys:
#   1. Ieškojo tik "neegzistuoja", o tas žodis yra ir eilutėje "OK      neegzistuoja".
#      Reikia ieškoti "TRŪKSTA neegzistuoja".
#   2. KODAS buvo užfiksuotas, bet netikrinamas. Reikia [ "$KODAS" -eq 1 ].
#   3. Pabaigoje nebuvo exit 1, todėl testas su ❌ baigdavosi kodu 0.

S="${1:-./scripts/patikra.sh}"
PASS=0
FAIL=0

OUT=$("$S" neegzistuoja 2>/dev/null)
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
