#!/usr/bin/env bash
# Ištrina GitHub repozitoriją (nuolat, negrįžtamai) per gh.
# Naudojimas: bash istrinti-repo.sh REPOZITORIJA [REPOZITORIJA ...]
#   pavyzdys:  bash istrinti-repo.sh bash-pamoka-03
#   pavyzdys:  bash istrinti-repo.sh demo-bash bash-pamoka-03
# Vardas be savininko reiškia jūsų paskyrą; galima ir savininkas/vardas.
# Prieš trynimą paklausia patvirtinimo (reikia įvesti pilną vardą).
# Jei gh rašo, kad trūksta teisių, vieną kartą paleiskite:
#   gh auth refresh -h github.com -s delete_repo
set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Naudojimas: bash istrinti-repo.sh REPOZITORIJA [REPOZITORIJA ...]" >&2
  exit 2
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "Nerastas gh. Įdiekite GitHub CLI ir paleiskite: gh auth login" >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "Nesate prisijungę. Paleiskite: gh auth login" >&2
  exit 1
fi

naudotojas=$(gh api user --jq .login)

for vardas in "$@"; do
  if [[ "$vardas" == */* ]]; then
    pilnas="$vardas"
  else
    pilnas="$naudotojas/$vardas"
  fi

  if ! gh repo view "$pilnas" >/dev/null 2>&1; then
    echo "Nėra (gerai): $pilnas"
    continue
  fi

  echo "Bus ištrinta GitHub'e: $pilnas"
  read -r -p "Kad patvirtintumėte, įveskite pilną vardą ($pilnas): " atsakymas
  if [ "$atsakymas" != "$pilnas" ]; then
    echo "Nepatvirtinta, praleista: $pilnas"
    continue
  fi

  gh repo delete "$pilnas" --yes
  echo "Ištrinta: $pilnas"
done
