#!/usr/bin/env bash
# 4 užduotis. Testas nuo nulio (README 8–10 skyriai)
# Tikrina scripts/skaiciuok.sh, kuris sudeda du skaičius:
#   ./scripts/skaiciuok.sh 2 3     -> 5, kodas 0
#   ./scripts/skaiciuok.sh         -> išvestis tuščia, naudojimo žinutė klaidų kanale, kodas 2
#   ./scripts/skaiciuok.sh abc 1   -> išvestis tuščia, klaida klaidų kanale, kodas 2
# Pirma paleiskite skriptą terminale ir pažiūrėkite, ką jis daro.
# Testas turi būti žalias su teisingu skaiciuok.sh ir raudonas, kai jis sugadintas
# (neteisinga suma, blogas kodas, klaida ne klaidų kanale, netikrinamas skaičius).

PASS=0
FAIL=0

echo "Testas: ./scripts/skaiciuok.sh"

# TODO 1: 2 3 -> išvestis lygi 5 ir kodas 0

# TODO 2: be argumentų -> išvestis tuščia ir kodas 2

# TODO 3: abc 1 -> išvestis tuščia ir kodas 2

# TODO 4: dar bent viena patikra, kurią sugalvojate patys (pvz., neigiami skaičiai, vienas argumentas)

echo
echo "Išlaikyta $PASS / $((PASS + FAIL))"
# TODO 5: jei FAIL didesnis už 0, baikite su kodu 1