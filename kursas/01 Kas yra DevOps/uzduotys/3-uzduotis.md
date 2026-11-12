# 3 užduotis: Nusiklonuokite savo repozitoriją

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, pridėta Teams'e).

**Tikslas:** Nusiklonuoti `git-bandymas` į naują aplanką ir jame pakartoti darbą su šaka: pakeitimas, commit, sujungimas, šakos trynimas.

**Pirma dalis: clone**

1. Atidarykite terminalą ir pereikite į aplanką `devops`.
2. Pažiūrėkite savo repozitorijos `git-bandymas` HTTPS nuorodą.
3. Nusiklonuokite repozitoriją į aplanką `git-bandymas-kopija` (`git-bandymas` jau užimtas).
4. Pereikite į `git-bandymas-kopija`.
5. Patikrinkite failus: turi būti `pastabos.txt` ir `idejos.txt`.
6. Patikrinkite nuotolinę nuorodą: ji rodo jūsų repozitoriją.
7. Patikrinkite istoriją: yra 1 užduoties commit'ai.

**Antra dalis: dokumentas main šakoje**

1. Sukurkite failą `devops-dokumentas.md` ir atidarykite jį iš terminalo redaktoriuje. Markdown rezultatą galite pasižiūrėti [markdownlivepreview.com](https://markdownlivepreview.com).
2. Įrašykite pirmo lygio antraštę `# Kas yra DevOps` ir po ja 3–4 sakinius savais žodžiais, kas yra DevOps (pavyzdys apačioje).
3. Pridėkite antro lygio antraštę `## Kur gali lūžti` ir po ja numeruotą sąrašą (`1.`, `2.`): 2 vietos, kur grandinė gali lūžti, kiekviena su vienu sakiniu kodėl (pavyzdys apačioje).
4. Pridėkite failą į Git.
5. Padarykite commit su žinute „Pridėta, kur gali lūžti“.
6. Nusiųskite į GitHub.
7. Pažiūrėkite failus, esančius GitHub repozitorijoje: turi atsirasti `devops-dokumentas.md`.

**Trečia dalis: šaka skyriai**

1. Sukurkite šaką `skyriai` ir persijunkite į ją.
2. Atidarykite dokumentą iš terminalo redaktoriuje ir papildykite jį skyriumi `## Kodėl DevOps`: 2 sakiniai, kuo DevOps naudingas komandai (pavyzdys apačioje).
3. Padarykite commit su žinute „Pridėta, kodėl DevOps“.
4. Nusiųskite šaką `skyriai` į GitHub.
5. Pažiūrėkite šakas GitHub repozitorijoje: turi būti `main` ir `skyriai`.
6. Grįžkite į `main`.
7. Atidarykite `devops-dokumentas.md` ir įsitikinkite, kad skyriaus `## Kodėl DevOps` dar nėra.

**Ketvirta dalis: sujungimas ir šakos trynimas**

1. Sujunkite šaką `skyriai` į `main`.
2. Nusiųskite `main` į GitHub.
3. Ištrinkite šaką `skyriai` kompiuteryje.
4. Ištrinkite šaką `skyriai` GitHub'e.
5. Peržiūrėkite istoriją su šakomis.

**Penkta dalis: šakos trynimas mažąja ir didžiąja raide**

1. Atidarykite oficialią Git dokumentaciją apie šakos trynimą ir suraskite, kuo skiriasi mažoji ir didžioji raidė.
2. Atidarykite dokumentą iš terminalo redaktoriuje ir pridėkite skyrių `## Git` ir užrašykite atsakymą savais žodžiais.
3. Padarykite commit su žinute „Pridėta apie šakų trynimą“.
4. Nusiųskite į GitHub.
5. Patikrinkite, kad dokumente ir repozitorijoje nėra slaptažodžių ar realių IP.
6. **Papildomai:** pažaiskite [Learn Git Branching](https://learngitbranching.js.org/) pirmą lygių grupę arba parašykite dokumente, kas yra merge commit.

**Markdown pavyzdys**

Dokumentas turi tris skyrius. Galite įklijuoti pavyzdį ir pakeisti tekstą savais žodžiais, bet kiekvieną skyrių pridėkite toje dalyje, kurioje jis minimas:

```markdown
# Kas yra DevOps

DevOps yra būdas, kaip kūrėjai ir sistemų administratoriai dirba kartu, kad programa greitai ir saugiai pasiektų vartotoją. Pagrindinė idėja: kuo daugiau žingsnių automatizuoti ir kuo dažniau išleisti mažus pakeitimus. Tai ne vienas įrankis, o darbo kultūra ir procesas.

## Kur gali lūžti

1. Testai: jei jų nėra, klaida pasiekia vartotoją.
2. Diegimas: ranka diegiant, galima pamiršti žingsnį ir serveris veiks kitaip nei kompiuteryje.

## Kodėl DevOps

DevOps leidžia komandai išleisti pakeitimus greičiau ir su mažesne rizika, nes daug žingsnių atlieka automatika. Klaidas randame anksti, o ne pas vartotoją.
```
