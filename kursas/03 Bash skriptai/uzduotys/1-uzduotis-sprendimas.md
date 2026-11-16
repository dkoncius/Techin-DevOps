# 1 užduotis, sprendimas (dėstytojui): Argumentas ir sąlyga

Numeriai atitinka užduoties žingsnius. Demonstracijoje naudojamas kitas pavyzdys (`sveikas.sh`).

**2.** Pasiruošimas: užduoties 2 žingsnis (`paruosti.sh` iš GitHub sukuria aplanką `pamoka-03`). Laukiama: `bash testai/tikrinti.sh 1` rodo ❌ (`Išlaikyta 3 / 8 patikrų`), nes šablonas tuščias.

**3.** Užpildytas `scripts/patikra.sh`:

```bash
#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Naudojimas: ./scripts/patikra.sh įrankis" >&2
  exit 2
fi

irankis="$1"

if command -v "$irankis" >/dev/null 2>&1; then
  echo "OK      $irankis"
else
  echo "TRŪKSTA $irankis"
  exit 1
fi
```

Laukiama: `bash testai/tikrinti.sh 1` rodo `Viskas gerai`.

**4.** Paleidimai ranka:

```bash
./scripts/patikra.sh git; echo "kodas: $?"
./scripts/patikra.sh neegzistuoja; echo "kodas: $?"
./scripts/patikra.sh; echo "kodas: $?"
```

Laukiama:

- `OK      git` ir `kodas: 0`
- `TRŪKSTA neegzistuoja` ir `kodas: 1`
- `Naudojimas: ./scripts/patikra.sh įrankis` ir `kodas: 2`

Dažnos klaidos: tarpai aplink `[` ir `]`, `$1` be kabučių, `echo $?` po kitos komandos, pamirštas `chmod +x`, `exit` po `else` pamirštas (kodas lieka 0), `curl` parsisiuntė klaidos puslapį (nėra interneto ar neteisingas adresas).
