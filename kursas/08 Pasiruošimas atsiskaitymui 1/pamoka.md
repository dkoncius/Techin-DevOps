# 08 Pasiruošimas atsiskaitymui 1

Data: 2026-11-26 (ketvirtadienis)

## Klasės darbas

Anksčiau mokėsi: 01–07 pamokų temas (Linux, Git, Bash, tinklai, projekto paleidimas, Docker pradžia). Naujų temų nebus; 2026-11-25 paskaitos nebuvo.

Prisiminsime viską nuo 01 iki 07 pamokos: pasitikrinsime `paleisti.sh`, šablono repozitoriją, `.env` ir bent 3 sulietus Pull Request aplanke `git-bandymas`. Kas neveikia, pataisysime vietoje. Docker šiame atsiskaityme nevertinamas.

1. Kas bus tikrinama: [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/08%20Pasiruošimas%20atsiskaitymui%201/skaidres.html), 1–2 skaidrės
2. Užduotis 1: `./paleisti.sh` kodas 0
3. Užduotis 2: `git-bandymas` sulieti PR
4. Pertrauka
5. Užduotis 3: `.env` nėra Git'e
6. Klausimai: kas dar neveikia, taisome vietoje
7. Kita paskaita: Atsiskaitymas 1, 2026-11-30

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `3-uzduotis.md`. Naujų komandų nėra. Lapai lieka ankstesnių pamokų.

## Pamokos eiga (dėstytojui)

Nepatikrinta: klasės repozitorijos. `main` vis dar neapsaugotas. Apsauga bus tada, kai atsiras CI.

### Demonstracijos žingsniai

1. Savo `demo-projektas`: `./paleisti.sh`, kodas 0.
2. `git-bandymas` analoge `gh pr list --state merged`.
3. `git status` nerodo `.env`.
