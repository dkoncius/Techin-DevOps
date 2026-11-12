# 1 užduotis: Sukurkite repozitoriją terminale

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, pridėta Teams'e).

**Tikslas:** Viename aplanke pakartoti kelią be GitHub: failai → commit → šaka su pakeitimu → sujungimas į `main`.

**Pirma dalis: aplankas ir failai**

1. Atidarykite terminalą.
2. Pereikite į aplanką `devops` (jei jūsų aplankas kitur, naudokite savo kelią).
3. Sukurkite aplanką `git-bandymas`.
4. Pereikite į jį.
5. Sukurkite failą `pastabos.txt` su viena eilute.
6. Sukurkite failą `idejos.txt` su viena eilute.
7. Pažiūrėkite, kokie failai yra aplanke.
8. Patikrinkite, kad failai ne tušti.

**Antra dalis: Git repozitorija ir pirmas commit**

1. Paverskite aplanką Git repozitorija.
2. Pažiūrėkite būseną: abu failai dar neįtraukti į Git.
3. Pridėkite abu failus.
4. Dar kartą pažiūrėkite būseną: abu failai paruošti commit.
5. Padarykite commit su žinute „Du failai“.
6. Peržiūrėkite commit istoriją.

**Trečia dalis: šaka su pakeitimu**

1. Sukurkite šaką `papildymas` ir persijunkite į ją.
2. Patikrinkite, kad esate šakoje `papildymas` (prie jos žvaigždutė).
3. Pridėkite eilutę į `pastabos.txt`.
4. Padarykite commit su žinute „Papildytas pastabos.txt“.
5. Peržiūrėkite istoriją.

**Ketvirta dalis: sujungimas į** `main`

1. Grįžkite į `main`.
2. Patikrinkite `pastabos.txt`: turi būti tik viena eilutė.
3. Sujunkite šaką `papildymas` į `main`.
4. Dar kartą patikrinkite `pastabos.txt`: dabar dvi eilutės.
5. Ištrinkite šaką `papildymas`.
6. Peržiūrėkite visą istoriją su šakomis.

**Penkta dalis (papildomai): sujungimas su išsišakojimu**

1. Sukurkite šaką `antra-saka` ir persijunkite į ją.
2. Pridėkite eilutę į `pastabos.txt`.
3. Padarykite commit su žinute „Papildyta antra-saka“.
4. Grįžkite į `main`.
5. Pridėkite eilutę į `idejos.txt`.
6. Padarykite commit su žinute „Papildytas idejos.txt“.
7. Sujunkite šaką `antra-saka` į `main` su sujungimo žinute „Sujungta antra-saka“.
8. Peržiūrėkite visą istoriją su šakomis: matysis dvi šakos, kurios susijungia.
