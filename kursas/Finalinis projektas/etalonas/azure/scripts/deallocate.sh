#!/usr/bin/env bash
# STATUSAS: neišbandyta (peržiūrėta, nepaleista)
# Sustabdo VM ir atlaisvina skaičiavimą (nebemokama už CPU); išveda būseną po komandos.
set -euo pipefail
export PATH="$HOME/.venvs/az/bin:$PATH"
RG=rg-etalonas; VM=vm-etalonas
az vm deallocate -g "$RG" -n "$VM"
echo "VM būsena: $(az vm get-instance-view -g $RG -n $VM --query "instanceView.statuses[?starts_with(code,'PowerState')].displayStatus | [0]" -o tsv)"
