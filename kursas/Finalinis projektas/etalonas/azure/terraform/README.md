# Azure VM (Terraform)

Kuriama: resource group `rg-etalonas`, VNet/subnet, NSG, statinis viešas IP, NIC ir Ubuntu 22.04 VM su k3s (cloud-init.yaml, be traefik)
`Standard_B2s_v2` (x86, 2 vCPU, 8 GB; B2ms šioje prenumeratoje apribotas; k3s + Argo CD + PostgreSQL), regionas `swedencentral` (westeurope prenumeratai uždarytas: `locationineligible`).

## Paruošimas

1. SSH raktas (RSA 4096 – Azure nepriima ed25519; atskiras nuo Argo deploy rakto):
   `ssh-keygen -t rsa -b 4096 -f ~/.ssh/etalonas_azure -C etalonas-azure`
   Privatus raktas niekada nededamas į Git.
2. `cp terraform.tfvars.example terraform.tfvars` ir užpildykite `ssh_public_key` (turinys iš
   `~/.ssh/etalonas_azure.pub`) bei `my_ip_cidr`. `*.tfvars` yra `.gitignore`.
3. `az login`, tada įsitikinkite, kad provideriai užregistruoti (registracija gali užtrukti
   ilgiau nei 13 min, tai normalu):
   `az provider show -n Microsoft.Compute --query registrationState -o tsv`
   (taip pat `Microsoft.Network`, `Microsoft.DevTestLab`).
4. `terraform init && terraform plan -var-file=terraform.tfvars`, o patikrinus: `terraform apply`.

## Tinklo IP (SSH)

SSH (22) leidžiamas tik iš `my_ip_cidr` (`IP/32`). **Pasikeitus tinklui (namai / mokykla)** reikia
atnaujinti `my_ip_cidr` faile `terraform.tfvars` (savo IP: `curl https://api.ipify.org`) ir paleisti
`terraform apply`. Portai 80/443 **irgi** leidžiami tik iš `my_ip_cidr`.

**Vėliau atverti viešai:** `main.tf` taisyklėje `http-https-tik-mano-ip` pakeiskite
`source_address_prefix = var.my_ip_cidr` į `"*"` ir paleiskite `terraform apply`.

## Kaina (Retail Prices API, swedencentral, EUR)

VM 0,0776 €/val.; statinis IP ~3,29 €/mėn.; diskas S4 ~1,38 €/mėn.

| Grafikas | Iš viso/mėn. |
|---|---|
| **Darbo dienos ~10 val. (prielaida)** | **~22 €** |
| Kasdien 14 val. | ~38 € (viršija 35 €) |
| 24/7 | ~61 € |

Po bandymo: `terraform destroy` (kad nebūtų mokama už IP ir diską).

## Biudžetas ir kvota

- Biudžetas valdomas **portale** (Cost Management → Budgets), ne Terraform: **35 EUR/mėn.**,
  perspėjimai ties **50 % / 80 % / 100 %**.
- vCPU kvota: **4 vCPU** regione; B2s_v2 naudoja 2.

## VM paleidimas / sustabdymas

Auto-shutdown kasdien 22:00 (Vilnius) tik išjungia (deallocate) VM; įjungti reikia ranka.
Deallocated VM neapmokestinama už skaičiavimą (diskas ir statinis IP – taip).

```bash
az vm start      -g rg-etalonas -n vm-etalonas
az vm deallocate -g rg-etalonas -n vm-etalonas   # sustabdyti ir nemokėti už CPU
ssh -i ~/.ssh/etalonas_azure azureuser@$(terraform output -raw public_ip)
```

## k3s ir kubeconfig

k3s diegiamas per `cloud-init.yaml` (be traefik; be slaptų reikšmių). Kubeconfig: `/home/azureuser/k3s.yaml`
(0640, savininkas `azureuser`). Argo Application: `azure/argocd/application-azure.yaml` + `azure/values-azure.yaml`
(Service `LoadBalancer`, be Ingress); `values.yaml` ir `etalonas-prod` nepakeisti.
