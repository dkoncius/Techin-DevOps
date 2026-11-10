# 12.3 Užduotys

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje arba klauskite LLM, ir užsirašykite, kas padėjo. Nuorodos yra pamoka.md.

## Užduotis 1

Laikas: ~1,5 val.

Tikslas: parašyti `docker-compose.yml` savo aplikacijai (API + PostgreSQL + Nginx), kuris paleidžiamas viena komanda.

Darbai:
1. Šaka `compose`, failas `.env.example` (`DB_USER`, `DB_PASSWORD`, `DB_NAME`); `.env` nukopijuotas, slaptažodis pakeistas, `.env` įrašytas į `.gitignore`.
2. `docker-compose.yml` su trimis servisais: `db`, `api`, `nginx`.
3. `db` turi pavadintą volume ir `healthcheck` su `pg_isready`.
4. `api` laukia sveikos DB (`depends_on` su `condition: service_healthy`) ir jungiasi pagal serviso vardą `db`.
5. `nginx` publikuoja 8080 ir per `nginx/default.conf` proksuoja į `api` (API portą rasite starterio README).
6. Visi kintamieji imami iš `.env`.
7. `docker compose up -d --build`, `docker compose ps`, `curl -s http://localhost:8080/health` grąžina 200.
8. Persistence: `docker compose down` (be `-v`), vėl `up -d`, sukurti duomenys išlieka.
9. `README.md` skyriai „Kaip paleisti" (3–5 komandos) ir „Kaip patikrinti" (komanda ir laukiamas rezultatas); README yra priėmimo sąlyga.
10. Papildomai: `restart: unless-stopped` visiems servisams ir vienas sakinys, ką tai daro.
11. Jei naudotas DI: parašyta, ką paklausėte ir kaip patikrinote atsakymą
12. Pateikimas: sulieto PR nuoroda, `docker compose ps` ir `curl` išvestis

**Pavyzdys:**

Terminale, jūsų kompiuteryje, projekto aplanke:

```
$ docker compose ps
NAME           IMAGE                COMMAND   SERVICE   STATUS                    PORTS
proj-db-1      postgres:16-alpine   ...       db        Up 10 seconds (healthy)   5432/tcp
proj-api-1     proj-api             ...       api       Up 8 seconds              8000/tcp
proj-nginx-1   nginx:1.27-alpine    ...       nginx     Up 8 seconds              0.0.0.0:8080->80/tcp

$ curl -s http://localhost:8080/health
{"db":"up","status":"ok"}
```

## Užduotis 2

Laikas: ~1 val.

Tikslas: rasti ir pataisyti klaidą kiekvienoje iš trijų sugadintų compose bylų (pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas).

Darbai:
1. Bylas `sugadinta-1.yml`, `sugadinta-2.yml`, `sugadinta-3.yml` iš `sugadintos/` nukopijuoti į projekto šaknį (šalia `app/` ir `nginx/`); `DB_PASSWORD` nustatyti aplinkoje.
2. Kiekvienai bylai paleisti `docker compose -f sugadinta-N.yml config` ir `up -d`, perskaityti klaidą ar `logs`.
3. Klaidų priežasčių ieškoti Compose file reference (https://docs.docker.com/reference/compose-file/).
4. Pataisyti visas tris bylas, po kiekvienos `down`; visos pasileidžia.
5. `docs/sugadintos.md`: kiekvienai bylai 4 eilutės (simptomas, priežastis, pataisymas, patikra) ir dokumentacijos vieta.
6. Papildomai: parašyti savo sugadintą bylą su kita klaida ir duoti kolegai pataisyti.
7. Jei naudotas DI: parašyta, ką paklausėte, kaip patikrinote atsakymą ir ar jis tiko
8. Pateikimas: PR nuoroda su pataisytomis bylomis ir `docs/sugadintos.md`

## Užduotis 3

Laikas: ~1 val.

Tikslas: paleisti dvi API instancijas už Nginx ir patikrinti, kad užklausos dalijamos.

Darbai:
1. Šaka `balansavimas`; vietoj `api` aprašyti `api1` ir `api2` (tas pats atvaizdas, abi jungiasi į `db`).
2. Nginx `upstream` su abiem servisais ir `proxy_pass` į jį (pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas: `ngx_http_upstream_module`). Pastaba: kad dalijimas būtų tolygus, upstream bloke reikia `zone`; raskite dokumentacijoje, kam jis skirtas.
3. `server` bloke `add_header X-Upstream $upstream_addr always;`.
4. `docker compose exec nginx nginx -t` sėkmingas, ciklas `for i in 1 2 3 4; do curl -sI http://localhost:8080/health | grep -i x-upstream; done` rodo du skirtingus adresus.
5. `curl -v http://localhost:8080/health`: užsirašyti metodą, kelią, statuso kodą ir 2 atsakymo antraštes; parašyti, kokiu REST metodu kuriamas naujas įrašas ir kokiu skaitomas sąrašas.
6. `docker compose stop api1`, pakartoti ciklą, užsirašyti, kas pasikeitė.
7. `docs/balansavimas.md`: 3 sakiniai apie rezultatą.
8. Papildomai: `least_conn` vietoj `round-robin` ir 3 sakiniai apie skirtumą.
9. Jei naudotas DI: parašyta, ką paklausėte ir kaip patikrinote atsakymą
10. Pateikimas: PR nuoroda su `docs/balansavimas.md` ir ciklo išvestimi

**Pavyzdys:**

Terminale, jūsų kompiuteryje (adresai bus kiti):

```
$ for i in 1 2 3 4; do curl -sI http://localhost:8080/health | grep -i x-upstream; done
X-Upstream: 172.18.0.3:8000
X-Upstream: 172.18.0.4:8000
X-Upstream: 172.18.0.3:8000
X-Upstream: 172.18.0.4:8000
```

## Iki kito susitikimo

1. Paruoškite compose projektą atsiskaitymui ir įkelkite į GitHub per PR.
2. Pasikartokite testui: IS platformos, serverio komponentai, RAID/NAS/SAN/UPS, virtualizacija, HTTP/REST, Docker/Podman, Compose.
