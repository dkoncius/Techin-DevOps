# 06 Docker pradžia

Data: 2026-11-23 (pirmadienis)

## Klasės darbas

Anksčiau mokėsi: 05 pamokoje paleido projektą lokaliai; pas Edgarą Docker pagrindus (`Dockerfile`, nginx). Kasdienių komandų (`logs`, `exec`, `stop`, `rm`) čia kartojame nuosekliai.

Prisiminsime, kaip paleidome projektą, ir Docker pagrindus pas Edgarą, o mokysimės paleisti konteinerį (`docker run`), skaityti žurnalą (`logs`), eiti į vidų (`exec`) ir sustabdyti (`stop`, `rm`).

1. Kodėl konteineris: [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/06%20Docker%20pradžia/skaidres.html), 1–2 skaidrės
2. `hello-world`, tada Užduotis 1: skaidrė 3
3. Serveris fone, tada Užduotis 2: skaidrė 4. Demonstracijoje portas `8888` ir vardas `demo-web`, ne `8080` ir ne `kursas-web`
4. Pertrauka
5. Žurnalas ir `exec`, tada Užduotis 3: skaidrė 5
6. Stop ir rm, tada Užduotis 4: skaidrė 6
7. Kita paskaita: image ir registrai

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `4-uzduotis.md`. Lapas: `uzduotys/docker komandos.md`. Atskiro sprendimo failo nėra.

## Pamokos eiga (dėstytojui)

Nepatikrinta: Docker šiame kompiuteryje šiam perrašymui nepaleistas. Mac ir Ubuntu komandos tos pačios. Nenaudokite `docker rm -f` ir `latest`.

### Demonstracijos žingsniai

1. `docker run hello-world`, tada `docker ps` ir `docker ps -a`.
2. `docker run -d --name demo-web -p 8888:80 nginx:1.27`.
3. `docker logs demo-web`, `docker exec demo-web nginx -v`.
4. `docker stop demo-web`, `docker rm demo-web`.
