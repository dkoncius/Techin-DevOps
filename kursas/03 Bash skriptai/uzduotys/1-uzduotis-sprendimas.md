# 1 užduotis, sprendimas (dėstytojui): Argumentas ir sąlyga

Numeriai atitinka užduoties žingsnius. Demonstracijoje naudojamas kitas pavyzdys (įrankis `python3`, ne `git`).

**5.** `scripts/patikra.sh`:

```bash
#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Naudojimas: ./scripts/patikra.sh įrankis" >&2
  exit 2
fi

if command -v "$1" >/dev/null 2>&1; then
  echo "OK      $1"
else
  echo "TRŪKSTA $1"
  exit 1
fi
```

**7–9.** Laukiama:

```bash
./scripts/patikra.sh git; echo "kodas: $?"
./scripts/patikra.sh neegzistuoja; echo "kodas: $?"
./scripts/patikra.sh; echo "kodas: $?"
```

- `OK      git` ir `kodas: 0`
- `TRŪKSTA neegzistuoja` ir `kodas: 1`
- `Naudojimas: ./scripts/patikra.sh įrankis` ir `kodas: 2`

Dažnos klaidos: tarpai aplink `[` ir `]`, `$1` be kabučių, `echo $?` po kitos komandos, pamirštas `chmod +x`.
