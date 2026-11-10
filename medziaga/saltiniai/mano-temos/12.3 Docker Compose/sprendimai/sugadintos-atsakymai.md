# 12.3 sugadintos compose bylos: atsakymai (TIK MOKYTOJUI)

Failai: `../sugadintos/sugadinta-1.yml`, `sugadinta-2.yml`, `sugadinta-3.yml`. Mokiniai juos gauna be šio failo. Visos trys bylos tikrintos su `docker compose config` (pirma ir trečia lūžta, antra praeina, bet nuspaudus `up` neveikia).

Bylas paleisti reikia projekto aplanke, kuriame yra `./app` (su Dockerfile) ir `./nginx/default.conf`, o `DB_PASSWORD` nustatytas aplinkoje (`export DB_PASSWORD=$(openssl rand -hex 8)`).

## Byla 1: neleistinas raktas

- **Klaida:** `nginx` servise parašyta `port:` vietoj `ports:`.
- **Simptomas:** jau `docker compose -f sugadinta-1.yml config` ar `up` sustoja su pranešimu, panašiu į `services.nginx.port false schema`. Konteineriai net nepaleidžiami.
- **Kaip diagnozuoti:** perskaityti klaidos tekstą, jis rodo kelią `services.nginx.port`. Compose failo aprašo (Compose file reference) ieškoti, kaip vadinasi raktas portų publikavimui.
- **Ištaisymas:** `port:` pakeisti į `ports:`.
- **Pamoka:** klaidos tekstas dažnai pasako tikslią vietą. `docker compose config` patikrina sintaksę nepaleidžiant.

## Byla 2: `localhost` vietoj serviso vardo

- **Klaida:** `api` servise `DATABASE_URL` baigiasi `@localhost:5432/lab`, o DB servisas vadinasi `db`.
- **Simptomas:** `config` praeina, konteineriai startuoja, bet `curl http://localhost:8080/health` grąžina 502 arba 503. `docker compose logs api` rodo prisijungimo klaidą (`connection refused`).
- **Kaip diagnozuoti:** `docker compose ps`, `docker compose logs api`. Klaidos tekste matyti, kad jungiamasi į `localhost` pačiame konteineryje.
- **Ištaisymas:** `@localhost:5432` pakeisti į `@db:5432`, tada `docker compose up -d`.
- **Pamoka:** Compose tinkle servisai kreipiasi vienas į kitą serviso vardu. `localhost` konteinerio viduje yra pats konteineris.
- **Pastaba:** po pataisymo API gali kelias sekundes startuoti anksčiau nei DB pasiruošia (`depends_on` be `healthcheck` laukia tik paleidimo, ne pasirengimo). Jei starterio programa neturi pakartojimo logikos, mokinys gali pridėti `healthcheck` DB servise ir `condition: service_healthy`. Tai ne šios klaidos dalis, bet gera diskusija.

## Byla 3: neaprašytas volume

- **Klaida:** `db` servise naudojamas volume `pgdata`, bet failo pabaigoje nėra `volumes:` bloko su `pgdata:`.
- **Simptomas:** `docker compose -f sugadinta-3.yml config` ir `up` baigiasi klaida `service "db" refers to undefined volume pgdata: invalid compose project`.
- **Kaip diagnozuoti:** klaida tiesiogiai įvardija servisą ir volume. Compose dokumentacijoje skyrius apie volumes top-level elementą.
- **Ištaisymas:** failo gale pridėti
  ```yaml
  volumes:
    pgdata:
  ```
- **Pamoka:** pavadintas volume turi būti paskelbtas aukščiausiu lygiu. Be to, kad klaida išspręsta, reikia patikrinti, ar duomenys išlieka (`down` be `-v`, vėl `up`).

## Vertinimas

Daugiau svarbu diagnozės kelias nei pats pataisymas: klaidos tekstas → hipotezė → pataisymas → įrodymas (`docker compose ps`, `curl` 200). Tinka ir atsiskaitymo praktikai (12.4) kaip viena iš trijų sugadintų bylų.
