#!/usr/bin/env bash
# STATUSAS: išbandyta 2026-11-07 (paleista)
# Tik spausdina: sužino dabartinį viešąjį IP ir parodo az komandas NSG taisyklėms atnaujinti.
# Nieko nevykdo. IP rodomas tik terminale (neįrašyk jo į Git / terraform.tfvars be reikalo).
set -euo pipefail
RG=rg-etalonas; NSG=nsg-etalonas
IP=$(curl -s --max-time 5 https://api.ipify.org)
[[ "$IP" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo "Nepavyko gauti IP (gauta: '$IP')"; exit 1; }
echo "Mano dabartinis IP: $IP"
echo "Nukopijuok ir paleisk pats (kiekviena taisyklė atskirai):"
for r in ssh-tik-mano-ip http-https-tik-mano-ip; do
  echo "  az network nsg rule update -g $RG --nsg-name $NSG -n $r --source-address-prefixes $IP/32"
done
echo "Pastaba: po to terraform būseną sutapdink su var.my_ip_cidr, kitaip kitas apply grąžins seną IP."
