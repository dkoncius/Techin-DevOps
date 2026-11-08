# Etalonas: CI → GHCR → GitOps → Argo CD → Kubernetes → Azure (žingsnis po žingsnio)

Atnaujinta: 2026-11-07

Tikslas: turėti veikiančią grandinę, kurią vėliau galima išardyti ir mokyti:

```
commit → GitHub Actions (testai, multi-arch atvaizdo build) → GHCR (sha-<commit>)
       → GitOps žingsnis įrašo naują image.tag į Git ([skip ci])
       → Argo CD mato pakeitimą → Kubernetes
            ├─ lokaliai: Docker Desktop (1 mazgas, arm64)  ✅ veikia
            └─ debesyje: Azure VM + k3s (amd64)            ✅ veikia (2026-11-07)
```

Būsena: ✅ padaryta · ⏳ vyksta / laukia · 🔜 dar neprasidėjo

---

## 1. Pasiruošimas

1. ✅ Docker Desktop → Settings → Kubernetes: įjungtas Kubernetes (kind, 1 mazgas).
2. ✅ Claude Code atidarytas **etalonas** aplanke.
3. ✅ `gh auth login`; GitHub Actions → Settings → Actions → **Workflow permissions: Read and write**
   (kad CI galėtų įkelti atvaizdą ir įrašyti GitOps commit'ą).

## 2. CI (GitHub Actions)

1. ✅ Workflow paleidžia testus ir surenka atvaizdą iš `app/Dockerfile`.
2. ✅ Trivy diegimo klaida ištaisyta; CI žalias.
3. ✅ Atvaizdas keliamas į GHCR su žyme `sha-<commit>` (ne tik `latest`).
4. ✅ **Multi-arch** (commit `441050f`): `docker/setup-qemu-action` + `docker/setup-buildx-action`,
   `platforms: linux/amd64,linux/arm64`. Action'ai pinuoti pagal commit SHA.
   - Priežastis: Mac (Apple Silicon) yra arm64, Azure/k3s serveriai dažniausiai amd64.
   - Patikra: `docker buildx imagetools inspect ghcr.io/<naudotojas>/etalonas/api:<tag>`
     rodo `linux/amd64` ir `linux/arm64` (papildomi `unknown/unknown` įrašai yra
     provenance/SBOM atestacijos, tai normalu).

## 3. GitOps žingsnis

1. ✅ Po sėkmingo build'o CI pakeičia `image.tag` Helm `values.yaml` ir padaro commit'ą
   su **`[skip ci]`** (kad nesusidarytų begalinis ciklas).
2. ✅ Prieš kiekvieną savo `push`: `git pull --rebase` (CI GitOps commit'as būna `main` šakoje).

## 4. Helm pakeitimai (commit `7262045`)

1. ✅ `values.yaml`: `imagePullSecrets: []` (paketas viešas).
2. ✅ `templates/api.yaml`: palaiko `imagePullSecrets` sąrašą.
3. ✅ `argocd/application.yaml` (dabar `local/argocd/application.yaml`): SSH repo URL, `helm.releaseName: etalonas`, pinned Argo CD v3.5.7,
   pirmas sync rankinis, be `automated`.

## 5. Argo CD diegimas

1. ✅ Argo CD v3.5.7, server-side apply (`argocd` namespace), 7 pod'ai Running.
2. ✅ `argocd` CLI v3.5.7 į `~/.local/bin` (sha256 palygintas su `cli_checksums.txt`);
   `brew` neveikė dėl `/opt/homebrew` teisių. CLI naudojamas `--core` režimu.

## 6. Prieiga prie privačios repozitorijos (deploy key)

Kam: repozitorija privati, Argo CD pats skaito Git. Deploy key leidžia skaityti tik šią repozitoriją.

1. ✅ Sugeneruota ed25519 pora.
2. ✅ GitHub → repozitorija → Settings → **Deploy keys**; raktas **viena eilutė**,
   **Allow write access nežymėti** (patikrinti, kad rodytų „Read-only“, o ne „Read/write“).
3. ✅ `ls-remote` per SSH veikia.
4. ✅ Repo Secret `argocd/repo-etalonas` (label `argocd.argoproj.io/secret-type=repository`);
   privatus raktas ištrintas iš disko.
5. ✅ `github.com` host key patikrintas su GitHub `/meta`.

## 7. Application ir diff

1. ✅ `kubectl apply -f argocd/application.yaml` (dabar `local/argocd/application.yaml`) → `etalonas-prod`.
2. ✅ `argocd app diff etalonas-prod --core`: Argo **perėmė esamus** objektus
   (`etalonas-postgres`, `etalonas-api`, `etalonas-backup`), nieko naujo nekūrė; PostgreSQL ir PVC
   keičiasi tik tracking anotacija.

## 8. GHCR paketas

1. ✅ GitHub profilis → Packages → `api` → Package settings → Change visibility → **Public**
   (repozitorija lieka privati).
2. ✅ Anoniminis pull veikia (HTTP 200), tag'ų sąraše matomi `sha-…`.

## 9. Pirmas sync (rankinis, saugiai)

1. ✅ Prieš sync: rankinė atsarginė kopija (`etalonas-backup-pre-argocd`) ir PostgreSQL eilučių skaičius (1).
2. ⚠️ Pirmas sync su `sha-7262045` (tik amd64) → naujas Pod `ImagePullBackOff` Mac'e (arm64).
   Senos replikos veikė toliau, prod nenukentėjo; duomenys nepaliesti.
3. ✅ Multi-arch CI (žr. 2.4) → naujas `image.tag` → pakartotas sync be prune.
4. ✅ Rezultatas: `rollout status` sėkmingas, abi API replikos 1/1 Running su `sha-441050f`,
   eilučių skaičius 1 (nepasikeitė), `/health` → `{"db":"up","status":"ok"}`, PostgreSQL ir PVC tie patys.

## 10. Automatinis GitOps ir drift testas (lokaliai ir Azure)

1. ✅ Įjungta `syncPolicy.automated` su **`prune: false`** ir **`selfHeal: true`** (PR #7) abiem Application
   (`etalonas-prod` lokaliai, `etalonas-azure` Azure). Pritaikyta `kubectl apply` tik tam vienam Application.
2. ✅ Drift testas: lokaliai `replicas` 2 → 1, Argo grąžino į 2 per ~3 s; Azure `replicas` 1 → 2, Argo grąžino į 1
   per ~4 s. Duomenys neliesti (lokaliai 7 eilutės, Azure 3, Postgres be restart'ų).
3. ✅ Pilnas ciklas be rankų: PR #7 → merge → CI (vaizdas + `image.tag`) → Argo CD pats išdiegė. Azure puslapio
   apačioje `sha-20e5ed8` pasikeitė į `sha-ab1d429` (naujas pod'as) be rankinio sync.
4. Gera praktika: `prune: false`. Argo nieko netrina pats, nes klaida Git'e galėtų ištrinti DB ar jos diską;
   `prune` įjungiame tik sąmoningai ir ne duomenų objektams.

## 11. Azure (veikianti aplinka debesyje)

Sprendimas: **Azure VM + k3s** (ne AKS). Pigiau, valdome patys, sutampa su kurso įrankiais
(Terraform, Ansible, k3s). AKS paliekamas 32.2 paskaitai kaip palyginimas.

### 11.1 Prenumerata ir kaštai

1. ✅ Mokyklos (`techin.lt`) paskyroje prenumeratos nėra. Laiškas administratoriui paruoštas
   (prenumerata dėstytojui + mokiniams 31–33 sav.).
2. ✅ Asmeninė Microsoft paskyra turi prenumeratą „Azure subscription 1“ (Active, Owner). Portalas rodo
   **kreditų prenumeratą**: likutis **€179,54**, kreditai galioja dar **29 dienas (~2026-12-06)**; jiems pasibaigus
   „services will be paused“, kol pasirenkamas „Upgrade to Pay-As-You-Go“. (Anksčiau klaidingai laikėme, kad tai
   mokama prenumerata be ribos.) Resursų sąrašas (`az resource list`): tik `rg-etalonas` ir `NetworkWatcherRG`,
   nieko pamiršto. ⏳ Kur dingo ~€20 nuo pradinio likučio, dar neaišku (Cost analysis rodo `NotFound`; tikrinti
   Credits skiltį).
3. ✅ Valiuta: **EUR**.
4. ✅ Biudžetas portale (atsiskaitymo paskyros lygiu): **35 €/mėn.**, perspėjimai 50/80/100 % (Actual).
   Biudžetas tik **perspėja**, neišjungia resursų.
5. ⏳ Patikrinti, ar pridėtas mokėjimo būdas (Cost Management → Payment methods).
6. ✅ Kainos (westeurope, Linux, iš viešo Azure Retail Prices API, USD): B2s 0,048 USD/val.,
   **B2ms 0,096 USD/val.**, Static IP 0,005 USD/val. Apytiksliai su IP ir disku: 24/7 ~76 USD/mėn.,
   kasdien 14 val. ~47 USD, darbo dienomis ~10 val. ~27 USD.
7. ✅ Pasirinkta 8 GB VM, nes Argo CD + k3s + PostgreSQL + API netelpa į 4 GB. Faktiškai veikia
   **Standard_B2s_v2** (2 vCPU, 8 GB; `B2ms` buvo apribotas šioje prenumeratoje).
8. ⏳ Kreditai baigiasi ~2026-12-06, o bendras k3s mokiniams turi veikti nuo 2026-11-30: reikia sprendimo
   (Pay-As-You-Go ar mokyklos prenumerata).

### 11.2 Apsaugos nuo netikėtų kaštų

- Auto-shutdown kasdien 22:00 (laiko juosta `FLE Standard Time`). **Pats VM neįjungia**, ryte reikia
  `az vm start -g rg-etalonas -n vm-etalonas` (arba `azure/scripts/start.sh`).
- **Po darbo: `az vm deallocate -g rg-etalonas -n vm-etalonas`** ir patikrinti portale
  (*Virtual machines → vm-etalonas → Status*): turi būti **Stopped (deallocated)**, ne tik „Stopped“.
  Tik deallocated VM nebekainuoja skaičiavimo.
- Kaina pagal būseną: Running ~0,05–0,10 USD/val. (~35–70 USD/mėn. 24/7); Stopped (deallocated)
  tik diskas + statinis IP, ~4,7 €/mėn.; ištrinta 0. Resursų grupė, VNet ir NSG nemokami.
- Po ilgesnio nenaudojimo (2+ savaitės): `terraform destroy` **tik su aiškiu leidimu** (kodas lieka,
  atstatyti užtrunka ~10 min; pasikeitus IP reikia iš naujo nustatyti Argo CD ir deploy key).
- Static IP kainuoja ir išjungus VM, kol resursas egzistuoja.
- Azure kainas rodo su vėlavimu (iki ~24 val.), todėl „Costs this month: 0“ iškart po paleidimo nieko neįrodo.
- Kartą per savaitę peržiūrėti Cost Management → Cost analysis.

### 11.3 Terraform (`azure/terraform/`)

1. ✅ Yra: resursų grupė, VNet, NSG (SSH tik iš nurodyto IP, 80/443 visiems), Static IP, NIC, Ubuntu 22.04 VM.
2. ✅ Pakeista: regionas **`swedencentral`** (`westeurope` atmetė naujus klientus, `Standard_B2ms` buvo
   apribotas šioje prenumeratoje; dydis ir regionas nurodomi `terraform.tfvars`),
   `azurerm_dev_test_global_vm_shutdown_schedule`,
   `budget_usd` → kintamasis prenumeratos valiuta, `my_ip_cidr` be numatytosios reikšmės,
   `terraform.tfvars.example`; `*.tfvars` ignoruojamas Git'e.
3. ✅ `terraform init` ir `validate` praeina.
4. ✅ Azure CLI 2.79.0 (virtualenv `~/.venvs/az`); `az login --use-device-code` su asmenine paskyra pavyko.
5. ✅ Biudžetas valdomas portale (Terraform'e išjungtas), kvota ir SKU patikrinti, `terraform plan`
   peržiūrėtas (9 resursai, `swedencentral`), `terraform apply` su aiškiu leidimu.
   - Pirmą kartą `apply` nepavyko dėl regiono/SKU apribojimų (`RequestDisallowedByAzure`,
     `NotAvailableForSubscription`) ir dėl to, kad Azure nepriima `ed25519` SSH rakto VM (reikia RSA).
   - Antrą kartą subnet jau buvo sukurtas Azure, bet nepateko į state (trumpalaikis 404):
     `terraform import`, tada `apply` baigėsi be klaidų.
6. ✅ k3s per cloud-init, `Ready`, kubeconfig VM viduje (`/home/azureuser/k3s.yaml`, 0640).
7. ✅ Argo CD v3.5.7 Azure k3s (server-side apply), **atskiras** read-only deploy key
   (`argocd-azure-readonly`), repo Secret `repo-etalonas`, db-secret `prod` namespace'e
   (slaptažodis generuojamas, nerodomas), `application-azure.yaml`.
8. ✅ Pirmas sync **be prune**, `etalonas-api` ir `etalonas-postgres-0` Running, Service LoadBalancer
   (k3s servicelb) per 80 portą. `GET /health` → `200 {"db":"up","status":"ok"}`.
   Prieiga tik iš `my_ip_cidr` (mūsų IP); pasikeitus IP reikia atnaujinti ir `terraform apply`.
9. ⏳ `etalonas-backup` PVC `Pending`: k3s `local-path` PVC susieja tik tada, kai atsiranda jį
   naudojantis Pod'as (CronJob kas valandą). Tai ne klaida, Application lieka `Progressing`
   iki pirmo paleidimo.
10. 🔜 Ingress + TLS (cert-manager) arba laikinas DNS vardas; viešas HTTPS adresas.
11. ✅ Paprastas puslapis su mygtukais veikia abiejose aplinkose (žr. 11.7). 🔜 Frontend per GitHub Pages: neskubame; reikia HTTPS (Ingress + TLS), CORS ir API adreso nustatymo; pasirenkama tema (pvz. 28.3).
12. ✅ Terraform perkeltas į `azure/terraform/` (state, `terraform.tfvars` ir `.terraform/` nukopijuoti `cp`, ne Git'e;
    atsarginė kopija už repo ribų). `terraform plan -lock=false` rodė vieną drift: `vm_agent_platform_updates_enabled`
    `true → false` (Azure įjungė pats). Į `main.tf` pridėta `vm_agent_platform_updates_enabled = true`, ir `plan`
    rodo „No changes“. `apply` nereikėjo.
13. ✅ Senas `terraform/azure/` kodas Git'e pašalintas (PR #6); diske liko vietinis state/tfvars (ignoruojami),
    kol viskas patvirtinta.

### 11.4 Programos patikra: lokaliai ir Azure (identiška)

Tas pats testas abiejose vietose (lokaliai `dev` namespace, kad nepaliesti `prod` duomenų):

| Užklausa | Lokaliai | Azure |
|---|---|---|
| GET /health | 200, `db: up` | 200, `db: up` |
| POST /notes (2 įrašai) | 201, id 1 ir 2 | 201, id 1 ir 2 |
| POST /notes be teksto | 400 | 400 |
| GET /notes | 200, 2 įrašai | 200, 2 įrašai |
| `SELECT count(*) FROM notes` | 2 | 2 |

Išvada: programa su DB elgiasi vienodai, todėl Azure testas patikrina **infrastruktūrą**, o ne programos
logiką. Azure testiniai įrašai ištrinti (`DELETE … WHERE id IN (1,2)`, tik su leidimu), `count = 0`.

### 11.5 Sinchronizacija ir CI: ką svarbu žinoti

- Kiekvienas push į `main` paleidžia CI, o CI GitOps žingsnis **pats pakeičia `main`** (`image.tag`,
  `[skip ci]`). Todėl: `git pull --rebase` prieš kiekvieną push. Nuo PR #7 Application turi `automated` +
  `selfHeal`, todėl po bot'o commit'o Argo pats išdiegia naują vaizdą (rankinio sync nebereikia).
- Prieš sync palaukti, kol CI žalias (kitaip galimas `ImagePullBackOff`, jei vaizdo dar nėra GHCR).
- CI `push` trigeris tik `main`; šakos push CI nepaleidžia. Šakai patikrinti naudoti pull request
  (paleidžia `test`, `trivy`, `secrets`, bet ne `build-push` ir `gitops`).
- `paths-ignore` (README, Terraform, skriptai) neleidžia dokumentų ar infrastruktūros pakeitimams perstatyti vaizdo.
  Neignoruojama: `helm/**`, `app/**`, `local/values-local.yaml`, `azure/values-azure.yaml`, `ci.yml`.

### 11.6 Struktūra: `local/` ir `azure/`

Bendra dalis lieka šaknyje (`app/`, `helm/`, `.github/`, `docs/`), nes **tas pats vaizdas diegiamas
abiem aplinkoms**. Kiekviena versija turi savo aplanką su README, Argo Application, values ir skriptais.

- `local/`: `argocd/application.yaml`, `values-local.yaml` (= `values-prod.yaml` kopija), `scripts/{up,test,down}.sh`.
- `azure/`: `argocd/application-azure.yaml`, `values-azure.yaml`, `terraform/`, `scripts/{preflight,test,start,deallocate}.sh`.
- Argo `valueFiles` keliai skaičiuojami nuo `source.path` (`helm/miniplatforma`), todėl rodo
  `../../local/values-local.yaml` ir `../../azure/values-azure.yaml` (lieka repozitorijos viduje).
- Perkėlimo tvarka (kad klasteriai nesugestų): 1) kopijos naujoje vietoje, senų nešalinti;
  2) `helm template` senas vs naujas (turi būti identiški); 3) PR → CI žalias → merge į `main`;
  4) `kubectl apply` atnaujintų Application, **pirma lokaliam**, tada Azure (prieš tai `argocd app diff`);
  5) tik tada šalinti senus failus atskiru commit'u; 6) Terraform state `cp` (ne `mv`), `terraform plan -lock=false`
  turi rodyti „No changes“.
- Valymas (PR #6): pašalinti `argocd/`, `helm/.../values-azure.yaml`, `values-prod.yaml` (CI dabar naudoja
  `local/values-local.yaml`), `scripts/k8s-bootstrap.sh`, `terraform/azure/` kodas; kainos ir kvotos dalis
  perkelta į `azure/terraform/README.md`. `up.sh` antraštė sutvarkyta; perrašyti ir išbandyti pažymėta `todo.md`.
- Didesnio šaknies perkėlimo (compose, nginx, monitoring, ansible į `local/`) **nedarome**, nes keistųsi Compose
  projekto vardas (nauji tušti volume'ai), reikėtų perkelti ranka `.env`, `vault-pass.txt`, `.terraform/`.
  Vietoj to šaknies README yra žemėlapis.
- `STATUSAS: neišbandyta` eilutė README ir skriptų viršuje pašalinama, kai juos išbandome. 2026-11-07 išbandyta ir pažymėta: `preflight.sh`, `local/test.sh`, `azure/test.sh`, `myip.sh`. Dar „neišbandyta“ (tik peržiūrėta): `up.sh`, `down.sh`, `start.sh`, `deallocate.sh`.

Pastaba: Argo CD **pats traukia** iš Git, todėl CI Azure prisijungimo nereikia. Azure OIDC (33.2)
reikės tik tada, kai CI valdys pačią Azure infrastruktūrą per Terraform.

### 11.7 Puslapis su mygtukais ir šios dienos pakeitimai (2026-11-07)

**Puslapis (Flask, tas pats vaizdas abiem aplinkoms):**
- `GET /` atiduoda statinį HTML (`app/static/index.html`): ženkliukas **LOCAL** (žalias) arba **AZURE** (mėlynas),
  mygtukas „Patikrinti“ (DB būsena), forma „Pridėti pastabą“ (1–500 simbolių), sąrašas „Pastabos“ + „Atnaujinti“,
  apačioje versija (`sha-…`) ir Pod'o vardas.
- `GET /api/info` grąžina `{env, version, hostname}` iš `APP_ENV` ir `APP_VERSION` (Helm values). `/health` ir `/notes` nepakeisti.
- Saugumas: CSP (`default-src 'none'`, tik `connect-src 'self'`), tekstas rodomas per `textContent`;
  įrašas `<script>alert(1)</script>` rodomas kaip paprastas tekstas (XSS nevykdomas). Konteineris UID 10001. 8 testai.
- Aplinkos nepriklausomos: LOCAL ir AZURE turi **atskiras** duomenų bazes (skirtingas pastabų skaičius yra normalu).

**Pull request'ai (kiekvienas per šaką, CI žalias prieš merge):**

| PR | Ką darė |
|---|---|
| #1 | struktūra `local/` ir `azure/`; Gitleaks PR žingsniui pridėtas `pull-requests: read` |
| #2 | puslapis su mygtukais |
| #3 | UI supaprastinimas (ženklelis, DB žymė, forma, sąrašas) |
| #4 | skriptų išbandymas, `azure/scripts/myip.sh`, statusai |
| #5 | `.DS_Store` pašalintas iš Git, įrašytas į `.gitignore` |
| #6 | senų dublikatų valymas, CI į `local/values-local.yaml`, `vm_agent_platform_updates_enabled` |
| #7 | `automated` + `selfHeal` (prune išjungtas) abiem Application |
| #8 | `todo.md` atnaujinimas |

**Sinchronizacija:**
- Lokaliai ir Azure veikė `sha-a05f4de`, vėliau atnaujinta iki `sha-20e5ed8`; abu `Synced` ir `Healthy`, Postgres neperkurtas (0 restart'ų),
  `/api/info` rodo `env=local` ir `env=azure`.
- Azure Application vadinasi **`etalonas-azure`** (ne `etalonas-prod-azure`); Azure naudoja 1 API kopiją (`azure/values-azure.yaml`), lokaliai 2.
  Rollout metu pirmas `/health` gali grąžinti vieną `000`; po rollout visi 200.
- `.DS_Store` buvo netyčia pakliuvęs į commit'ą `5b8f0f1`; jis pakeitė `app/`, todėl CI sukūrė naują vaizdą (kodas tas pats).
  Klasteriai dėl to rodo `OutOfSync`, bet nieko nesugenda; sinchronizuojama kitą kartą (ar automatiškai po `selfHeal`).

**Skriptai:** `myip.sh` tik atspausdina dvi `az network nsg rule update` komandas (SSH ir HTTP/HTTPS taisyklės), nieko nevykdo;
primena atnaujinti `my_ip_cidr` Terraform. `local/scripts/up.sh` aprašytas kaip „kind + ingress-nginx + cert-manager“, bet mūsų
lokalus klasteris yra Docker Desktop su jau sukonfigūruotu Argo CD, todėl `up.sh` reikia perrašyti arba pašalinti (valymo žingsnyje).

**Prieiga:** Azure puslapis pasiekiamas tik iš `my_ip_cidr` (NSG); pasikeitus IP reikia `myip.sh` komandų. Naršyklėje rodo „Not Secure“,
nes adresas `http://`; išsprendžia Ingress + TLS.

## 12. Stebėjimas (26.3 paskaitai)

1. 🔜 Grafana su node_exporter skydeliu kaip JSON provisioning.

---

## Dažnos klaidos

| Klaida | Priežastis | Sprendimas |
|---|---|---|
| `divergent branches` | CI GitOps commit'as `main` šakoje | `git pull --rebase` prieš push |
| `Permission denied (publickey)` | deploy key nepridėtas / pridėtas ne ten | Settings → Deploy keys tos pačios repozitorijos; palyginti SHA256 |
| Raktas neveikia po įklijavimo | įklijuotas per kelias eilutes | viena eilutė, `pbcopy < argocd_deploy.pub` |
| Deploy key „Read/write“ | pažymėtas „Allow write access“ | ištrinti ir pridėti iš naujo be varnelės |
| HTTP 403 traukiant atvaizdą | GHCR paketas privatus | paketas → Change visibility → Public (arba `imagePullSecret`) |
| `ImagePullBackOff`, `short read … unexpected EOF` | atvaizdas tik `amd64`, mazgas `arm64` | multi-arch build (`platforms: linux/amd64,linux/arm64`) |
| CI paleidžia save be galo | GitOps commit be `[skip ci]` | visada `[skip ci]` |
| `brew install` be teisių | `/opt/homebrew` neįrašomas | binarą į `~/.local/bin` su sha256 patikra arba virtualenv |
| „Looks like you already have an Azure account“ | bandomasis laikotarpis tik vienam klientui | naudoti esamą prenumeratą / mokyklos prenumeratą |
| „We couldn't load your credit info“ | pranešimas rodomas ir kreditų prenumeratai | ne klaida; kreditų likutį žiūrėti portalo pradžioje / Credits skiltyje |
| „Forecast unavailable … offer type“ | prenumeratos tipas nepalaiko prognozės | ne mokėjimas; biudžeto perspėjimus naudoti pagal Actual |
| `AADSTS90135 … user decided not to continue` | `az login` patvirtinimas atšauktas | pakartoti `az login --use-device-code`, spausti Continue |
| Azure auto-shutdown „neįjungia“ ryte | schedule tik išjungia | `az vm start` |
| `NotAvailableForSubscription` (Terraform / `az vm create`) | VM dydis apribotas prenumeratoje | kitas B serijos dydis arba regionas; prieš tai `azure-preflight.sh` |
| `RequestDisallowedByAzure … not accepting new customers` | regionas nepriima naujų klientų | kitas regionas (čia `swedencentral`) |
| „ssh-ed25519 SSH key is not supported“ (Azure VM) | VM priima tik RSA | RSA 4096 VM prisijungimui; `ed25519` GitHub deploy key tinka |
| Terraform: subnet sukurtas Azure, bet ne state (404) | trumpalaikis atsakymas kūrimo metu | `terraform import`, tada `apply` |
| PVC `Pending` k3s (`etalonas-backup`) | `local-path` susieja tik atsiradus Pod'ui | palaukti CronJob arba paleisti ranka; ne klaida |
| Abu Application `OutOfSync` po kiekvieno push | CI keičia `image.tag` Git'e | palaukti žalio CI, `git pull --rebase`, sync be prune |
| Šakos push, bet CI nepasileido | `push` trigeris tik `main` | atidaryti pull request |
| `kubectl apply` ne tame klasteryje | neteisingas kontekstas | prieš apply: `kubectl config current-context` (docker-desktop ar Azure) |
| Portale „Credits will expire soon“ / `Costs: 0` | bendras pranešimas; kainos rodomos su vėlavimu | ne klaida; Cost analysis kitą dieną |
| „We couldn't merge this pull request“ PR puslapyje | GitHub dar skaičiuoja mergeability tik ką sukurtam PR | perkrauti puslapį ir bandyti dar kartą |
| PR patikros pasileido, nors keitėsi tik skriptai | `pull_request` trigeris veikia, `build-push` ir `gitops` praleidžiami (`if`) | normalu; po merge į `main` stebėti Actions |
| `.DS_Store` repozitorijoje | `git add .` be `.gitignore` įrašo | `.DS_Store` į `.gitignore`, `git rm --cached`, PR |
| Azure Application vardas neatitinka prompte | Application vadinasi `etalonas-azure` | `kubectl get applications -n argocd` prieš sync |
| `terraform plan` rodo 1 pakeitimą be mūsų kodo pakeitimo | Azure pats įjungė atributą (`vm_agent_platform_updates_enabled`) | fiksuoti reikšmę `main.tf`, kad `plan` būtų „No changes“; `apply` nereikia |
| `az`: executable file not found (Terraform ar AI sesijoje) | `az` įdiegtas virtualenv (`~/.venvs/az/bin`), ne PATH | `PATH="$HOME/.venvs/az/bin:$PATH" terraform plan -lock=false` |
| Cost analysis: „Something went wrong (Code: NotFound)“ | portalo klaida kreditų prenumeratai arba dar nėra duomenų | pakartoti kitą dieną; resursus tikrinti `az resource list`; kreditai Credits skiltyje |

## Taisyklės, kurių laikomės

- Jokių slaptažodžių, raktų ir kortelės duomenų Git'e ar pokalbiuose.
- Nieko nesinchronizuoti su `prune`, kol nesame tikri dėl diff. `automated` + `selfHeal` įjungti, `prune` lieka `false`.
- Terraform: `plan` prieš kiekvieną `apply`; atsirandantį drift fiksuoti kode.
- Prieš sync, kuris liečia duomenų bazę: atsarginė kopija ir eilučių skaičius.
- `[skip ci]` visiems automatiniams GitOps commit'ams.
- Azure: `apply` ir `destroy` tik su aiškiu leidimu, po darbo `az vm deallocate` ir patikrinti „deallocated“.
- **Pirmiausia lokaliai, tada debesyje**: programos ir DB elgsena tikrinama lokaliai; jei debesyje lūžta, lyginame su lokaliu.
- Nekeisti Argo Application kelių ir nešalinti senų failų tame pačiame commit'e (ComparisonError).
- Prieš `kubectl apply` visada patikrinti kontekstą, prieš sync su DB: atsarginė kopija ir eilučių skaičius.
- Atskiras read-only deploy key kiekvienam klasteriui; Azure VM prisijungimui RSA, GitHub deploy key gali būti ed25519.
- Du AI agentai negali redaguoti to paties repo vienu metu (vienas Claude Code, be Cursor/kitų skydelių).
