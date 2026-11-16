#!/usr/bin/env bash
set -euo pipefail

while read -r vardas adresas; do
  kodas=$(./scripts/http-kodas.sh "$adresas")
  echo "$vardas $kodas"
done < uzrasai/adresai.txt
