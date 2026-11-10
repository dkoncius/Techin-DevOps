#!/usr/bin/env bash
# STATUSAS: išbandyta 2026-11-07 (paleista)
# Tik skaito: patikrina įrankius, prisijungimą, VM būseną ir ar mano IP sutampa su my_ip_cidr NSG taisyklėse.
set -uo pipefail
export PATH="$HOME/.venvs/az/bin:$HOME/.local/bin:$PATH"
RG=rg-etalonas; VM=vm-etalonas
for t in az terraform kubectl curl; do command -v "$t" >/dev/null && echo "  OK    $t" || echo "  TRŪKSTA $t"; done
az account show --query name -o tsv >/dev/null 2>&1 && echo "  OK    az login" || echo "  TRŪKSTA az login"
echo "VM būsena: $(az vm get-instance-view -g $RG -n $VM --query "instanceView.statuses[?starts_with(code,'PowerState')].displayStatus | [0]" -o tsv 2>&1)"
echo "Mano dabartinis IP: $(curl -s --max-time 5 https://api.ipify.org) (turi sutapti su my_ip_cidr, kitaip 22/80/443 uždaryti)"
