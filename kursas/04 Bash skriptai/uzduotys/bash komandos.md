# Bash komandos

## Skriptas
- `#!/usr/bin/env bash` → pirma eilutė: kuo paleisti
- `set -euo pipefail` → sustoti pirmoje klaidoje, nepažintas kintamasis yra klaida
- `chmod +x FAILAS` → leidžia vykdyti
- `./SKRIPTAS.sh` → paleidžia (`echo $?` iškart po to rodo kodą)
- `echo "žinutė" >&2` → rašo į klaidų kanalą

## Sąlyga ir ciklas
- `[ "$#" -lt 1 ]` → ar argumentų mažiau nei vienas (tarpai aplink `[` ir `]` privalomi)
- `command -v VARDAS` → ar įrankis yra
- `for VARDAS in "${sąrašas[@]}"; do ... done` → ciklas per sąrašą
- `[ -f FAILAS ]` → ar tai failas
- `[ -d APLANKAS ]` → ar tai aplankas

## Git, kurio šiame lape reikia
- `git check-ignore -v FAILAS` → kuri `.gitignore` eilutė ignoruoja failą
- `git restore FAILAS` → atšaukia neįtrauktą pakeitimą
- `git restore --staged FAILAS` → išima iš staging, failo nepaliečia
