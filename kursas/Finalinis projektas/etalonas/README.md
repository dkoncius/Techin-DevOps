# Etalonas: „Mini platforma“

Dėstytojo etaloninis sprendimas finalinei užduočiai ([aprašas](../aprasymas.md)). Aplikacija: užrašų API (Flask + PostgreSQL) su `/health`, `/notes`, `/metrics`. Architektūra: [docs/architektura.md](docs/architektura.md).

**Paskirtis:** (1) demonstracija studentams, (2) vertinimo etalonas, (3) pagrindas pamokoms. Egzamine studentai gauna **kitą** aplikaciją.

> **Taisyklės:** pirmiausia lokaliai, tik tada Azure. Pirmas Argo CD sync be prune. Po darbo Azure: `./azure/scripts/deallocate.sh`. Slaptų duomenų (raktų, tfstate, tfvars, kubeconfig) nerodyti ir nedėti į Git.

## Žemėlapis

| Dalis | Kam skirta | Nuo ko pradėti |
|---|---|---|
| **Bendra**: `app/`, `helm/`, `.github/`, `docs/` | Aplikacija, Helm chart'as (jį skaito Argo CD abiejose aplinkose), CI, dokumentacija | `app/` ir `helm/miniplatforma/`; architektūra: [docs/architektura.md](docs/architektura.md), runbook: [docs/runbook.md](docs/runbook.md) |
| **Tik local** | Paleidimas Docker Desktop kompiuteryje (Kubernetes namespace `dev`/`prod`) ir Docker Compose | [local/README.md](local/README.md): `./local/scripts/up.sh`, tada `./local/scripts/test.sh` |
| **Tik azure** | VM `vm-etalonas` su k3s `swedencentral` regione (Terraform) ir Argo CD | [azure/README.md](azure/README.md): `./azure/scripts/preflight.sh`, `start.sh`, `test.sh` |

### Kas kur guli dabar

Perkėlimas dar nevyksta: dalis lokalių failų tebėra šaknyje.

**Bendra**
- `app/`: Flask API, `Dockerfile`, testai
- `helm/miniplatforma/`: chart'as ir `values*.yaml` (`values.yaml`, `values-dev.yaml`; local ir azure reikšmės yra `local/` ir `azure/`)
- `.github/workflows/ci.yml`: ruff, pytest, Trivy, gitleaks, build, push, GitOps
- `docs/`: architektūra, runbook, rizikos

**Tik local**
- `local/`: `README.md`, `values-local.yaml`, `argocd/`, `scripts/` (naujas pagrindas)
- šaknyje likę: `docker-compose*.yml`, `.env.example`, `nginx/`, `monitoring/`, `backup/`, `scripts/`, `ansible/`, `failures/`, `k8s/`, `terraform/local/`
- paleidimas Compose: `make up && make check`; stebėjimas `make monitor`

**Tik azure**
- `azure/`: `README.md`, `values-azure.yaml`, `argocd/application-azure.yaml`, `terraform/`, `scripts/`
- Terraform: `azure/terraform/` (state ir tfvars tik lokaliai, `.gitignore`)

**Šaknyje taip pat:** `Makefile` (Compose ir lokalaus Kubernetes tikslai), `todo.md`.

## Kas ir kaip išbandyta (A–H reikalavimai)

| Reik. | Dalis | Kur | Būsena |
|---|---|---|---|
| A | VM/IaC per Terraform | `azure/terraform` | `terraform validate` praeina. **Netaikyta** (nėra Azure paskyros) |
| A | Lokalus Terraform | `terraform/local` | **išbandyta**: apply, drift atstatymas, duomenys išlieka, destroy |
| A/E | SSH tik raktas, UFW, vault slaptažodis | `ansible/` | **išbandyta** prieš SSH serverį konteineryje: idempotentiška; `fail2ban` praleistas (konteineryje nėra auth.log), todėl jo tikroje VM dar netikrinta |
| B | Dockerfile multi-stage, non-root, Compose | `app/`, `docker-compose.yml` | **išbandyta** |
| C | CI: ruff, pytest, Trivy, gitleaks, build, push, GitOps | `.github/workflows/ci.yml` | `actionlint` švarus; ruff, pytest, Trivy, gitleaks paleisti lokaliai ir praeina. **Pats workflow GitHub'e dar nepaleistas** |
| C/D | Diegimas per Argo CD | `local/argocd/application.yaml`, `azure/argocd/application-azure.yaml` | **neišbandyta** (reikia GitHub repo) |
| D | Deployment, probes, limits, ConfigMap/Secret, PVC | `helm/`, `k8s/` | **išbandyta** dev ir prod (kind) |
| D | Ingress + TLS | Helm + ingress-nginx + cert-manager | **išbandyta** su self-signed; Let's Encrypt reikalauja tikro domeno |
| E | Paslaptys ne repozitorijoje, antraštės, rizikos | `docs/rizikos.md` | **išbandyta**; testuojant testuojant rastos ir ištaisytos spragos (žr. žemiau) |
| F | Prometheus, Grafana (RED), 2+ perspėjimai, Loki | `monitoring/` | **išbandyta** Compose: skydelis įkeliamas automatiškai, `ApiDown` užsidegė, pasiekė Alertmanager, logai Loki. Kubernetes stebėjimas **nepadarytas** |
| G | Kopijos, atkūrimas, RTO/RPO | `backup/` | **išbandyta** Compose ir Kubernetes (RTO 14 s) |
| H | README, schema, runbook, gedimai | `docs/`, `failures/` | parašyta ir išbandyta |

## Ką radome testuojant (naudinga pamokoms)
1. `PAKEISTI` didžiosiomis raidėmis netinka Kubernetes host (RFC 1123).
2. API pasileisdavo anksčiau už DB ir kraudavosi → aplikacija dabar laukia DB.
3. `/metrics` per Ingress buvo atviras → užblokuota.
4. Trivy: trūko `readOnlyRootFilesystem` → pridėta su `emptyDir`.
5. Ansible: SSH konfigūracija įrašyta, bet procesas neperkrautas po klaidos → `flush_handlers`.
6. `helm --wait` stringa dėl `Pending` kopijų PVC (WaitForFirstConsumer).
7. macOS: Terraform Docker provider reikia `DOCKER_HOST=unix://$HOME/.docker/run/docker.sock`.

## Kas dar neatlikta
- GitHub repozitorija ir pirmas tikras Actions paleidimas; Argo CD diegimas.
- Azure: `terraform apply`, kainos patikra (reikia paskyros).
- Kubernetes stebėjimas (Prometheus/Loki klasteryje) ir Vault.
- Egzamino scenarijus su **nauja** aplikacija.
