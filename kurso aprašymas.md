# DevOps kursas

79 paskaitos po 3 valandas (17:30–20:40), 2026-11-11 – 2027-05-27. Datos nuo 2027 m. orientacinės. Dėstytojas Deividas Koncius.

## 1 etapas. Linux, Bash, patikra ir projekto paleidimas (27 val.)

1.1. Kas yra DevOps ir pirmas Git kelias aplanke git-bandymas  
1.2. Linux terminalas: žinomas terminalas, skriptas, export, paketas ir pirmas Pull Request  
1.3. Bash: argumentai, sąlygos, ciklai, išėjimo kodai, stdout ir stderr, .gitignore  
1.4. Bash skripto tikrinimas: išvestis, kodas, palyginimas, sugadintas atvejis  
1.5. Git būsenos tikrinimas: init, add, commit, push eiliškumas, git rm --cached ir patikros  
1.6. Tinklai praktikoje: portai, HTTP kodai, curl ir patikra per curl  
1.7. Savo projekto kopija iš šablono, paleidimas vietoje, .env, [paleisti.sh](http://paleisti.sh) ir [tikrinti.sh](http://tikrinti.sh)  
1.8. Skriptų rašymo praktika: mažas projektas su klaidomis, savo patikra, sugadinti atvejai  
1.9. Atsiskaitymas: projektas su klaidomis, Bash ir Git patikra, Pull Request

Šiame etape 1.2 yra viena pamoka vietoje dviejų: pwd, ls, grep ir ps tik pasitikrinami, nes tai jau išlaikyta pas Edgarą. 1.4–1.5 pamokose išmokstama patikros: paleisti, užfiksuoti išvestį ir kodą, palyginti, ir tą patį padaryti su sugadintu atveju. Iš pradžių tikrinamas Bash skriptas, paskui Git būsena. Flask programos nerašo: 1.7 pamokoje iš šablono susikuria savo repozitoriją, ją paleidžia ir parašo `paleisti.sh` bei `tikrinti.sh`. Atsiskaitymas 2026-11-30 vyksta ant projekto su klaidomis. Docker prasideda 2.1 pamokoje.

## 2 etapas. Docker ir pirmas workflow (33 val.)

2.1. Pirmasis Dockerfile projektui
2.2. Mažesnis image: cache, `.dockerignore`, multi-stage
2.3. Docker Compose: programa ir MySQL, volume ir tinklas toje pačioje pamokoje
2.4. Ne root vartotojas ir image skenavimas
2.5. Sugadintų Dockerfile ir Compose taisymas
2.6. Pirmas GitHub Actions workflow: `on`, `jobs`, `steps`
2.7. Testai kiekviename Pull Request
2.8. `main` apsauga: PR nesijungia, jei testai raudoni
2.9. Workflow, kuris paleidžia `docker build` ir dar nekelia į registrą
2.10. Docker kartojimas prieš atsiskaitymą
2.11. Atsiskaitymas: `docker compose up`, mažesnis image, veikia be root

*Šiame etape studentai supakuoja tą patį projektą į konteinerį ir paleidžia jį kartu su MySQL viena komanda. SQL nerašo: duomenų bazės modulis dar nepraėjęs. Taip pat parašo pirmą workflow, kuris paleidžia testus. Atsiskaitymas 2026-12-17 tikrina Docker, ne registrą.*

## 3 etapas. GitHub Actions tęsinys (27 val.)

3.1. Runner'iai ir actions iš Marketplace
3.2. Image įkėlimas į GitHub Container Registry
3.3. Secrets ir aplinkos
3.4. Cache, matrix ir artefaktai
3.5. Image tag'as ir release
3.6. Pakartotinai naudojami workflow
3.7. Sugadintų workflow taisymas
3.8. Viena praktika: nuo PR testo iki image
3.9. Atsiskaitymas: PR paleidžia testus, `main` šaka sukuria ir išsaugo image

*Šiame etape studentai pratęsia gruodį pradėtą workflow: image atsiranda registre, o paslaptys lieka Secrets. Trys praktikos sujungtos į vieną. Atsiskaitymas 2027-01-18.*

## 4 etapas. Kubernetes pagrindai (39 val.)

4.1. Kam reikia Kubernetes ir kaip jis sudėtas
4.2. Lokalus klasteris ir `kubectl`
4.3. Pod: paleidimas, log'ai, exec
4.4. YAML ir `kubectl apply`
4.5. Deployment, rolling update ir rollback
4.6. Service
4.7. ConfigMap ir Secret
4.8. Kartojimas po DB modulio ir namespace
4.9. Liveness ir readiness probe'ai
4.10. Ingress
4.11. Requests ir limits
4.12. Sugadintų Pod ir Service taisymas
4.13. Atsiskaitymas: projektas ir duomenų bazė veikia klasteryje

*Šiame etape studentai paleidžia projektą lokaliame klasteryje ir pasiekia jį per Ingress. DB modulis yra tarp 4.7 ir 4.8. Python kodą skaito iš to, ką išmoko pas Karoliną, SQL iš DB modulio. Atsiskaitymas 2027-03-02.*

## 5 etapas. Kubernetes praktikoje (39 val.)

5.1. PersistentVolume, PVC ir StorageClass
5.2. StatefulSet duomenų bazei
5.3. Jobs ir CronJobs
5.4. Helm: esamų chart'ų naudojimas
5.5. Savo Helm chart'as
5.6. Helm values skirtingoms aplinkoms
5.7. Automatinis plėtimasis ir apkrovos testas
5.8. Prometheus ir Grafana
5.9. Log'ai ir trikčių paieška
5.10. RBAC ir NetworkPolicy
5.11. Atsiskaitymas: diegimas su Helm ir trijų klaidų taisymas klasteryje
5.12. TLS ir sertifikatai ant jau veikiančio Ingress
5.13. PromQL, Alertmanager ir Loki

*Šiame etape studentai supakuoja projektą kaip Helm chart ir moka rasti, kodėl Pod nepasileidžia. Duomenų bazės pamoka prasideda trumpu SQL prisiminimu, nes vasario modulis jau būna pasibaigęs, o jis eina po Karolinos Python kurso. Atsiskaitymas 2027-03-23 to netikrina. 5.12 ir 5.13 eina po jo, kai klasteris jau stovi.*

## 6 etapas. Azure (36 val.)

6.1. SSH raktas, tada Azure portalas, subscription ir resource group
6.2. Azure CLI ir kaštų kontrolė
6.3. Entra ID ir RBAC
6.4. Azure Container Registry
6.5. Container Apps arba App Service
6.6. AKS klasteris ir registras
6.7. Helm chart'o įdiegimas į AKS
6.8. Valdoma MySQL ir Key Vault
6.9. Infrastruktūra kodu: Bicep arba Terraform
6.10. AKS ir registras aprašyti kodu
6.11. Azure Monitor
6.12. Atsiskaitymas: infrastruktūra sukuriama iš kodo, po darbo resursai ištrinami

*Šiame etape studentai perkelia projektą į Azure ir aprašo infrastruktūrą kodu, kad resursai būtų kuriami ir trinami viena komanda. SSH raktas dėstomas šio etapo pradžioje. Atsiskaitymas 2027-05-06.*

## 7 etapas. Pilnas pipeline ir baigiamasis projektas (36 val.)

7.1. Diegimas į Azure iš GitHub Actions per OIDC, be slaptažodžio
7.2. Pilnas pipeline: testas, build, registras, Helm į AKS
7.3. Staging ir production, rankinis patvirtinimas
7.4. Deploy strategijos: rolling, blue-green, canary, rollback
7.5. Infrastruktūros pipeline
7.6. GitOps ir skenavimas pipeline'e, viena pamoka
7.7. Terraform moduliai ir state
7.8. Ansible jau turimam serveriui
7.9. Incidento imitacija
7.10. Baigiamasis projektas
7.11. Baigiamasis projektas, konsultacijos
7.12. Baigiamojo projekto gynimas

*Pipeline iki AKS sudedamas 7.1–7.5. Tada, kai tą kelią jau moka, eina Terraform moduliai ir Ansible. Incidente prisimena Python ir SQL ir pataiso vieną eilutę. Gynimas 2027-05-27.*

## Baigiamoji užduotis (9 val.)

1. Reikalavimų apžvalga: trys lygiai, kiekvienas apima ankstesnį
2. Savarankiškas darbas ir dėstytojo konsultacijos
3. Gynimas: kelias nuo commit iki serverio, pakeitimas per Pull Request, sugadintos dalies taisymas
4. Rezultatų apžvalga

*Vertinama, ar studentas paleidžia programą su duomenų baze, sujungia testus, image ir diegimą, o gynime paaiškina tą kelią ir pataiso sugadintą dalį. Darbas individualus. Galima daryti poroje, gynimas individualus. Klasėje tam skirtos trys paskaitos: dvi darbui ir viena gynimui. Etalonas yra aplanke* `kursas/Finalinis projektas/`*.*

## Kaip vyksta pamoka

1. Dėstytojas trumpai paaiškina temą ir gyvai parodo kitu pavyzdžiu.
2. Užduotis atsiduria Teams'e. Ją darote savo kompiuteryje, baigę gaunate kitą.
3. Kitos pamokos pradžioje dėstytojas parodo sprendimą ir aptariate, kas liko neaišku.
4. Kasdienių užduočių dėstytojas netikrina. Vertinama atsiskaitymuose.
5. Užduotį galite daryti su DI pagalba, bet atsakymą patikrinate patys. Slaptažodžių, raktų, tokenų ir `.env` turinio nekeliate į DI ir į Git.

## Kurso projektas

Vienas projektas visą kursą: Python (Flask) su MySQL, keliai `/health` ir `/items`. Programos ir SQL iš naujo nerašote: Python skaitote iš to, ką išmokote pas Karoliną, SQL iš vasario DB modulio. 1 etapo pradžioje dirbate `git-bandymas`. 1.6 pamokoje iš GitHub šablono susikuriate savo `devops-projektas`. Dockerfile, Compose, workflow ir Helm chart'ą rašote patys.

## Atsiskaitymai

Kiekvienas atsiskaitymas: testas (30 klausimų, 35 min.) ir praktika (~2 val.).

| Etapas | Data | Sritis |
|---|---|---|
| 1 etapas | 2026-11-30 | Linux, Bash, Git, tinklai, projekto paleidimas |
| 2 etapas | 2026-12-17 | Docker, Compose, MySQL konteineryje |
| 3 etapas | 2027-01-18 | GitHub Actions: testai per PR, image registre |
| 4 etapas | 2027-03-02 | Kubernetes pagrindai |
| 5 etapas | 2027-03-23 | Helm, duomenys, stebėsena, derinimas |
| 6 etapas | 2027-05-06 | Azure, infrastruktūra kodu, AKS |
| 7 etapas | 2027-05-27 | Baigiamojo projekto gynimas |

Pirmų dviejų datos patvirtintos, kitos orientacinės. Atsiskaitymų praktikos įvertinimai skaičiuojami paprastu vidurkiu ir sudaro 40 % egzamino praktikos įvertinimo.

## DI kurse

DI galima naudoti klaidoms paaiškinti ir komandoms pasiūlyti. Rezultatą reikia paleisti ir patikrinti patiems. Slaptų duomenų į DI nekeliame. Atsiskaitymuose ir testuose DI nenaudojamas. Daugiau: `medziaga/di-kurse.md`.

## Egzaminai kurso pabaigoje

Kurso pabaigoje laikomi du egzaminai (tikėtina birželio 15–25 d., datas mokykla paskelbs 2027 sausį):

1. **Teorijos egzaminas.** 80–100 klausimų iš visų etapų, 2 val., kompiuteriu, niekuo naudotis negalima. Rezultatas iškart.
2. **Praktikos egzaminas.** 3–4 val., mokyklos kompiuteriais. Jį laikyti galite, jei teorijos egzamine surinkote 50 % ar daugiau. Neišlaikius teorijos, rašomas prašymas perlaikymui.

Kurso eigoje surinkti praktinių atsiskaitymų įvertinimai sudaro 40 % egzamino praktikos įvertinimo. Egzaminą vis tiek reikia laikyti. Baigiamasis projektas yra praktinis atsiskaitymas ir didesnio svorio neturi. Pažymiai du: už teoriją ir už praktiką.

Praktikos egzamine galima naudotis savo darbais GitHub'e. Egzaminų uždavinių nerašo dėstytojas. Komisijoje: išorės vertintojas ir du TECHIN dėstytojai. Klausimus apie egzaminų organizavimą spręskite su IT skyriaus vadybininke Justina.

## Ką žinoti dar

1. Datos po 2027-01-01 skaičiuotos ir gali keistis. Duomenų bazių modulis yra 2027-02-01 – 02-19.
2. Detali 79 pamokų lentelė: `medziaga/kurso-planas.md`.
