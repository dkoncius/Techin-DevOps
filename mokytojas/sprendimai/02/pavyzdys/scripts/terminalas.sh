#!/usr/bin/env bash
# terminalas.sh – parodo, kur esame, kiek čia failų ir paskutinius commit'us.
# Naudojimas: ./scripts/terminalas.sh
set -euo pipefail

echo "Aplankas: $(pwd)"
echo "Failų ir aplankų čia: $(ls | wc -l | tr -d ' ')"
echo "Paskutiniai commit'ai:"
git log --oneline -n 3
