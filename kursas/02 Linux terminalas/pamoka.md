# 02 Linux terminalas

Data: 2026-11-12 (ketvirtadienis)

## Klasės darbas

3 val. Skaidrėse **N** rodo pastabas. Kiekviena tema: skaidrės → jūsų demonstracija kitu pavyzdžiu → užduotis Teams'e → mokiniai daro savo. Užduotys eina viena gija tame pačiame `git-bandymas`: užrašai → srautai → skriptas → Pull Request. Šablono nėra.

1. Pasitikrinimas po 01 (~5 min): dėstytojas parodo 01 užduotis gyvai (1 ir 2 komandos yra pačioje užduotyje, 3 užduoties sprendimas `uzduotys/3-uzduotis-sprendimas.md`)
2. Tęsiame `git-bandymas` (~8 min), tada Užduotis 1 (~15 min): [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/02%20Linux%20terminalas/skaidres/skaidres.html), 1–3 skaidrės; šaka, `nano`, commit
3. Navigacija ir failai (~10 min), tada Užduotis 2 (~20 min): skaidrės 4–5; `pwd`, keliai, `mkdir`, `cp`, `mv`
4. Srautai ir paieška (~13 min), tada Užduotis 3 (~25 min): skaidrės 6–7; `>`, vamzdis, `grep`, `find`
5. Pertrauka (~15 min)
6. Teisės ir skriptas (~13 min), tada Užduotis 4 (~30 min): skaidrės 8–9; `chmod`, skriptas kartoja paiešką
7. Pull Request (~6 min), tada Užduotis 5 (~20 min): skaidrės 10–11; šaka, sujungimas, šakos trynimas GitHub'e
8. Kita paskaita: Procesai, aplinkos kintamieji, paketų tvarkyklė

Nuorodos: [GitHub: creating a repository from a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template), [GitHub: about pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)

## Užduotys

Užduotys yra atskiruose failuose `uzduotys/1-uzduotis.md` … `5-uzduotis.md` (dėstytojas skelbia Teams'e po vieną: pirma demonstracija, tada darbas). Jos eina viena gija viename `devops-projekte`: savo kopija → navigacija → srautai → skriptas → Pull Request. Komandos ir laukiamas rezultatas yra pačiose užduotyse. Atskiro sprendimo failo nėra.

## Pamokos eiga (dėstytojui)

Patikrinta: macOS, užduočių 2–4 Linux kelias (navigacija, `cp`/`mv`, srautai, `grep`/`find`, skriptas, `chmod`) paleistas laikiname aplanke. Nepatikrinta: **Use this template**, tikras `git clone` ir Pull Request GitHub svetainėje (ir `gh pr`), WSL2 Ubuntu (`/mnt/c`, CRLF); išbandyti ranka prieš pamoką.

### Demonstracijos žingsniai

Demonstracijų komandos yra skaidrėse (`skaidres/skaidres.html`). Laikas, dažnos klaidos ir kada skelbti užduotį rašoma skaidrių pastabose (klavišas **N**). Rodykite kitu pavyzdžiu nei užduotyje (`demo-a`, šaka `demo-02`, `pradzia.md`, `demo/vaisiai`, `labas.sh`, `~/devops/demo-raktas.txt`). Eiga ta pati kaip užduotyse. Atskiro sprendimo failo nėra: komandos yra `uzduotys/1-uzduotis.md` … `5-uzduotis.md`. Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaityme.
