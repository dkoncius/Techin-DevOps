# Įgyvendinimo planas: kaip kuo greičiau pastatyti veikiančią DevOps grandinę

Planas dėstytojui ir studentams. Egzamino užduotis aprašyta atskirai: [uzdoties_aprasymas.md](uzdoties_aprasymas.md). 12 savaitės praktinė užduotis: [12-savaitė.md](12-savaitė.md).

---

## 1. Tikslas ir principai

| Laukas | Aprašymas |
|--------|-----------|
| **Tikslas** | Kuo greičiau turėti veikiančią grandinę: git push → GitHub Actions (lint, testai, build) → atvaizdas į GHCR → Argo CD → k3s → HTTPS svetainė. Ji yra dėstytojo etalonas ir pagrindas studentų etapų projektams. |
| **Mokymo būdas** | Etalonas statomas vienu etapu pirma už grupę. Kiekviename etape: parodyti → išardyti → sugadinti → perstatyti nuo nulio kitai aplikacijai (etapo projektas). Egzamino projektas atskiras ir naujas. |
| **Aplinka** | Sav. 10–28: studentų kompiuteris arba GitHub Codespaces ir vienas bendras k3s serveris (namespace kiekvienam). Azure kiekvienam studentui tik sav. 31–33, su B serija ir atsarginiais variantais A/B/C. |
| **Ko vengti pradžioje** | Vault, ELK, AKS ir atskiras VM kiekvienam studentui. Jie ilgina pradžią, o MVP grandinei nereikalingi. |
| **Biudžetas** | Apie 500 € per metus: bendras VM veikia tik paskaitų ir namų darbų metu su auto-shutdown; Azure per studentą tik sav. 31–33. Skaičiai apytiksliai, juos reikia patikrinti Azure kainų skaičiuokle. |

---

## 2. Veiksmų planas pagal fazes

| Fazė | Kada | Ką padaryti | Rezultatas | Priklauso nuo | Rizika / atsarginis variantas |
|------|------|-------------|------------|---------------|--------------------------------|
| **0** | Iki 2026-11-09 (prieš 10 sav.) | GitHub organizacija ir GitHub Education paraiška. Šablono repozitorija: Flask su `/health` ir `/metrics`, testai, Dockerfile, pirmas workflow, `devcontainer.json`. Studentų paskyrų sąrašas. Techninės įrangos apklausa (RAM, OS) 10.1 paskaitoje. | Studentai gali pradėti per Codespaces arba vietinį Docker, be mokyklos infrastruktūros. | — | Jei Education nepatvirtintas: viešos repozitorijos (neribotos Actions minutės). |
| **1** | Sav. 10–11 (2026-11-09 – 11-20) | 1 etapo etalonas: Dockerfile, Compose su DB ir Nginx, pirmas Actions workflow, atvaizdas į GHCR. Užsakyti domeną (~10 €/mėn.) ir wildcard DNS. Pradėti bendro VM paruošimą (Docker, k3s). | 1 etapo etalonas paruoštas anksčiau už grupę; domenas veikia. | 0 fazė | Jei VM nespėja: 12 sav. užduotis vyksta lokaliai. |
| **2** | Sav. 12 (iki 2026-11-27) | Bendras VM: k3s, Traefik, Argo CD, GHCR prieiga. MVP grandinė veikia nuo commit iki HTTPS. Scenarijus: namespace, RBAC, kvota ir kubeconfig kiekvienam iš 30 studentų. Kaupiamasis 1. Studentų praktika: [programa, bazė ir Compose](12-savaitė.md). | MVP grandinė veikia; 30 namespace paruošta. Kiekvienas iš švarios kopijos paleidžia programą ir bazę per `docker compose`. | 1 fazė | Kasdienis VM snapshot. ResourceQuota, kad vienas studentas nesugadintų visų. |
| **3** | Sav. 13–14 (2026-11-30 – 12-10) | 2 etapo etalonas: Helm chart, ConfigMap/Secret, Ingress su TLS. Ansible ir kaupiamasis 2 slenka po 2027-01-04, nes 2026-12-14–01-01 tvarkaraštyje atostogos. | Studentai diegia savo Helm chart į savo namespace. | 2 fazė | Jei klasteris perkrautas: Compose pavyzdys kaip alternatyva. |
| **4** | Sav. 17–19 (2027-01-04 – 01-22) | 3 etapas: pipeline šablonas ir komandos projektas (Scrum, PR, testai). Etalonas: perpanaudojamas workflow. Kaupiamasis 3 (gynimas). | Komandos pipeline šablonai ir tarpinio projekto gynimas. | 3 fazė | Komandos dydis 3–4 žmonės; gynime individualus klausimas. |
| **5** | Sav. 20, 24, 25 (2027-01-25 – 03-05) | 4 etapas: saugumas (TLS, SSH, ugniasienė, WAF, Trivy/SAST, paslaptys). Pažeidžiamas stendas auditui. Kaupiamasis 4. | Apsaugotas stendas ir ataskaita „prieš ir po“. | 4 fazė | Jei laiko trūksta: Vault tik apžvalgai. |
| **6** | Sav. 26–28 (2027-03-08 – 03-26) | 5 etapas: Prometheus, Grafana, Loki, Restic, Terraform, Argo CD. Kaupiamasis 5. | Stebėjimo paketas ir atkūrimo įrodymas. | 5 fazė | Jei silpni kompiuteriai: lengvas Compose monitoringas. |
| **7** | Iki 2027-04-16 (prieš 31 sav.) | Nuspręsti Azure variantą: A (mokyklos prenumerata, resource group kiekvienam), B (Azure for Students), C (lokalus variantas). Išbandyti Terraform modulį ir biudžetus. | Aiškus Azure variantas ir veikiantis testas. | Atsakymai iš IT skyriaus | Iki 24 sav. gauti atsakymus ir kvotas. C variantas visada paruoštas. |
| **8** | Sav. 31–36 (2027-04-19 – 05-28) | 6 etapas Azure. FINAL projektas ir gynimas. Incidentų pratybos. Kaupiamieji 6 ir 7. | Studentų portfolio projektai gyvi ir apginti. | 7 fazė | Jei Azure nepasiekiamas: C variantas ir dėstytojo demonstracija. |
| **9** | Iki 2027-05-31 | Parengti egzamino scenarijų (nauja aplikacija), vertinimo lapą, 3–4 gedimų scenarijus ir patikrinimo scenarijų. | Egzaminas paruoštas 2027-06-14 – 06-25 laikotarpiui. | Etalono patirtis | Egzamino projektas negali sutapti su etapų projektais. |

