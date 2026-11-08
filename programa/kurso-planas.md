# DevOps kursas VH-DO: planas metams

Atnaujinta: 2026-11-07. Dėstytojas: Deividas Koncius. Grupė: VH-DO (DevOps), 30 mokinių. Šis failas yra **vienintelis tiesos šaltinis** kurso struktūrai, datoms ir sprendimams.

## 0. Kaip naudoti šį failą (Claude Code)

1. Prieš kuriant ar keičiant bet kurią pamoką, perskaityk šį failą ir skill'ą `.claude/skills/pamoka-formatas/SKILL.md`.
2. Viešas pamokos turinys yra `kursas/pamokos/<NN> <Pavadinimas>/` (`pamoka.md`, `uzduotys.md`, `check.sh`), sprendimai privačiai `mokytojas/sprendimai/<NN>/`; pavadinimai kaip 5 skyriaus lentelėje, schema 13 skyriuje. Numeracija 01–80, be savaičių kodų.
3. Nekeisk šio failo savo iniciatyva. Jei pamokos darbas rodo, kad planą reikia pakeisti, parašyk pasiūlymą ir paklausk.
4. Datos po 2027-01-01 yra skaičiavimas, ne tvarkaraštis (žr. 3 skyrių). Nerašyk jų į mokinių medžiagą kaip patvirtintų.
5. Nieko netrink, nedaryk `git push` ir `git commit` be aiškaus prašymo. Pavojingų komandų (apply, destroy, delete, prune, kubectl apply, terraform) šiame kompiuteryje nevykdyk, tik aprašyk tekste.
6. Slapti duomenys (raktai, slaptažodžiai, tfstate, kubeconfig, kortelės) niekada į Git ir į atsakymus. Rodyk tik `.pub` raktus.
7. Į viešą repo `devops-kursas` niekas nepatenka be mano `publikuoti.sh` paleidimo ir paties `git push`. Sprendimų ir atsiskaitymų atsakymų viešai nerašyk.
8. Senas projektas lieka nepakeistas. Jo medžiaga kopijuota į `_saltiniai/` (tik skaitymui), iš ten pritaikyk, o ne perrašyk.

## 1. Trumpai

| Dalykas | Reikšmė |
|---|---|
| Paskaitų skaičius | 80, po 3 val. (17:30–20:40) |
| Tvarkaraštis | pirmadienis–ketvirtadienis, 4 per savaitę (pirma savaitė: tik trečiadienis ir ketvirtadienis) |
| Pirma paskaita | 2026-11-11 (trečiadienis) |
| Paskutinė paskaita | 2027-05-27 (orientacinė) |
| Etapai | 7, kiekvienas baigiasi atsiskaitymu |
| Kurso projektas | Python (Flask) web API su MySQL, vienas visą kursą |
| Duomenų bazė | MySQL |
| Git platforma | GitHub; užduotys pateikiamos per Pull Request |
| Repo (pavadinimai pasiūlyti) | `devops-projektas` (GitHub template, mokinio darbo projektas), `devops-kursas` (viešas, pamokų medžiaga), `Techin DevOps` (privatus, visas dėstytojo darbas) |
| Sprendimų skelbimas | užduotys ir `check.sh` pamokos dieną, praeitos pamokos sprendimas kitos pamokos pradžioje (13 skyrius) |
| Konteineriai ir Kubernetes | lokaliai iki Azure etapo; Azure tik 6–7 etapuose |
| Pamokos formatas | `pamoka.md`, `uzduotys.md`, `sprendimai/` pagal skill'ą `pamoka-formatas` |

## 2. Priimti sprendimai

