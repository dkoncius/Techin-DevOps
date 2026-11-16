# DevOps kursas VH-DO: kurso planas (darbinis)

Atnaujinta: 2026-11-15. Dėstytojas: Deividas Koncius. Grupė: VH-DO (DevOps), 30 mokinių. Šis failas yra **vienintelis tiesos šaltinis** kurso struktūrai, datoms ir sprendimams.

## 0. Kaip naudoti šį failą (Claude Code)

1. Prieš kuriant ar keičiant bet kurią pamoką, perskaityk šį failą ir skill'ą `.claude/skills/pamoka-formatas/SKILL.md`.
2. Kiekviena pamoka yra viename aplanke `kursas/<NN> <Pavadinimas>/` su vienu `pamoka.md` (klasės darbas, užduotys, komandos, sprendimas); pavadinimai kaip 5 skyriaus lentelėje, schema 13 skyriuje. Numeracija 01–79, be savaičių kodų.
3. Nekeisk šio failo savo iniciatyva. Jei pamokos darbas rodo, kad planą reikia pakeisti, parašyk pasiūlymą ir paklausk.
4. Datos po 2027-01-01 yra skaičiavimas, ne tvarkaraštis (žr. 3 skyrių). Nerašyk jų į mokinių medžiagą kaip patvirtintų.
5. Nieko netrink, nedaryk `git push` ir `git commit` be aiškaus prašymo. Pavojingų komandų (apply, destroy, delete, prune, kubectl apply, terraform) šiame kompiuteryje nevykdyk, tik aprašyk tekste.
6. Slapti duomenys (raktai, slaptažodžiai, tfstate, kubeconfig, kortelės) niekada į Git ir į atsakymus. Rodyk tik `.pub` raktus.
7. Užduotis studentai gauna per Teams (dėstytojas įkelia po vieną), sprendimą mato kitos pamokos pradžioje, kai jį parodo dėstytojas. Sprendimų ir atsiskaitymų atsakymų studentams iš anksto nerašyk.
8. Senas projektas lieka nepakeistas. Jo medžiaga kopijuota į `medziaga/` (tik skaitymui), iš ten pritaikyk, o ne perrašyk.

## 1. Trumpai

| Dalykas | Reikšmė |
|---|---|
| Paskaitų skaičius | 79, po 3 val. (17:30–20:40) |
| Tvarkaraštis | pirmadienis–ketvirtadienis, 4 per savaitę (pirma savaitė: tik trečiadienis ir ketvirtadienis) |
| Pirma paskaita | 2026-11-11 (trečiadienis) |
| Paskutinė paskaita | 2027-05-27 (orientacinė) |
| Etapai | 7, kiekvienas baigiasi atsiskaitymu |
| Kurso projektas | Python (Flask) web API su MySQL, vienas visą kursą |
| Duomenų bazė | MySQL |
| Git platforma | GitHub; užduotys pateikiamos per Pull Request |
| Repo (pavadinimai pasiūlyti) | `devops-projektas` (GitHub template, mokinio darbo projektas), `Techin DevOps` (privatus, visas dėstytojo darbas) |
| Užduotys ir sprendimai | užduotys per Teams po vieną, sprendimas kitos pamokos pradžioje (13 skyrius); savitikros nėra |
| Konteineriai ir Kubernetes | lokaliai iki Azure etapo; Azure tik 6–7 etapuose |
| Pamokos formatas | `pamoka.md`, `uzduotys.md`, `sprendimai/` pagal skill'ą `pamoka-formatas` |

## 2. Priimti sprendimai

1. Naudojamas **naujas 79 paskaitų planas** (2026-11-07): Linux ir Git, Docker, GitHub Actions, Kubernetes, Kubernetes praktikoje, Azure, pilnas pipeline ir baigiamasis projektas.
2. Senas ISP planas (IS platformos, serverių komponentai, RAID/NAS/SAN/UPS, virtualizavimas, VM šablonai, LXC) **nenaudojamas**, nes mokiniams svarbiau realių DevOps įgūdžių seka. Medžiaga archyvuojama, o ne trinama.
3. Nepasirinktos temos **gilesnis saugumas, monitoringas ir Terraform** sprendžiamos vėliau, pagal tai, kaip seksis (žr. 8 skyrių). Pagrindai jau yra plane.
4. Duomenų bazė **MySQL**. Mokiniai SQL mokosi tik vasario DB modulyje, todėl Docker ir Compose užduotyse MySQL tik paleidžiama ir prižiūrima, o schemą ir pradinius duomenis duoda pradinis repo.
5. Pamokų aplankai `NN Pavadinimas`, 01–79. Kiekviena pamoka: `pamoka.md`, `uzduotys.md`, `sprendimai/` (README ir tikri rezultatai). Atsiskaitymo pamoka: `praktika.md`, `vertinimas.md`, `testas.md`, `sprendimai/`.
6. Dėstytojas kasdienių užduočių netikrina. Pamokos pradžioje parodo sprendimą gyvai, mokiniai daro užduotis. Praeitos pamokos sprendimas įkeliamas į viešą repo kitos pamokos pradžioje. Tikrinama tik atsiskaitymuose.
7. Pirmose paskaitose užduotis pateikti per GitHub Pull Request, todėl 01 paskaitoje reikia ~20 min. GitHub paskyros ir paprasčiausio PR įvado (naudoti seną 10.1).
8. Šabloną `devops-projektas` mokiniai susikuria 05 pamokoje. 02–04 tęsia `git-bandymas`. Užduotis gauna per Teams.
9. Kiekvienos pamokos pabaigos projekto būsena yra kitos pamokos pradžia. Sprendimą dėstytojas parodo kitos pamokos pradžioje.
10. Atsiskaitymų atsakymai studentams nepateikiami.
11. Naujos pamokos kuriamos naujame projekte. Seno projekto veikiantys pavyzdžiai (Docker, Compose, Actions, Kubernetes, Terraform, Azure) kopijuojami į `medziaga/` ir pritaikomi, o ne perrašomi.
12. Užduotys parodo, ar mokiniai išmoko tai, ką dėstė Edgaras (Git, Bash, Python kodo skaitymas), o vėliau ir MySQL kodo skaitymą. Atskiro įvadinio testo tam nereikia.
13. **2026-11-15, eiga iki Actions.** 01–04 jau išmoko šaką, `merge` ir Pull Request, todėl atskiros 07 Git ir 08 PR paskaitos nebedėstomos. SSH neprieš Docker: raktas dėstomas 56 pamokos pradžioje, prieš Azure portalą. `main` apsauga dėstoma tada, kai yra CI (17), ne prieš tai. Iki 1 atsiskaitymo (data nejuda): 05 paleidžia projektą vietoje, 06 yra viena 3 val. Docker pamoka: pradžioje trumpas palyginimas, likęs laikas `run`, `ps`, `logs`, `exec`, `stop`. 07 yra kita 3 val. pamoka, image ir registrai. 08 yra 3 val. repeticija. Atskira „kodėl konteineriai“ paskaita nėra. Gruodį Docker sutrumpėja (volume ir tinklas įeina į Compose). Po Dockerfile, 15–18, prasideda Actions (workflow, testai per PR, apsauga, `docker build` be registro). 19 yra Docker kartojimas, 20 atsiskaitymas lieka Docker. Sausį Actions tęsiasi nuo image į registrą, ne nuo „kas yra workflow“. Datos 2026-11-30 ir 2026-12-17 patvirtintos ir nejuda. Aplankai `kursas/02`–`09` perrašyti 2026-11-15. Senos SSH, Git ir PR pamokos yra `medziaga/atideta/`. Nuo 10 pamokos aplankų pavadinimai diske dar seni.
14. **2026-11-15, išpūstos pamokos.** Trys sausio Actions praktikos sujungtos į vieną (28), atsiskaitymas 3 yra 29 pamoka (2027-01-18, data orientacinė). Kubernetes prasideda 30 pamoka. Po 5 etapo atsiskaitymo, kai lokalus klasteris jau veikia, eina TLS ir gilesnė stebėsena (54–55). Kai pipeline iki AKS jau sudėtas, 74–75 yra Terraform moduliai ir Ansible. GitOps ir pipeline skenavimas telpa į vieną pamoką (73). Python ir MySQL pagrindai dėstomi kitų mokytojų, čia tik kodo skaitymas ir taisymas. DI nuo 13 pamokos: paprašyti, paleisti, pataisyti vieną dalyką pačiam.

