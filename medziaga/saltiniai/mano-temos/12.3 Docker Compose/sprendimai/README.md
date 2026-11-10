# 12.3 Sprendimai (dėstytojui)

Patikrinta: Mac Docker (Compose): `docker-compose.yml` (up, `/health` 200, duomenys išlieka po `down`/`up`, `nginx -t`), `docker-compose.balansavimas.yml` (du adresai, vienas po `stop api1`), `pataisyta-1..3.yml` ir `demo/compose.yml` paleisti; sugadintų bylų simptomai patvirtinti. Mermaid schema `pamoka.md` neatvaizduota, prieš pamoką peržiūrėkite.

1. Kas čia: pavyzdinis mokinio projektas (mažas Flask užrašų API `app/`, `nginx/`, compose failai, `docs/`) ir `pataisyta-1..3.yml`. Demonstracinis pavyzdys `demo/` (kino bilietai) skiriasi nuo mokinių.
2. Kaip rodyti klasėje: demonstracijos planas (~25 min). Demonstracija: kino bilietai, `demo/compose.yml`: `db`, dvi kasos (`kasa1`, `kasa2`) ir Nginx. Mokiniai po to daro tą patį su savo aplikacija.
   1. (~3 min) Parodyti `demo/compose.yml` ir paaiškinti servisus. Mokiniai atsidaro savo starterio README. Dažna klaida: portas ar atvaizdas paimtas iš demo, o ne iš starterio.
   2. (~4 min) `export DB_PASSWORD=$(openssl rand -hex 8)`, `docker compose -p kinas up -d`, `docker compose -p kinas ps`. Mokiniai kuria `.env` ir `.gitignore`. Dažna klaida: `.env` patenka į Git.
   3. (~3 min) Parodyti `healthcheck` ir `depends_on` su `service_healthy`. Mokiniai rašo `db` servisą. Dažna klaida: `depends_on` be `condition` laukia tik paleidimo, ne pasirengimo.
   4. (~4 min) `for i in 1 2 3 4; do curl -s localhost:8081 | grep ^Name; done` rodo `kasa1`, `kasa2` pakaitomis; paaiškinti `upstream` ir `zone`. Mokiniai rašo `nginx/default.conf`. Dažna klaida: be `zone` kelių Nginx darbininkų skaitliukai atskiri, todėl gali rodyti vieną kasą.
   5. (~3 min) `docker compose -p kinas stop kasa1` ir pakartoti ciklą: lieka tik `kasa2`. Mokiniai paleidžia savo steką. Dažna klaida: po `stop` `nginx -t` rodo „host not found“; tikrinti prieš stabdant.
   6. (~3 min) `docker compose -p kinas down`, `up -d`: duomenys išlieka (volume). Mokiniai tikrina persistence savo projekte. Dažna klaida: `down -v` ištrina duomenis.
   7. (~5 min) Sugadintų bylų diagnozė: parodyti kelią klaida → hipotezė → pataisymas → patikra. Mokiniai ima `sugadinta-N.yml`. Dažna klaida: bylos paleidžiamos ne projekto šaknyje (nėra `./app`) arba nenustatytas `DB_PASSWORD`.
   Pabaigoje: `docker compose -p kinas down -v` (tik demo projektas).
3. Sprendimas pagal darbus:

   | Darbas | Kur sprendime |
   |--------|---------------|
   | .env.example ir .gitignore | `.env.example`, `.gitignore` |
   | compose trys servisai | `docker-compose.yml` |
   | healthcheck ir depends_on | `docker-compose.yml`, servisas `db` ir `api` |
   | Nginx proxy | `nginx/default.conf` |
   | persistence ir restart | `docker-compose.yml`: volume `pgdata`, `restart: unless-stopped` |
   | trys sugadintos bylos | `pataisyta-1.yml`, `pataisyta-2.yml`, `pataisyta-3.yml`, `docs/sugadintos.md` |
   | balansavimas | `docker-compose.balansavimas.yml`, `nginx/balansavimas.conf`, `docs/balansavimas.md` |
   | HTTP pažiūra ir REST | `docs/balansavimas.md`; `curl -v`, POST/GET `/notes` |

   README, DI, PR ir pateikimas: README „Kaip paleisti/patikrinti“ yra priėmimo sąlyga; PR per šaką, DI aprašyta, pateikta PR nuoroda.

   Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose (vertinimas.md).
