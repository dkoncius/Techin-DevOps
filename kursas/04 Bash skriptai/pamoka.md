# 04 Bash skriptai

Data: 2026-11-17 (antradienis)

## Klasės darbas

3 val. Skaidrėse **N** rodo pastabas. Kiekviena tema: skaidrės → jūsų demonstracija kitu pavyzdžiu → užduotis Teams'e → mokiniai daro savo. Užduotys eina viena gija: skriptas `scripts/patikra.sh` auga per 1–3 užduotis, 4 užduotis baigiama Pull Request.

1. Pasitikrinimas po 03 (~10 min): dėstytojas parodo 03 sprendimą gyvai (03 `pamoka.md`, skyrius „Pamokos eiga“); kam neveikė procesų stabdymas, paketų diegimas ar PR, kartu randame priežastį
2. Argumentai, sąlyga ir išėjimo kodas (~25 min), tada Užduotis 1 (~20 min): [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/04%20Bash%20skriptai/skaidres/skaidres.html), 1–6 skaidrės; argumentai, sąlyga, išėjimo kodas
3. Ciklas ir saugus skriptas (~10 min), tada Užduotis 2 (~20 min): skaidrė 7; masyvas, aritmetika, išėjimas pirmoje klaidoje
4. Pertrauka (~15 min)
5. Failų patikra (~5 min), tada Užduotis 3 (~20 min): skaidrė 8; failų ir aplankų patikra, skriptas iš projekto šaknies
6. Tikras Bash ir Git (~15 min), tada Užduotis 4 (~35 min): skaidrės 9–10; ignoravimas, pakeitimų atšaukimas, Pull Request
7. Kita paskaita: Tinklų pagrindai: IP, portai, DNS, HTTP

## Užduotys

Užduotys yra atskiruose failuose `uzduotys/1-uzduotis.md` … `4-uzduotis.md` (dėstytojas skelbia Teams'e po vieną: pirma demonstracija, tada darbas). 1–3 užduotys plečia tą patį skriptą `scripts/patikra.sh`, 4 užduotis baigiama Pull Request. Dėstytojo sprendimai su komandomis: `uzduotys/N-uzduotis-sprendimas.md`.

## Pamokos eiga (dėstytojui)

Patikrinta (2026-11-12): macOS (Bash 3.2): `uzduotys/N-uzduotis-sprendimas.md` komandos ir skaidrių demonstracijos paleistos iš eilės su tikru šablonu ir laikina nuotoline repozitorija vietoj GitHub. Nepatikrinta: tas pats Ubuntu (WSL, Bash 5), Pull Request GitHub svetainėje; išbandyti prieš pamoką.

### Demonstracijos žingsniai

Demonstracijų komandos su aprašais yra skaidrėse (`skaidres/skaidres.html`, šaltinis `skaidres/skaidres.md`); laikas, dažnos klaidos ir kada skelbti užduotį rašoma skaidrių pastabose (klavišas **N**). Rodykite viename terminalo lange, vieną komandą po kitos, KITU pavyzdžiu nei užduotyje. Demonstracijos ir sprendimai užduotims yra atskiruose failuose: `uzduotys/1-uzduotis-sprendimas.md` … `4-uzduotis-sprendimas.md`. Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaityme.