## 3. Kalendorius ir pertraukos

| Laikotarpis | Kas | Šaltinis |
|---|---|---|
| 2026-11-11 – 11-12 | pirma savaitė: paskaitos tik trečiadienį ir ketvirtadienį | tvarkaraštis |
| 2026-11-25 | IT konferencija, paskaitos nėra | tvarkaraštis |
| 2026-11-30 | **1 atsiskaitymas** | tvarkaraštis (patvirtinta) |
| 2026-12-17 | **2 atsiskaitymas** | tvarkaraštis (patvirtinta) |
| 2026-12-21 – 2027-01-03 | žiemos atostogos | tvarkaraštis |
| 2027-02-01 – 02-19 | duomenų bazių modulis (Jaroslav Grablevski, 60 val., MySQL) | Teams pranešimas 2026-10-29 |
| 2027-03-11 | valstybinė šventė, paskaitos nėra | prielaida |
| 2027-03-29 – 04-02 | pavasario atostogos | Excel planas, nepatikrinta |
| 2027-04-05 – 04-16 | kitas mokytojas (STVA skyrius) | Excel planas, nepatikrinta |
| 2027-05-31 – 06-25 | konsultacijos ir egzaminai | Excel planas, nepatikrinta |

Datos po 2027-01-01 skaičiuotos: pirmadienis–ketvirtadienis, be aukščiau išvardytų dienų. Jei pavasario atostogų ir STVA savaičių tvarkaraštyje nėra, atsiranda ~12 laisvų paskaitų (4 pavasario atostogų ir 8 STVA savaičių).

Mokyklos tvarkaraštis (Justina Balsė, 2026-10-26) žinomas tik iki 2027-01-01. Pagal jį dalykai: Operacinės sistemos (Edgaras), ISP priežiūra ir administravimas (Deividas), Python (Karolina).

## 4. Etapai

| Etapas | Tema | Paskaitos | Datos | Atsiskaitymas |
|---|---|---|---|---|
| 1 etapas | Linux, Bash, projekto paleidimas | 01–09 (9) | 2026-11-11 – 2026-11-30 | 2026-11-30 |
| 2 etapas | Docker, tada pirmas workflow | 06–07 ir 10–20 | 2026-11-23 – 2026-12-17 | 2026-12-17 |
| 3 etapas | GitHub Actions (tęsinys) | 21–29 (9) | 2027-01-04 – 2027-01-18 | 2027-01-18 |
| 4 etapas | Kubernetes pagrindai | 30–42 (13) | 2027-01-19 – 2027-03-02 | 2027-03-02 |
| 5 etapas | Kubernetes praktikoje, tada TLS ir stebėsena | 43–55 (13) | 2027-03-03 – 2027-03-25 | 2027-03-23 |
| 6 etapas | Azure | 56–67 (12) | 2027-04-19 – 2027-05-06 | 2027-05-06 |
| 7 etapas | Pipeline, papildomos temos, baigiamasis | 68–79 (12) | 2027-05-10 – 2027-05-27 | 2027-05-27 |

4 etapas prasideda 30 pamoka (2027-01-19). 30–36 yra iki DB modulio, 37 yra kartojimas ir namespace po jo. Atsiskaitymas yra 42 pamoka (2027-03-02).

Tikslai:

1 etapas. Linux, Bash, projekto paleidimas: terminalas, skriptas, kuris paleidžia projektą, ir jau turimas Pull Request. Atskiras Git kartojimas nedėstomas.
2 etapas. Docker: projektas su duomenų baze paleidžiamas viena komanda. Pradžia 11-23, atsiskaitymas 12-17.
3 etapas. GitHub Actions: pirmas workflow ir testai per PR dar gruodį (15–18). Sausį image keliamas į registrą. Trys praktikos sujungtos į 28 pamoką. Atsiskaitymas 29 pamoka.
4 etapas. Kubernetes pagrindai: Projektas veikia lokaliame klasteryje (kind arba minikube) ir pasiekiamas iš naršyklės.
5 etapas. Kubernetes praktikoje: projektas supakuotas kaip Helm chart. Po atsiskaitymo, kai klasteris jau veikia, TLS ir gilesnė stebėsena.
6 etapas. Azure: Visa infrastruktūra aprašyta kodu ir sukuriama bei ištrinama viena komanda, kad kreditai būtų naudojami tik pamokų metu.
7 etapas. Pipeline iki AKS, tada Terraform moduliai ir Ansible, tada baigiamasis projektas. GitOps ir skenavimas yra viena pamoka.

## 5. Paskaitų lentelė (79)

Datos nuo 2027-01-01 orientacinės. Stulpelis „Aplankas“ yra aplankas `kursas/<aplankas>/`. 01–09 medžiaga parašyta 2026-11-15. 02 pamoka pagal datą jau turėjo būti, bet dar neįvyko. Nuo 10 pamokos aplankai diske dar senu pavadinimu.

