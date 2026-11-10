# 12.2 Užduotys

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje arba klauskite LLM, ir užsirašykite, kas padėjo. Nuorodos yra pamoka.md.

## Užduotis 1

Laikas: ~1,5 val.

Parašyti multi-stage `Dockerfile` starterio programai (Flask + PostgreSQL + testai, gaunate iš dėstytojo), kad atvaizdas būtų mažas ir neveiktų kaip root.

Darbai:

1. Nusiklonuokite starterį, susikurkite savo kopiją (savo GitHub repozitoriją) pagal dėstytojo nurodymus ir sukurkite šaką: `git switch -c dockerfile`
2. Dockerfile ir multi-stage build (pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas): perskaitykite Docker dokumentacijos skyrius apie Dockerfile instrukcijas ir multi-stage build
3. Parašykite `Dockerfile`: bent du `FROM` (build ir galutinis etapas), priklausomybės įdiegiamos build etape, galutiniame yra tik programa ir bibliotekos, programa veikia ne kaip root (`USER`)
4. Parašykite `.dockerignore`, kuris neįtraukia `tests/`, `__pycache__`, `.git`
5. Sukurkite atvaizdą: `docker build -t mano-app:1 .` (iš aplanko su `Dockerfile`)
6. Patikrinkite: `docker images mano-app` (užsirašykite dydį) ir `docker run --rm mano-app:1 id` (turi būti ne `uid=0`)
7. Paleiskite programą, kaip aprašyta starterio README (portą ir aplinkos kintamuosius skaitykite iš jo; DB slaptažodį imkite iš aplinkos kintamojo, ne iš failo)
8. Paaiškinkite savais žodžiais 3 sakiniais, kodėl `COPY requirements.txt` ir `RUN pip install` rašomi prieš `COPY . .` (sluoksniai ir cache)
9. Jei naudotas DI: parašyta, ką paklausėte ir kaip patikrinote atsakymą
10. Pateikimas: sulieto PR į jūsų repozitoriją nuoroda (su `Dockerfile`, `.dockerignore` ir faile `docs/dockerfile.md` įklijuotomis `docker images` ir `docker run ... id` išvestimis bei 3 sakinių paaiškinimu)

**Pavyzdys:**

Terminale, jūsų kompiuteryje (kito projekto atvaizdas, ne jūsų):

```
$ docker run --rm kito-projekto-app:1 id
uid=10001(appuser) gid=10001(appuser) groups=10001(appuser)
```

## Užduotis 2

Laikas: ~1,5 val.

Paleisti PostgreSQL su volume ir custom tinklu, įrodyti, kad duomenys išlieka po konteinerio ištrynimo, ir prijungti savo programą.

Darbai:

1. Sukurkite tinklą ir volume: `docker network create mano-tinklas` ir `docker volume create pgdata`
2. Slaptažodį sugeneruokite į aplinkos kintamąjį, neįrašykite jo į jokį failą: `export DB_PASSWORD=$(openssl rand -hex 8)`
3. Paleiskite DB: `docker run -d --name db --network mano-tinklas -e POSTGRES_USER=lab -e POSTGRES_PASSWORD="$DB_PASSWORD" -e POSTGRES_DB=lab -v pgdata:/var/lib/postgresql/data postgres:16-alpine`
4. Po ~5 s įrašykite duomenis: `docker exec db psql -U lab -d lab -c "CREATE TABLE test(id serial, txt text); INSERT INTO test(txt) VALUES ('liks');"`
5. Ištrinkite konteinerį (`docker rm -f db`), paleiskite iš naujo ta pačia komanda iš 3 darbo ir po ~5 s patikrinkite: `docker exec db psql -U lab -d lab -c "SELECT * FROM test;"` (turi matytis eilutė `liks`)
6. Paleiskite savo programą tame pačiame tinkle (`--network mano-tinklas`); bazės adresas yra konteinerio vardas `db`, ne `localhost`; patikrinkite `/health` (DB turi būti `up`)
7. Faile `docs/volume.md` atsakykite 2 sakiniais, kas nutiktų be `-v pgdata:...`, ir po 1 sakinį apie skirtumą tarp volume ir bind mount (raskite Docker dokumentacijoje skyrių apie volumes ir bind mounts)
8. Jei naudotas DI: parašyta, ką paklausėte ir kaip patikrinote atsakymą
9. Pateikimas: PR nuoroda į `docs/volume.md` su išvestimis prieš ir po `docker rm -f db` bei `/health` išvestimi

**Pavyzdys:**

Terminale, jūsų kompiuteryje (rezultatas po naujo konteinerio sukūrimo):

```
$ docker exec db psql -U lab -d lab -c "SELECT * FROM test;"
 id | txt  
----+------
  1 | liks
(1 row)
```

## Papildomos užduotys

1. Palyginkite atvaizdo dydį su vieno etapo Dockerfile (tas pats kodas) ir užrašykite skirtumą
2. Įkelkite atvaizdą į GitHub Container Registry (`docker tag`, `docker push`; prisijungimą raskite GitHub dokumentacijoje, token'o niekur nerašykite) ir užfiksuokite dydį prieš ir po sumažinimo

## Iki kito susitikimo

1. Užbaikite ir sulieskite abu PR
2. Paleiskite DB ir programą iš naujo ir pasižiūrėkite, kiek komandų reikia: tai spręs Docker Compose (12.3)
