# 2 užduotis, sprendimas (dėstytojui): Ciklas per įrankius

Numeriai atitinka užduoties žingsnius. Demonstracijoje naudojami kiti įrankiai (`python3`, `node`).

**3.** `scripts/patikra.sh`:

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

**4–6.** Laukiama:

- be argumentų: trys `OK`, kodas 0
- `git neegzistuoja kitas`: `OK      git`, dvi `TRŪKSTA`, `Trūksta: 2`, kodas 1
- tik `git`: viena `OK`, kodas 0

Dažnos klaidos: `"${irankiai[@]}"` be kabučių arba be `@`, `truksta=$truksta+1` vietoje `$(( ))`, `set -u` su neapibrėžtu `truksta`.