| Nr | Data | Aplankas | Tema | Būsena |
|---|---|---|---|---|
| 01 | 2026-11-11 | 01 Kas yra DevOps | Kas yra DevOps ir Git nuo nulio aplanke `git-bandymas`. | dėstyta |
| 02 | 2026-11-16 | 02 Linux terminalas | 02 ir 03 sujungtos. Pasitikrinimas to, ką išlaikė pas Edgarą, tada skriptas, `export`, `brew`/`apt`, pirmas Pull Request. 2026-11-11 pamoka neįvyko. | parašyta, pamoka dar neįvyko |
| 03 | 2026-11-17 | 03 Bash skriptai | Argumentai, `if`, `for`, išėjimo kodai, `.gitignore`, `git restore`. Tas pats `git-bandymas`. | parašyta |
| 04 | 2026-11-18 | 04 Tinklų pagrindai | IP, portai, DNS, HTTP, `curl`. Serveris `python3 -m http.server`. Flask dar nėra. | parašyta |
| 05 | 2026-11-19 | 05 Projekto paleidimas lokaliai | Šablonas `devops-projektas`, `./run.sh`, `/health`, `.env`, `paleisti.sh`. Trumpai randa `/health` faile `app.py`. SQL nėra. | parašyta |
| 06 | 2026-11-23 | 06 Docker pradžia | 3 val. Pradžioje „pas mane veikia“ ir VM prieš konteinerį. Toliau `run`, `ps`, `logs`, `exec`, `stop`. | parašyta |
| 07 | 2026-11-24 | 07 Image ir registrai | Tag'as, sluoksniai, dydis. `docker login` su access token, ne slaptažodžiu. | parašyta |
| 08 | 2026-11-26 | 08 Pasiruošimas atsiskaitymui 1 | `paleisti.sh`, šablono repo, bent 3 sulieti PR aplanke `git-bandymas`. Naujos temos nėra. 11-25 paskaitos nėra. | parašyta |
| 09 | 2026-11-30 | 09 Atsiskaitymas 1 | Linux, Git, Bash, tinklai ir `paleisti.sh`. Trys PR yra `git-bandymas`. Docker nevertinamas. | parašyta: testas, praktika, vertinimas |
| 10 | 2026-12-01 | 10 Pirmasis Dockerfile | Dockerfile projektui. | yra pagrindas iš senos 12.2; PostgreSQL pakeisti į MySQL |
| 11 | 2026-12-02 | 11 Mažesnis image | cache, `.dockerignore`, multi-stage. | perkelta iš buvusios 15 |
| 12 | 2026-12-03 | 12 Docker Compose | app + MySQL, volume ir tinklas šioje pamokoje. SQL nerašomas: DB modulis dar nepraėjęs. | yra pagrindas iš senos 12.3; PostgreSQL pakeisti į MySQL |
| 13 | 2026-12-07 | 13 Docker saugumas | ne-root vartotojas, image skenavimas (pvz. Trivy). | perkelta iš buvusios 19 |
| 14 | 2026-12-08 | 14 Sulaužyk ir pataisyk Docker | Sugedę Dockerfile ir compose failai. | gali naudoti sugadintas/ iš senos 12.3 |
| 15 | 2026-12-09 | 15 Pirmas workflow | `on`, `jobs`, `steps`. Pirmas Actions, dar be registro. | perkelta iš buvusios 22 |
| 16 | 2026-12-10 | 16 Testai per PR | `pytest` kiekviename Pull Request. | perkelta iš buvusios 24 |
| 17 | 2026-12-14 | 17 Branch apsauga | PR nesijungia, jei CI raudonas. | perkelta iš buvusios 25; čia, ne prieš CI |
| 18 | 2026-12-15 | 18 Image build workflow | Workflow paleidžia `docker build`. Į registrą dar nekelia. | reikia sukurti |
| 19 | 2026-12-16 | 19 Docker kartojimas | `compose up`, image dydis, ne root. Actions tęsinys po atsiskaitymo. | reikia sukurti |
| 20 | 2026-12-17 | 20 Atsiskaitymas 2 | Atsiskaitymas: `docker compose up`, image mažesnis už ribą, veikia be root. | yra pagrindas iš senos 12.4; data patvirtinta |
| 21 | 2027-01-04 | 21 Runner ir Marketplace | Runner'iai, actions iš Marketplace, YAML. Workflow idėja jau buvo 15. | reikia sukurti |
| 22 | 2027-01-05 | 22 Docker image į GHCR | Build ir push į GitHub Container Registry. | perkelta iš buvusios 27 |
| 23 | 2027-01-06 | 23 Secrets ir environments | Secrets, aplinkos, tokenų teisės. | perkelta iš buvusios 26 |
| 24 | 2027-01-07 | 24 Cache, matrix ir artefaktai | Cache, matrix, artefaktai. | perkelta iš buvusios 28 |
| 25 | 2027-01-11 | 25 Image tag ir release | Tag pagal commit SHA ir versiją, release. | perkelta iš buvusios 29 |
| 26 | 2027-01-12 | 26 Pakartotiniai workflow | Pakartotinai naudojami workflow ir composite actions. | perkelta iš buvusios 30 |
| 27 | 2027-01-13 | 27 Sulaužyk ir pataisyk Actions | Neveikiantys workflow, log'ai, teisės. | perkelta iš buvusios 31 |
| 28 | 2027-01-14 | 28 Actions praktika | Viena praktika nuo PR testo iki image. Sujungtos buvusios trys praktikos. | reikia sukurti |
| 29 | 2027-01-18 | 29 Atsiskaitymas 3 | Atsiskaitymas: pipeline, kuris PR'e paleidžia testus, o main šakoje sukuria ir išsaugo image. | reikia sukurti: testas.md, praktika.md, vertinimas.md |
| 30 | 2027-01-19 | 30 Kubernetes architektūra | Kam reikia orkestravimo, Kubernetes architektūra. | reikia sukurti |
| 31 | 2027-01-20 | 31 Lokalus klasteris ir kubectl | Lokalaus klasterio paruošimas, kubectl pagrindai. | reikia sukurti |
| 32 | 2027-01-21 | 32 Pod | Pod'ai: paleidimas, log'ai, exec, describe. | reikia sukurti |
| 33 | 2027-01-25 | 33 YAML ir kubectl apply | Deklaratyvus YAML ir kubectl apply. | reikia sukurti |
| 34 | 2027-01-26 | 34 Deployment ir rollback | Deployment ir ReplicaSet, rolling update ir rollback. | reikia sukurti |
| 35 | 2027-01-27 | 35 Service | Service: ClusterIP, NodePort, LoadBalancer. Iki DB modulio. | reikia sukurti |
| 36 | 2027-01-28 | 36 ConfigMap ir Secret | ConfigMap ir Secret. | reikia sukurti |
| 37 | 2027-02-22 | 37 Kartojimas ir namespace | Po DB modulio: kartojimas ir namespace bei labels. | reikia sukurti |
| 38 | 2027-02-23 | 38 Probe | Liveness ir readiness probe'ai. | reikia sukurti |
| 39 | 2027-02-24 | 39 Ingress | Ingress: prieiga per HTTP maršrutus. | reikia sukurti |
| 40 | 2027-02-25 | 40 Requests ir limits | Resource requests ir limits. | reikia sukurti |
| 41 | 2027-03-01 | 41 Sulaužyk ir pataisyk Kubernetes | CrashLoopBackOff, ImagePullBackOff, neveikiantis Service. | reikia sukurti |
| 42 | 2027-03-02 | 42 Atsiskaitymas 4 | Projektas ir DB veikia klasteryje su Ingress, probe'ais ir ConfigMap/Secret. | reikia sukurti: testas.md, praktika.md, vertinimas.md |
| 43 | 2027-03-03 | 43 PV, PVC ir StorageClass | Duomenų saugojimas: PersistentVolume, PVC, StorageClass. | reikia sukurti |
| 44 | 2027-03-04 | 44 StatefulSet duomenų bazei | StatefulSet duomenų bazei. Pradžioje trumpas SQL prisiminimas: perskaito `schema.sql`. DB modulis jau būna pasibaigęs. | reikia sukurti |
| 45 | 2027-03-08 | 45 Jobs ir CronJobs | Jobs ir CronJobs (pvz., DB atsarginė kopija). | reikia sukurti |
| 46 | 2027-03-09 | 46 Helm pagrindai | Helm: kas tai, esamų chart'ų naudojimas. | reikia sukurti |
| 47 | 2027-03-10 | 47 Savo Helm chart | Savo Helm chart'as projektui. | reikia sukurti |
| 48 | 2027-03-15 | 48 Helm values aplinkoms | Helm values skirtingoms aplinkoms (dev, prod). | reikia sukurti |
| 49 | 2027-03-16 | 49 HPA ir apkrovos testas | Horizontal Pod Autoscaler ir apkrovos testas. | reikia sukurti |
| 50 | 2027-03-17 | 50 Prometheus ir Grafana | Stebėsena: Prometheus ir Grafana, be PromQL gylio. | reikia sukurti |
| 51 | 2027-03-18 | 51 Log ir trikčių paieška | Log'ų rinkimas ir trikčių paieška. | reikia sukurti |
| 52 | 2027-03-22 | 52 RBAC ir NetworkPolicy | Saugumas: RBAC, ServiceAccount, NetworkPolicy. | reikia sukurti |
| 53 | 2027-03-23 | 53 Atsiskaitymas 5 | Helm diegimas ir 3 klaidų taisymas klasteryje. | reikia sukurti: testas.md, praktika.md, vertinimas.md |
| 54 | 2027-03-24 | 54 TLS ir sertifikatai | TLS ant jau veikiančio Ingress. Papildoma tema, ne 5 atsiskaitymo dalis. | reikia sukurti |
| 55 | 2027-03-25 | 55 Stebėsena plačiau | PromQL, Alertmanager, Loki. Papildoma tema, klasteris jau stovi. | reikia sukurti |
| 56 | 2027-04-19 | 56 Debesų pagrindai ir Azure | Pradžioje SSH raktas (perkelta iš buvusios 06), tada portalas, subscription ir resource group. | reikia sukurti |
| 57 | 2027-04-20 | 57 Azure CLI ir kaštai | Azure CLI, kaštų kontrolė: budget alert'ai, resursų trynimas po pamokos. | reikia sukurti |
| 58 | 2027-04-21 | 58 Entra ID ir RBAC | Microsoft Entra ID, RBAC ir service principal'ai. | reikia sukurti |
| 59 | 2027-04-22 | 59 ACR | Azure Container Registry (ACR). | reikia sukurti |
| 60 | 2027-04-26 | 60 Container Apps ir App Service | Azure Container Apps ar App Service: paprastesnis deploy prieš AKS. | reikia sukurti |
| 61 | 2027-04-27 | 61 AKS ir ACR | AKS klasterio sukūrimas ir prijungimas prie ACR. | reikia sukurti |
| 62 | 2027-04-28 | 62 Helm į AKS | Projekto Helm chart'o įdiegimas į AKS. | reikia sukurti |
| 63 | 2027-04-29 | 63 Valdomos paslaugos | Valdomos paslaugos: Azure Database for MySQL, Key Vault. | reikia sukurti |
| 64 | 2027-05-03 | 64 Bicep ir Terraform | Infrastruktūra kodu: Bicep arba Terraform pagrindai. | reikia sukurti |
| 65 | 2027-05-04 | 65 AKS ir ACR kodu | AKS ir ACR aprašymas kodu. | reikia sukurti |
| 66 | 2027-05-05 | 66 Azure Monitor | Azure Monitor ir Log Analytics. | reikia sukurti |
| 67 | 2027-05-06 | 67 Atsiskaitymas 6 | Atsiskaitymas: infrastruktūra sukuriama iš kodo, projektas veikia AKS, po atsiskaitymo resursai ištrinami. | reikia sukurti: testas.md, praktika.md, vertinimas.md, sprendimai/ |
| 68 | 2027-05-10 | 68 CD į Azure per OIDC | CD į Azure: GitHub Actions prisijungimas per OIDC (federated credentials), be slaptažodžių. | reikia sukurti |
| 69 | 2027-05-11 | 69 Pilnas pipeline | Pilnas pipeline: test → build → push į ACR → helm upgrade į AKS. | reikia sukurti |
| 70 | 2027-05-12 | 70 Aplinkos ir approve | Aplinkos ir patvirtinimai: staging ir production, rankinis approve. | reikia sukurti |
| 71 | 2027-05-13 | 71 Deploy strategijos | Deploy strategijos: rolling, blue-green, canary, rollback. | reikia sukurti |
| 72 | 2027-05-17 | 72 Infrastruktūros pipeline | Infrastruktūros pipeline: Bicep/Terraform per Actions. | reikia sukurti |
| 73 | 2027-05-18 | 73 GitOps ir skenavimas | GitOps apžvalga ir skenavimas pipeline'e. Viena pamoka, ne dvi. | reikia sukurti |
| 74 | 2027-05-19 | 74 Terraform moduliai ir state | Moduliai ir state. Pagrindai jau buvo 64–65, pipeline jau yra. | reikia sukurti |
| 75 | 2027-05-20 | 75 Ansible | Ansible jau turimam serveriui. Papildoma tema prieš projektą. | reikia sukurti |
| 76 | 2027-05-24 | 76 Incidentų imitacija | Kažkas sulūžta. Prisiminus Python ir SQL, pataiso vieną eilutę `app.py` arba užklausoje. | reikia sukurti |
| 77 | 2027-05-25 | 77 Baigiamasis projektas 1 | Baigiamojo projekto darbas. | reikia sukurti |
| 78 | 2027-05-26 | 78 Baigiamasis projektas 2 | Baigiamojo projekto darbas, konsultacijos. | reikia sukurti |
| 79 | 2027-05-27 | 79 Baigiamojo projekto gynimas | Atsiskaitymas: baigiamojo projekto gynimas, 10–15 min. kiekvienam: demonstracija ir klausimai apie pipeline'ą. | reikia sukurti: testas.md, praktika.md, vertinimas.md, sprendimai/ |

