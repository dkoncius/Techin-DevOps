#!/usr/bin/env bash
# Paruošia 03 pamokos užduočių aplanką pamoka-03 (paleiskite: bash paruosti.sh)
set -euo pipefail

ADRESAS="https://raw.githubusercontent.com/dkoncius/Techin-DevOps/main/kursas/03%20Bash%20skriptai"
APLANKAS="${PAMOKA_DIR:-$HOME/Desktop/devops}/pamoka-03"

mkdir -p "$APLANKAS/scripts" "$APLANKAS/testai" "$APLANKAS/uzrasai" "$APLANKAS/docs"
touch "$APLANKAS/uzrasai/serveriai.txt" "$APLANKAS/scripts/ataskaita.sh"

curl -fsSL -o "$APLANKAS/testai/tikrinti.sh" "$ADRESAS/testai/tikrinti.sh"
curl -fsSL -o "$APLANKAS/scripts/patikra.sh" "$ADRESAS/starteris/1-patikra.sh"
chmod +x "$APLANKAS/scripts/patikra.sh"

echo "Paruošta: $APLANKAS"
echo "Toliau: cd $APLANKAS"
