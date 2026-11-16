# 05 Projekto paleidimas lokaliai

Data: 2026-11-19 (ketvirtadienis)

## Klasės darbas

Anksčiau mokėsi: 02–04 pamokose dirbo `git-bandymas` aplanke; pas Karoliną skaitė Python. Šablono, Flask projekto paleidimo ir `.env` dar nematė.

Prisiminsime `curl`, išėjimo kodą ir Python skaitymą, o mokysimės sukurti projektą iš šablono, paleisti jį lokaliai, paleisti testus, laikyti nustatymus `.env` faile ir parašyti `paleisti.sh`.

1. Pasitikrinimas po 04: `python3 -m http.server` ir `curl` kodai
2. Šablonas ir klonas, tada Užduotis 1: [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/05%20Projekto%20paleidimas%20lokaliai/skaidres.html), 1–3 skaidrės
3. Paleidimas ir testai, tada Užduotis 2: skaidrės 4–5; `./run.sh`, `/health`, `pytest`
4. Pertrauka
5. `.env`, tada Užduotis 3: skaidrė 6
6. `paleisti.sh` ir Pull Request, tada Užduotis 4: skaidrės 7–9
7. Kita paskaita: Docker pradžia

Nuorodos: [Creating a repository from a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template), [The Twelve-Factor App: Config](https://12factor.net/config)

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `4-uzduotis.md`. Skelbiate Teams'e po vieną. Komandos ir `paleisti.sh` turinys yra pačiose užduotyse. Atskiro sprendimo failo nėra. Lapas: `uzduotys/paleidimas komandos.md`.

## Pamokos eiga (dėstytojui)

Nepatikrinta šiame perrašyme: Use this template, `gh repo create --template`, `./run.sh`, `pytest`, `paleisti.sh` Ubuntu. Anksčiau `paleisti.sh` buvo paleistas macOS su starteriu (sėkmė, kitas portas, užimtas portas po 20 s kodas 1). To šį kartą nekartojau.

### Demonstracijos žingsniai

1. Naršyklėje Use this template į `demo-projektas`, klonas į `~/devops`.
2. `./run.sh`, `curl` į `/health` ir `/status`.
3. `.env` su kita spalva ir versija nei užduotyje (`APP_COLOR=red`, `APP_VERSION=9`).
4. `paleisti.sh` sėkmė ir užimtas portas. Pull Request pavadinimas „Demo paleidimas“, ne „Paleidimas lokaliai“.
