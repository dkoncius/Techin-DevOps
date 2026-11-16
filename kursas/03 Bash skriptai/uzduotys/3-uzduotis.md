# 3 užduotis: Projekto failų patikra

1. **Tikslas:** pridėti tam pačiam skriptui projekto failų patikrą.
2. Perrašykite `nano scripts/patikra.sh` šiuo turiniu:

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

3. Iš projekto šaknies: `cd ~/Desktop/devops/git-bandymas`, `./scripts/patikra.sh; echo "kodas: $?"`. Visi `OK`, kodas 0.
4. Iš `docs`: `(cd docs && ../scripts/patikra.sh; echo "kodas: $?")`. Failai `TRŪKSTA`, kodas 1. Skriptas ieško failų tame aplanke, kuriame paleistas.
5. Išsaugokite išvestį: `./scripts/patikra.sh > docs/patikra.txt`. `cat docs/patikra.txt` rodo `OK` eilutes.
6. Commit: `git add scripts docs`, `git commit -m "Patikra tikrina projekto failus"`.
7. **Pateikimas:** terminalo nuotrauka iš šaknies (kodas 0) ir iš `docs` (kodas 1).

Jei užstrigote, pasižiūrėkite `bash komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
