#!/usr/bin/env bash
# 3 užduotis: Ciklas per įrankius
# Pakeiskite kiekvieną TODO savo kodu ir paleiskite: bash testai/tikrinti.sh 3
#
# Tikslas:
#   ./scripts/patikra.sh                       -> tikrina git, python3, curl
#   ./scripts/patikra.sh git neegzistuoja kitas -> tikrina tik tuos tris
#   Jei ko nors trūksta: klaidų kanale "Trūksta: SKAIČIUS" ir kodas 1
set -euo pipefail

# TODO 1: jei yra argumentų (#), irankiai=("$@"); kitaip irankiai=(git python3 curl)

# TODO 2: skaitiklis truksta=0

# TODO 3: for irankis in "${irankiai[@]}"; do ... done
#         jei įrankis yra: OK, 6 tarpai ir vardas
#         jei nėra: TRŪKSTA, 1 tarpas ir vardas, o truksta=$((truksta + 1))

# TODO 4: jei truksta didesnis už 0:
#         į klaidų kanalą parašykite: Trūksta: SKAIČIUS
#         ir baikite su kodu 1
