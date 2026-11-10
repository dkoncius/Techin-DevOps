**STATUSAS: neišbandyta**

# Lokali versija (Docker Desktop, namespace dev ir prod)

> **Taisyklės**
> 1. Pirmiausia lokaliai (`local/`), tik tada Azure.
> 2. Pirmas Argo CD sync be prune (rankinis; `automated`/`prune` įjungti tik po žalio pirmo sync).
> 3. Slaptų duomenų (privačių raktų, tfstate, tfvars, kubeconfig, argocd-initial-admin-secret) nerodyti ir nedėti į Git.

Bendras kodas (`app/`, `Dockerfile`, testai, `helm/miniplatforma`) lieka šakninėje repozitorijoje; Argo CD skaito jį iš ten.

## Turinys
| Failas | Paskirtis |
|---|---|
| `scripts/up.sh` | atvaizdas, ingress-nginx, cert-manager, dev ir prod išleidimai |
| `scripts/test.sh` | GET /health, POST /notes („TESTAS"), POST be teksto (400), GET /notes |
| `scripts/down.sh` | pašalina Helm išleidimus (klausia patvirtinimo) |
| `values-local.yaml` | prod reikšmės lokaliai |
| `argocd/application.yaml` | Application `etalonas-prod` (`valueFiles: ../../local/values-local.yaml`) |
| `argocd/repo-secret.template.yaml` | repo Secret ŠABLONAS be rakto |

## Paleidimas nuo nulio
1. `./local/scripts/up.sh`
2. Argo CD v3.5.7: `kubectl create ns argocd && kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v3.5.7/manifests/install.yaml`
3. Repo Secret: nukopijuoti šabloną į `local/argocd/repo-secret.yaml` (ignoruojamas Git), įklijuoti read-only deploy raktą, `kubectl apply -f`.
4. `kubectl apply -f local/argocd/application.yaml`, pirmas sync rankinis, be prune.
5. `kubectl -n ingress-nginx port-forward svc/ingress-nginx-controller 8443:443 &` ir `./local/scripts/test.sh`.

`test.sh` testinių įrašų netrina; trinti tik savininkui paprašius.
