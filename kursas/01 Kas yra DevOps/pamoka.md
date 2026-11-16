# 01 Kas yra DevOps

Data: 2026-11-11 (trečiadienis)

## Klasės darbas

Anksčiau mokėsi pas Edgarą: Linux terminalą (failai, teisės, procesai), teksto redaktorius, Bash skriptus su kintamaisiais, SSH, Git (`init`, `add`, `commit`, `push`, `pull`, `restore`) ir GitHub, Apache / Nginx, aplinkos kintamuosius, Docker pagrindus. Šakų, `merge`, `clone` per `gh` ir Pull Request dar nemokėsi.

Prisiminsime Git ir terminalą, o mokysimės, kas yra DevOps, kaip paruošti terminalą (WSL arba Mac) ir kaip įkelti projektą į GitHub su šakomis: `init`, commit, šaka, `merge`, `clone`.

1. Prisistatymas: [1-apie-mane](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/1-apie-mane.html), 1–4 skaidrės
2. Susipažinkime: [1-apie-mane](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/1-apie-mane.html), 5 skaidrė; atsakymus užrašyti [Google lentelėje](https://docs.google.com/spreadsheets/d/1K_lsp3dnYaUWD2iWq_jCH5XMv4ZkYzXnXAclkF0Y7mA/edit?gid=0#gid=0)
3. Terminalas: [1-apie-mane](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/1-apie-mane.html), 6 skaidrė (`wsl --install` / `xcode-select --install`)
4. Kurso eiga: [2-apie-kursa](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/2-apie-kursa.html); vertinimo procentų nesakyti, jie nepatvirtinti
5. Kas yra DevOps: [3-skaidres](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/3-skaidres.html), 1–13 skaidrės; [roadmap.sh/devops](https://roadmap.sh/devops)
6. Pertrauka: Windows perkrauna ir vieną kartą paleidžia Ubuntu; Mac patikrina `xcode-select`
7. Aplinkos patikra: [WSL diegimo sąrašas](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/checklists/WSL%20diegimo%20s%C4%85ra%C5%A1as.html), kurį paskelbiate ir Teams'e prie paskaitos (žingsniai su komanda ir laukiamu rezultatu); jei WSL nepavyksta, sąraše „Jei WSL nepavyko“ (turi būti išspręsta prieš 02 pamoką).
8. Užduotis 1: [3-skaidres](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/3-skaidres.html), 14–19 skaidrės; nuo aplanko iki įkėlimo į `main` per GitHub, komandos užduotyje; skelbiate po vietinio commit demonstracijos
9. Užduotis 2: [3-skaidres](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/3-skaidres.html), 19–20 skaidrės; naujas failas, commit ir push į `main`, tada šaka, sujungimas ir trynimas, komandos užduotyje; skelbiate, kai `main` jau yra GitHub'e
10. Užduotis 3: [3-skaidres](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/3-skaidres.html), 21–22 skaidrės; `clone` šalia `git-bandymas` aplanke `devops`, prieiga, šaka, commit, push, sujungimas ir trynimas kompiuteryje bei GitHub'e
11. Kita paskaita: pakartosime Linux terminalo temą (navigacija, failai, teisės)

Nuorodos: [GitHub Hello World](https://docs.github.com/en/get-started/start-your-journey/hello-world), [Learn Git Branching](https://learngitbranching.js.org/), [Git cheat sheet](https://git-scm.com/cheat-sheet), [Pro Git](https://git-scm.com/book/en/v2)

## Užduotys

Užduotys yra atskiruose failuose `uzduotys/1-uzduotis.md` … `3-uzduotis.md` (dėstytojas skelbia Teams'e po vieną: pirma demonstracija, tada darbas). Visos per terminalą: 1 – `git-bandymas` nuo aplanko iki įkėlimo į `main` per GitHub, komandos užduotyje, 2 – tame pačiame aplanke naujas failas, commit ir push į `main`, tada šaka, sujungimas ir trynimas, komandos užduotyje, 3 – `clone` šalia `git-bandymas` aplanke `devops`, prieiga, šaka, commit, push, sujungimas ir trynimas kompiuteryje bei GitHub'e. Vardas ir el. paštas (`git config`), darbalaukio aplankas `devops` ir `gh auth login` daromi aplinkos patikroje ir į užduotis neįeina. Projekto šablono klonavimas bus 02 pamokoje.

## Pamokos eiga (dėstytojui)

Patikrinta: klasės ir užduočių Git eiga (`git init`, commit, šaka, `merge`, `clone` į kitą aplanką) paleista macOS. 1 užduoties pabaiga `gh repo create` be vardo (Push an existing local repository, kelias `.`, Public, remote `origin`, push Yes) paleista macOS ir `main` atsirado GitHub'e. Nepatikrinta: WSL2 Ubuntu ir `GH007` dėl privataus el. pašto.

### Demonstracijos žingsniai

1 ir 2 užduočių atskiro sprendimo nėra: visos komandos ir laukiamas rezultatas yra `uzduotys/1-uzduotis.md` ir `2-uzduotis.md`. 3 užduoties sprendimas yra `uzduotys/3-uzduotis-sprendimas.md`. Demonstracijai naudokite kitą pavyzdį nei `git-bandymas` (žr. skaidres). Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose.
