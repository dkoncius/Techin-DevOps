# 12.4 atsiskaitymas 1: praktinė dalis (~2 val.)

Praktika sudaro **60 %** viso atsiskaitymo, teorinis testas (`testas.md`) **40 %**.

## Taisyklės

- Dirbate savarankiškai, savo kompiuteryje. Leidžiama naudoti oficialią dokumentaciją ir savo užrašus. DI leidžiamas, bet turite mokėti paaiškinti ir pataisyti viską, ką pateikiate.
- **Viskas turi būti GitHub repozitorijoje**, pakeitimai per šaką ir pull request. Be paslapčių, raktų ir realių IP.
- **Priėmimo sąlyga:** repozitorijoje yra `README.md` su skyriais „Kaip paleisti" ir „Kaip patikrinti". Be jo praktika nevertinama.
- Pabaigoje dėstytojas ar kolega klonuoja jūsų repozitoriją ir seka README.

## Užduotis

1. **VM (apie 20 min).** Paruoškite Linux VM (ankstesnių paskaitų). Faile `docs/vm-planas.md` nurodykite vCPU, RAM, diską ir tinklo tipą. Įrodykite `nproc`, `free -h`, `df -h /`.
2. **Compose (apie 40 min).** Paleiskite konteinerizuotą aplikaciją (API + PostgreSQL, taip pat Nginx) per `docker compose up -d --build`. Reikia `.env.example`, DB `healthcheck`, pavadinto volume. `.env` nėra Git.
3. **Duomenų išlikimas (apie 15 min).** Per API sukurkite bent vieną įrašą. `docker compose down` (be `-v`), `docker compose up -d`, įrodykite, kad įrašas yra. Aprašykite README.
4. **Sugadinta byla (apie 30 min).** Dėstytojas duoda vieną sugadintą compose bylą. Raskite klaidą, pataisykite per šaką ir PR, `docs/triktis.md` parašykite 4 eilutes: simptomas, priežastis, pataisymas, patikra. Sprendimo ieškokite Docker Compose dokumentacijoje.
5. **Repozitorija (apie 15 min).** `README.md`, `.gitignore`, bent 2 sulieti PR su aiškiais aprašais.

## Vertinimo lentelė (100 taškų)

| Kriterijus | Taškai | Kaip tikrinama |
|---|---|---|
| VM ir konteineriai veikia | 20 | `nproc`, `free -h`, `df -h /` atitinka `vm-planas.md` (8); `docker compose ps` rodo `api`, `db`, `nginx` kaip `Up`, `db` `healthy` (12) |
| Compose paleidžiamas viena komanda | 20 | Dėstytojas klonuoja repozitoriją, nustato `.env` iš `.env.example` ir paleidžia `docker compose up -d --build`. `curl http://localhost:8080/health` grąžina 200 (20). Jei reikia daugiau nei vienos komandos paleisti, nuimama 8 |
| Duomenys išlieka | 20 | Po `down` ir `up` `curl` rodo anksčiau sukurtą įrašą (14); volume pavadintas ir paaiškintas README (6) |
| Repozitorija tvarkinga | 20 | README skyriai „Kaip paleisti" ir „Kaip patikrinti" veikia (8); `.env` nėra Git, nėra slaptažodžių (6); ≥ 2 sulieti PR (6) |
| Trikties priežastis paaiškinta | 20 | Sugadinta byla pataisyta (8); `docs/triktis.md` turi 4 eilutes (6); žodžiu paaiškina, kodėl klaida atsirado ir kaip rado (6) |
| **Viso** | **100** | |

**Praktikos balai (100) × 0,6 + testo taškai (iš 30) × (40/30) = atsiskaitymo procentai (iš 100).**
Pagal Excel šis atsiskaitymas vertas 7 balų, tad: 7 × procentai ÷ 100.

## Išlaikyta, jei (iš plano)

VM ir konteineriai veikia; compose paleidžiamas viena komanda; duomenys išlieka; repozitorija tvarkinga; trikties priežastis paaiškinta. Siūloma riba: bent 50 taškų iš 100 praktikoje ir testas ≥ 50 % (derinti su mokykla).

## Mokytojui: sugadintos bylos atsiskaitymui

Duokite vieną iš gedimų. Remkitės bylomis iš `../12.3 Docker Compose/sugadintos/` arba `etalonas/failures/README.md` gedimais (blogas DB slaptažodis `.env`, neteisingas Nginx `proxy_pass` portas, `localhost` vietoj `db`, neaprašytas volume). Geriau duoti kitą nei mokiniai matė 12.3, bet to paties tipo (pvz. Nginx `proxy_pass http://api:8001;` vietoj 8000). Atsakymai: `../12.3 Docker Compose/sprendimai/sugadintos-atsakymai.md`.
