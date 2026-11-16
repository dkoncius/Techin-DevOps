# 2 užduotis, sprendimas (dėstytojui): Ciklas per įrankius

Numeriai atitinka užduoties žingsnius. Demonstracijoje kiti įrankiai (`python3`, `node`).

**2.** Pasiruošimas: užduoties 2 žingsnis (kopija ir `curl` šablonas). Laukiama: `bash testai/tikrinti.sh 2` rodo ❌, kol neužpildyti `TODO`.

**3.** Užpildytas `scripts/patikra.sh`:

```bash
#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -gt 0 ]; then
  irankiai=("$@")
else
  irankiai=(git python3 curl)
fi

truksta=0

for irankis in "${irankiai[@]}"; do
  if command -v "$irankis" >/dev/null 2>&1; then
    echo "OK      $irankis"
  else
    echo "TRŪKSTA $irankis"
    truksta=$((truksta + 1))
  fi
done

if [ "$truksta" -gt 0 ]; then
  echo "Trūksta: $truksta" >&2
  exit 1
fi
```

Laukiama: `bash testai/tikrinti.sh 2` rodo `Viskas gerai`.

**4.** Paleidimai ranka:

```bash
./scripts/patikra.sh; echo "kodas: $?"
./scripts/patikra.sh git neegzistuoja kitas; echo "kodas: $?"
```

Laukiama:

- be argumentų: `OK      git`, `OK      python3`, `OK      curl`, `kodas: 0` (numatytasis sąrašas, `else` šaka)
- su trimis argumentais: `OK      git`, dvi `TRŪKSTA`, `Trūksta: 2`, `kodas: 1`

Dažnos klaidos: `"${irankiai[@]}"` be kabučių arba be `@`, `truksta=$truksta+1` vietoje `$(( ))`, `set -u` su neapibrėžtu `truksta`, 1 užduoties kopija neišsaugota prieš atsisiunčiant šabloną.
