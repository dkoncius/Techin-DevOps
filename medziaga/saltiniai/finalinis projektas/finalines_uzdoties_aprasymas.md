# Finalinė užduotis: „Mini platformos“ pastatymas, apsauga ir priežiūra

**Egzaminas, 39–40 savaitės**

Egzamino projektas yra atskiras nuo etapų projektų: naujas scenarijus ir nauja aplikacija, kurių studentai iš anksto nemato. Jis tikrina, ar studentas gali pritaikyti viską, ką išmoko etapų projektuose, naujam atvejui.

---

## 1. Bendras aprašas

| Laukas       | Aprašymas |
|--------------|-----------|
| **Paskirtis** | Egzamino užduotis sujungia visą kursą ir kartu yra demonstracija, ką studentai išmoksta: nuo serverio iki stebimos, apsaugotos, atkuriamos platformos. |
| **Scenarijus** | Maža įmonė turi Python (Flask) API su PostgreSQL. Studentas kaip junior DevOps inžinierius turi paruošti platformą nuo nulio, įdiegti programą ir parodyti, kad ji veikia, yra apsaugota, stebima ir atkuriama. |
| **Formatas** | Individualiai, ~6 val. (2 paskaitos) arba 2 dienos su gynimu. Duodama repozitorija su programos kodu ir trumpas techninis reikalavimų dokumentas. |
| **Leidžiama** | Naudoti kursų medžiagą, dokumentaciją ir DI įrankius (kaip 33.3 paskaitoje), bet kiekvienas sprendimas turi būti paaiškintas gynime. |

---

## 2. Reikalavimai (ką turi pateikti)

| Kodas | Sritis | Reikalavimai |
|-------|--------|--------------|
| **A** | **Infrastruktūra** | VM arba debesies resursai sukurti per Terraform arba Ansible (ne rankomis); SSH tik su raktu; ugniasienė leidžia tik reikalingus portus. |
| **B** | **Konteineriai** | Dockerfile (multi-stage, non-root), compose lokaliam testui, atvaizdas registry su versijos žyma. |
| **C** | **CI/CD** | GitHub pipeline: lint, testai, saugumo skanavimas (SAST, Trivy), build, push, diegimas į k3s per Helm arba Argo CD. |
| **D** | **Kubernetes** | Deployment su probes ir resource limits, ConfigMap/Secret, Ingress su TLS, PostgreSQL su PVC. |
| **E** | **Saugumas** | Paslaptys ne repozitorijoje (Vault arba CI kintamieji), Nginx saugumo antraštės, trumpa rizikų lentelė. |
| **F** | **Stebėjimas** | Prometheus ir Grafana dashboard (RED metrikos), bent 2 perspėjimai, logai Loki. |
| **G** | **Kopijos ir atkūrimas** | Automatizuota duomenų bazės kopija (Restic arba `pg_dump`), įrodytas atkūrimas po sąmoningo gedimo; nurodyti RTO ir RPO. |
| **H** | **Dokumentacija ir gynimas** | README „kaip pakelti nuo nulio“, architektūros schema, runbook; gynimas 15 min su gyva demonstracija ir vieno sugedusio komponento taisymu. |

---

## 3. Vertinimo rubrika (100 balų)

| Kriterijus | Ką vertiname (stiprus lygis) | Balai | Silpnas lygis |
|------------|------------------------------|-------|---------------|
| Infrastruktūra kaip kodas | Viskas atkartojama viena komanda, kodas tvarkingas, kintamieji | 15 | Dalis padaryta rankomis |
| Konteineriai ir CI/CD | Pilnas pipeline be kritinių radinių, versijuoti atvaizdai | 20 | Pipeline nepilnas ar raudonas |
| Kubernetes ir diegimas | Helm/Argo CD diegia, probes, TLS, PVC veikia | 15 | Manifestai neveikia be pataisų |
| Saugumas | Paslaptys atskirtos, antraštės, skanavimas, rizikų lentelė | 15 | Slaptažodžiai kode |
| Stebėjimas ir kopijos | Dashboard, 2 perspėjimai, logai, įrodytas atkūrimas, RTO/RPO | 20 | Nėra atkūrimo įrodymo |
| Dokumentacija ir gynimas | Aiški dokumentacija, gynimas, sugedusio komponento taisymas | 15 | Nesupranta savo sprendimų |
| **Viso** | | **100** | |

---

## 4. Ką turi parengti dėstytojas (kol kas tik aprašas)

| Elementas | Aprašymas |
|-----------|-----------|
| **Etaloninis sprendimas** | Dėstytojas pats pastato visą platformą pagal užduotį ir išsaugo GitHub repozitorijoje: tai ir demonstracija studentams (kurso pradžioje, 10.1), ir vertinimo etalonas. |
| **Pradinė medžiaga** | Flask API su DB, testais ir pavyzdiniais endpoint’ais; aprašas; leidžiamas laikas; vertinimo lapas. |
| **Sugedusio komponento scenarijai** | 3–4 paruošti gedimai (blogas Secret, pilnas diskas, neteisingas Ingress, sugadinta DB), kuriuos egzamino metu paskiriame atsitiktinai. |
| **Patikrinimo scenarijus** | Trumpas scenarijus, kuris automatiškai patikrina HTTP atsakymą, TLS, metrikų endpoint’ą ir DB kopiją. |
| **Laikas pasiruošimui** | Apytiksliai 2–3 dienos etaloniniam sprendimui ir paruoštukams. |
