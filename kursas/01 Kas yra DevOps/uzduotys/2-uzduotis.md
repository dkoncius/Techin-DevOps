# 2 užduotis: Clone your repo

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, pridėta Teams'e).

1. **Tikslas:** Sukurti repozitoriją GitHub svetainėje, įkelti į ją dokumentą nutempdami (drag and drop), susieti su kompiuteriu ir toliau papildyti dokumentą kompiuteryje.
2. Aplanke `devops` sukurkite aplanką `git-svetaine-failai`.
3. Aplanke `git-svetaine-failai` sukurkite failą `devops-dokumentas.md`: antraštė ir 3–4 sakiniai savais žodžiais, kas yra DevOps.
4. Naršyklėje atidarykite github.com ir sukurkite naują repozitoriją `git-svetaine` (**New repository**, Public, nieko nepažymėkite: be README, be `.gitignore`).
5. Naujos repozitorijos puslapyje spauskite *uploading an existing file*, nutempkite `devops-dokumentas.md` iš `git-svetaine-failai` ir spauskite **Commit changes**.
6. Terminale aplanke `devops` nusiklonuokite repozitoriją `git-svetaine` ir pereikite į jos aplanką.
7. Patikrinkite: aplanke yra `devops-dokumentas.md`, nuotolinė nuoroda rodo jūsų repozitoriją, o commit istorijoje yra commit'as iš GitHub svetainės.
8. Kompiuteryje papildykite dokumentą skyriumi „Kur gali lūžti“: 2 vietos, kur grandinė gali lūžti, kiekviena su vienu sakiniu kodėl. Padarykite commit su žinute „Pridėta, kur gali lūžti“.
9. Nusiųskite commit'ą į GitHub ir naršyklėje patikrinkite, kad pakeitimas atsirado.
10. Sukurkite šaką `health` ir persijunkite į ją.
11. Naršyklėje atidarykite [`app.py`](https://github.com/dkoncius/devops-projektas-starter-template/blob/main/app.py) iš projekto šablono ir suraskite maršrutą `/health`.
12. Šakoje `health` papildykite dokumentą skyriumi `/health`: ką jis grąžina (atsakymą ir kodą) ir kam toks maršrutas reikalingas. Padarykite commit su žinute „Pridėtas /health“.
13. Nusiųskite šaką `health` į GitHub.
14. Grįžkite į `main`, sujunkite `health` į `main` ir nusiųskite `main` į GitHub.
15. Ištrinkite šaką `health` kompiuteryje ir GitHub'e.
16. Išsiaiškinkite pagal oficialią dokumentaciją, kuo skiriasi šakos trynimas mažąja ir didžiąja raide. Atsakymą užrašykite dokumento skyriuje „Git“, padarykite commit su žinute „Pridėta apie šakų trynimą“ ir nusiųskite.
17. Patikrinkite, kad dokumente ir repozitorijoje nėra slaptažodžių ar realių IP.
18. **Kodėl:** vienu sakiniu užrašykite, kuo šis būdas skiriasi nuo `gh repo create` ir kodėl pradėjus svetainėje darbą galima tęsti kompiuteryje.
19. **Papildomai:** pažaiskite [Learn Git Branching](https://learngitbranching.js.org/) pirmą lygių grupę arba parašykite dokumente, kas yra merge commit.
