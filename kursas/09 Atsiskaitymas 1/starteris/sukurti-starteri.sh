#!/usr/bin/env bash
# Dėstytojui: sukuria atsiskaitymo 1 starterio repozitoriją su klaidomis.
# Naudojimas: ./sukurti-starteri.sh /kelias/iki/atsiskaitymas-1-starteris
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Naudojimas: $0 <naujas-aplankas>" >&2
  exit 2
fi
cel="$1"
vieta="$(cd "$(dirname "$0")" && pwd)"

git clone -q https://github.com/dkoncius/devops-projektas-starter-template "$cel"
cd "$cel"
rm -rf .git tests
git init -q -b main

# .gitignore be .env eilutės
grep -v '^\.env$' .gitignore > .gitignore.new && mv .gitignore.new .gitignore

# Klaidų failai
cp "$vieta/failai/README.md" README.md
cp "$vieta/failai/paleisti.sh" paleisti.sh
rm -f run.sh
mkdir -p scripts uzrasai docs
cp "$vieta/failai/scripts/"*.sh scripts/
cp "$vieta/failai/uzrasai/adresai.txt" uzrasai/
cp "$vieta/failai/docs/atsiskaitymas.md" docs/
cp "$vieta/failai/env.demo" .env
chmod 644 paleisti.sh
chmod 755 scripts/*.sh

git add -A
git -c user.name=Destytojas -c user.email=destytojas@example.com commit -q -m "Atsiskaitymo 1 starteris su klaidomis"
echo "Sukurta: $cel"
