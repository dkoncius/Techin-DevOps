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
7. Aplinkos patikra (~10 min): `README.md` skyrius „Aplinka“; jei WSL nepavyksta, „Jei WSL nepavyko“ (turi būti išspręsta prieš 02 pamoką)
8. Užduotis 1 (~45 min): [3-skaidres](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/3-skaidres.html), 14–17 ir 21 skaidrės; nuo aplanko iki GitHub, šaka ir sujungimas; užduotys skelbiamos po vieną Teams'e
9. Užduotis 2 (~55 min): [3-skaidres](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/01%20Kas%20yra%20DevOps/skaidres/3-skaidres.html), 18–20 skaidrės (21 skaidrėje abi užduotys); repozitorija per svetainę, `clone`, dokumentas, šaka, sujungimas, šakos trynimas
10. Kita paskaita: pakartosime Linux terminalo temą (navigacija, failai, teisės)

Nuorodos: [GitHub Hello World](https://docs.github.com/en/get-started/start-your-journey/hello-world), [Learn Git Branching](https://learngitbranching.js.org/), [Pro Git](https://git-scm.com/book/en/v2)

## Užduotys

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, pridėta Teams'e). Nuorodos yra klasės darbe.

Užduotis skelbiu po vieną (Teams). Pirmiausia parodau gyvai kitu pavyzdžiu, tada darote savo kompiuteryje ir tik baigę gaunate kitą. Vardas ir el. paštas (`git config`), darbalaukio aplankas `devops` ir `gh auth login` padaromi aplinkos patikroje. Projekto šablono klonavimas bus 02 pamokoje.

### 1️⃣ Create your repo

1. **Tikslas:** Viename aplanke pakartoti visą kelią: failai → GitHub → commit → šaka su pakeitimu → sujungimas į `main`.
2. Darbalaukyje esančiame aplanke `devops` sukurkite aplanką `git-bandymas` ir atidarykite jį terminale.
3. Aplanke `git-bandymas` sukurkite du failus: `pastabos.txt` ir `idejos.txt` (kiekviename bent viena eilutė).
4. Prisijunkite prie GitHub per `gh` (tik pirmą kartą).
5. GitHub'e sukurkite tuščią repozitoriją `git-bandymas` (Public).
6. Paverskite aplanką `git-bandymas` Git repozitorija.
7. Pridėkite abu failus (ne sistemos failų, pvz. `.DS_Store`) ir padarykite pirmą commit su žinute „Du failai“.
8. Susiekite aplanką su GitHub repozitorija ir nusiųskite commit'ą į šaką `main`.
9. Atidarykite repozitoriją naršyklėje; terminale patikrinkite nuotolinę nuorodą ir commit istoriją.
10. Sukurkite šaką `papildymas` ir persijunkite į ją.
11. Šakoje `papildymas` papildykite `pastabos.txt` viena eilute ir padarykite commit su žinute „Papildytas pastabos.txt“.
12. Nusiųskite šaką `papildymas` į GitHub (naršyklėje turi atsirasti šaka `papildymas`).
13. Grįžkite į `main` ir įsitikinkite, kad `pastabos.txt` vėl be naujos eilutės.
14. Sujunkite `papildymas` į `main` ir nusiųskite `main` į GitHub.
15. Ištrinkite šaką `papildymas` kompiuteryje ir GitHub'e; peržiūrėkite commit istoriją.
16. **Kodėl:** vienu sakiniu užrašykite (galite `pastabos.txt`), kuo GitHub kopija geresnė už aplanką tik jūsų kompiuteryje, ir kodėl pakeitimą geriau daryti šakoje, o ne tiesiai `main`.
17. **Papildomai:** prieš sujungimą `main` papildykite `idejos.txt` viena eilute ir padarykite commit, tada sujunkite: `git log --oneline --graph --all` parodys dvi šakas, kurios susijungia.

### 2️⃣ Clone your repo

1. **Tikslas:** Sukurti repozitoriją GitHub svetainėje, įkelti į ją dokumentą nutempdami (drag and drop), susieti su kompiuteriu ir toliau papildyti dokumentą kompiuteryje.
2. Aplanke `devops` sukurkite aplanką `git-svetaine-failai`.
3. Aplanke `git-svetaine-failai` sukurkite failą `devops-dokumentas.md`: antraštė ir 3–4 sakiniai savais žodžiais, kas yra DevOps.
4. Naršyklėje atidarykite github.com ir sukurkite naują repozitoriją `git-svetaine` (**New repository**, Public, nieko nepažymėkite: be README, be `.gitignore`).
5. Naujos repozitorijos puslapyje spauskite *uploading an existing file*, nutempkite `devops-dokumentas.md` iš `git-svetaine-failai` ir spauskite **Commit changes**.
6. Terminale aplanke `devops` nusiklonuokite repozitoriją `git-svetaine` ir pereikite į jos aplanką.
7. Patikrinkite: aplanke yra `devops-dokumentas.md`, nuotolinė nuoroda rodo jūsų repozitoriją, o commit istorijoje yra commit'as iš GitHub svetainės.
8. Kompiuteryje papildykite dokumentą skyriumi „Kur gali lūžti“: 2 vietos, kur grandinė gali lūžti, kiekviena su vienu sakiniu kodėl. Padarykite commit su žinute „Pridėta, kur gali lūžti“.
9. Nusiųskite commit'ą į GitHub ir naršyklėje patikrinkite, kad pakeitimas atsirado.
10. Sukurkite šaką `skyriai` ir persijunkite į ją.
11. Šakoje `skyriai` papildykite dokumentą skyriumi „Kodėl DevOps“: 2 sakiniai, kuo DevOps naudingas komandai. Padarykite commit su žinute „Pridėta, kodėl DevOps“.
12. Nusiųskite šaką `skyriai` į GitHub (naršyklėje turi atsirasti šaka `skyriai`).
13. Grįžkite į `main` ir įsitikinkite, kad skyriaus „Kodėl DevOps“ dokumente dar nėra.
14. Sujunkite `skyriai` į `main` ir nusiųskite `main` į GitHub.
15. Ištrinkite šaką `skyriai` kompiuteryje ir GitHub'e.
16. Išsiaiškinkite pagal oficialią dokumentaciją, kuo skiriasi šakos trynimas mažąja ir didžiąja raide. Atsakymą užrašykite dokumento skyriuje „Git“, padarykite commit su žinute „Pridėta apie šakų trynimą“ ir nusiųskite.
17. Patikrinkite, kad dokumente ir repozitorijoje nėra slaptažodžių ar realių IP.
18. **Kodėl:** vienu sakiniu užrašykite, kuo šis būdas skiriasi nuo `gh repo create` ir kodėl pradėjus svetainėje darbą galima tęsti kompiuteryje.
19. **Papildomai:** pažaiskite [Learn Git Branching](https://learngitbranching.js.org/) pirmą lygių grupę arba parašykite dokumente, kas yra merge commit.

## Komandos

## 1️⃣ Create your repo

2–3. Aplankas ir failai:

   ```bash
   # Susikurti DevOps aplankalą darbalaukyje
   # Atsidaryti DevOps aplankalą per terminalą
   mkdir git-bandymas
   cd git-bandymas
   echo "pirma pastaba" > pastabos.txt
   echo "pirma idėja" > idejos.txt
   ls
   cat pastabos.txt
   ```

4–5. Prisijungimas ir repozitorija GitHub'e:

   ```bash
   gh auth login   # tik pirmą kartą
   gh repo create
   ```

   Klausimai: pirmas pasirinkimas turi būti *Create a new repository on github.com from scratch*; pavadinimas `git-bandymas`; Public; README, `.gitignore` ir license: No; *Clone the new repository locally?* No.

6–7. Git repozitorija ir commit:

   ```bash
   git init
   git status
   git add pastabos.txt idejos.txt
   git commit -m "Du failai"
   git log --oneline
   ```

8. Susiejimas ir nusiuntimas (nuorodą nukopijuokite iš GitHub puslapio „Quick setup“):

   ```bash
   git remote add origin <nuoroda iš GitHub>
   git push -u origin main
   ```

9. Patikra:

   ```bash
   git remote -v
   git log --oneline
   ```

10. Šaka:

   ```bash
   git switch -c papildymas
   ```

11–12. Pakeitimas šakoje ir šakos nusiuntimas:

   ```bash
   echo "papildymas" >> pastabos.txt
   git commit -am "Papildytas pastabos.txt"
   git push -u origin papildymas
   ```

13. Grįžimas į `main`:

   ```bash
   git switch main
   cat pastabos.txt
   ```

14–15. Sujungimas ir šakos trynimas:

    ```bash
    git merge papildymas
    git push
    git branch -d papildymas
    git push origin --delete papildymas
    git log --oneline --graph --all
    ```

17. Papildomai (sujungimas su pakeitimu `main`): `git switch main`, `echo "pokytis" >> idejos.txt`, `git commit -am "Pakeistas idejos.txt"`, tada `git merge papildymas -m "Sujungta papildymas"` (be `-m` atsidaro redaktorius: išeiti `:wq`)

## 2️⃣ Clone your repo

2–3. Aplankas ir dokumentas (aplanke `devops`):

   ```bash
   mkdir git-svetaine-failai
   cat > git-svetaine-failai/devops-dokumentas.md <<'EOF'
   # Kas yra DevOps

   DevOps yra būdas, kaip kūrėjai ir sistemų administratoriai dirba kartu, kad programa greitai ir saugiai pasiektų vartotoją. Pagrindinė idėja: kuo daugiau žingsnių automatizuoti ir kuo dažniau išleisti mažus pakeitimus. Tai ne vienas įrankis, o darbo kultūra ir procesas.
   EOF
   ```

   Studentai gali kurti redaktoriumi (pvz. VS Code); `cat` čia tik greitesnis dėstytojui.

4. Svetainėje: **New repository** (viršuje dešinėje `+`), pavadinimas `git-svetaine`, Public, be README.
5. Svetainėje: *uploading an existing file* → nutempkite `devops-dokumentas.md` iš `git-svetaine-failai` → **Commit changes**.
6. Lokali kopija (aplanke `devops`; nuorodą nukopijuokite per **Code** → HTTPS):

   ```bash
   git clone https://github.com/<vartotojas>/git-svetaine.git
   cd git-svetaine
   ls
   ```

   Klonuojama į `git-svetaine`, nes `git-svetaine-failai` yra atskiras aplankas (be `.git`).

7. Patikra:

   ```bash
   git remote -v
   git log --oneline
   ```

8–9. Pakeitimas kompiuteryje ir nusiuntimas:

   ```bash
   cat >> devops-dokumentas.md <<'EOF'

   ## Kur gali lūžti

   1. Testai: jei jų nėra, klaida pasiekia vartotoją.
   2. Diegimas: ranka diegiant, galima pamiršti žingsnį ir serveris veiks kitaip nei kompiuteryje.
   EOF
   git commit -am "Pridėta, kur gali lūžti"
   git push
   ```

10–13. Šaka `skyriai`:

   ```bash
   git switch -c skyriai
   cat >> devops-dokumentas.md <<'EOF'

   ## Kodėl DevOps

   DevOps leidžia komandai išleisti pakeitimus greičiau ir su mažesne rizika, nes daug žingsnių atlieka automatika. Klaidas randame anksti, o ne pas vartotoją.
   EOF
   git commit -am "Pridėta, kodėl DevOps"
   git push -u origin skyriai
   git switch main
   ```

14–15. Sujungimas ir šakos trynimas:

   ```bash
   git merge skyriai
   git push
   git branch -d skyriai
   git push origin --delete skyriai
   ```

16. `git branch --help` (skyrius apie `-d` ir `-D`) arba Pro Git knyga; atsakymas dokumente, tada `git commit -am "..."` ir `git push`.

## Sprendimas (dėstytojui)

Patikrinta: klasės ir užduočių Git eiga (`git init`, commit, šaka, `merge`, `push`) buvo paleista macOS (bash 3.2) su laikina nuotoline repozitorija vietoj GitHub. Nauji komandų blokai (`cat >` su `EOF`) dar nepaleisti. Nepatikrinta: `gh repo create` ir GitHub dalis (reali paskyra, Public, `GH007` dėl privataus el. pašto) bei WSL2 Ubuntu; daroma ranka prieš pamoką.

### Sprendimas pagal darbus

| Darbas | Kur sprendime |
|---|---|
| `git-bandymas` su `pastabos.txt` ir `idejos.txt` GitHub'e | `git remote -v`, GitHub puslapis |
| Šaka `papildymas` sujungta į `main` | `git log --oneline --graph --all` rodo sujungimą |
| `devops-dokumentas.md` per svetainę ir `clone` į `git-svetaine` | `git log --oneline` rodo commit iš svetainės |
| „Kur gali lūžti“ ir „Kodėl DevOps“ | dokumento skyriai, šaka `skyriai` sujungta |
| `git branch -d` ir `-D` | dokumento skyrius „Git“ |
| Slaptų duomenų nėra | dokumente ir repo be slaptažodžių ir realių IP |

Vardas ir el. paštas bei darbalaukio aplankas `devops` daromi aplinkos patikroje (`git config --global --list`, `gh auth status`) ir į užduotis neįeina. `git init`, `gh repo create` ir pirmas `merge` yra Užduotyje 1; repozitorija per svetainę, `clone`, dokumentas, šaka ir sujungimas Užduotyje 2. Dirbtinio intelekto abiejose užduotyse nenaudojame. Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose (vertinimas.md).

### Pavyzdinis failas

#### `devops-dokumentas.md`

````markdown
# Kas yra DevOps

DevOps yra būdas, kaip kūrėjai ir sistemų administratoriai dirba kartu, kad programa greitai ir saugiai pasiektų vartotoją. Pagrindinė idėja: kuo daugiau žingsnių automatizuoti ir kuo dažniau išleisti mažus pakeitimus. Tai ne vienas įrankis, o darbo kultūra ir procesas.

## Kur gali lūžti

1. Testai: jei jų nėra, klaida pasiekia vartotoją.
2. Diegimas: ranka diegiant, galima pamiršti žingsnį ir serveris veiks kitaip nei kompiuteryje.

## Kodėl DevOps

DevOps leidžia komandai išleisti pakeitimus greičiau ir su mažesne rizika, nes daug žingsnių atlieka automatika. Klaidas randame anksti, o ne pas vartotoją.

## Git

`git branch -d` ištrina šaką tik jei ji jau sujungta į dabartinę šaką, todėl nepaleistų pakeitimų neprarandame. `git branch -D` ištrina šaką priverstinai, net jei ji nesujungta, ir tada jos commit'ai gali dingti. Todėl įprastai naudojamas `-d`.
````
