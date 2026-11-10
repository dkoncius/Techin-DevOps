# 01 Kas yra DevOps

Data: 2026-11-11 (trečiadienis)

## Klasės darbas

3 val. Skaidrėse **N** rodo pastabas.

1. Prisistatymas (~5 min): [1-apie-mane](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/1-apie-mane.html), 1–4 skaidrės
2. Susipažinkime (~10 min): [1-apie-mane](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/1-apie-mane.html), 5 skaidrė; atsakymus užrašyti [Google lentelėje](https://docs.google.com/spreadsheets/d/1K_lsp3dnYaUWD2iWq_jCH5XMv4ZkYzXnXAclkF0Y7mA/edit?gid=0#gid=0)
3. Terminalas (~5 min): [1-apie-mane](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/1-apie-mane.html), 6 skaidrė (`wsl --install` / `xcode-select --install`)
4. Kurso eiga (~10 min): [2-apie-kursa](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/2-apie-kursa.html); vertinimo procentų nesakyti, jie nepatvirtinti
5. Kas yra DevOps (~20 min): [3-skaidres](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/3-skaidres.html), 1–13 skaidrės; [roadmap.sh/devops](https://roadmap.sh/devops)
6. Pertrauka (~15 min): Windows perkrauna ir vieną kartą paleidžia Ubuntu; Mac patikrina `xcode-select`
7. Aplinkos patikra (~10 min): `README.md` skyrius „Aplinka“; jei WSL nepavyksta, „Jei WSL nepavyko“ (turi būti išspręsta prieš 02 pamoką)
8. Git per užduotis (~30 min): [3-skaidres](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/3-skaidres.html), 14–17 skaidrės; Užduotys 1 ir 2; užduotys skelbiamos po vieną Teams'e
9. `/health` (~5 min): [`app.py`](https://github.com/dkoncius/devops-projektas-starter-template/blob/main/app.py) naršyklėje
10. Užduotis 3 (~70 min): [3-skaidres](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/3-skaidres.html), 18–20 skaidrės
11. Kita paskaita: pakartosime Linux terminalo temą (navigacija, failai, teisės)

Nuorodos: [GitHub Hello World](https://docs.github.com/en/get-started/start-your-journey/hello-world), [Learn Git Branching](https://learngitbranching.js.org/), [Pro Git](https://git-scm.com/book/en/v2)

## Užduotys

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje arba klauskite LLM, ir užsirašykite, kas padėjo. Nuorodos yra klasės darbe. Komandos yra skyriuje „Komandos“: žiūrėkite tik įstrigę.

Užduotis skelbiu po vieną (Teams). Pirmiausia parodau gyvai kitu pavyzdžiu, tada darote savo kompiuteryje ir tik baigę gaunate kitą. Vardas ir el. paštas (`git config`), aplankas `~/devops` ir `gh auth login` padaromi aplinkos patikroje. Projekto šablono klonavimas bus 02 pamokoje.

### 1️⃣ Git: nuo aplanko iki GitHub

1. **Tikslas:** Pakartoti žinomą Git kelią: aplankas su failais → commit → jūsų repozitorija GitHub'e.
2. Sukurkite aplanką `~/devops/git-bandymas` ir jame du failai: `pastabos.txt` ir `idejos.txt` (kiekviename bent viena eilutė).
3. Paverskite aplanką Git repozitorija ir padarykite pirmą commit su abiem failais.
4. Sukurkite repozitoriją GitHub'e (Public: jokių slaptažodžių, raktų, `.env`) ir nusiųskite commit'ą.
5. Atidarykite repozitoriją naršyklėje; terminale patikrinkite nuotolinę nuorodą ir commit istoriją.
6. **Kodėl:** vienu sakiniu užrašykite (galite `pastabos.txt`), kuo GitHub kopija geresnė už aplanką tik jūsų kompiuteryje.

### 2️⃣ Git: šaka ir sujungimas

1. **Tikslas:** Padaryti pakeitimą atskiroje šakoje, tuo pačiu metu pakeisti `main` ir sujungti.
2. Sukurkite šaką `papildymas` ir persijunkite į ją.
3. Šakoje papildykite `pastabos.txt` viena eilute ir padarykite commit.
4. Grįžkite į `main` ir įsitikinkite, kad `pastabos.txt` vėl be naujos eilutės.
5. Šakoje `main` papildykite `idejos.txt` viena eilute ir padarykite commit.
6. Sujunkite `papildymas` į `main` ir ištrinkite šaką.
7. Nusiųskite `main` į GitHub ir peržiūrėkite commit grafiką: turi matytis dvi šakos, kurios susijungia.
8. **Kodėl:** vienu sakiniu užrašykite, kodėl pakeitimą geriau daryti šakoje, o ne tiesiai `main`.

### 3️⃣ Git: DevOps dokumentas ir `/health`

1. **Tikslas:** Per šaką sukurti pirmą dokumentą apie DevOps, sujungti jį į `main` ir nusiųsti į GitHub.
2. Aplanke `~/devops/git-bandymas` sukurkite šaką `devops-docs` iš `main`.
3. Šakoje sukurkite `docs/devops.md`: 3–4 sakiniai savais žodžiais, kas yra DevOps; numeruotas sąrašas „nuo kodo iki vartotojo“ (5–7 žingsniai) ir 2 vietos, kur grandinė gali lūžti, kiekviena su vienu sakiniu kodėl. Padarykite commit.
4. Naršyklėje atidarykite [`app.py`](https://github.com/dkoncius/devops-projektas-starter-template/blob/main/app.py) iš projekto šablono ir suraskite maršrutą `/health`. Faile `docs/devops.md` paaiškinkite, ką jis grąžina (atsakymą ir kodą) ir kam toks maršrutas reikalingas. Padarykite commit.
5. Išsiaiškinkite pagal oficialią dokumentaciją, kuo skiriasi šakos trynimas mažąja ir didžiąja raide (žingsnių čia nėra, tik tikslas). Atsakymą užrašykite `docs/devops.md` skyriuje „Git“ ir padarykite commit. **Šakos `devops-docs` netrinkite**: ji reikalinga savitikrai.
6. Sujunkite šaką į `main` ir nusiųskite `main` į GitHub.
7. Patikrinkite, kad faile ir repozitorijoje nėra slaptažodžių, raktų ar realių IP.
8. **Papildomai:** pažaiskite [Learn Git Branching](https://learngitbranching.js.org/) pirmą lygių grupę arba parašykite `docs/devops.md`, kas yra merge commit.

## Komandos

## 1️⃣ Nuo aplanko iki GitHub

2. Aplankas ir failai:

   ```bash
   mkdir -p ~/devops/git-bandymas
   cd ~/devops/git-bandymas
   echo "pirma pastaba" > pastabos.txt
   echo "pirma idėja" > idejos.txt
   ```

3. Git repozitorija ir commit:

   ```bash
   git init
   git status
   git add .
   git commit -m "Du failai"
   ```

4. Repozitorija GitHub'e ir nusiuntimas:

   ```bash
   gh repo create git-bandymas --public --source . --push
   ```

5. Patikra:

   ```bash
   git remote -v
   git log --oneline
   ```

## 2️⃣ Šaka ir sujungimas

2. `git switch -c papildymas`
3. `echo "papildymas" >> pastabos.txt`, tada `git commit -am "Papildytas pastabos.txt"`
4. `git switch main`, tada `cat pastabos.txt`
5. `echo "pokytis" >> idejos.txt`, tada `git commit -am "Pakeistas idejos.txt"`
6. `git merge papildymas -m "Sujungta papildymas"`, tada `git branch -d papildymas` (be `-m` atsidaro redaktorius: išeiti `:wq`)
7. `git push`, tada `git log --oneline --graph --all`

## 3️⃣ DevOps dokumentas ir `/health`

2. `git switch -c devops-docs`
3. `mkdir -p docs`, failą kurkite redaktoriumi, tada `git add docs/devops.md` ir `git commit -m "..."`
5. `git branch --help` (skyrius apie `-d` ir `-D`) arba Pro Git knyga
6. `git switch main`, `git merge devops-docs -m "..."`, `git push`

## Sprendimas (dėstytojui)

Patikrinta: visa klasės ir užduoties Git eiga (`git init`, commit, šaka, `merge`, `push`) paleista macOS (bash 3.2) su laikina nuotoline repozitorija vietoj GitHub. Nepatikrinta: `gh repo create` ir GitHub dalis (reali paskyra, Public, `GH007` dėl privataus el. pašto) bei WSL2 Ubuntu; daroma ranka prieš pamoką.

### Sprendimas pagal darbus

| Darbas | Kur sprendime |
|---|---|
| Šaka `devops-docs` iš `main` | `git branch` rodo `devops-docs` |
| `docs/devops.md`: DevOps paaiškinimas, grandinė, 2 lūžimo vietos | `docs/devops.md` |
| `/health` skaitymas | `docs/devops.md`, skyrius `/health` |
| `git branch -d` ir `-D` | `docs/devops.md`, skyrius „Git“ |
| Šaka sujungta į `main` ir `push` | `git log --oneline --graph --all` rodo sujungimą |
| Slaptų duomenų nėra | `docs/devops.md` ir repo be slaptažodžių, raktų, tokenų, realių IP |

Vardas ir el. paštas bei `~/devops` daromi aplinkos patikroje (`git config --global --list`, `gh auth status`) ir į užduotis neįeina. `git init`, `gh repo create` ir pirmas `merge` yra Užduotyse 1 ir 2; lentelė žemiau apie Užduotį 3. Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose (vertinimas.md).

### Pavyzdiniai failai

#### `docs/devops.md`

````markdown
# Kas yra DevOps

DevOps yra būdas, kaip kūrėjai ir sistemų administratoriai dirba kartu, kad programa greitai ir saugiai pasiektų vartotoją. Pagrindinė idėja: kuo daugiau žingsnių automatizuoti ir kuo dažniau išleisti mažus pakeitimus. Tai ne vienas įrankis, o darbo kultūra ir procesas.

## Nuo kodo iki vartotojo

1. Kūrėjas parašo kodą savo kompiuteryje.
2. Kodas išsaugomas Git šakoje ir nusiunčiamas į GitHub.
3. Atidaromas Pull Request, kitas žmogus peržiūri pakeitimus.
4. Automatiniai testai patikrina, ar nieko nesulaužyta.
5. Programa supakuojama ir įdiegiama į serverį.
6. Vartotojas ją naudoja, o stebėsena rodo, ar viskas gerai.

Kur gali lūžti:

1. Testai: jei jų nėra, klaida pasiekia vartotoją.
2. Diegimas: ranka diegiant, galima pamiršti žingsnį ir serveris veiks kitaip nei kompiuteryje.

## /health

Maršrutas `/health` grąžina JSON `{"status": "ok"}` ir HTTP kodą 200. Jis skirtas patikrinti, ar programa gyva: pvz. monitoringas ar Kubernetes gali kreiptis į jį ir žinoti, ar programą reikia perkrauti.

## Git

`git branch -d` ištrina šaką tik jei ji jau sujungta į dabartinę šaką, todėl nepaleistų pakeitimų neprarandame. `git branch -D` ištrina šaką priverstinai, net jei ji nesujungta, ir tada jos commit'ai gali dingti. Todėl įprastai naudojamas `-d`.
````
