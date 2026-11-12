# 02 Linux terminalas

Data: 2026-11-12 (ketvirtadienis)

## Klasės darbas

3 val. Skaidrėse **N** rodo pastabas. Kiekviena tema: skaidrės → jūsų demonstracija kitu pavyzdžiu → užduotis Teams'e → mokiniai daro savo. Užduotys eina viena gija viename `devops-projekte`: pastabos → srautai → skriptas → Pull Request.

1. Pasitikrinimas po 01 (~5 min): dėstytojas parodo 01 sprendimą gyvai (01 `pamoka.md`, skyrius „Pamokos eiga“)
2. Savo projektas (~5 min), tada Užduotis 1 (~10 min): [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/02%20Linux%20terminalas/skaidres/skaidres.html), 1–4 skaidrės; šablonas, klonavimas, šaka
3. Komanda ir navigacija (~10 min), tada Užduotis 2 (~25 min): skaidrės 5–9; pagalba, judėjimas, keliai, failai ir aplankai, commit
4. Srautai ir paieška (~10 min), tada Užduotis 3 (~25 min): skaidrės 10–11; peržiūra, vamzdis, nukreipimas, paieška
5. Pertrauka (~15 min)
6. Teisės ir pirmas skriptas (~15 min), tada Užduotis 4 (~30 min): skaidrės 12–13; teisės, vykdymas, pirmas skriptas
7. Pull Request (~5 min), tada Užduotis 5 (~20 min): skaidrės 14–15; šaka, Pull Request, atnaujinimas
8. Kita paskaita: Procesai, aplinkos kintamieji, paketų tvarkyklė

Nuorodos: [GitHub: creating a repository from a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template), [GitHub: about pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)

## Užduotys

Užduotys yra atskiruose failuose `uzduotys/1-uzduotis.md` … `5-uzduotis.md` (jas dėstytojas skelbia Teams'e po vieną: pirma demonstracija, tada darbas). Jos eina viena gija: savo projekto kopija → navigacija → srautai → skriptas → Pull Request. Komandų užduotyse nėra; dėstytojo sprendimai su komandomis: `uzduotys/N-uzduotis-sprendimas.md`.

## Pamokos eiga (dėstytojui)

Patikrinta (2026-11-12): macOS (bash 3.2): visi `uzduotys/N-uzduotis-sprendimas.md` kodo blokai paleisti iš eilės su tikru šablonu `devops-projektas-starter-template` (klonuotas) ir laikina nuotoline repozitorija vietoj GitHub. Nepatikrinta: **Use this template**, Pull Request GitHub svetainėje (ir `gh pr`), WSL2 Ubuntu (`/mnt/c`, CRLF); išbandyti ranka prieš pamoką.

### Demonstracijos žingsniai

Demonstracijų komandos su aprašais yra skaidrėse (`skaidres/skaidres.html`, šaltinis `skaidres/skaidres.md`); laikas, dažnos klaidos ir kada skelbti užduotį rašoma skaidrių pastabose (klavišas **N**). Rodykite viename terminalo lange, vieną komandą po kitos, KITU pavyzdžiu nei užduotyje. Demonstracijos ir sprendimai užduotims yra atskiruose failuose: `uzduotys/1-uzduotis-sprendimas.md` … `5-uzduotis-sprendimas.md`. Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaityme.