---

## 3. Kiti darbai ir atsakomybės

| Nr. | Kas | Ką | Kada | Atsakingas | Pastaba |
|-----|-----|----|------|------------|---------|
| 1 | IT skyrius | Azure administratoriaus teisės, Entra ID paskyros, kvotos, biudžetai, Policy | Iki 24 sav. (A variantui) | IT skyrius | Žr. lapą „Klausimai“ |
| 2 | Dėstytojas | Šablono repozitorija ir devcontainer | Prieš 10 sav. | Dėstytojas | Gali paruošti Claude pagal pageidavimą |
| 3 | Dėstytojas | VM paruošimo scenarijus (Docker, k3s, Traefik, Argo CD) | Iki 12 sav. | Dėstytojas | Viena komanda, kad VM būtų atkuriamas |
| 4 | Dėstytojas | Studentų namespace scenarijus | Iki 12 sav. | Dėstytojas | 30 žmonių per vieną komandą |
| 5 | Dėstytojas | Etapų etalonai (vienu etapu pirma) | Per visą kursą | Dėstytojas | Etapų projektai kitoms aplikacijoms |
| 6 | Dėstytojas | Egzamino scenarijus ir gedimai | Iki 2027-05-31 | Dėstytojas | Atskirti nuo etapų projektų |
| 7 | Dėstytojas | Pagalbos pavyzdys iš FitBook ir savaitė po egzamino | Po 2027-06-25, kol k3s dar įjungtas | Dėstytojas | Žr. [studentu-darbai/README.md](studentu-darbai/README.md) |

---

## 4. Po kurso: pagalba saviems projektams

Keturi studentų projektai guli `studentu-darbai/`. Etapams ir egzaminui jų nenaudoti. Pagalba yra viena savaitė po egzamino: tas pats Helm chart ir workflow keturioms programoms. Pavyzdys ruošiamas iš FitBook. Kaip tai padaryti aprašyta [studentu-darbai/README.md](studentu-darbai/README.md).

- [ ] Kurso etalonas veikia iki HTTPS anksčiau, nei liečiamas FitBook
- [ ] FitBook forkas kurso organizacijoje. Į studentų `origin` nepushinti
- [ ] Pavyzdinis pakeitimas: multi-stage API, atskiras React atvaizdas, paslaptys ne compose faile, tikras workflow vietoje „always pass“, Helm `values`, be pgAdmin
- [ ] Vieno puslapio „prieš / po“ lapas studentams
- [ ] Tas pats chart Skaidrinam, MySavings ir ShiftPilot, skiriasi tik `values` ir Dockerfile
- [ ] Sutarta savaitė po 2027-06-25: kiekviena komanda išeina su atvaizdu GHCR, adresu ir README
