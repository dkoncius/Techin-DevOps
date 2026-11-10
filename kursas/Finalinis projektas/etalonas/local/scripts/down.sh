#!/usr/bin/env bash
# STATUSAS: neišbandyta (peržiūrėta, nepaleista)
# Lokalaus išleidimo šalinimas. Naikina duomenis, todėl reikalauja patvirtinimo.
set -euo pipefail
export PATH="$HOME/.local/bin:$PATH"
echo "Bus pašalinti Helm išleidimai 'etalonas' namespace dev ir prod (DB duomenys gali dingti)."
read -r -p "Rašyk 'taip' tęsti: " a
[ "$a" = "taip" ] || { echo "Atšaukta."; exit 1; }
for ns in dev prod; do helm uninstall etalonas -n "$ns" || true; done
echo "Argo CD, ingress-nginx ir cert-manager nepaliesti."
