# 3 užduotis, sprendimas (dėstytojui): Projekto failų patikra

Numeriai atitinka užduoties žingsnius. Demonstracijoje tikrinami kiti failai (pvz. `README.md`).

**2.** Atidaryti `nano scripts/patikra.sh`. Turinys:

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

**3.** Iš projekto šaknies:

```bash
cd ~/Desktop/devops/git-bandymas
./scripts/patikra.sh; echo "kodas: $?"
```

Laukiama: šeši `OK` (trys įrankiai, du failai, `docs/`), `kodas: 0`.

**4.** Iš `docs`:

```bash
(cd docs && ../scripts/patikra.sh; echo "kodas: $?")
```

Laukiama: trys įrankiai `OK`, du failai ir `docs/` kaip `TRŪKSTA`, `Trūksta: 3`, `kodas: 1`.

**5.** Išvestis į failą:

```bash
./scripts/patikra.sh > docs/patikra.txt
cat docs/patikra.txt
```

Laukiama: `cat` rodo šešias `OK` eilutes.

**6.** Git:

```bash
git add scripts docs
git commit -m "Patikra tikrina projekto failus"
git log --oneline
```

Laukiama: viršuje `Patikra tikrina projekto failus`.

Dažnos klaidos: failų sąrašas po `truksta=0` (su `set -u` nieko blogo, bet painu), `-f` vietoje `-d` aplankui, paleidimas ne iš šaknies.
