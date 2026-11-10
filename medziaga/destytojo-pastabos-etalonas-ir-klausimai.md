# Dėstytojo pastabos: debesis, etalonas, atviri klausimai

Perkelta iš metinio plano (planas dabar tik tvarkaraštis, užduotys ir atsiskaitymai).

## Debesies infrastruktūra: laipsniškai (pakeitimas)

Principas: **debesis anksti, bet bendras; individualus Azure vėliau.** Mokiniai nuo Kubernetes temų turi realų serverį, kuriame projektai veikia viešai, o savo Azure aplinką kuria tik 31–33 savaitėmis. DevOps įrankiai (Git, Docker, Kubernetes, Terraform, Argo CD, GitHub Actions) nepriklauso nuo debesies tiekėjo.

| Laikotarpis | Aplinka | Kas ją valdo | Apytikslė kaina |
|---|---|---|---|
| 10–12 sav. (etapas 1) | lokaliai (VM, Docker, Compose) | mokinys | 0 |
| 13–15 sav. (etapas 2) | lokalus klasteris (kind / Docker Desktop) + **bendras k3s serveris debesyje, namespace kiekvienam mokiniui** | dėstytojas paleidžia; mokiniai deploy'ina per Git | ~vienos VM kaina (8 GB VM, dabar B2s_v2; ~27–47 USD/mėn. pagal B2ms įvertį, kai veikia pagal grafiką; B2s_v2 kainą patikslinti) |
| 17–28 sav. (etapai 3–5) | tas pats bendras k3s: CI/CD, saugumas, stebėjimas, Argo CD; **kiekvienas baigtas etapo projektas gauna viešą adresą** | dėstytojas (infrastruktūra), mokiniai (programos) | ta pati |
| 28–30 sav. | **Azure paruošimo patikra:** prisijungimas, prenumeratos patikra, savo resursų grupė, „Hello“ Terraform | mokiniai | pagal mokyklos sprendimą |
| 31–33 sav. (etapas 6) | **individualus Azure**: VM, VNet, NSG, AKS/ACR, OIDC | mokiniai | žr. „Laiškas mokyklai“ (~120–300 USD visai grupei, riba ~400–450 USD) |
| 34–36 sav. (etapas 7) | savarankiškas projektas ten, kur mokinys pasirenka (bendras k3s arba Azure) | mokinys | pagal pasirinkimą |

Kodėl taip: ankstesnėje versijoje etapų projektai veikė tik lokaliai ir negalėjo būti rodomi kitiems; „kiekvienas savo Azure nuo pirmos dienos“ būtų brangu ir daug administravimo, kol mokiniai dar mokosi pagrindų.

## Etalonas (dėstytojo pavyzdinė platforma): būsena ir panaudojimas

**Būsena (2026-11-07):** lokali grandinė **baigta ir veikia**: commit → GitHub Actions (testai, multi-arch atvaizdas) → GHCR → GitOps žingsnis → Argo CD → Kubernetes (Docker Desktop). Duomenys (PostgreSQL) išlieka, `/health` atsako. Žingsniai ir klaidos: `kursas/Finalinis projektas/etalonas-zingsniai.md`.

**Azure variantas (2026-11-07) taip pat veikia:** Terraform sukūrė VM su k3s (`swedencentral`), Argo CD v3.5.7 ir tas pats vaizdas, `/health` atsako, programos testas (įrašyti, nuskaityti, 400 validacija, DB count) **identiškas lokaliam**. Prieiga tik iš dėstytojo IP; po darbo VM `deallocate` (nekainuoja skaičiavimo, ~4,7 €/mėn. diskas ir IP). Regionas ir dydis parinkti pagal prenumeratos apribojimus (`westeurope` ir `B2ms` buvo uždrausti).

