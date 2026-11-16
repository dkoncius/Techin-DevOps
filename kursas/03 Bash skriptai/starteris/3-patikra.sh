#!/usr/bin/env bash
# 3 užduotis: Projekto failų patikra
# Pakeiskite kiekvieną TODO savo kodu ir paleiskite: bash testai/tikrinti.sh 3
#
# Tikslas: be 2 užduoties įrankių patikros dar tikrina failus ir aplanką docs.
#   Iš projekto šaknies: visi OK, kodas 0
#   Iš aplanko docs:     failai TRŪKSTA, kodas 1
set -euo pipefail

if [ "$#" -gt 0 ]; then
  irankiai=("$@")
else
  irankiai=(git python3 curl)
fi

# TODO 1: sukurkite masyvą failai su dviem failais:
#         uzrasai/serveriai.txt ir scripts/ataskaita.sh

truksta=0

for irankis in "${irankiai[@]}"; do
  if command -v "$irankis" >/dev/null 2>&1; then
    echo "OK      $irankis"
  else
    echo "TRŪKSTA $irankis"
    truksta=$((truksta + 1))
  fi
done

# TODO 2: antras ciklas per failus (for failas in "${failai[@]}")
#         jei failas yra (-f): OK, 6 tarpai ir failas
#         jei nėra: TRŪKSTA, 1 tarpas ir failas, o truksta padidinkite per 1

# TODO 3: ar yra aplankas docs (-d)?
#         jei yra: OK, 6 tarpai ir docs/
#         jei nėra: TRŪKSTA, 1 tarpas ir docs/, o truksta padidinkite per 1

if [ "$truksta" -gt 0 ]; then
  echo "Trūksta: $truksta" >&2
  exit 1
fi