## 6. Atsiskaitymai

Kiekvienas atsiskaitymas: teorijos testas (30 klausimų, 35 min.) ir praktika (užduotis ar jų rinkinys, ~2 val.). Praeinamas balas ≥ 50 %. Mokyklos tvarkaraštyje patvirtintos tik 2026-11-30 ir 2026-12-17; kitų datų dar nėra.

| Nr | Data | Aplankas | Sritis |
|---|---|---|---|
| 1 | 2026-11-30 (patvirtinta) | 09 Atsiskaitymas 1 | Linux, Bash, Git, GitHub, projekto paleidimas |
| 2 | 2026-12-17 (patvirtinta) | 20 Atsiskaitymas 2 | Docker, Compose, MySQL konteineryje |
| 3 | 2027-01-18 | 29 Atsiskaitymas 3 | GitHub Actions: CI, image push |
| 4 | 2027-03-02 | 42 Atsiskaitymas 4 | Kubernetes pagrindai |
| 5 | 2027-03-23 | 53 Atsiskaitymas 5 | Helm, duomenys, stebėsena, derinimas |
| 6 | 2027-05-06 | 67 Atsiskaitymas 6 | Azure, infrastruktūra kodu, AKS |
| 7 | 2027-05-27 | 79 Baigiamojo projekto gynimas | Baigiamojo projekto gynimas |

