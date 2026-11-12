# 1 užduotis: Sukurkite repozitoriją terminale

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, pridėta Teams'e).

**Tikslas:** Viename aplanke pakartoti kelią be GitHub: failai → commit → šaka su pakeitimu → sujungimas į `main`.

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

**4 dalis: sujungimas į** `main`

21. Grįžkite į `main`.
22. Patikrinkite `pastabos.txt`: turi būti tik viena eilutė.
23. Sujunkite šaką `papildymas` į `main`.
24. Dar kartą patikrinkite `pastabos.txt`: dabar dvi eilutės.
25. Ištrinkite šaką `papildymas`.
26. Peržiūrėkite visą istoriją su šakomis.
27. **Kodėl:** užrašykite `pastabos.txt` vienu sakiniu, kuo commit istorija geresnė už failų keitimą be Git, ir kodėl pakeitimą geriau daryti šakoje, o ne tiesiai `main`.
28. **Papildomai:** pakartokite 16–19 su nauja šaka. Prieš sujungimą `main` papildykite `idejos.txt` viena eilute ir padarykite commit, tada sujunkite su sujungimo žinute. Istorija parodys dvi šakas, kurios susijungia.
