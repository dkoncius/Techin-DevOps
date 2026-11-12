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

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, pridėta Teams'e).

Užduotis skelbiu po vieną (Teams). Pirmiausia parodau gyvai kitu pavyzdžiu, tada darote savo kompiuteryje ir tik baigę gaunate kitą. Vardas ir el. paštas (`git config`), darbalaukio aplankas `devops` ir `gh auth login` padaromi aplinkos patikroje. Projekto šablono klonavimas bus 02 pamokoje.

### 1️⃣ Sukurkite repozitoriją terminale

1. **Tikslas:** Viename aplanke pakartoti kelią be GitHub: failai → commit → šaka su pakeitimu → sujungimas į `main`.

**1 dalis: aplankas ir failai**

2. Atidarykite terminalą.
3. Pereikite į aplanką `devops` (jei jūsų aplankas kitur, naudokite savo kelią).
4. Sukurkite aplanką `git-bandymas`.
5. Pereikite į jį.
6. Sukurkite failą `pastabos.txt` su viena eilute.
7. Sukurkite failą `idejos.txt` su viena eilute.
8. Pažiūrėkite, kokie failai yra aplanke.
9. Patikrinkite, kad failai ne tušti.

**2 dalis: Git repozitorija ir pirmas commit**

10. Paverskite aplanką Git repozitorija.
11. Pažiūrėkite būseną: abu failai dar neįtraukti į Git.
12. Pridėkite abu failus.
13. Dar kartą pažiūrėkite būseną: abu failai paruošti commit.
14. Padarykite commit su žinute „Du failai“.
15. Peržiūrėkite commit istoriją.

**3 dalis: šaka su pakeitimu**

16. Sukurkite šaką `papildymas` ir persijunkite į ją.
17. Patikrinkite, kad esate šakoje `papildymas` (prie jos žvaigždutė).
18. Pridėkite eilutę į `pastabos.txt`.
19. Padarykite commit su žinute „Papildytas pastabos.txt“.
20. Peržiūrėkite istoriją.

**4 dalis: sujungimas į `main`**

21. Grįžkite į `main`.
22. Patikrinkite `pastabos.txt`: turi būti tik viena eilutė.
23. Sujunkite šaką `papildymas` į `main`.
24. Dar kartą patikrinkite `pastabos.txt`: dabar dvi eilutės.
25. Ištrinkite šaką `papildymas`.
26. Peržiūrėkite visą istoriją su šakomis.
27. **Kodėl:** užrašykite `pastabos.txt` vienu sakiniu, kuo commit istorija geresnė už failų keitimą be Git, ir kodėl pakeitimą geriau daryti šakoje, o ne tiesiai `main`.
28. **Papildomai:** pakartokite 16–19 su nauja šaka. Prieš sujungimą `main` papildykite `idejos.txt` viena eilute ir padarykite commit, tada sujunkite su sujungimo žinute. Istorija parodys dvi šakas, kurios susijungia.


### 2️⃣ Sukurkite repozitoriją GitHub ir susiekite

1. **Tikslas:** Per terminalą sukurti tuščią repozitoriją GitHub ir susieti ją su jau esančiu aplanku `git-bandymas`.

**1 dalis: prisijungimas**

2. Atidarykite terminalą ir pereikite į aplanką `git-bandymas`.
3. Patikrinkite, kad esate teisingame aplanke.
4. Patikrinkite, ar esate prisijungę prie GitHub (jei ne, prisijunkite, pasirinkite HTTPS).

**2 dalis: tuščia repozitorija GitHub**

5. Sukurkite viešą (Public) repozitoriją `git-bandymas` savo GitHub paskyroje: be README, be `.gitignore`, be licencijos ir nesusiekite jos su aplanku (susiesite patys kituose žingsniuose).
6. Pažiūrėkite sukurtos repozitorijos HTTPS nuorodą.

**3 dalis: susiejimas**

7. Pridėkite nuotolinę nuorodą vardu `origin`.
8. Patikrinkite, kad nuoroda pridėta: turi būti dvi eilutės (fetch ir push).
9. Nusiųskite šaką `main` į GitHub ir nustatykite, kad ji sektų `origin/main`.
10. Patikrinkite būseną: turi rašyti „up to date with 'origin/main'“.

**4 dalis: patikra GitHub**

11. Pažiūrėkite failus, esančius GitHub repozitorijoje: turi būti `pastabos.txt` ir `idejos.txt`.
12. Pažiūrėkite commit'us GitHub repozitorijoje: turi būti 1 užduoties commit'ai.

**5 dalis: tolesnis darbas tame pačiame aplanke**

13. Pridėkite eilutę į `idejos.txt`.
14. Padarykite commit su žinute „Papildytas idejos.txt“.
15. Nusiųskite į GitHub.
16. Pažiūrėkite commit'us GitHub repozitorijoje: turi atsirasti naujas commit.
17. **Kodėl:** užrašykite vienu sakiniu, ką sukuria `gh repo create` ir ką nusiunčia `git push`.

### 3️⃣ Nusiklonuokite savo repozitoriją

1. **Tikslas:** Nusiklonuoti `git-bandymas` į naują aplanką ir jame pakartoti darbą su šaka: pakeitimas, commit, sujungimas, šakos trynimas.

**1 dalis: clone**