**Vertinimas (Techin atsakymas, 2026-11-10, pakeičia ankstesnį 40/30/30 pasiūlymą):**
- Atsiskaitymų (1–6 ir baigiamojo projekto 7) **praktinių dalių** įvertinimai visų modulių ir dėstytojų kaupiami ir į egzamino praktiką atsinešami kaip **40 %** jos įvertinimo (visi 10 → 4 balai). Egzaminą vis tiek būtina laikyti.
- Baigiamasis projektas yra praktinis atsiskaitymas, ne egzamino dalis.
- Atsiskaitymų **teorijos** dalis vertinama pažymiu, bet į egzaminą nenešama (Techin tekste nurodyta tik praktika).
- Justina 2026-11-12: praktinių darbų įvertinimai skaičiuojami **paprastu vidurkiu**, baigiamasis projektas didesnio svorio neturi. Pažymiai du: už teoriją ir už praktiką (atskirai).
- Atviras: galutinis kurso pažymys (visi mokslo metai ar vienas modulis) ir ar atsiskaitymų teorija įeina į jį. Justina siūlo susiskambinti ir parodyti pažymių lentelę; pirma suderinti žodyną.

**Egzaminai (Techin, 2026-11-10; kontaktas Justina, IT skyriaus vadybininkė):**
- Teorija: 80–100 klausimų iš visų modulių, 2 val., kompiuteriu specialioje sistemoje, niekuo naudotis negalima, rezultatas iš karto. Reikia ≥ 50 %, kad būtų leista laikyti praktiką.
- Praktika: 3–4 val., kompiuteriu, mokyklos kompiuteriai ir patalpos, po kelių dienų nuo teorijos. Aplinką iš anksto įdiegia IT pagal dėstytojo programų sąrašą (`medziaga/egzamino-programu-sarasas.md`); po teorijos egzamino galima nueiti į praktikos klasę ir pasitikrinti. Egzamine galima naudotis GitHub ir ten sukeltais darbais (Justina 2026-11-12: programuotojams leidžiama, DevOps dar tiksliai nežino, bet savo užduotimis galės). Egzamino užduotis rengia speciali įstaiga; praktikos pavyzdį galima gauti nuo mėnesio iki kelių dienų prieš egzaminą.
- Datos skelbiamos 2027 sausį, tikėtina birželio 15–25.
- Komisija: išorės vertintojas + 2 TECHIN dėstytojai. Pagrindinis dėstytojas egzamine dalyvauti negali.
- Perlaikymas: prašymas, nauja data po 1–3 mėn. Neatvykus reikia oficialaus dokumento ir svarbios priežasties.
- Uždavinius ruošia ne dėstytojas (pavyzdžių nėra, mokykla pasidalins gavusi).

## 7. Senų pamokų panaudojimas

| Sena pamoka | Panaudojimas naujame projekte |
|---|---|
| 10.2 IS platformos ir serveriai | 01 Kas yra DevOps: pritaikyti iš `medziaga/` |
| 10.1 Įvadas ir GitHub | 01 paskaitos GitHub įvadas. Atskira PR paskaita nebedėstoma (sprendimas 13). |
| 12.2 Dockerfile ir PostgreSQL | 13 Pirmasis Dockerfile: pritaikyti, PostgreSQL keisti į MySQL |
| 12.3 Docker Compose (su sugadintos/) | 17 Docker Compose: pritaikyti |
| 12.4 Atsiskaitymas 1 | 20 Atsiskaitymas 2: pritaikyti |
| 11.1 Serverio komponentai, 11.2 RAID/NAS/SAN/UPS, 11.3 Virtualizavimas, 12.1 VM šablonai/LXC/Podman | nenaudojamos, lieka tik `medziaga/` |

Senas projektas lieka nepakeistas, naujas kuriamas atskirame aplanke. Senas programos failas `visi-metai-iki-finalinio-projekto.md` nebenaudojamas. Excel `DevOps_mokymo_planas_2026-2027.xlsx` (senas ISP planas) reikia atnaujinti pagal šį failą.

## 8. Papildomos temos

Įdėtos ten, kur studentas jau moka tai, ant ko jos stovi. Atsirado sujungus tris Actions praktikas į vieną ir GitOps su skenavimu į vieną pamoką.

1. TLS ir sertifikatai: 54 pamoka, po 5 atsiskaitymo, kai Ingress jau veikia.
2. PromQL, Alertmanager, Loki: 55 pamoka, kai Prometheus ir log'ai jau būna (50–51).
3. Terraform moduliai ir state: 74 pamoka, kai pagrindai (64–65) ir pipeline (72) jau yra.
4. Ansible: 75 pamoka, kai Azure serveris jau būna.

Pagrindai, ant kurių tai stovi: image skenavimas (13), ConfigMap/Secret (36), RBAC (52), Prometheus (50), Terraform pradmenys (64–65), GitOps ir skenavimas vienoje pamokoje (73). SSH yra 56 pamokos pradžia. Python skaito iš Karolinos kurso, SQL iš vasario DB modulio. Atskiros jų paskaitos čia nededamos.

## 9. Pradinis projektas (Python + Flask + MySQL)

Dėstytojas paskelbia repo `devops-projektas` kaip GitHub template iki 05 pamokos. Mokiniai jį susikuria ir klonuoja 05 pamokoje (2026-11-19), kai projektą reikia paleisti. 02–04 tęsia `git-bandymas`. Reikalavimai:

