# 3 užduotis, sprendimas (dėstytojui): Projekto failų patikra

Numeriai atitinka užduoties žingsnius. Demonstracijoje tikrinamas kitas failas (pvz. `README.md`).

**3.** `scripts/patikra.sh`:

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

**4–5.** Laukiama: iš šaknies visi `OK`, kodas 0; iš `docs` du failai ir `docs/` kaip `TRŪKSTA`, `Trūksta: 3`, kodas 1.

Dažna klaida: failų sąrašas po `truksta=0` ir `set -u`, `-f` vietoje `-d` aplankui.
