# 2 užduotis, sprendimas (dėstytojui): Ciklas per įrankius

Numeriai: dalis ir žingsnis kaip užduotyje (`2-uzduotis.md`). Demonstracijoje naudokite kitą pavyzdį nei mokinių. Failus redaktoriuje atidarome iš terminalo: `nano FAILAS` (išsaugoti `Ctrl+O`, `Enter`, išeiti `Ctrl+X`).

Pirma dalis, 1–4. Skriptas (2 versija):

```bash
nano scripts/patikra.sh
```

Failo `scripts/patikra.sh` turinys (įrašykite ir išsaugokite):

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

Antra dalis, 1–3. Paleidimas:

```bash
./scripts/patikra.sh; echo "kodas: $?"
./scripts/patikra.sh git neegzistuoja kitas; echo "kodas: $?"
./scripts/patikra.sh git; echo "kodas: $?"
```

Laukiama kodai: 0, 1, 0.

Trečia dalis, 1–2. Užrašai ir commit:

```bash
nano docs/bash.md
```

Pridėkite gale:

```markdown
Be argumentų kodas 0 (visi trys įrankiai yra), su `git neegzistuoja kitas` kodas 1 (trūksta dviejų), tik su `git` kodas 0.
```

```bash
git add scripts docs
git commit -m "Skriptas tikrina įrankių sąrašą"
```

Dažna klaida: Mac studentas naudoja `${var,,}` ar `mapfile` (Bash 3.2 nepalaiko); skaitiklis `truksta` nenustatytas prieš ciklą (`set -u`).
