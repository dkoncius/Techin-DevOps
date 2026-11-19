#!/usr/bin/env bash
# Pasveikina kiekvieną vardą ir suskaičiuoja, kiek pasveikinta.
#   ./scripts/sveikas.sh Ona Jonas
set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Naudojimas: ./scripts/sveikas.sh vardas..." >&2
  exit 2
fi

kiekis=0
for vardas in "$@"; do
  echo "Sveiki, $vardas"
  kiekis=$((kiekis + 1))
done
echo "Pasveikinta: $kiekis"
