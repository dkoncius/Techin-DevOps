# 3 užduotis: Nusiklonuokite savo repozitoriją

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, pridėta Teams'e).

**Tikslas:** Nusiklonuoti `git-bandymas` į naują aplanką ir jame pakartoti darbą su šaka: pakeitimas, commit, sujungimas, šakos trynimas.

**1 dalis: clone**

2. Atidarykite terminalą ir pereikite į aplanką `devops`.
3. Pažiūrėkite savo repozitorijos `git-bandymas` HTTPS nuorodą.
4. Nusiklonuokite repozitoriją į aplanką `git-bandymas-kopija` (`git-bandymas` jau užimtas).
5. Pereikite į `git-bandymas-kopija`.
6. Patikrinkite failus: turi būti `pastabos.txt` ir `idejos.txt`.
7. Patikrinkite nuotolinę nuorodą: ji rodo jūsų repozitoriją.
8. Patikrinkite istoriją: yra 1 užduoties commit'ai.

**2 dalis: dokumentas** `main` **šakoje**

9. Sukurkite failą `devops-dokumentas.md` (pvz. VS Code arba terminale).
10. Įrašykite antraštę „Kas yra DevOps“ ir 3–4 sakinius savais žodžiais, kas yra DevOps.
11. Pridėkite skyrių „Kur gali lūžti“: 2 vietos, kur grandinė gali lūžti, kiekviena su vienu sakiniu kodėl.
12. Pridėkite failą į Git.
13. Padarykite commit su žinute „Pridėta, kur gali lūžti“.
14. Nusiųskite į GitHub.
15. Pažiūrėkite failus, esančius GitHub repozitorijoje: turi atsirasti `devops-dokumentas.md`.

**3 dalis: šaka** `skyriai`

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
33. **Papildomai:** pažaiskite [Learn Git Branching](https://learngitbranching.js.org/) pirmą lygių grupę arba parašykite dokumente, kas yra merge commit.
