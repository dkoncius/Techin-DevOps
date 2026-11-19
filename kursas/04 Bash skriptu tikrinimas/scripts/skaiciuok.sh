#!/usr/bin/env bash
# Sudeda du sveikuosius skaičius.
#   ./scripts/skaiciuok.sh 2 3   ->  5
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Naudojimas: ./scripts/skaiciuok.sh a b" >&2
  exit 2
fi

for x in "$1" "$2"; do
  if ! [[ $x =~ ^-?[0-9]+$ ]]; then
    echo "Klaida: ne skaičius: $x" >&2
    exit 2
  fi
done

echo $(( $1 + $2 ))