2. Atidarykite terminalą ir pereikite į aplanką `devops`.
3. Pažiūrėkite savo repozitorijos `git-bandymas` HTTPS nuorodą.
4. Nusiklonuokite repozitoriją į aplanką `git-bandymas-kopija` (`git-bandymas` jau užimtas).
5. Pereikite į `git-bandymas-kopija`.
6. Patikrinkite failus: turi būti `pastabos.txt` ir `idejos.txt`.
7. Patikrinkite nuotolinę nuorodą: ji rodo jūsų repozitoriją.
8. Patikrinkite istoriją: yra 1 užduoties commit'ai.

**2 dalis: dokumentas `main` šakoje**

9. Sukurkite failą `devops-dokumentas.md` (pvz. VS Code arba terminale).
10. Įrašykite antraštę „Kas yra DevOps“ ir 3–4 sakinius savais žodžiais, kas yra DevOps.
11. Pridėkite skyrių „Kur gali lūžti“: 2 vietos, kur grandinė gali lūžti, kiekviena su vienu sakiniu kodėl.
12. Pridėkite failą į Git.
13. Padarykite commit su žinute „Pridėta, kur gali lūžti“.
14. Nusiųskite į GitHub.
15. Pažiūrėkite failus, esančius GitHub repozitorijoje: turi atsirasti `devops-dokumentas.md`.

**3 dalis: šaka `skyriai`**

16. Sukurkite šaką `skyriai` ir persijunkite į ją.
17. Papildykite dokumentą skyriumi „Kodėl DevOps“: 2 sakiniai, kuo DevOps naudingas komandai.
18. Padarykite commit su žinute „Pridėta, kodėl DevOps“.
19. Nusiųskite šaką `skyriai` į GitHub.
20. Pažiūrėkite šakas GitHub repozitorijoje: turi būti `main` ir `skyriai`.
21. Grįžkite į `main`.
22. Atidarykite `devops-dokumentas.md` ir įsitikinkite, kad skyriaus „Kodėl DevOps“ dar nėra.

**4 dalis: sujungimas ir šakos trynimas**

23. Sujunkite šaką `skyriai` į `main`.
24. Nusiųskite `main` į GitHub.
25. Ištrinkite šaką `skyriai` kompiuteryje.
26. Ištrinkite šaką `skyriai` GitHub'e.
27. Peržiūrėkite istoriją su šakomis.

**5 dalis: šakos trynimas mažąja ir didžiąja raide**

28. Atidarykite oficialią Git dokumentaciją apie šakos trynimą ir suraskite, kuo skiriasi mažoji ir didžioji raidė.
29. Pridėkite dokumente skyrių „Git“ ir užrašykite atsakymą savais žodžiais.
30. Padarykite commit su žinute „Pridėta apie šakų trynimą“.
31. Nusiųskite į GitHub.
32. Patikrinkite, kad dokumente ir repozitorijoje nėra slaptažodžių ar realių IP.
33. **Kodėl:** užrašykite vienu sakiniu, kuo `clone` skiriasi nuo `git init` su `git remote add` ir kodėl po `clone` nieko papildomai susieti nereikia.
34. **Papildomai:** pažaiskite [Learn Git Branching](https://learngitbranching.js.org/) pirmą lygių grupę arba parašykite dokumente, kas yra merge commit.



## Komandos

Komandų užduotyse nėra: studentai remiasi `git komandos.pdf` (Teams'e) ir dokumentacija. Dėstytojo sprendimas su komandomis yra `uzduotys/N-uzduotis-sprendimas.md`.

## Sprendimas (dėstytojui)

Patikrinta: klasės ir užduočių Git eiga (`git init`, commit, šaka, `merge`, tada `git remote add` į laikiną nuotolinę repozitoriją, `push`, `clone` į kitą aplanką) paleista macOS. Nepatikrinta: tikra GitHub paskyra (Public, tuščia repozitorija, `GH007` dėl privataus el. pašto) ir WSL2 Ubuntu; daroma ranka prieš pamoką.

### Sprendimas žingsnis po žingsnio

Komandos rodymui yra atskiruose failuose: `uzduotys/1-uzduotis-sprendimas.md`, `2-uzduotis-sprendimas.md`, `3-uzduotis-sprendimas.md`.

### Sprendimas pagal darbus

| Darbas | Kur sprendime |
|---|---|
| `git-bandymas` su `pastabos.txt` ir `idejos.txt` tik kompiuteryje, paskui GitHub'e | `git log --oneline` prieš push; po push tie patys commit'ai GitHub'e |
| Šaka `papildymas` sujungta į `main` dar be GitHub | `git log --oneline --graph --all` aplanke `git-bandymas` |
| Tuščia repozitorija GitHub susieta su aplanku | `git remote -v` rodo `origin` |
| `git-bandymas-kopija` po `clone` | `git log --oneline` rodo 1 užduoties commit'us |
| „Kur gali lūžti“ ir „Kodėl DevOps“ | `devops-dokumentas.md` kopijoje, šaka `skyriai` sujungta |
| `git branch -d` ir `-D` | dokumento skyrius „Git“ |
| Slaptų duomenų nėra | dokumente ir repo be slaptažodžių ir realių IP |

Vardas ir el. paštas bei darbalaukio aplankas `devops` daromi aplinkos patikroje (`git config --global --list`, `gh auth status`) ir į užduotis neįeina. `git init`, šaka ir pirmas `merge` yra Užduotyje 1; tuščia repozitorija GitHub (`gh repo create`) ir `git remote add` su `git push` yra Užduotyje 2; `clone`, dokumentas, šaka ir sujungimas Užduotyje 3. Dirbtinio intelekto užduotyse nenaudojame. Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose (vertinimas.md).