1. Naudojamas **naujas 80 paskaitų planas** (2026-11-07): Linux ir Git, Docker, GitHub Actions, Kubernetes, Kubernetes praktikoje, Azure, pilnas pipeline ir baigiamasis projektas.
2. Senas ISP planas (IS platformos, serverių komponentai, RAID/NAS/SAN/UPS, virtualizavimas, VM šablonai, LXC) **nenaudojamas**, nes mokiniams svarbiau realių DevOps įgūdžių seka. Medžiaga archyvuojama, o ne trinama.
3. Nepasirinktos temos **gilesnis saugumas, monitoringas ir Terraform** sprendžiamos vėliau, pagal tai, kaip seksis (žr. 8 skyrių). Pagrindai jau yra plane.
4. Duomenų bazė **MySQL**. Mokiniai SQL mokosi tik vasario DB modulyje, todėl Docker ir Compose užduotyse MySQL tik paleidžiama ir prižiūrima, o schemą ir pradinius duomenis duoda pradinis repo.
5. Pamokų aplankai `NN Pavadinimas`, 01–80. Kiekviena pamoka: `pamoka.md`, `uzduotys.md`, `sprendimai/` (README ir tikri rezultatai). Atsiskaitymo pamoka: `praktika.md`, `vertinimas.md`, `testas.md`, `sprendimai/`.
6. Dėstytojas kasdienių užduočių netikrina. Pamokos pradžioje parodo sprendimą gyvai, mokiniai daro užduotis su savitikra (`check.sh`). Praeitos pamokos sprendimas įkeliamas į viešą repo kitos pamokos pradžioje. Tikrinama tik atsiskaitymuose.
7. Pirmose paskaitose užduotis pateikti per GitHub Pull Request, todėl 01 paskaitoje reikia ~20 min. GitHub paskyros ir paprasčiausio PR įvado (naudoti seną 10.1).
8. Nuo 01 paskaitos mokiniai iš GitHub template `devops-projektas` susikuria savo repo, o viešą `devops-kursas` klonuoja ir kas savaitę daro `git pull`.
9. Kiekvienos pamokos pabaigos projekto būsena yra kitos pamokos pradžia. Jei kas nepavyko, `kursas.sh atstatyti NN` atstato projektą iš paskelbto sprendimo (senas projektas perkeliamas į atsarginį aplanką, nieko netrinama).
10. Atsiskaitymų atsakymai ir `mokytojas/` niekada nepublikuojami.
11. Naujos pamokos kuriamos naujame projekte. Seno projekto veikiantys pavyzdžiai (Docker, Compose, Actions, Kubernetes, Terraform, Azure) kopijuojami į `_saltiniai/` ir pritaikomi, o ne perrašomi.
12. Užduotys parodo, ar mokiniai išmoko tai, ką dėstė Edgaras (Git, Bash, Python kodo skaitymas), o vėliau ir MySQL kodo skaitymą. Atskiro įvadinio testo tam nereikia.

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
| 1 | DevOps pagrindai, Linux, Git | 1–10 (10) | 2026-11-11 – 2026-11-30 | 2026-11-30 |
| 2 | Docker | 11–21 (11) | 2026-12-01 – 2026-12-17 | 2026-12-17 |
| 3 | GitHub Actions | 22–32 (11) | 2027-01-04 – 2027-01-20 | 2027-01-20 |
| 4 | Kubernetes pagrindai | 33–45 (13) | 2027-01-21 – 2027-03-04 | 2027-03-04 |
| 5 | Kubernetes praktikoje | 46–56 (11) | 2027-03-08 – 2027-03-25 | 2027-03-25 |
| 6 | Azure | 57–68 (12) | 2027-04-19 – 2027-05-06 | 2027-05-06 |
| 7 | Pilnas pipeline ir baigiamasis projektas | 69–80 (12) | 2027-05-10 – 2027-05-27 | 2027-05-27 |

Etapo 4 (Kubernetes pagrindai) paskaitos 33–37 patenka į sausio pabaigą, o 38–45 į vasario pabaigą ir kovą, nes viduryje yra DB modulis. Po pertraukos pirmą paskaitą verta skirti kartojimui.

Tikslai:

1. DevOps pagrindai, Linux, Git: Mokiniai jaučiasi patogiai terminale ir dirba su Git per Pull Request'us.
2. Docker: Projektas su duomenų baze paleidžiamas viena komanda bet kuriame kompiuteryje.
3. GitHub Actions: Kiekvienas commit automatiškai patikrinamas, o main šakoje sukuriamas ir išsaugomas image.
4. Kubernetes pagrindai: Projektas veikia lokaliame klasteryje (kind arba minikube) ir pasiekiamas iš naršyklės.
5. Kubernetes praktikoje: Projektas supakuotas kaip Helm chart, stebimas ir pats prisitaiko prie apkrovos.
6. Azure: Visa infrastruktūra aprašyta kodu ir sukuriama bei ištrinama viena komanda, kad kreditai būtų naudojami tik pamokų metu.
7. Pilnas pipeline ir baigiamasis projektas: Push į main automatiškai pasiekia AKS, o mokinys gali paaiškinti kiekvieną žingsnį.

## 5. Paskaitų lentelė (80)

Datos nuo 2027-01-01 orientacinės. Stulpelis „Aplankas“ yra aplankas `kursas/pamokos/<aplankas>/`.

