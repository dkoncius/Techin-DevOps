# 06 Docker pradžia

Data: 2026-11-23 (pirmadienis)

## Klasės darbas

3 val. Pradžioje trumpai: kodėl „pas mane veikia“ ir kuo konteineris skiriasi nuo virtualios mašinos. Likęs laikas yra `docker run`, `ps`, `logs`, `exec`, `stop`. Atskiros teorijos pamokos nėra. Projekto šablono šiai pamokai nereikia.

1. Kodėl konteineris (~15 min): [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/06%20Docker%20pradžia/skaidres.html), 1–2 skaidrės
2. `hello-world` (~15 min), tada Užduotis 1: skaidrė 3
3. Serveris fone (~25 min), tada Užduotis 2: skaidrė 4. Demonstracijoje portas `8888` ir vardas `demo-web`, ne `8080` ir ne `kursas-web`
4. Pertrauka (~15 min)
5. Žurnalas ir `exec` (~25 min), tada Užduotis 3: skaidrė 5
6. Stop ir rm (~20 min), tada Užduotis 4: skaidrė 6
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
