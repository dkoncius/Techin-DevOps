# Azure dalis

Statusas: **0 žingsnis (tik skaitymas)**. Nieko Azure'e dar nesukurta.

## Ką darysime

1. **0 žingsnis – patikra**: `az` ir `terraform`, prisijungimas, prenumerata, regionas `westeurope`, B serijos kvota.
2. **1 žingsnis – biudžetas ir auto-shutdown**: sumos po kainų lentelės (žr. žemiau).
3. **2 žingsnis – Terraform**: kodas dedamas į esamą `etalonas/terraform/azure` (nieko neperrašant be peržiūros).
4. **3 žingsnis – Ansible ant Azure VM**.
5. **4 žingsnis – kainos patikra ir `terraform destroy`**.
6. Azure varianto sprendimas (A / B / C) – iki 2027-04-16 (`planas.md`, 7 fazė).

## Taisyklės

- Jokių resursų kūrimo be aiškaus patvirtinimo.
- Nieko į Git nesiunčiama, kol nepasakoma.
- Prieš `apply` – `terraform plan` ir kainos įvertinimas; po bandymo – `destroy`.

## Įrankiai

- `terraform` 1.9.8.
- `az` 2.79.0 virtualenv'e: `~/.venvs/az/bin/az` (įdiegta: `python3 -m venv ~/.venvs/az && ~/.venvs/az/bin/pip install azure-cli`).
- PATH tik einamajai terminalo sesijai: `export PATH="$HOME/.venvs/az/bin:$PATH"`.
- Prisijungimas: `az login --use-device-code`.

## Kainos (Azure Retail Prices API, westeurope, Linux, pay-as-you-go, USD)

Šaltinis: `https://prices.azure.com/api/retail/prices`, užklausta 2026-11-07. Kainos USD, ne EUR.

| Pozicija | Kaina |
|----------|-------|
| Standard_B2s (2 vCPU, 4 GB) | 0,048 USD/val. |
| Standard_B2ms (2 vCPU, 8 GB) | 0,096 USD/val. |
| Viešas IP Standard Static | 0,005 USD/val. (~3,65 USD/mėn., mokama ir kai VM išjungta) |
| OS diskas | ~2 USD/mėn. (**nepatikrinta per API**; Standard SSD E10 128 GB būtų 9,60 USD) |

Mėnesio VM kaina pagal grafiką (tik VM, be IP ir disko):

| Grafikas | Val./mėn. | B2s | B2ms |
|----------|-----------|-----|------|
| 24/7 | 730 | 35,04 | 70,08 |
| Kasdien 08–22 (14 val.) | 426 | 20,45 | 40,90 |
| Darbo dienomis ~10 val. (22 d.) | 220 | 10,56 | 21,12 |

Apytikslė bendra suma su IP (3,65) ir disku (~2): B2ms 24/7 ≈ 76; kasdien 14 val. ≈ 47; darbo dienomis 10 val. ≈ 27 USD/mėn. Neįtraukta: išeinantis srautas, snapshot'ai, mokesčiai.

**Siūlomas VM dydis: Standard_B2ms (8 GB)** dėl Argo CD + k3s + PostgreSQL. B2s (4 GB) per mažas.

Biudžeto suma: renkamasi po šios lentelės.

## Auto-shutdown ir paleidimas

Auto-shutdown 22:00 (Europe/Vilnius) VM tik **išjungia (deallocate)**. Pats jis niekada jos neįjungia. Paleisti reikia ranka:

```bash
export PATH="$HOME/.venvs/az/bin:$PATH"
az vm start -g rg-etalonas -n vm-etalonas
az vm show -d -g rg-etalonas -n vm-etalonas --query publicIps -o tsv   # statinis IP nesikeičia
```

Siūlomas paprastas skriptas `scripts/vm.sh start|stop|status` (bus sukurtas vėliau, po patvirtinimo). Vėliau galima pridėti automatinį paleidimą (Azure Automation / Logic App), bet tai papildoma kaina ir sudėtingumas.

## Žinomi apribojimai

- **Biudžetas tik perspėja, bet neišjungia resursų.** Viršijus sumą gaunamas laiškas, o VM toliau veikia ir kaupia išlaidas. Perspėjimai taip pat vėluoja (kainos duomenys atnaujinami kas kelias valandas).
- Auto-shutdown neįjungia VM (žr. aukščiau).
- Statinis viešas IP kainuoja ir išjungus VM.
- Deallocate VM nemoka už skaičiavimą, bet diskas ir IP lieka apmokestinti.

## Terraform (`etalonas/terraform/azure`)

Patvirtinta: westeurope, `Standard_B2ms`, biudžetas **35 USD** (kintamasis `budget_usd`, skaičiuojamas prenumeratos valiuta), auto-shutdown 22:00 `FLE Standard Time` (Vilnius).

Naudojimas:

```bash
cd etalonas/terraform/azure
cp terraform.tfvars.example terraform.tfvars   # užpildyti; failas ignoruojamas Git'e
terraform init && terraform validate
```

`terraform plan` – tik po `az login` ir prenumeratos patvirtinimo. `terraform apply` – tik po aiškaus patvirtinimo.

- **SSH ir IP**: `my_ip_cidr` neturi numatytosios reikšmės. **Pasikeitus jūsų viešam IP (namai, kita tinklo prieiga) reikia atnaujinti `terraform.tfvars` ir paleisti `terraform apply`**, kitaip SSH nebeprisijungs.
- Auto-shutdown pranešimai el. paštu išjungti, nebent `shutdown_notification_email` nustatytas `terraform.tfvars`. Tikri adresai į Git nededami.
- Ubuntu 22.04; atnaujinimas į 24.04 vėliau, atskiru žingsniu.
- Esamas kodas pataisytas, ne perrašytas (RG, vnet, NSG, Static IP, NIC, VM, biudžetas liko).