| Nr | Data | Aplankas | Tema | Būsena |
|---|---|---|---|---|
| 01 | 2026-11-11 | 01 Kas yra DevOps | Kas yra DevOps: kodo kelias nuo kūrėjo iki vartotojo, kurso projekto pristatymas. | yra pagrindas iš senos 10.2 (IS platformos, gyvavimo ciklas); sutrumpinti pagal 1 paskaitą |
| 02 | 2026-11-12 | 02 Linux terminalas | Linux terminalas: navigacija, failai, teisės. | reikia sukurti |
| 03 | 2026-11-16 | 03 Procesai ir paketai | Procesai, aplinkos kintamieji, paketų tvarkyklė. | reikia sukurti |
| 04 | 2026-11-17 | 04 Bash skriptai | Bash skriptai: kintamieji, sąlygos, ciklai. | reikia sukurti |
| 05 | 2026-11-18 | 05 Tinklų pagrindai | Tinklų pagrindai: IP, portai, DNS, HTTP, curl. | reikia sukurti |
| 06 | 2026-11-19 | 06 SSH ir raktai | SSH ir raktai, darbas nuotoliniame serveryje. | reikia sukurti |
| 07 | 2026-11-23 | 07 Git pagrindai | Git: commit, branch, merge, konfliktai. | reikia sukurti |
| 08 | 2026-11-24 | 08 GitHub Pull Request | GitHub: Pull Request, code review, branch apsauga. | yra iš senos 10.1 (GitHub, devops-projektas, PR); pritaikyti |
| 09 | 2026-11-26 | 09 Projekto paleidimas lokaliai | Kurso projekto paleidimas lokaliai, README ir .gitignore. | reikia sukurti |
| 10 | 2026-11-30 | 10 Atsiskaitymas 1 | Atsiskaitymas: projekto repozitorija, bent 3 sujungti PR, Bash skriptas, kuris paleidžia projektą. | reikia sukurti: testas.md, praktika.md, vertinimas.md, sprendimai/ |
| 11 | 2026-12-01 | 11 Kodėl konteineriai | Kodėl konteineriai: „pas mane veikia“ problema, VM ir konteinerio skirtumas. | reikia sukurti; Mermaid VM prieš konteinerį galima paimti iš archyvuotos 11.3 |
| 12 | 2026-12-02 | 12 Docker CLI | Docker CLI: run, ps, logs, exec, stop. | reikia sukurti |
| 13 | 2026-12-03 | 13 Image ir registrai | Image'ai ir registrai: Docker Hub, tag'ai, sluoksniai. | reikia sukurti |
| 14 | 2026-12-07 | 14 Pirmasis Dockerfile | Pirmasis Dockerfile projektui. | yra pagrindas iš senos 12.2 (Dockerfile); PostgreSQL pakeisti į MySQL |
| 15 | 2026-12-08 | 15 Dockerfile praktikos ir multi-stage | Dockerfile gerosios praktikos: cache, .dockerignore, mažesni bazės image'ai, multi-stage build'ai. | reikia sukurti |
| 16 | 2026-12-09 | 16 Volume ir duomenys | Volume'ai ir duomenų išsaugojimas. | reikia sukurti |
| 17 | 2026-12-10 | 17 Docker tinklai | Docker tinklai: konteinerių tarpusavio ryšys. | reikia sukurti |
| 18 | 2026-12-14 | 18 Docker Compose | Docker Compose: app + MySQL + kintamieji. | yra pagrindas iš senos 12.3 (Compose + sugadintos/); PostgreSQL pakeisti į MySQL |
| 19 | 2026-12-15 | 19 Docker saugumas | Saugumas: ne-root vartotojas, image skenavimas (pvz., Trivy). | reikia sukurti |
| 20 | 2026-12-16 | 20 Sulaužyk ir pataisyk Docker | „Sulaužyk ir pataisyk“: sugedę Dockerfile ir compose failai. | gali naudoti sugadintas Dockerfile ir compose iš senos 12.3 (sugadintos/) |
| 21 | 2026-12-17 | 21 Atsiskaitymas 2 | Atsiskaitymas: projektas paleidžiamas su docker compose up, image mažesnis už nustatytą ribą, veikia be root. | yra pagrindas iš senos 12.4 (praktika.md); perrašyti kaip 2 atsiskaitymą |
| 22 | 2027-01-04 | 22 CI/CD ir pirmas workflow | CI/CD idėja, pirmas workflow: on, jobs, steps. | reikia sukurti |
| 23 | 2027-01-05 | 23 Runner ir Marketplace actions | Runner'iai, actions iš Marketplace, YAML sintaksė be baimės. | reikia sukurti |
| 24 | 2027-01-06 | 24 Testai ir lint per PR | Testai ir lint'as per kiekvieną Pull Request. | reikia sukurti |
| 25 | 2027-01-07 | 25 Branch apsauga | Branch apsauga: PR negalima sujungti, jei CI raudonas. | reikia sukurti |
| 26 | 2027-01-11 | 26 Secrets ir environments | Secrets ir kintamieji, aplinkos (environments). | reikia sukurti |
| 27 | 2027-01-12 | 27 Docker image į GHCR | Docker image build'as ir push'as į GitHub Container Registry. | reikia sukurti |
| 28 | 2027-01-13 | 28 Cache, matrix ir artefaktai | Cache, matrix build'ai, artefaktai. | reikia sukurti |
| 29 | 2027-01-14 | 29 Image tag ir release | Image tag'ai pagal commit SHA ir versijas, release'ai. | reikia sukurti |
| 30 | 2027-01-18 | 30 Pakartotiniai workflow | Pakartotinai naudojami workflow'ai ir composite actions. | reikia sukurti |
| 31 | 2027-01-19 | 31 Sulaužyk ir pataisyk Actions | „Sulaužyk ir pataisyk“: neveikiantys workflow'ai, derinimas iš log'ų. | reikia sukurti |
| 32 | 2027-01-20 | 32 Atsiskaitymas 3 | Atsiskaitymas: pipeline, kuris PR'e paleidžia testus, o main šakoje sukuria ir išsaugo image. | reikia sukurti: testas.md, praktika.md, vertinimas.md, sprendimai/ |
| 33 | 2027-01-21 | 33 Kubernetes architektūra | Kam reikia orkestravimo, Kubernetes architektūra. | reikia sukurti |
| 34 | 2027-01-25 | 34 Lokalus klasteris ir kubectl | Lokalaus klasterio paruošimas, kubectl pagrindai. | reikia sukurti |
| 35 | 2027-01-26 | 35 Pod | Pod'ai: paleidimas, log'ai, exec, describe. | reikia sukurti |
| 36 | 2027-01-27 | 36 YAML ir kubectl apply | Deklaratyvus YAML ir kubectl apply. | reikia sukurti |
| 37 | 2027-01-28 | 37 Deployment ir rollback | Deployment ir ReplicaSet, rolling update ir rollback. | reikia sukurti |
| 38 | 2027-02-22 | 38 Service | Service: ClusterIP, NodePort, LoadBalancer. | reikia sukurti |
| 39 | 2027-02-23 | 39 ConfigMap ir Secret | ConfigMap ir Secret. | reikia sukurti |
| 40 | 2027-02-24 | 40 Namespace ir labels | Namespace'ai ir labels/selectors. | reikia sukurti |
| 41 | 2027-02-25 | 41 Probe | Liveness ir readiness probe'ai. | reikia sukurti |
| 42 | 2027-03-01 | 42 Ingress | Ingress: prieiga per HTTP maršrutus. | reikia sukurti |
| 43 | 2027-03-02 | 43 Requests ir limits | Resource requests ir limits. | reikia sukurti |
| 44 | 2027-03-03 | 44 Sulaužyk ir pataisyk Kubernetes | „Sulaužyk ir pataisyk“: CrashLoopBackOff, ImagePullBackOff, neveikiantis Service. | reikia sukurti |
| 45 | 2027-03-04 | 45 Atsiskaitymas 4 | Atsiskaitymas: projektas (app + DB) veikia klasteryje su Ingress, probe'ais ir konfigūracija ConfigMap/Secret. | reikia sukurti: testas.md, praktika.md, vertinimas.md, sprendimai/ |
| 46 | 2027-03-08 | 46 PV, PVC ir StorageClass | Duomenų saugojimas: PersistentVolume, PVC, StorageClass. | reikia sukurti |
| 47 | 2027-03-09 | 47 StatefulSet duomenų bazei | StatefulSet duomenų bazei (MySQL). | reikia sukurti |
| 48 | 2027-03-10 | 48 Jobs ir CronJobs | Jobs ir CronJobs (pvz., DB atsarginė kopija). | reikia sukurti |
| 49 | 2027-03-15 | 49 Helm pagrindai | Helm: kas tai, esamų chart'ų naudojimas. | reikia sukurti |
| 50 | 2027-03-16 | 50 Savo Helm chart | Savo Helm chart'as projektui. | reikia sukurti |
| 51 | 2027-03-17 | 51 Helm values aplinkoms | Helm values skirtingoms aplinkoms (dev, prod). | reikia sukurti |
| 52 | 2027-03-18 | 52 HPA ir apkrovos testas | Horizontal Pod Autoscaler ir apkrovos testas. | reikia sukurti |
| 53 | 2027-03-22 | 53 Prometheus ir Grafana | Stebėsena: Prometheus ir Grafana. | reikia sukurti |
| 54 | 2027-03-23 | 54 Log ir trikčių paieška | Log'ų rinkimas ir trikčių paieška. | reikia sukurti |
| 55 | 2027-03-24 | 55 RBAC ir NetworkPolicy | Saugumas: RBAC, ServiceAccount, NetworkPolicy. | reikia sukurti |
| 56 | 2027-03-25 | 56 Atsiskaitymas 5 | Atsiskaitymas: projektas įdiegiamas su Helm, plius praktinė derinimo užduotis, kurioje reikia rasti ir pataisyti 3 klaidas klasteryje. | reikia sukurti: testas.md, praktika.md, vertinimas.md, sprendimai/ |
| 57 | 2027-04-19 | 57 Debesų pagrindai ir Azure | Debesų pagrindai, Azure portalas, subscription ir resource group. | reikia sukurti |
| 58 | 2027-04-20 | 58 Azure CLI ir kaštai | Azure CLI, kaštų kontrolė: budget alert'ai, resursų trynimas po pamokos. | reikia sukurti |
| 59 | 2027-04-21 | 59 Entra ID ir RBAC | Microsoft Entra ID, RBAC ir service principal'ai. | reikia sukurti |
| 60 | 2027-04-22 | 60 ACR | Azure Container Registry (ACR). | reikia sukurti |
| 61 | 2027-04-26 | 61 Container Apps ir App Service | Azure Container Apps ar App Service: paprastesnis deploy prieš AKS. | reikia sukurti |
| 62 | 2027-04-27 | 62 AKS ir ACR | AKS klasterio sukūrimas ir prijungimas prie ACR. | reikia sukurti |
| 63 | 2027-04-28 | 63 Helm į AKS | Projekto Helm chart'o įdiegimas į AKS. | reikia sukurti |
| 64 | 2027-04-29 | 64 Valdomos paslaugos | Valdomos paslaugos: Azure Database for MySQL, Key Vault. | reikia sukurti |
| 65 | 2027-05-03 | 65 Bicep ir Terraform | Infrastruktūra kodu: Bicep arba Terraform pagrindai. | reikia sukurti |
| 66 | 2027-05-04 | 66 AKS ir ACR kodu | AKS ir ACR aprašymas kodu. | reikia sukurti |
| 67 | 2027-05-05 | 67 Azure Monitor | Azure Monitor ir Log Analytics. | reikia sukurti |
| 68 | 2027-05-06 | 68 Atsiskaitymas 6 | Atsiskaitymas: infrastruktūra sukuriama iš kodo, projektas veikia AKS, po atsiskaitymo resursai ištrinami. | reikia sukurti: testas.md, praktika.md, vertinimas.md, sprendimai/ |
| 69 | 2027-05-10 | 69 CD į Azure per OIDC | CD į Azure: GitHub Actions prisijungimas per OIDC (federated credentials), be slaptažodžių. | reikia sukurti |
| 70 | 2027-05-11 | 70 Pilnas pipeline | Pilnas pipeline: test → build → push į ACR → helm upgrade į AKS. | reikia sukurti |
| 71 | 2027-05-12 | 71 Aplinkos ir approve | Aplinkos ir patvirtinimai: staging ir production, rankinis approve. | reikia sukurti |
| 72 | 2027-05-13 | 72 Deploy strategijos | Deploy strategijos: rolling, blue-green, canary, rollback. | reikia sukurti |
| 73 | 2027-05-17 | 73 Infrastruktūros pipeline | Infrastruktūros pipeline: Bicep/Terraform per Actions. | reikia sukurti |
| 74 | 2027-05-18 | 74 GitOps apžvalga | GitOps idėja (Argo CD arba Flux) kaip apžvalga. | reikia sukurti |
| 75 | 2027-05-19 | 75 DevSecOps | DevSecOps: priklausomybių ir image skenavimas pipeline'e. | reikia sukurti |
| 76 | 2027-05-20 | 76 Incidentų imitacija | Incidentų imitacija: kažkas sulūžta production, komanda taiso. | reikia sukurti |
| 77 | 2027-05-24 | 77 Baigiamasis projektas 1 | Baigiamojo projekto darbas. | reikia sukurti |
| 78 | 2027-05-25 | 78 Baigiamasis projektas 2 | Baigiamojo projekto darbas, konsultacijos. | reikia sukurti |
| 79 | 2027-05-26 | 79 Kartojimas | Kartojimas prieš egzaminą. | reikia sukurti |
| 80 | 2027-05-27 | 80 Baigiamojo projekto gynimas | Atsiskaitymas: baigiamojo projekto gynimas, 10–15 min. kiekvienam: demonstracija ir klausimai apie pipeline'ą. | reikia sukurti: testas.md, praktika.md, vertinimas.md, sprendimai/ |

