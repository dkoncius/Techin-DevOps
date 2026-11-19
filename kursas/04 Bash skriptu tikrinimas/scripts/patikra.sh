#!/usr/bin/env bash
# 03 pamokos skriptas: tikrina įrankius (argumentai arba git python3 curl), failus ir docs/.
#   ./scripts/patikra.sh git curl
set -euo pipefail

if [ "$#" -gt 0 ]; then
  irankiai=("$@")
else
  irankiai=(git python3 curl)
fi
failai=(uzrasai/serveriai.txt scripts/ataskaita.sh)
truksta=0

for irankis in "${irankiai[@]}"; do
  if command -v "$irankis" >/dev/null 2>&1; then
    echo "OK      $irankis"
  else
    echo "TRŪKSTA $irankis"
    truksta=$((truksta + 1))
  fi
done

for failas in "${failai[@]}"; do
  if [ -f "$failas" ]; then
    echo "OK      $failas"
  else
    echo "TRŪKSTA $failas"
    truksta=$((truksta + 1))
  fi
done

if [ -d docs ]; then
  echo "OK      docs/"
else
  echo "TRŪKSTA docs/"
  truksta=$((truksta + 1))
fi

if [ "$truksta" -gt 0 ]; then
  echo "Trūksta: $truksta" >&2
  exit 1
fi