1. Flask API su `/health` ir 2–3 maršrutais (pvz. `/items` sąrašas ir pridėjimas).
2. Prisijungimas prie MySQL tik per aplinkos kintamuosius (`DB_HOST`, `DB_USER`, `DB_PASSWORD`, `DB_NAME`); `.env.example` be tikrų reikšmių, `.env` į `.gitignore`.
3. Lokalus paleidimas be MySQL (SQLite pagal numatytuosius), kad 05 pamokoje nereikėtų diegti MySQL. MySQL įjungiama 12 pamokoje su Compose.
4. `schema.sql` ir `seed.sql`. Iki DB modulio pabaigos (2027-02-19) studentai SQL nerašo ir neredaguoja. MySQL tik paleidžiama. Po modulio, kuris eina po Karolinos Python kurso, ten, kur reikia skaityti ar taisyti SQL, pamoka prasideda trumpu prisiminimu. Python prisiminimas trumpas nuo 05 pamokos: randa `/health` faile `app.py` ir kodo neperrašo.
5. `requirements.txt`, vienas paprastas `pytest` testas (16 pamokai) ir `README` su paleidimu viena komanda.
6. Be Dockerfile, docker-compose ir workflow: tai mokiniai kuria patys 10, 12 ir 15–18 bei 22 paskaitose.
7. Paskelbtas kaip GitHub „Template repository“. Prieš tai patikrinti, kad repo nėra privačių duomenų.

## 10. Darbų eiga ir terminai

| Iki kada | Ką paruošti |
|---|---|
| 2026-11-11 | template `devops-projektas`, 01 Kas yra DevOps su Git pakartojimu |
| 2026-11-12 | 02 Linux terminalas |
| 2026-11-16 | 02–04 (Linux terminalas, Bash, Tinklai). SSH ne šioje savaitėje |
| 2026-11-19 | 05 Projekto paleidimas lokaliai. Starteris turi veikti be MySQL |
| 2026-11-24 | 06 visa 3 val. Docker pradžia. 07 visa 3 val. image ir registrai. 08 (11-26) 3 val. atsiskaitymo repeticija |
| Kiekvieną pamoką | užduotis į Teams po vieną pamokos metu; kitos pamokos pradžioje praeitos pamokos sprendimas |
| 2026-11-30 | 09 Atsiskaitymas 1: testas (30 kl.), praktika, vertinimas.md, sprendimai |
| 2026-12-01 | 10–14 Docker iki atsiskaitymo, 15–18 pirmas workflow, 19 Docker kartojimas |
| 2026-12-17 | 20 Atsiskaitymas 2 |

## 11. Atviri klausimai

1. **Tvarkaraštis po 2027-01-01.** Žinomas tik iki sausio 1 d. ir vasario DB modulis.
2. **Pavasario atostogos, STVA savaitės ir birželio konsultacijos** paimtos iš Excel plano ir nepatikrintos. Nuo jų priklauso, ar yra laisvų paskaitų.
3. **Linux paskaitos.** Edgaras mokė OS (2026-09-07 – 10-02). Senos 02 ir 03 sujungtos į vieną patikrą 2026-11-16 (dabar 02). 03 yra Bash, 04 tinklai, 05 paleidimas.
4. **Vertinimas.** Iš dalies išspręsta (žr. 6 skyrių: 40 % egzamino praktikos iš atsiskaitymų). Kaupiama paprastu vidurkiu (Justina 2026-11-12); neaišku tik galutinis kurso pažymys.
5. **Azure kreditai.** Pagal užrašus baigiasi apie 2026-12-06, o Azure pradedamas 2027-04-19. Reikia naujų kreditų ar mokyklos laiško.
6. **Pradinis repo.** Template `devops-projektas` reikalingas 05 pamokoje (2026-11-19). Iki tol mokiniai tęsia `git-bandymas`.
7. **Kubernetes etapas pertrauktas DB moduliu.** Po pertraukos pirmą paskaitą skirti kartojimui.
8. **Excel planas.** Atnaujinti pagal šį failą.
9. **Mokinių sistemos.** Ar visi turi Bash (Linux, Git Bash ar WSL)? Nuo to priklauso komandų pamokose.
10. **Viešas repo.** Ar reikia viešo `devops-kursas` (aplinkos `README.md`), jei užduotys eina per Teams.
11. **Privatumas.** Repo `Techin DevOps` turi būti privatus prieš bet kurį `git push`.
12. **Egzaminas.** Išspręsta 2026-11-10: gynimas (79) yra atsiskaitymas, ne egzamino dalis. Justina 2026-11-12: GitHub ir savo darbai galimi; aplinką įdiegs IT pagal programų sąrašą (`medziaga/egzamino-programu-sarasas.md`, reikia išsiųsti). Laukiama tik tikslių datų (2027 sausis).

## 12. Pamokos formatas (trumpai)

Pilnos taisyklės yra `.claude/skills/pamoka-formatas/SKILL.md`.

1. Vienas `pamoka.md` pamokai: `## Klasės darbas` (numeruotas, su minutėmis, „Demonstracija“, nuorodos į oficialią dokumentaciją), `## Schemos`, `## Užduotys`, `## Komandos`, `## Pamokos eiga (dėstytojui)`.
2. Užduotys: `### 1️⃣ <Pavadinimas>`, vienas numeruotas sąrašas: pirmas punktas `**Tikslas:**`, toliau po vieną smulkų veiksmą be komandų, pagal Edgaro stilių; ≥1 užduotis iš oficialios dokumentacijos (tik tikslas). Pateikimo ir savitikros nėra. Komandos atskirame skyriuje „Komandos“ pagal žingsnio numerį.
3. Sprendimas: tik tikri rezultatai (kodas, konfigūracijos), „Patikrinta/Nepatikrinta“, „Demonstracijos žingsniai“ su minutėmis, lentelė „Darbas | Kur sprendime“, pavyzdiniai failai kodo blokuose (daug kodo: `sprendimai/` aplankas).
4. Paskaita 3 val.: ~20–30 min. teorijos, likusi dalis praktika; užduočių suma ~1,25–2,5 val.
5. Atsiskaitymo pamoka (tame pačiame `kursas/<NN Atsiskaitymas N>/` aplanke): `praktika.md`, `vertinimas.md` (lentelė kriterijus | taškai | kaip tikrinama), `testas.md` (30 klausimų, A–D), `atsakymai.md`. Studentams duodamos tik užduotys be atsakymų.

## 13. Aplankai ir pamokų eiga

| Vieta | Kam | Kas viduje |
|---|---|---|
| `devops-projektas` (GitHub template) | mokinio darbo projektas | Flask + MySQL starteris (9 skyrius) |
| `Techin DevOps` (privatus) | dėstytojo darbas | `kurso aprašymas.md` (šis failas), `kursas/` (79 pamokų ir atsiskaitymų aplankų pagal numeraciją, `Finalinis projektas/` su aprašymu ir etalonu), `medziaga/` (senos temos, šaltiniai, darbiniai failai) |