## 6. Atsiskaitymai

Kiekvienas atsiskaitymas: teorijos testas (30 klausimų, 35 min.) ir praktika (užduotis ar jų rinkinys, ~2 val.). Praeinamas balas ≥ 50 %. Mokyklos tvarkaraštyje patvirtintos tik 2026-11-30 ir 2026-12-17; kitų datų dar nėra.

| Nr | Data | Aplankas | Sritis |
|---|---|---|---|
| 1 | 2026-11-30 (patvirtinta) | 10 Atsiskaitymas 1 | Linux, Bash, Git, GitHub, projekto paleidimas |
| 2 | 2026-12-17 (patvirtinta) | 21 Atsiskaitymas 2 | Docker, Compose, MySQL konteineryje |
| 3 | 2027-01-20 | 32 Atsiskaitymas 3 | GitHub Actions: CI, image push |
| 4 | 2027-03-04 | 45 Atsiskaitymas 4 | Kubernetes pagrindai |
| 5 | 2027-03-25 | 56 Atsiskaitymas 5 | Helm, duomenys, stebėsena, derinimas |
| 6 | 2027-05-06 | 68 Atsiskaitymas 6 | Azure, infrastruktūra kodu, AKS |
| 7 | 2027-05-27 | 80 Baigiamojo projekto gynimas | Baigiamojo projekto gynimas |

