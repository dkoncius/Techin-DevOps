# 01 Kas yra DevOps

Data: 2026-11-11 (trečiadienis)

## Klasės darbas

3 val. Skaidrėse **N** rodo pastabas.

1. Prisistatymas (~5 min): [1-apie-mane](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/1-apie-mane.html), 1–4 skaidrės
2. Susipažinkime (~10 min): [1-apie-mane](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/1-apie-mane.html), 5 skaidrė; atsakymus užrašyti [Google lentelėje](https://docs.google.com/spreadsheets/d/1K_lsp3dnYaUWD2iWq_jCH5XMv4ZkYzXnXAclkF0Y7mA/edit?gid=0#gid=0)
3. Terminalas (~5 min): [1-apie-mane](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/1-apie-mane.html), 6 skaidrė (`wsl --install` / `xcode-select --install`)
4. Kurso eiga (~10 min): [2-apie-kursa](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/2-apie-kursa.html); vertinimo procentų nesakyti, jie nepatvirtinti
5. Kas yra DevOps (~20 min): [3-skaidres](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/3-skaidres.html), 1–13 skaidrės; [roadmap.sh/devops](https://roadmap.sh/devops)
6. Pertrauka (~15 min): Windows perkrauna ir vieną kartą paleidžia Ubuntu; Mac patikrina `xcode-select`
7. Aplinkos patikra (~10 min): [WSL diegimo sąrašas](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/checklists/WSL%20diegimo%20s%C4%85ra%C5%A1as.html), kurį paskelbiate ir Teams'e prie paskaitos (žingsniai su komanda ir laukiamu rezultatu); jei WSL nepavyksta, sąraše „Jei WSL nepavyko“ (turi būti išspręsta prieš 02 pamoką)
8. Užduotis 1 (~45 min): [3-skaidres](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/3-skaidres.html), 14–17 ir 23 skaidrės; nuo aplanko iki commit, šaka ir sujungimas, be GitHub; užduotys skelbiamos po vieną Teams'e
9. Užduotis 2 (~15 min): [3-skaidres](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/3-skaidres.html), 18–19 skaidrės; tuščia repozitorija GitHub per terminalą ir susiejimas su aplanku, žingsnius darome kartu su dėstytoju
10. Užduotis 3 (~40 min): [3-skaidres](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/3-skaidres.html), 20–21 skaidrės (23 skaidrėje visos užduotys); `clone` į naują aplanką, šaka, sujungimas, šakos trynimas, savarankiškai
11. Kita paskaita: pakartosime Linux terminalo temą (navigacija, failai, teisės)

Nuorodos: [GitHub Hello World](https://docs.github.com/en/get-started/start-your-journey/hello-world), [Learn Git Branching](https://learngitbranching.js.org/), [Pro Git](https://git-scm.com/book/en/v2)

## Užduotys

Užduotys yra atskiruose failuose `uzduotys/1-uzduotis.md` … `3-uzduotis.md` (dėstytojas skelbia Teams'e po vieną: pirma demonstracija, tada darbas). Visos per terminalą: 1 – `git-bandymas` vietoje (`init`, commit, šaka, `merge`), 2 – tuščia repozitorija GitHub per `gh` ir rankinis susiejimas, 3 – `clone`, dokumentas, šaka, sujungimas ir šakos trynimas. Vardas ir el. paštas (`git config`), darbalaukio aplankas `devops` ir `gh auth login` daromi aplinkos patikroje ir į užduotis neįeina. Projekto šablono klonavimas bus 02 pamokoje.

## Pamokos eiga (dėstytojui)

Patikrinta: klasės ir užduočių Git eiga (`git init`, commit, šaka, `merge`, tada `git remote add` į laikiną nuotolinę repozitoriją, `push`, `clone` į kitą aplanką) paleista macOS. Nepatikrinta: tikra GitHub paskyra (Public, tuščia repozitorija, `GH007` dėl privataus el. pašto) ir WSL2 Ubuntu; daroma ranka prieš pamoką.

### Demonstracijos žingsniai

Demonstracijos komandos ir sprendimai yra atskiruose failuose: `uzduotys/1-uzduotis-sprendimas.md`, `2-uzduotis-sprendimas.md`, `3-uzduotis-sprendimas.md` (rodoma tuo pačiu pavadinimu `git-bandymas`; demonstracijai naudokite kitą pavyzdį, žr. skaidres). Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose.
