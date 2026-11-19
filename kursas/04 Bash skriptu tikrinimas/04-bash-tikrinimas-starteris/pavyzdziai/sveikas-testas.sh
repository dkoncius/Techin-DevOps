#!/usr/bin/env bash
# Testas scripts/sveikas.sh
#   ./pavyzdziai/sveikas-testas.sh

PASS=0
FAIL=0

echo "Testas: ./scripts/sveikas.sh"

# 1. Du vardai
OUT=$(./scripts/sveikas.sh Ona Jonas 2>/dev/null)
KODAS=$?
if [ "$OUT" = $'Sveiki, Ona\nSveiki, Jonas\nPasveikinta: 2' ] && [ "$KODAS" -eq 0 ]; then
  echo "  ✅ Ona Jonas -> du pasveikinimai, kodas 0"
  PASS=$((PASS + 1))
else
  echo "  ❌ Ona Jonas -> du pasveikinimai, kodas 0"
  echo "     gauta (kodas $KODAS): $OUT"
  FAIL=$((FAIL + 1))
fi

# 2. Be argumento
OUT=$(./scripts/sveikas.sh 2>/dev/null)
KODAS=$?
if [ -z "$OUT" ] && [ "$KODAS" -eq 2 ]; then
  echo "  ✅ be argumento -> išvestis tuščia, kodas 2"
  PASS=$((PASS + 1))
else
  echo "  ❌ be argumento -> išvestis tuščia, kodas 2"
  echo "     gauta (kodas $KODAS): $OUT"
  FAIL=$((FAIL + 1))
fi

# 3. Naudojimo žinutė ne išvestyje
if ! printf '%s\n' "$OUT" | grep -qF -- "Naudojimas"; then
  echo "  ✅ Naudojimas nepateko į išvestį"
  PASS=$((PASS + 1))
else
  echo "  ❌ Naudojimas nepateko į išvestį"
  echo "     išvestyje: $OUT"
  FAIL=$((FAIL + 1))
fi

echo
echo "Išlaikyta $PASS / $((PASS + FAIL))"
if [ "$FAIL" -gt 0 ]; then
  exit 1
fi