# Programų sąrašas praktikos egzamino kompiuteriams (IT skyriui)

Skirta Techin IT specialistams: ką iš anksto įdiegti kompiuteriuose, kuriuose vyks DevOps (VH-DO) praktikos egzaminas (birželis 2027, 3–4 val.). Versijos yra **minimalios**: tinka ir naujesnės, svarbu, kad visi kompiuteriai turėtų tas pačias.

> Juodraštis (2026-11-12), parašytas pagal kurso turinį. Prieš siunčiant: pasitikslinti su Justina, kokia sistema yra mokyklos kompiuteriuose (Windows ar Linux), ir patvirtinti versijas pagal tuometinius leidimus (2027 gegužė).

## 1. Sistema

| Variantas | Pastaba |
|---|---|
| **Linux (Ubuntu 22.04 / 24.04) tiesiogiai** | Geriausia: visos komandos veikia taip, kaip kurse |
| Windows 11 + **WSL2 Ubuntu 22.04 / 24.04** | Kursas mokomas per WSL2 Ubuntu; visos komandos vykdomos WSL viduje, ne PowerShell |
| Windows be WSL (tik PowerShell) | **Netinka**: Bash skriptai ir kurso komandos neveiks |

Reikia: virtualizacijos įjungimo BIOS, ~20 GB laisvos vietos, ≥ 8 GB RAM (geriau 16 GB, nes veiks lokalus Kubernetes klasteris), vartotojo teisės diegti paketus (`sudo`) arba paruošti viską iš anksto.

## 2. Programos

| Programa | Min. versija | Kam reikia | Kurso etapas |
|---|---|---|---|
| Bash | 5.x (Ubuntu) | skriptai, terminalas | 1 |
| Git | 2.40+ | versijų kontrolė | 1 |
| GitHub CLI (`gh`) | 2.40+ | repozitorijos, Pull Request'ai, prisijungimas | 1, 3 |
| Python 3 (+ `python3-venv`, `pip`) | 3.12 | kurso projektas (Flask), testai | 1 |
| curl, jq, nano | bet kokia | užklausos, JSON, redagavimas | 1 |
| OpenSSH klientas (`ssh`, `ssh-keygen`) | 8.x+ | raktai, prisijungimas | 1 |
| Docker Engine arba Docker Desktop (+ Compose v2) | Docker 27+, Compose 2.2x+ | konteineriai, `docker compose` | 2 |
| Trivy | 0.50+ | image skenavimas | 2, 7 |
| kubectl | 1.30+ | Kubernetes valdymas | 4–7 |
| kind (arba minikube) | kind 0.23+ | lokalus Kubernetes klasteris | 4–5 |
| Helm | 3.14+ | Helm chart'ai | 5–6 |
| Azure CLI (`az`, su `az bicep`) | 2.60+ | Azure ir Bicep | 6–7 |
| Terraform | 1.9+ | infrastruktūra kodu | 6–7 |
| VS Code (arba kitas redaktorius) | bet kokia | YAML, Dockerfile, skriptai | visi |
| Naršyklė (Chrome / Edge / Firefox) | naujausia | GitHub, Azure portalas, programos tikrinimas | visi |

Pastabos:
1. Kubernetes lokaliam klasteriui (kind) reikia veikiančio Docker. Dar neišrinkta, ar kursas naudos kind ar minikube; šį sąrašą atnaujinsiu, kai išrinksiu.
2. Docker turi veikti **be `sudo`** (vartotojas `docker` grupėje) arba per Docker Desktop su WSL integracija.
3. Jei IT nori sumažinti sąrašą: ko tikrai reikia egzaminui, nuspręsiu pagal oficialią programą ir egzamino pavyzdį.

## 3. Prieiga prie tinklo

Praktikoje reikia interneto (arba bent šių adresų), kitaip neveiks nei diegimas, nei užduotys:

| Adresas | Kam |
|---|---|
| `github.com`, `api.github.com`, `ghcr.io`, `raw.githubusercontent.com` | kodas, Actions, image registras |
| `registry-1.docker.io`, `auth.docker.io`, `production.cloudflare.docker.com` | Docker Hub image'ai (python, mysql, nginx) |
| `pypi.org`, `files.pythonhosted.org` | Python paketai |
| `login.microsoftonline.com`, `portal.azure.com`, `management.azure.com`, `*.azurecr.io` | Azure prisijungimas ir ACR |
| `registry.k8s.io`, `quay.io`, `kind.sigs.k8s.io`, `get.helm.sh` | Kubernetes ir Helm komponentai |

Portai: leisti išeinančius HTTPS (443). Lokaliai programos naudoja 5000, 8080, 3306, 80/443 (tik localhost).

## 4. Paskyros

1. Studentai naudoja **savo GitHub paskyras** (Justinos patvirtinta: egzamine galima naudotis GitHub ir ten sukeltais darbais). Todėl kompiuteryje turi būti galima prisijungti prie GitHub (`gh auth login` per naršyklę) ir atsijungti po egzamino.
2. Azure: ar egzaminui reikės Azure prenumeratos, išaiškės pagal egzamino užduoties pavyzdį; mokykla turės pasirūpinti paskyromis.

## 5. Ką prašau IT patvirtinti

1. Kokia operacinė sistema yra praktikos klasės kompiuteriuose (Windows / Linux)?
2. Ar galima įdiegti WSL2 ir Docker (arba Docker Desktop, kuriam kai kuriais atvejais reikia licencijos)?
3. Ar studentai turės teises vykdyti `sudo`, `docker` be administratoriaus?
4. Ar bus atviri aukščiau išvardinti adresai (dažnai užblokuoti: `ghcr.io`, Docker Hub, `*.azurecr.io`)?
5. Kada galima atvykti pasitikrinti aplinkos (Justina minėjo, kad po teorijos egzamino galima)?
6. Ar atsiskaitymų (kurso eigoje) kompiuteriai ta pati aplinka kaip egzamino?

## 6. Patikros komandos (po diegimo)

```
git --version
gh --version
python3 --version
docker --version
docker compose version
docker run --rm hello-world
trivy --version
kubectl version --client
kind version
helm version
az version
terraform version
```

Visos komandos turi veikti be klaidų ir be `sudo`; `docker run --rm hello-world` patikrina ir tinklo prieigą prie Docker Hub.
