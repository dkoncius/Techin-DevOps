# 3 užduotis, sprendimas (dėstytojui): Projekto failų patikra

Numeriai: dalis ir žingsnis kaip užduotyje (`3-uzduotis.md`). Demonstracijoje naudokite kitą pavyzdį nei mokinių. Failus redaktoriuje atidarome iš terminalo: `code FAILAS` (VS Code); jei `code` neįdiegta, `nano FAILAS` (išsaugoti `Ctrl+O`, `Enter`, išeiti `Ctrl+X`).

Pirma dalis, 1–3. Skriptas (galutinė versija):

```bash
code scripts/patikra.sh
```

Failo `scripts/patikra.sh` turinys (įrašykite ir išsaugokite):

```bash
#!/usr/bin/env bash
# patikra.sh – patikrina, ar yra įrankiai ir projekto failai.
# Naudojimas: ./scripts/patikra.sh [įrankis ...]  (be argumentų: git, python3, curl)
# Išėjimo kodas: 0 viskas yra, 1 kažko trūksta.
set -euo pipefail

if [ "$#" -gt 0 ]; then
  irankiai=("$@")
else
  irankiai=(git python3 curl)
fi
failai=(app.py requirements.txt run.sh .env.example)

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

Antra dalis, 1–3. Iš šaknies ir iš `docs`:

```bash
./scripts/patikra.sh; echo "kodas: $?"
(cd docs && ../scripts/patikra.sh; echo "kodas: $?")
./scripts/patikra.sh > docs/patikra.txt
```

Laukiama: iš šaknies kodas 0; iš `docs` visi failai „TRŪKSTA“ ir kodas 1 (skriptas ieško failų dabartiniame aplanke). Tai teisinga, bet mokiniai gali manyti, kad skriptas sugedęs.

Trečia dalis, 1. Commit:

```bash
git add scripts docs
git commit -m "Patikra tikrina projekto failus"
```

Dažna klaida: `-f` vietoj `-d` aplankui.
