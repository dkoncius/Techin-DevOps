#!/usr/bin/env bash
# Azure preflight: ar prenumerata paruošta kurti VM? Nieko mokamo nekuria.
#
# Ką daro:
#   - parodo aktyvią prenumeratą;
#   - tikrina resursų teikėjų (providers) registraciją;
#   - kiekvienam regionui: VM dydžio apribojimus, vCPU kvotą ir ar regionas priima
#     jūsų prenumeratą (laikina nemokama resursų grupė + VNet, iškart ištrinama).
# Ko nedaro: nekuria VM, diskų, viešų IP ir kitų mokamų resursų.
#
# Naudojimas:
#   ./azure-preflight.sh                       # numatytieji regionai ir dydis
#   REGIONS="swedencentral westeurope" SKU=Standard_B2s_v2 ./azure-preflight.sh
#
# Reikia: Azure CLI (az) ir prisijungimo: az login --use-device-code
# Pastaba: skriptas parašytas pagal etalono testą, bet dar nepatikrintas su kita prenumerata.

set -u

REGIONS="${REGIONS:-swedencentral westeurope northeurope}"
SKU="${SKU:-Standard_B2s_v2}"
PROVIDERS="Microsoft.Compute Microsoft.Network Microsoft.Storage Microsoft.ContainerRegistry Microsoft.ContainerService Microsoft.Consumption Microsoft.DevTestLab Microsoft.Insights"

problems=0
ok()   { printf '  [OK]       %s\n' "$1"; }
warn() { printf '  [PROBLEMA] %s\n' "$1"; problems=$((problems + 1)); }

if ! command -v az >/dev/null 2>&1; then
  echo "Nerastas az. Įdiekite Azure CLI arba pridėkite jį į PATH."
  exit 2
fi

echo "== 1. Prenumerata =="
if ! az account show --query "{vardas:name, busena:state, tipas:'(žr. portalą)'}" -o table 2>/dev/null; then
  echo "Neprisijungta. Paleiskite: az login --use-device-code"
  exit 2
fi
state="$(az account show --query state -o tsv)"
if [ "$state" = "Enabled" ]; then ok "prenumerata aktyvi"; else warn "prenumeratos būsena: $state"; fi

echo
echo "== 2. Resursų teikėjai (providers) =="
for p in $PROVIDERS; do
  s="$(az provider show -n "$p" --query registrationState -o tsv 2>/dev/null)"
  if [ "$s" = "Registered" ]; then
    ok "$p"
  else
    warn "$p: ${s:-nežinoma}. Registruoti: az provider register -n $p  (užtrunka kelias minutes)"
  fi
done

echo
echo "== 3. Regionai (dydis: $SKU) =="
for r in $REGIONS; do
  echo "-- $r --"

  restr="$(az vm list-skus -l "$r" --size "$SKU" --resource-type virtualMachines \
    --query "[0].restrictions[].reasonCode" -o tsv 2>/dev/null)"
  found="$(az vm list-skus -l "$r" --size "$SKU" --resource-type virtualMachines \
    --query "length(@)" -o tsv 2>/dev/null)"
  if [ -z "$found" ] || [ "$found" = "0" ]; then
    warn "$SKU: nerastas (gali būti neužregistruotas Microsoft.Compute arba dydžio nėra regione)"
  elif [ -n "$restr" ]; then
    warn "$SKU apribotas ($restr). Pabandykite kitą dydį arba regioną"
  else
    ok "$SKU be apribojimų"
  fi

  echo "  vCPU kvota (naudojama / riba):"
  az vm list-usage -l "$r" \
    --query "[?name.value=='cores' || contains(name.value,'BSv2') || contains(name.value,'Bsv2') || contains(name.value,'BSFamily') || contains(name.value,'standardBS')].{kvota:name.localizedValue, naudojama:currentValue, riba:limit}" \
    -o table 2>/dev/null | sed 's/^/    /'

  # Ar regionas priima prenumeratą: laikina RG + VNet (nemokama), iškart trinama
  rg="rg-preflight-$RANDOM"
  if az group create -n "$rg" -l "$r" -o none 2>/dev/null; then
    err="$(az network vnet create -g "$rg" -n vnet-preflight --address-prefixes 10.255.0.0/16 -o none 2>&1)"
    if [ -z "$err" ]; then
      ok "regionas priima prenumeratą (laikinas VNet sukurtas)"
    else
      warn "regionas atmetė bandomąjį VNet: $(printf '%s' "$err" | tr '\n' ' ' | cut -c1-200)"
    fi
    az group delete -n "$rg" --yes --no-wait -o none 2>/dev/null
  else
    warn "nepavyko sukurti laikinos resursų grupės regione $r"
  fi
done

echo
if [ "$problems" -eq 0 ]; then
  echo "Rezultatas: viskas gerai."
else
  echo "Rezultatas: rasta problemų: $problems. Peržiūrėkite eilutes [PROBLEMA]."
  echo "Dažniausi sprendimai: registruoti providerius, rinktis kitą regioną ar dydį,"
  echo "prašyti Microsoft palaikymo (kvota arba regiono prieiga) per portalą (Help + support)."
fi
echo "Laikinos resursų grupės rg-preflight-* trinamos fone; patikrinkite portale, jei liko."
