#!/usr/bin/env bash
# 1 užduotis. Išvestis ir kodas į kintamuosius (README 2–5 skyriai)
# Tikslas: paleisti patikra.sh du kartus ir parodyti, kuo jis baigėsi.
#   ./uzduotys/1-uzduotis.sh
#                                       neegzistuoja: kodas 1
#                                       neegzistuoja: TRŪKSTA neegzistuoja
# Ekrane neturi būti "Trūksta: 1": paslėpkite klaidų kanalą (2>/dev/null).
# Užuomina: pirma išvesties eilutė yra  printf '%s\n' "$OUT" | head -n 1

# TODO 1: paleiskite ./scripts/patikra.sh git, išvestį įrašykite į OUT, kodą į KODAS

# TODO 2: išveskite eilutę: git: kodas <KODAS>

# TODO 3: paleiskite ./scripts/patikra.sh neegzistuoja (klaidų kanalą paslėpkite), išvestis į OUT, kodas į KODAS

# TODO 4: išveskite eilutę: neegzistuoja: kodas <KODAS>

# TODO 5: išveskite eilutę: neegzistuoja: <pirma OUT eilutė>