Eiga:

1. Medžiagą kuria Claude Code privačiame `Techin DevOps`. Demonstruoji tik iš jo (arba iš atskiro bandomojo projekto, sukurto iš template).
2. Pamokos dieną dėstytojas trumpai paaiškina temą, parodo gyvai kitu pavyzdžiu ir į Teams įkelia užduotį (skyrius „Užduotys“, prireikus „Komandos“). Mokiniai daro, baigę gauna kitą.
3. Kitos pamokos pradžioje dėstytojas parodo praeitos pamokos sprendimą (skyrius „Pamokos eiga“) ir aptariama, kas liko neaišku.
4. Tikrinama tik atsiskaitymuose.

## 14. Šaltiniai

1. `DevOps_kurso_planas_81_paskaita.md` (2026-11-07): paskaitų turinys; pakeitimai: MySQL, 15 ir 16 sujungtos (iš viso 80), datos.
2. Mokyklos tvarkaraštis iki 2027-01-01 (Justina Balsė, 2026-10-26): atsiskaitymų datos 2026-11-30 ir 2026-12-17, formatas (30 klausimų, 35 min. teorija + praktika), atostogos, mokytojai.
3. Duomenų bazių modulio programa (60 val.) ir Teams pranešimas 2026-10-29: 2027-02-01 – 02-19, MySQL.
4. Svetainė su laiko juosta: claude.ai artefaktas „Naujas DevOps planas“.
5. Darbo eigos sprendimai (2026-11-07): template + viešas kursas + privatus Techin, sprendimai kitos pamokos pradžioje.

## 15. Ką mokiniai išmoks iki 1 ir 2 atsiskaitymo (pamokos 01–20)

Sudaryta pagal 5, 9, 12 skyrius. Žymos: **[planas]** yra kurso plane, **[pasiūlymas]** yra mano pasiūlymas ir reikia patvirtinti.

Kaip tikrinama (visoms pamokoms):

- **Atsiskaitymas**: vienintelis vertinamas tikrinimas. Kasdienių užduočių dėstytojas netikrina.

---

### 1 etapas: Linux, Bash, projekto paleidimas (01–09)

Etapo tikslas [planas]: terminalas, skriptas, kuris paleidžia projektą, ir jau turimas Pull Request. Git ir PR atskirai nebekartojami.

#### 01 Kas yra DevOps (2026-11-11)

- **Pamoka:** kodo kelias nuo kūrėjo iki vartotojo, kurso apžvalga, aplinka ir **Git kelias nuo nulio** bandomoje repozitorijoje `git-bandymas`.
- **Studentas po pamokos gali:**
  1. paaiškinti, kuo DevOps skiriasi nuo „kūrėjai rašo, administratoriai paleidžia“;
  2. sukurti vietinę Git repozitoriją, daryti commit'us (`git init`, `add`, `commit`, `log`);
  3. sukurti repozitoriją GitHub'e ir nusiųsti kodą (`gh repo create`, `push`);
  4. sukurti šaką, persijungti (`git switch`), sujungti į `main` (`git merge`) ir nusiųsti.
- **Pastaba:** 02–04 tęsia `git-bandymas`. Šablonas `devops-projektas` atsiranda 05 pamokoje, kai projektą reikia paleisti.

#### 02 Linux terminalas (2026-11-16)

- **Pamoka:** 02 ir 03 sujungtos į vieną 3 val. pamoką. `pwd`, `ls`, `mkdir`, `grep`, `ps` tik pasitikrinami. Nauja: skriptas, `chmod 600`, `export` tik šiam langui, `brew`/`apt`, pirmas Pull Request. Tas pats `git-bandymas`.
- **Studentas po pamokos gali:**
  1. tęsti `~/Desktop/devops/git-bandymas` šakoje `pamoka-02`;
  2. parašyti ir paleisti `scripts/ataskaita.sh`;
  3. sustabdyti `sleep` pagal PID ir pamatyti, kad `export` naujame lange neveikia;
  4. įdiegti `tree` (`brew` arba `apt`) ir pateikti Pull Request.

#### 03 Bash skriptai (2026-11-17)

- **Pamoka:** argumentai, `if`, `for`, išėjimo kodai, `.gitignore` ir `git restore` aplanke `git-bandymas`. `run.sh` skaitomas 05 pamokoje.
- **Studentas po pamokos gali:**
  1. parašyti skriptą su `#!/usr/bin/env bash`, argumentais ir kintamaisiais;
  2. naudoti `if` ir `for`;
  3. patikrinti, ar komanda ar failas egzistuoja, ir baigti su teisingu išėjimo kodu;
  4. naudoti `.gitignore` ir `git restore`.

#### 04 Tinklų pagrindai (2026-11-18)

- **Pamoka:** IP, portai, DNS, HTTP, `curl`.
- **Studentas po pamokos gali:**
  1. paaiškinti IP, portą, DNS ir HTTP kodus (200, 404, 500);
  2. naudoti `curl` ir perskaityti atsakymą;
  3. surasti, kuris procesas klauso porto.

#### 05 Projekto paleidimas lokaliai (2026-11-19)

- **Pamoka:** `./run.sh`, `/health`, `/status`, `.env`, `paleisti.sh`. SSH ne čia.
- **Studentas po pamokos gali:**
  1. paleisti projektą (`./run.sh`) ir atidaryti `/health` ir `/status`;
  2. paleisti testus (`.venv/bin/pytest`) ir rasti `/health` funkciją `app.py`, kodo nekeičiant;
  3. nustatyti `APP_COLOR` ir `APP_VERSION` per `.env` ir pamatyti pokytį;
  4. paaiškinti, kodėl `.env` į Git nekeliamas, ir parašyti `paleisti.sh`.

#### 06 Docker pradžia (2026-11-23)

- **Pamoka:** 3 val. Pradžioje „pas mane veikia“ ir VM prieš konteinerį. Likusios valandos: `run`, `ps`, `logs`, `exec`, `stop`. Atskira teorijos paskaita nėra.
- **Studentas po pamokos gali:**
  1. vienu sakiniu pasakyti, kuo konteineris skiriasi nuo VM;
  2. paleisti konteinerį fone su paskelbtu portu, pažiūrėti log'us ir įeiti vidun (`exec`);
  3. sustabdyti ir pašalinti konteinerį.

#### 07 Image ir registrai (2026-11-24)

- **Pamoka:** Docker Hub, tag'ai, sluoksniai.
- **Studentas po pamokos gali:**
  1. atsisiųsti image su konkrečiu tag'u (ne `latest`);
  2. paaiškinti sluoksnius (`docker history`);
  3. rasti image dydį ir ištrinti nereikalingus.

