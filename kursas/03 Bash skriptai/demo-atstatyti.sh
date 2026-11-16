#!/usr/bin/env bash
# Atstato 03 pamokos demonstraciją: ištrina ~/devops/demo-bash ir ~/devops/demo-git.
# Paleisti iš bet kur: bash ~/Desktop/"Techin DevOps"/"kursas/03 Bash skriptai/demo-atstatyti.sh"
# Trina TIK šiuos du demonstracijos aplankus. git-bandymas ir devops-projektas neliečiami.
set -euo pipefail

BAZE="${DEVOPS_DIR:-$HOME/devops}"

for aplankas in demo-bash demo-git; do
  kelias="$BAZE/$aplankas"
  if [ -d "$kelias" ]; then
    rm -rf "$kelias"
    echo "Ištrinta: $kelias"
  else
    echo "Nėra (gerai): $kelias"
  fi
done

mkdir -p "$BAZE"
echo "---"
echo "Paruošta. Demonstracijoje kuriami: demo-bash (pridek.sh, pasveikink.sh) ir demo-git."
ls "$BAZE"
