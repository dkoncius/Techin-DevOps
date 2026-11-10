# 12.2 Sprendimai (dėstytojui)

Patikrinta: Mac Docker 29.9.2 (docker build, `id`, PostgreSQL su volume po `docker rm -f`, programa per tinklą, `/health`, `POST/GET /knygos`); Nepatikrinta: Mermaid schema `pamoka.md` (sintaksė neatvaizduota), hadolint (nėra), Ubuntu VM.

1. Kas čia: demonstracinė knygų aplikacija `knygynas/` (Flask + PostgreSQL) su multi-stage `Dockerfile`, `.dockerignore` ir vieno etapo `Dockerfile.single` palyginimui, bei pavyzdinis mokinio failas `docs/volume.md`. Mokiniai dirba su dėstytojo starteriu (kitas pavyzdys), čia rodoma tik demonstracija.
2. Kaip rodyti klasėje: demonstracijos planas (~25 min), pavyzdys `knygynas/` (mokinių starteris kitas). Komandos vykdomos aplanke `knygynas/`.
   1. (~5 min) Parodyti `Dockerfile`: du `FROM`, `COPY --from=build`, `USER 10001`. Mokiniai tuo metu skaito Dockerfile ir multi-stage dokumentaciją. Dažna klaida: `COPY . .` prieš `pip install` (cache nebeveikia).
   2. (~3 min) `.dockerignore` ir `docker build -t knygynas:1 .`. Mokiniai rašo savo Dockerfile ir `.dockerignore`. Dažna klaida: Dockerfile ne tame aplanke, iš kurio vykdomas build.
   3. (~3 min) `docker images knygynas` ir `docker run --rm knygynas:1 id` (turi būti `uid=10001`, ne `uid=0`). Mokiniai tą patį daro savo atvaizdui. Dažna klaida: pamiršta `USER`, `id` rodo `uid=0`.
   4. (~3 min) Palyginti su `docker build -f Dockerfile.single -t knygynas:single .` (pas mus ~238 MB prieš ~225 MB). Papildoma užduotis mokiniams. Dažna klaida: tikimasi didelio skirtumo; jis priklauso nuo to, ką build etape reikia kompiliuoti.
   5. (~4 min) Sukurti tinklą ir volume, `export DB_PASSWORD=$(openssl rand -hex 8)`, paleisti `postgres:16-alpine` su `-v pgdata:/var/lib/postgresql/data`. Mokiniai paleidžia savo DB. Dažna klaida: slaptažodis įrašytas į failą arba komandą; `psql` per anksti (reikia palaukti ~5 s).
   6. (~4 min) Įrašyti eilutę per `docker exec ... psql`, `docker rm -f db`, paleisti iš naujo, `SELECT` parodo eilutę. Mokiniai tą patį daro. Dažna klaida: iš naujo paleidžiama su kitu volume vardu arba be `-v`, duomenų nėra.
   7. (~3 min) Paleisti programą tame pačiame tinkle su `-e DB_HOST=db -e DB_PASSWORD="$DB_PASSWORD"` ir parodyti `curl localhost:8000/health` bei `POST/GET /knygos`. Mokiniai paleidžia savo programą pagal starterio README. Dažna klaida: bazės adresas `localhost` vietoj `db`; programa ne tame tinkle.
3. Sprendimas pagal darbus:

   | Darbas | Kur sprendime |
   |--------|---------------|
   | multi-stage Dockerfile | `knygynas/Dockerfile`: 2 `FROM`, `COPY --from=build`, `USER 10001` |
   | .dockerignore | `knygynas/.dockerignore` |
   | build, dydis, ne root | žingsniai 2 ir 3 (`docker images`, `id`) |
   | programos paleidimas | žingsnis 7 |
   | cache paaiškinimas | žingsnis 1: `requirements.txt` kopijuojamas prieš kodą |
   | tinklas, volume, DB | žingsnis 5 |
   | duomenys po `docker rm -f` | žingsnis 6 |
   | programa per vardą `db`, `/health` | žingsnis 7 |
   | be volume, volume prieš bind mount | `docs/volume.md` |
   | vieno etapo palyginimas, GHCR | `knygynas/Dockerfile.single`, žingsnis 4 |

   DI, PR ir pateikimas: aprašyta, ką paklausė ir kaip patikrino, pateikta sulieto PR nuoroda su išvestimis.

   Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose (vertinimas.md).
