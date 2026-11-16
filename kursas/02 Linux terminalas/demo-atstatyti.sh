#!/usr/bin/env bash
# Atstato 02 pamokos demonstraciją: ~/Desktop/devops/demo-a grįžta į pradinę būseną.
# Paleisti iš bet kur: bash ~/Desktop/"Techin DevOps"/"kursas/02 Linux terminalas/demo-atstatyti.sh"
# Trina TIK demonstracijos failus ir šakas (demo-a, ../demo-raktas.txt). git-bandymas neliečiamas.
set -euo pipefail

DEMO="$HOME/Desktop/devops/demo-a"
BASE=7f5db4b   # "Trumpas pakeitimas": paskutinis commit prieš demonstraciją

cd "$DEMO"

if [ "$(git rev-parse --short=7 "$BASE")" != "$BASE" ]; then
  echo "Nerastas commit $BASE. Patikrinkite demo-a istoriją (git log --oneline)." >&2
  exit 1
fi

git checkout -f main
git reset --hard "$BASE"
git clean -fd
git branch -D demo-02 2>/dev/null || true

if git remote get-url origin >/dev/null 2>&1; then
  git push --force origin main
  git push origin --delete demo-02 2>/dev/null || true
  git fetch --prune origin
else
  echo "Dėmesio: nėra origin. Sukurkite: gh repo create demo-a --private --source=. --remote=origin" >&2
fi

rm -f "$HOME/Desktop/devops/demo-raktas.txt"

echo "---"
git status -sb
git branch -a
git log --oneline
