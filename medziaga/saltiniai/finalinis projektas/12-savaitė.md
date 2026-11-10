# 12 savaitė. Programa, duomenų bazė ir Compose

Data: **2026-11-23 – 11-26**. **Atsiskaitymas 1** — **2026-11-26** (ketvirtadienis). Visa eiga — [iki-gruodzio.md](../programa/iki-gruodzio.md).

Lapas dėstytojui. Studentams duodate tik skyrių „Užduotis“. Skyrių „Instrukcijos dėstytojui“ paliekate sau. Skaidrės kaip OS kurse: teorija ir komandos skaidrėse, užduotis šiame lape.

OS kurso 11 temą studentai jau padarė: `hello-world`, `httpd`, `nginx`, savo svetainė per `Dockerfile`, MeTube ir trys tarnybos iš sąrašo. Skaidrėse girdėjo atvaizdą, registrą, prievadą `-p` ir volume. To nekartojame.

---

## Instrukcijos dėstytojui

Aplinka tokia pati kaip OS užduotyse: Ubuntu virtuali mašina, darbas terminale. Dockeris jau įdiegtas. Python paketų, PostgreSQL ir Nginx į pačią sistemą neįsidiegti. Jie būna atvaizduose.

Prieš paskaitas paruošti:

1. Mažą Python programą iš Karolinos kurso. Ji skaito bazės adresą ir slaptažodį iš aplinkos kintamųjų ir turi adresą, kuris atsako, pavyzdžiui `/health`. Programos kodo studentai nerašo.
2. Tuščią repozitoriją GitHub organizacijoje ir teisę kelti atvaizdą į GHCR.
3. Tris sugadintas `docker-compose.yml` bylas paskaitai ir vieną kitą atsiskaitymui. Atsakymų studentams neduoti. Tinkami gedimai:
   - bazės adresas parašytas `localhost`, nors bazė yra kitas konteineris;
   - nėra volume, todėl ištrynus konteinerį duomenys dingsta;
   - slaptažodis įrašytas programos kode, o ne `.env`;
   - prievadas užimtas arba nesutampa su tuo, kurį klauso programa.
4. ShiftPilot, FitBook ir kitų studentų projektų šią savaitę nenaudoti. Jie lieka savaitei po egzamino.

Tikrinate taip pat, kaip OS darbuose: matosi komanda ir bent dvi išvesties eilutės. Užtenka įklijuoti į README. Ekrano nuotrauka tinka, jei išvestis trumpa.

DI juodraštis leistinas. Studentas paaiškina, kodėl bazė vadinasi serviso vardu, pavyzdžiui `db`, o ne `localhost`. Jei nepaaiškina, darbo nėra.

---

## Užduotis

Tikslas: savo Python programa ir PostgreSQL pakyla viena komanda, duomenys išlieka.

Dockerį jau mokate. `hello-world`, `httpd`, `nginx` ir savo svetainės iš naujo nedarote. PostgreSQL, Nginx ir Python paketų į Ubuntu neįsidiegite.

Gaunate mažą Python programą. Ją įdedate į savo GitHub repozitoriją. Grafinę aplinką naudokite tik rezultatui patikrinti.

### 1. Dockerfile

1. Parašykite `Dockerfile` gautai programai.
2. Padarykite du etapus. Pirmas įdiegia priklausomybes. Antras palieka tik tai, ko reikia paleisti.
3. Sukurkite atvaizdą ir paleiskite konteinerį. Programos patikros adresas turi atsakyti.
4. Įkelkite atvaizdą į GHCR. README įrašykite atvaizdo dydį prieš sumažinimą ir po jo.

### 2. Duomenys ir tinklas

5. Paleiskite PostgreSQL konteinerį su volume.
6. Paleiskite programą tame pačiame tinkle. Bazės adresas yra konteinerio vardas, ne `localhost`.
7. Slaptažodį perduokite aplinkos kintamuoju. Į programos kodą ir į git jo nerašykite.
8. Įrašykite vieną eilutę į bazę. Ištrinkite konteinerį ir sukurkite iš naujo su tuo pačiu volume. README parodykite, kad eilutė liko.

### 3. Compose

9. Parašykite `docker-compose.yml` su programa ir baze.
10. Slaptažodį laikykite `.env`. Į repozitoriją dėkite tik `.env.example`.
11. Iš švarios kopijos komanda `docker compose up -d --build` pakelia programą ir bazę.
12. Pataisykite tris dėstytojo duotas sugadintas compose bylas. Prie kiekvienos README parašykite vieną sakinį, ką radote per `docker logs`.

### 4. Atsiskaitymas, 2026-11-26

Testas iš 30 klausimų. Temos: IS platformos ir gyvavimo ciklas, serverio komponentai, RAID, NAS, SAN, virtualizacija, HTTP ir REST, Docker, Podman, Compose.

Praktika:

13. Virtualioje mašinoje repozitorija iš GitHub pasileidžia viena komanda.
14. Duomenys po konteinerio perkūrimo lieka. Tai matosi README.
15. Pataisote vieną naują sugadintą compose bylą ir paaiškinate priežastį.

Vertinama: konteineriai veikia, paleidimas yra viena komanda, duomenys išlieka, repozitorija tvarkinga, trikties priežastis paaiškinta.
