# 3 užduotis, sprendimas (dėstytojui): Projekto failų patikra

Numeriai atitinka užduoties žingsnius. Demonstracijoje tikrinami kiti failai (pvz. `README.md`).

**2.** Pasiruošimas: tęsiamas 2 užduoties skriptas arba atsisiųstas 3 šablonas (užduoties 2 žingsnis). Laukiama: `bash testai/tikrinti.sh 3` rodo ❌, kol neužpildyti `TODO`.

**3.** Užpildytas `scripts/patikra.sh`:

```bash
#!/usr/bin/env bash
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
```

Laukiama: `bash testai/tikrinti.sh 3` rodo `Viskas gerai`.

**4.** Paleidimai ranka:

```bash
cd ~/Desktop/devops/pamoka-03
./scripts/patikra.sh; echo "kodas: $?"
(cd docs && ../scripts/patikra.sh; echo "kodas: $?")
```

Laukiama:

- iš šaknies: šeši `OK` (trys įrankiai, du failai, `docs/`), `kodas: 0`
- iš `docs`: trys įrankiai `OK`, du failai ir `docs/` kaip `TRŪKSTA`, `Trūksta: 3`, `kodas: 1`

Dažnos klaidos: `-f` vietoje `-d` aplankui, paleidimas ne iš šaknies, trūksta paruošime sukurtų `uzrasai/serveriai.txt` ir `scripts/ataskaita.sh` (be jų iš šaknies bus `TRŪKSTA`).