Pasiūlytas vertinimas (**nepatvirtinta**): 1–6 etapų atsiskaitymai 40 %, baigiamasis projektas 30 %, egzaminas 30 % (praktika ~70 %, teorija ~30 %; egzaminas lokaliai, be Azure). Ankstesnis variantas: 7 atsiskaitymai po 7–8 % (50 %) ir egzaminas 50 %. Pasirinkti vieną prieš pirmą pažymį.

## 7. Senų pamokų panaudojimas

| Sena pamoka | Panaudojimas naujame projekte |
|---|---|
| 10.2 IS platformos ir serveriai | 01 Kas yra DevOps: pritaikyti iš `_saltiniai/` |
| 10.1 Įvadas ir GitHub | 08 GitHub Pull Request ir 01 paskaitos GitHub įvadas: pritaikyti |
| 12.2 Dockerfile ir PostgreSQL | 14 Pirmasis Dockerfile: pritaikyti, PostgreSQL keisti į MySQL |
| 12.3 Docker Compose (su sugadintos/) | 18 Docker Compose: pritaikyti |
| 12.4 Atsiskaitymas 1 | 21 Atsiskaitymas 2: pritaikyti |
| 11.1 Serverio komponentai, 11.2 RAID/NAS/SAN/UPS, 11.3 Virtualizavimas, 12.1 VM šablonai/LXC/Podman | nenaudojamos, lieka tik `_saltiniai/` |

