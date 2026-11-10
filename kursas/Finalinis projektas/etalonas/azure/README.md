**STATUSAS: neišbandyta**

# Azure versija (VM vm-etalonas, k3s, namespace prod)

> **Taisyklės**
> 1. Pirmiausia lokaliai (`local/`), tik tada Azure.
> 2. Pirmas Argo CD sync be prune (rankinis; `automated`/`prune` įjungti tik po žalio pirmo sync).
> 3. Slaptų duomenų (privačių raktų, tfstate, tfvars, kubeconfig, argocd-initial-admin-secret) nerodyti ir nedėti į Git.
> 4. Po darbo: `./azure/scripts/deallocate.sh` (az vm deallocate -g rg-etalonas -n vm-etalonas).

Bendras kodas (`app/`, `Dockerfile`, testai, `helm/miniplatforma`) lieka šakninėje repozitorijoje; Argo CD skaito jį iš ten.
Regionas `swedencentral`, resource group `rg-etalonas`. Prieiga (SSH, 80/443) tik iš `my_ip_cidr`.

## Turinys
| Failas | Paskirtis |
|---|---|
| `terraform/` | `main.tf`, `cloud-init.yaml`, `terraform.tfvars.example` (tikras `terraform.tfvars` ir state niekada Git'e) |
| `argocd/application-azure.yaml` | Application `etalonas-azure` (`valueFiles: ../../azure/values-azure.yaml`) |
| `values-azure.yaml` | 1 replika, Service LoadBalancer, be Ingress, valandinis backup |
| `scripts/preflight.sh` | tik skaito: įrankiai, `az login`, VM būsena, mano IP |
| `scripts/start.sh` / `deallocate.sh` | VM start / deallocate, po komandos rodo būseną |
| `scripts/test.sh` | tie patys testai kaip lokaliai; `BASE_URL` numatyta `http://20.240.240.218` |

## Eiga
1. `./azure/scripts/preflight.sh`, tada `./azure/scripts/start.sh`.
2. Terraform (tik jei kuriama nuo nulio): `cp terraform.tfvars.example terraform.tfvars`, užpildyti, `terraform init && terraform plan`. `apply`/`destroy` tik sąmoningai.
3. SSH: `ssh -i ~/.ssh/etalonas_azure azureuser@20.240.240.218`; Argo CD v3.5.7 diegiamas kaip lokaliai, repo Secret raktas `argocd-azure-readonly` (read-only).
4. `kubectl apply -f azure/argocd/application-azure.yaml`, pirmas sync be prune.
5. `./azure/scripts/test.sh`; testinių įrašų netrinti be savininko prašymo.
6. **Po darbo: `./azure/scripts/deallocate.sh`.**

Kaina, kvota, tinklo IP pakeitimai ir `terraform` smulkmenos: žr. `azure/terraform/README.md`.
