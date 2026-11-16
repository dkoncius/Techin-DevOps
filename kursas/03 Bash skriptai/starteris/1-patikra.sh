#!/usr/bin/env bash
# 1 užduotis: Argumentai ir išėjimo kodas
# Pakeiskite kiekvieną TODO savo kodu ir paleiskite: bash testai/tikrinti.sh 1
#
# Tikslas: ./scripts/patikra.sh git  ->  OK      git        (kodas 0)
#          ./scripts/patikra.sh xyz  ->  TRŪKSTA xyz        (kodas 1)
#          ./scripts/patikra.sh      ->  naudojimo žinutė   (kodas 2)

# TODO 1: įjunkite griežtą režimą (set -euo pipefail)

# TODO 2: jei argumentų (#) yra mažiau nei 1:
#         į klaidų kanalą (>&2) parašykite: Naudojimas: ./scripts/patikra.sh įrankis
#         ir baikite su kodu 2

# TODO 3: kintamasis irankis = pirmas argumentas ($1)

# TODO 4: jei įrankis yra (command -v "$irankis" >/dev/null 2>&1):
#           parašykite OK, 6 tarpai ir vardas
#         kitaip:
#           parašykite TRŪKSTA, 1 tarpas ir vardas, tada exit 1