Senas projektas lieka nepakeistas, naujas kuriamas atskirame aplanke. Senas programos failas `visi-metai-iki-finalinio-projekto.md` nebenaudojamas. Excel `DevOps_mokymo_planas_2026-2027.xlsx` (senas ISP planas) reikia atnaujinti pagal šį failą.

## 8. Vėliau, pagal tempą

Šios temos svarbios, bet dabar nededamos, kad kursas nebūtų per sunkus. Sprendimas sausio viduryje, kai bus matyti mokinių tempas ir kiek laiko liko:

1. Gilesnis saugumas (tinklo saugumas, TLS ir sertifikatai, pažeidžiamumų valdymas, paslapčių valdymas).
2. Monitoringas ir žurnalai plačiau (PromQL, Alertmanager, Loki).
3. Terraform plačiau (moduliai, state).
4. Ansible.

Jau yra plane: image skenavimas (20), Secrets ir RBAC/NetworkPolicy (39, 55), Prometheus ir Grafana (53), Bicep/Terraform pradmenys (65, 66), DevSecOps ir GitOps apžvalga (74, 75).

## 9. Pradinis projektas (Python + Flask + MySQL)

Dėstytojas paskelbia repo `devops-projektas` kaip GitHub template **iki 01 paskaitos (2026-11-11)**: mokiniai jį susikuria ir klonuoja jau pirmą dieną. 01–08 paskaitose su juo tik klonuojama, skaitomas kodas (pvz. ką daro `/health`), dirbama su šakomis ir Bash; pilnas paleidimas (9 paskaita, 2026-11-26) turi veikti iki tada. Reikalavimai:

