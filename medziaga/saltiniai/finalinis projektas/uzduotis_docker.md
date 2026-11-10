# Užduotis: iš paleidimo be Dockerio į Compose

Tai ne 12 savaitės lapas. 12 savaitė yra [12-savaitė.md](12-savaitė.md): maža Python programa, PostgreSQL ir Compose.

Šis lapas lieka savaitei po egzamino. Tada ta pati Compose tvarka kartojama su ShiftPilot. Java, Maven ir PostgreSQL neįsidiegiate. Užtenka Docker Desktop.

1. Perskaityti README, kaip programa buvo leidžiama. Taip leisti nereikia.
2. Parašyti `Dockerfile` su reikiama kalbos versija.
3. Parašyti `docker-compose.yml` su programa ir duomenų baze. Bazės adresas yra serviso vardas, pavyzdžiui `db`, ne `localhost`.
4. Slaptažodį išimti iš kodo. Repozitorijoje palikti tik `.env.example`.
5. README palikti komandą `docker compose up -d --build`. Iš švarios kopijos ji pakelia programą ir bazę.
6. Jei konteineris iškart miršta, `docker logs` ir pataisyti tai, ką sugadino konteineris.
7. Programos klaidą palikti ir vienu sakiniu parašyti, ką radote. Mygtuko, kuris grąžina 400 ar 403, netaisyti.
8. Parodyti eilutę su kalbos versija ir eilutę, kuri sujungia programą su baze.

Failus rašote patys. DI juodraštis leistinas, jei paaiškinate, kodėl bazė vadinasi `db`.

Sąsaja gali likti per `npm run dev`. Šią savaitę užtenka programos ir bazės.