#### 08 Pasiruošimas atsiskaitymui 1 (2026-11-26)

- **Pamoka:** `paleisti.sh`, repo, bent 3 sulieti PR. Naujos temos nėra. 11-25 paskaitos nėra.

#### 09 Atsiskaitymas 1 (2026-11-30)

**Reikalavimai [planas]:** projekto repozitorija, bent 3 sujungti PR, Bash skriptas, kuris paleidžia projektą.

| Dalis | Ką tikrina | Kaip tikrinama |
|---|---|---|
| Repozitorija | sukurta iš šablono, `origin` į GitHub, README, `.gitignore`, nėra `.env` | dėstytojas |
| Pull Request'ai | bent 3 **sulieti** PR yra `git-bandymas` (pamokos 02–04). `devops-projektas` turi 05 pamokos PR ir šio atsiskaitymo PR | per `gh` ir peržiūra |
| Bash skriptas | **[pasiūlymas]** `paleisti.sh` (ne `run.sh`): tikrina Python versiją, kuria `.venv`, paleidžia, laukia `/health` 200, išvalo | skriptas paleidžiamas komisijos kompiuteryje |
| Testas | Linux, Git, Bash, tinklai (30 klausimų, A–D) | `testas.md`, `atsakymai.md` (tik dėstytojui, nepateikiami studentams) |

Taškai ir sverto sistema: **dar nenustatyti** (plano atviras klausimas 4), bus `vertinimas.md`.

---

### 2 etapas: Docker ir pirmas workflow (06–07, 10–20)

Etapo tikslas [planas]: projektas su duomenų baze paleidžiamas viena komanda. Po Dockerfile prasideda pirmas workflow. Atsiskaitymas 12-17 lieka apie Docker.

06 yra Docker pradžia, 07 yra image. Žemiau tik gruodžio paskaitos.

#### 10 Pirmasis Dockerfile (2026-12-01)

- **Pamoka:** Dockerfile projektui.
- **Studentas po pamokos gali:**
  1. parašyti Dockerfile (`FROM`, `COPY`, `RUN`, `CMD`);
  2. sukurti image (`docker build`) ir paleisti projektą konteineryje;
  3. pasiekti `/health` iš naršyklės.

#### 11 Mažesnis image (2026-12-02)

- **Pamoka:** cache, `.dockerignore`, mažesni bazės image'ai, multi-stage.
- **Studentas po pamokos gali:**
  1. teisingai išdėstyti sluoksnius, kad cache veiktų;
  2. parašyti `.dockerignore`;
  3. sumažinti image dydį ir paaiškinti, kas sumažino.

#### 12 Docker Compose (2026-12-03)

- **Pamoka:** app + MySQL, volume ir tinklas šioje pačioje pamokoje.
- **Studentas po pamokos gali:**
  1. parašyti `compose.yml` su programa ir MySQL;
  2. prijungti volume ir pasiekti MySQL pagal konteinerio vardą, ne per `localhost`. SQL nerašyti;
  3. paleisti `docker compose up` ir patikrinti `/status`.

#### 13 Docker saugumas (2026-12-07)

- **Pamoka:** ne-root vartotojas, image skenavimas (pvz. Trivy).
- **Studentas po pamokos gali:**
  1. paleisti programą ne kaip root (`USER`);
  2. paleisti Trivy ir perskaityti rezultatą;
  3. paaiškinti, kodėl vengiama `latest` ir slaptažodžių image'e.

#### 14 Sulaužyk ir pataisyk Docker (2026-12-08)

- **Pamoka:** sugedę Dockerfile ir compose failai.
- **Studentas po pamokos gali:**
  1. skaityti klaidų pranešimus ir `docker logs`;
  2. rasti ir pataisyti klaidingą `Dockerfile` ar `compose.yml`;
  3. paaiškinti, kas buvo blogai.

#### 15 Pirmas workflow (2026-12-09)

- **Pamoka:** `on`, `jobs`, `steps`. Image į registrą dar nekeliamas.
- **Studentas po pamokos gali:**
  1. parašyti workflow, kuris paleidžia vieną komandą;
  2. pamatyti jo log'ą GitHub'e;
  3. pasakyti, kuo `on: push` skiriasi nuo `on: pull_request`.

#### 16 Testai per PR (2026-12-10)

- **Pamoka:** `pytest` kiekviename Pull Request.
- **Studentas po pamokos gali:**
  1. įdėti `pytest` į workflow;
  2. pamatyti žalią ir raudoną PR patikrą;
  3. perskaityti, kuris testas krito.

#### 17 Branch apsauga (2026-12-14)

- **Pamoka:** PR nesijungia, jei CI raudonas.
- **Studentas po pamokos gali:**
  1. įjungti taisyklę, kad `main` reikalauja žalios patikros;
  2. pamatyti, kad raudonas PR nesijungia;
  3. paaiškinti, kodėl apsauga be CI nieko nesulaiko.

#### 18 Image build workflow (2026-12-15)

- **Pamoka:** tas pats workflow paleidžia `docker build`. Į registrą nekelia.
- **Studentas po pamokos gali:**
  1. įdėti `docker build` į workflow;
  2. pamatyti build log'ą GitHub'e;
  3. pasakyti, kad image dar yra tik runner'yje, ne registre.

#### 19 Docker kartojimas (2026-12-16)

- **Pamoka:** `compose up`, image dydis, ne root. Naujos temos nėra.

#### 20 Atsiskaitymas 2 (2026-12-17)

**Reikalavimai [planas]:** projektas paleidžiamas su `docker compose up`, image mažesnis už nustatytą ribą, veikia ne kaip root.

| Dalis | Ką tikrina | Kaip tikrinama |
|---|---|---|
| Compose | `docker compose up` paleidžia app ir MySQL, `/status` rodo MySQL | komisijos kompiuteris, švarus klonas |
| Image dydis | mažesnis už ribą (riba nustatoma **iš anksto**, pvz. pagal dėstytojo sprendimą) | `docker images` |
| Ne root | `id -u` konteinerio viduje ≠ 0 | `docker exec` |
| Slaptažodžiai | nėra `compose.yml`, Dockerfile ar Git istorijoje | peržiūra ir paieška |
| Testas | Docker teorija (30 klausimų, A–D) | `testas.md`, `atsakymai.md` (tik dėstytojui, nepateikiami studentams) |

---

### Ką dar reikia nuspręsti

1. **Taškai ir svoriai** (plano atviras klausimas 4).
2. **Image dydžio riba** atsiskaitymui 2 (pvz. po `python:3.12-slim` bazės, reikia išmatuoti ir parinkti).
3. **Ar `paleisti.sh` atsiskaitymui 1** (pasiūlymas) priimamas, ar užtenka `run.sh`.
4. **Pirmas paleidimas** nuspręstas: 05 pamoka (2026-11-19).