1. Flask API su `/health` ir 2–3 maršrutais (pvz. `/items` sąrašas ir pridėjimas).
2. Prisijungimas prie MySQL tik per aplinkos kintamuosius (`DB_HOST`, `DB_USER`, `DB_PASSWORD`, `DB_NAME`); `.env.example` be tikrų reikšmių, `.env` į `.gitignore`.
3. Lokalus paleidimas be MySQL (SQLite pagal numatytuosius), kad 9 paskaitoje nereikėtų diegti MySQL. MySQL įjungiama 18 paskaitoje su Compose.
4. `schema.sql` ir `seed.sql`, kad mokiniams nereikėtų rašyti SQL.
5. `requirements.txt`, vienas paprastas `pytest` testas (24 paskaitai) ir `README` su paleidimu viena komanda.
6. Be Dockerfile, docker-compose ir workflow: tai mokiniai kuria patys 14, 18 ir 22–27 paskaitose.
7. Paskelbtas kaip GitHub „Template repository“. Prieš tai patikrinti, kad repo nėra privačių duomenų.

## 10. Darbų eiga ir terminai

| Iki kada | Ką paruošti |
|---|---|
| 2026-11-11 | template `devops-projektas`, viešas `devops-kursas` su README ir `kursas.sh`, 01 Kas yra DevOps su GitHub įvadu (~20 min.) |
| 2026-11-12 | 02 Linux terminalas |
| 2026-11-16 | 03–06 (Procesai ir paketai, Bash, Tinklai, SSH); prieš tai 10 min. diagnostinis testas (Bash, Git, Docker), nes Linux mokė Edgaras |
| 2026-11-24 | 07–09 (Git, GitHub PR, projekto paleidimas) |
| 2026-11-26 | Starteris pilnai veikia (paleidimas, MySQL, pytest) |
| Kiekvieną pamoką | iš vakaro `publikuoti.sh NN` (pamoka, užduotys, `check.sh`); kitos pamokos pradžioje praeitos pamokos sprendimas |
| 2026-11-30 | 10 Atsiskaitymas 1: testas (30 kl.), praktika, vertinimas.md, sprendimai |
| 2026-12-01 | 11–21 pagal etapą 2 (paeiliui, 4 per savaitę) |
| 2026-12-17 | 21 Atsiskaitymas 2 |

## 11. Atviri klausimai

1. **Tvarkaraštis po 2027-01-01.** Žinomas tik iki sausio 1 d. ir vasario DB modulis.
2. **Pavasario atostogos, STVA savaitės ir birželio konsultacijos** paimtos iš Excel plano ir nepatikrintos. Nuo jų priklauso, ar yra laisvų paskaitų.
3. **Linux paskaitos 02–06.** Edgaras mokė OS (2026-09-07 – 10-02). Patikrinti jo programą ir diagnostiniu testu nustatyti, kiek kartoti.
4. **Vertinimas.** 40/30/30 ar 7 atsiskaitymai po 7–8 % su 50 % egzaminu.
5. **Azure kreditai.** Pagal užrašus baigiasi apie 2026-12-06, o Azure pradedamas 2027-04-19. Reikia naujų kreditų ar mokyklos laiško.
6. **Pradinis repo.** Template `devops-projektas` reikalingas jau 2026-11-11 (bent kad susikurtų ir klonuotųsi), pilnai veikiantis iki 2026-11-26.
7. **Kubernetes etapas pertrauktas DB moduliu.** Po pertraukos pirmą paskaitą skirti kartojimui.
8. **Excel planas.** Atnaujinti pagal šį failą.
9. **Mokinių sistemos.** Ar visi turi Bash (Linux, Git Bash ar WSL)? Nuo to priklauso `kursas.sh`; atsarginis variantas kopijavimas rankomis pagal README.
10. **Repo pavadinimai.** `devops-projektas`, `devops-kursas` pasiūlyti, reikia patvirtinti.
11. **Privatumas.** Repo `Techin DevOps` turi būti privatus prieš bet kurį `git push`. Viešas `devops-kursas` kuriamas tuščias, prieš pirmą push peržiūrimas.

## 12. Pamokos formatas (trumpai)

Išsamios taisyklės `.claude/skills/pamoka-formatas/SKILL.md`. Esmė:

