# 02 Linux terminalas

Data: 2026-11-16 (pirmadienis)

## Klasės darbas

3 val. Skaidrėse **N** rodo pastabas. Buvusi 03 pamoka sujungta čia. Pirma kas yra terminalas ir kad jame nėra pelės, tada tęsiame 01 projektą nauja šaka, ir tik tada terminalo komandos. Pull Request lieka 4 užduotyje. Skriptas čia tik išsaugota komandų eilė. `if`, `for` ir išėjimo kodas yra 04 pamokoje.

1. Kas yra terminalas ir kad jame nėra pelės (~12 min): [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/02%20Linux%20terminalas/skaidres/skaidres.html), 1–4 skaidrės
2. Tęsiame Git projektą, gyvai iki `git branch` (~8 min): skaidrė 5
3. Failas, `grep` ir commit (~10 min), tada Užduotis 1 (~18 min): skaidrė 6
4. Pertrauka (~15 min)
5. Skriptas: pirma klaida, tada `chmod` (~12 min), tada Užduotis 2 (~22 min): skaidrė 7
6. Procesas, `export`, paketas (~12 min), tada Užduotis 3 (~22 min): skaidrė 8
7. Pull Request tik iš užduoties (~18 min): skaidrės 9–10
8. Kita paskaita: Bash skriptai. Ten skriptas jau sprendžia: argumentas, `if`, `for`, išėjimo kodas

Nuoroda: [GitHub: about pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `4-uzduotis.md`. Skelbiate Teams'e po vieną. Komandos yra pačiose užduotyse. Atskiro sprendimo failo nėra. Lapas: `uzduotys/linux komandos.pdf`.

## Pamokos eiga (dėstytojui)

Nepatikrinta šiame sujungime: naujos 1–4 užduotys iš eilės GitHub'e ir WSL. `chmod`, `grep` ir `export` anksčiau veikė macOS.

### Demonstracijos žingsniai

1. `demo-a`: `git status`, šaka `demo-02`, `git branch`. Tada `juodrastis`, `pradzia.md`, `grep`, commit „Demo: pradžia“.
2. `labas.sh`: pirma `./labas.sh` be teisių, tada `chmod +x`, išvestis į `rezultatas.txt`, `chmod 600` failui `demo-raktas.txt`.
3. `sleep 20`, PID ne iš `grep`, `export SPALVA=raudona`, naujas langas tuščias, paketas `jq`.
4. Pull Request skaidrėje nedemonstruojate. Komandos yra 4 užduotyje.
