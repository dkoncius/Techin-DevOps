#!/usr/bin/env bash
# STATUSAS: neišbandyta (peržiūrėta, nepaleista)
# Paleidžia VM (tik start; nieko nekuria/netrina) ir išveda jos būseną.
set -euo pipefail
export PATH="$HOME/.venvs/az/bin:$PATH"
RG=rg-etalonas; VM=vm-etalonas
az vm start -g "$RG" -n "$VM"
echo "VM būsena: $(az vm get-instance-view -g $RG -n $VM --query "instanceView.statuses[?starts_with(code,'PowerState')].displayStatus | [0]" -o tsv)"