1. `pamoka.md`: `# <NN> <tema>`, `## Klasės darbas` numeruotas, „Demonstracija (~X min)“, nuorodos į oficialią dokumentaciją, schemos `## Schemos` (Mermaid arba Excalidraw).
2. `uzduotys.md`: Laikas, tikslas, „Darbai:“ numeruotas sąrašas (vienas tikrinamas veiksmas kiekvienas, DI darbas prieš paskutinį, paskutinis „Pateikimas: …“), ≥1 užduotis iš oficialios dokumentacijos (tik tikslas). Prie pamokos yra `check.sh` su išvestimi „OK“ arba „nepavyko, nes…“; sunkesniems žingsniams „jei nežinai, kaip“ užuomina.
3. Sprendimai (`mokytojas/sprendimai/<NN>/`, viešai perkeliami `publikuoti.sh`): tik tikri rezultatai (kodas, konfigūracijos, schemos), `projektas/` (projekto būsena pamokos pabaigoje, tik kai pamoka keičia projektą) ir `README.md`: „Patikrinta/Nepatikrinta“ po antraštės, „Kas čia“, „Kaip rodyti klasėje“ (planas su minutėmis, kitas pavyzdys nei mokinių, dažna klaida prie žingsnio), lentelė „Sprendimas pagal darbus“.
4. Paskaita 3 val.: ~20–30 min. teorijos, likusi dalis praktika; užduočių suma ~2–2,5 val.
5. Atsiskaitymo pamoka: `praktika.md`, `vertinimas.md` (lentelė kriterijus | taškai | kaip tikrinama), `testas.md` (30 klausimų, A–D), `atsakymai.md` ir praktikos sprendimai. Atsiskaitymo `testas.md`, `vertinimas.md`, `atsakymai.md` ir sprendimai yra tik `mokytojas/`; viešai tik užduotys be atsakymų.

## 13. Repo ir pamokų skelbimas

| Repo | Kam | Kas viduje | Kas mato |
|---|---|---|---|
| `devops-projektas` (GitHub template) | mokinio darbo projektas | Flask + MySQL starteris (9 skyrius) | visi |
| `devops-kursas` | kurso medžiaga | `README.md`, `kursas.sh`, `pamokos/<NN> <Pavadinimas>/` (`pamoka.md`, `uzduotys.md`, `check.sh`, paskelbus `sprendimai/`) | visi, mokiniai daro `git pull` |
| `Techin DevOps` | dėstytojo darbas | `programa/` (šis failas), `kursas/` (juodraštis), `mokytojas/` (sprendimai, atsiskaitymai, atsakymai), `_saltiniai/` (senos medžiagos kopija) | tik dėstytojas |

Eiga:

1. Medžiagą kuria Claude Code privačiame `Techin DevOps`. Demonstruoji tik iš jo (arba iš atskiro bandomojo projekto, sukurto iš template), tada netyčinis `git push` eina į privatų repo.
2. Pamokos dieną ar iš vakaro: `publikuoti.sh NN` nukopijuoja `pamoka.md`, `uzduotys.md` ir `check.sh` į atskirą `devops-kursas` aplanką. Peržiūri, paleidi slaptų duomenų paiešką (`grep -rIlE 'password|secret|token|BEGIN .*PRIVATE KEY|AccountKey' .`), tada pats `git commit` ir `git push`.
3. Pamokos pradžioje parodai sprendimą gyvai, mokiniai daro užduotis ir tikrinasi `check.sh`.
4. Kitos pamokos pradžioje `publikuoti.sh NN --sprendimai` įkelia praeitos pamokos sprendimą. Mokiniai daro `git pull`, palygina su savo darbu (galima su DI, bet be paslapčių ir `.env` turinio).
5. Jei kas nepavyko, `kursas.sh atstatyti NN` paima pamokos pabaigos būseną iš paskelbtų sprendimų. Prieš tai senas projektas perkeliamas į `projektas.atsarginis-<laikas>`, nieko netrinama, prašoma patvirtinimo. Neįkeltam sprendimui rodoma „sprendimas bus įkeltas kitos pamokos pradžioje“.

Skriptai (juos parašo Claude Code, `set -euo pipefail`, lietuviški komentarai): `kursas.sh atstatyti NN`, `kursas.sh patikrinti NN`, `publikuoti.sh NN [--sprendimai]`. Skriptai niekada nepaleidžia `git push` ir `rm`.

## 14. Šaltiniai

1. `DevOps_kurso_planas_81_paskaita.md` (2026-11-07): paskaitų turinys; pakeitimai: MySQL, 15 ir 16 sujungtos (iš viso 80), datos.
2. Mokyklos tvarkaraštis iki 2027-01-01 (Justina Balsė, 2026-10-26): atsiskaitymų datos 2026-11-30 ir 2026-12-17, formatas (30 klausimų, 35 min. teorija + praktika), atostogos, mokytojai.
3. Duomenų bazių modulio programa (60 val.) ir Teams pranešimas 2026-10-29: 2027-02-01 – 02-19, MySQL.
4. Svetainė su laiko juosta: claude.ai artefaktas „Naujas DevOps planas“.
5. Darbo eigos sprendimai (2026-11-07): template + viešas kursas + privatus Techin, sprendimai kitos pamokos pradžioje.
