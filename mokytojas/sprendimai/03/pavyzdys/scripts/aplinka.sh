#!/usr/bin/env bash
# aplinka.sh – parodo kintamąjį PROJEKTO_VARDAS ir procesų eilučių skaičių.
# Naudojimas: ./scripts/aplinka.sh   arba   PROJEKTO_VARDAS=mano ./scripts/aplinka.sh
set -euo pipefail

echo "PROJEKTO_VARDAS: ${PROJEKTO_VARDAS:-nenustatyta}"
echo "Proceso eilučių ps išvestyje: $(ps -e | wc -l | tr -d ' ')"
