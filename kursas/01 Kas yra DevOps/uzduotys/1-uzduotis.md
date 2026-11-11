# 1 užduotis: Sukurkite repozitoriją terminale

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, pridėta Teams'e). Taip pat [Git ir GitHub sąrašas](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/checklists/Git%20ir%20GitHub%20s%C4%85ra%C5%A1as.html) (nustatymai, prisijungimas, šakos, klaidų sprendimai).

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
