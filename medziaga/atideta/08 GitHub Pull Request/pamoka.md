# 08 GitHub Pull Request

Data: 2026-11-24 (antradienis)

## Klasės darbas

3 val. Skaidrėse **N** rodo pastabas. Kiekviena tema: skaidrės → jūsų demonstracija kitu pavyzdžiu → užduotis Teams'e → mokiniai daro savo. Užduotys eina viena gija: Issue ir PR → peržiūra poroje → `main` apsauga. Nuo šios pamokos `main` keičiamas tik per Pull Request.

1. Pasitikrinimas po 07 (~10 min): parodykite 07 užduotis (komandos yra pačiose užduotyse); kam neveikė `pull` konfliktas ar `stash`, kartu randame priežastį
2. Pull Request (~20 min): [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/08%20GitHub%20Pull%20Request/skaidres.html), 1–5 skaidrės; antraštė, aprašas, `Closes #N`, `gh pr create`
3. Code review (~25 min): skaidrė 6; komentaras eilutei, Request changes, Approve
4. Pertrauka (~15 min)
5. Branch apsauga ir darbas poromis (~30 min), tada užduotys: skaidrės 7–8; taisyklė `main`, atmestas `git push`
6. Kita paskaita: projekto paleidimas lokaliai

Nuorodos: [PR](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request), [review](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests), [branch apsauga](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule), [gh](https://cli.github.com/manual/)

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `3-uzduotis.md`. Skelbiate Teams'e po vieną: pirma demonstracija, tada darbas. 2 ir 3 užduotys daromos poroje. Komandos yra pačiose užduotyse. Atskiro sprendimo failo nėra. Lapas: `uzduotys/github komandos.md`.

## Pamokos eiga (dėstytojui)

Patikrinta anksčiau: šaka, commit, `git push` ir `git reset --soft` macOS su lokalia repozitorija. Nepatikrinta: Issue su `Closes #N`, bendradarbio kvietimas, review komentarai, branch apsauga Public repozitorijoje, ar apsauga atmeta `git push`, `gh` komandos. Šiame perrašyme iš naujo nepaleista. Jei kopija privati, nemokamame plane apsauga gali neveikti.

### Demonstracijos žingsniai

Rodykite savo demo repozitorijoje, ne mokinio: Issue „Pridėti /about“, failas `docs/about.md`. Porai reikia dviejų paskyrų. Kasdienių darbų netikrinate.