**Repozitorijos struktūra:** bendra dalis (`app/`, `helm/`, `.github/`, `docs/`), `local/` (Docker Desktop, Argo CD) ir `azure/` (Terraform, k3s, Argo CD), šakninis README yra žemėlapis. Dideli perkėlimai (Compose, nginx, monitoring, ansible į `local/`) atidėti po kurso pradžios (keistųsi Compose projekto vardas ir volume'ai).

**Struktūra įdiegta (2026-11-07):** PR #1 (`local/` ir `azure/`, CI `paths-ignore`, README žemėlapis) sujungtas; abu Argo Application perjungti į naujus `valueFiles` kelius (`../../local/values-local.yaml`, `../../azure/values-azure.yaml`), abu Synced, Postgres neperkurtas, vaizdas `sha-5d478a9`.

**Puslapis su mygtukais (Flask):** paruoštas šakoje, PR #2 žalias (3 nauji pytest testai, `helm template` skiriasi tik `APP_ENV`/`APP_VERSION`); po merge ir bot'o commit'o sinchronizuojame lokaliai ir Azure (plokštelė rodo `local` arba `azure`, versiją ir pod'ą).

**Padaryta (2026-11-07):** struktūra `local/` ir `azure/`, puslapis su mygtukais, skriptų išbandymas, `myip.sh`, senų dublikatų valymas ir Terraform state perkėlimas, `automated` + `selfHeal` su drift testu abiejuose klasteriuose (`prune: false`). Etalonas laikomas užbaigtu kurso pradžiai.

**Dar liko (pagal paskaitų datas):** starterio repozitorija iš `app/` iki 2026-11-24 (12.2); Azure sprendimas po kreditų pabaigos (~2026-12-06); Ingress + TLS iki 2026-12-08 (14.2); `create_all` lenktynių sąlygos pataisa; `up.sh` perrašymas; Grafana node_exporter skydelis (26.3); `ci.yml` dubliuotas lint ir Node 20 action'ų atnaujinimas; didesnis šaknies perkėlimas (Compose, nginx, monitoring, ansible į `local/`) po kurso pradžios. Aktualus sąrašas: etalono `todo.md`.

**Kur etalonas naudojamas paskaitose (parodyti → išardyti → sugadinti → perstatyti):**

| Paskaita | Ką rodome iš etalono | Ką mokiniai „išardo“ (tikros klaidos iš statybos) |
|---|---|---|
| 12.2–12.3 | Dockerfile ir Compose su PostgreSQL | trys sugadintos Compose bylos |
| 13.1–13.4 | Kubernetes manifestai, Secret | slaptažodis Git'e → perkelti į Secret |
| 14.3 | Helm chart (`values.yaml`, `imagePullSecrets`) | tas pats chart dev/prod su skirtingomis values |
| 18.1–18.2 | GitHub Actions workflow, GHCR atvaizdas `sha-<commit>` | privatus paketas → HTTP 403; `imagePullSecret` |
| 18.2 | multi-arch build | atvaizdas tik `amd64` Apple Silicon kompiuteryje → `ImagePullBackOff` |
| 18.1–18.2 | PR ir `main` elgiasi skirtingai (`build-push`, `gitops` tik po merge) | Gitleaks PR žingsnis krenta dėl trūkstamos `pull-requests: read` teisės, ne dėl paslapčių; mažiausios teisės |
| 18.2 / 28.3 | CI GitOps commit'as `[skip ci]` po merge | `OutOfSync` po kiekvieno merge; sync tik po bot'o commit'o ir `git pull --rebase` |
| 13.x / 14.4 | `create_all` du gunicorn worker'iai prieš tuščią DB | `UniqueViolation`; Kubernetes paslepia restartu; pataisyti ir paaiškinti lenktynių sąlygą |
| 28.3 | Argo CD, deploy key (tik skaitymas), `[skip ci]` | `kubectl scale` ranka → Argo grąžina (drift); `divergent branches` |
| 26.3 | Grafana skydelis | išjungti `node_exporter`, pamatyti tuščią grafiką |
| 31–33 | tas pats etalonas Azure VM + k3s | rankomis (portalas → CLI) → Terraform → CI/CD |

Etalonas taip pat yra pamoka apie metodą: dėstytojas pats pirmas padarė visą grandinę ir žino, kur mokiniai klups.

### Veikiantis puslapis kaip kiekvienos temos pradžia

Etalonas pradžioje buvo statytas „iš apačios“ (infrastruktūra), todėl mokymuose eilė apsukama: **pirmiausia mokinys mato veikiantį puslapį** (įrašyti pastabą, matyti sąrašą, DB veikia; rodo aplinką, versiją ir pod'ą), ir tik paskui mokosi, kaip jis atsiduria serveryje.

| Paskaita | Pradžios taškas (matomas rezultatas) | Tada mokomės |
|---|---|---|
| 10.1 (2026-11-11) | 5–10 min demonstracija: tas pats puslapis veikia lokaliai ir Azure adresu (du naršyklės langai) | kodėl DevOps, kas slypi po „Deploy“ mygtuku |
| 12.2 | puslapis veikia be Docker (Python + PostgreSQL) | Dockerfile, volume, multi-stage |
| 12.3 | tas pats puslapis per Compose (aplikacija + DB + Nginx) | trys sugadintos Compose bylos |
| 13.1 | puslapis Kubernetes klasteryje (lokaliai ir bendrame k3s) | Pods, Deployments, kaip veikia „Deploy“ grandinė (žr. `13-1-ka-slepe-deploy-mygtukas.md`) |
| 14.3 | puslapis dev ir prod su skirtingomis `values` (APP_ENV rodo aplinką) | Helm |
| 18.x | puslapis atsinaujina po commit'o (pakeičiame tekstą, matome naują versiją) | GitHub Actions, GHCR, `sha-<commit>` |
| 28.3 | `kubectl scale` ranka → Argo grąžina, puslapis rodo skirtingą pod'ą | Argo CD, drift |
| 31–33 | tas pats puslapis Azure, tas pats testas kaip lokaliai | portalas → CLI → Terraform |

Pastaba: puslapis (GET `/`, `/api/info`, mygtukai) paruoštas etalono repozitorijoje (PR #2); į klasterius jis patenka po merge ir sinchronizacijos. Iki 11-11 jis nebūtinas (10.1 galima rodyti per `/health` ir `/notes`), bet jį verta turėti iki 12.2.

### Pull request darbo eiga (kaip mokome)

Etalone ši eiga jau išbandyta tikroje situacijoje, todėl galime rodyti tikrus pavyzdžius.

| Kada | Ką daro mokinys |
|---|---|
| 10.1 | `devops-lab`: pirma šaka, pirmas PR į savo `main`, merge |
| 12.x | kiekvienas pakeitimas (Dockerfile, Compose) per šaką ir PR; dėstytojas peržiūri |
| 17–19 sav. | CI patikros PR'e (testai, Trivy, Gitleaks): raudonas → ištaisyti → žalias; branch protection |
| 28.3 | PR → merge → Argo CD: kas vyksta po merge (OutOfSync, bot'o commit'as, sync) |

Etalono pamokos: PR tik tikrina, `main` publikuoja ir diegia; CI turi mažiausias teises; žurnalą skaitome, o ne išjungiame patikrą; kiekvienas merge į `main` pakeičia `main` (`image.tag`), todėl `git pull --rebase`.

## Atviri klausimai

1. Kas veda 2026-11-09 ir 11-10 programavimo pamokas?
2. Ar 2027-03-11 mokykla dirba (26 sav.)? Jei ne, 26 sav. turės 3 pamokas.
3. Kas veda konsultacijas 05-31 – 06-11?
4. Azure variantas (A: mokyklos prenumerata, B: Azure for Students, C: lokalus / mišrus) – sprendimas iki 2027-04-16. Laiškas administratoriui: `laiskas-mokyklai-azure.md`.
5. **Bendras k3s serveris debesyje nuo 13 sav. (2026-11-30):** kas jį apmoka ir kur jis laikomas (mokyklos prenumerata, dėstytojo prenumerata ar mokyklos aparatūra)? Be jo etapų projektai lieka tik lokalūs. Apytikslė kaina ~27–47 USD/mėn., kai veikia pagal grafiką.
6. Studentų kompiuterių galia – žr. Excel lapą „Klausimai“ (Nr. 8–9).
7. Ar oficialus ISP aprašas reikalauja darbo su debesimi / Azure (nuo to priklauso, ar galimas mišrus variantas)? Patikrinti pas programos vadovą.
8. **Atsiskaitymo 1 data:** šiame plane 2026-11-26 (ketvirtadienis), bet mokyklos tvarkaraštyje raudonai (atsiskaitymas) pažymėta 2026-11-30 (pirmadienis). Jei teisinga 11-30, Kubernetes (13.1) prasideda 12-01 ir 13–14 savaitės pasislenka viena pamoka. Patikslinti prieš keičiant datas.
9. **FINAL lygių vertinimas:** ar lygis lemia pažymį (minimalus = išlaikyta, pažengęs = gerai, profesionalus = puikiai), ar tai tik tikslai? Priklauso nuo mokyklos vertinimo tvarkos; patikslinti prieš 34 sav.
