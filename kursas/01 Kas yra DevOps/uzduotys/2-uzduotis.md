# 2 užduotis: Sukurkite repozitoriją GitHub ir susiekite

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, pridėta Teams'e).

**Tikslas:** Per terminalą sukurti tuščią repozitoriją GitHub ir susieti ją su jau esančiu aplanku `git-bandymas`.

**Pirma dalis: prisijungimas**

1. Atidarykite terminalą ir pereikite į aplanką `git-bandymas`.
2. Patikrinkite, kad esate teisingame aplanke.
3. Patikrinkite, ar esate prisijungę prie GitHub (jei ne, prisijunkite, pasirinkite HTTPS).

**Antra dalis: tuščia repozitorija GitHub**

1. Sukurkite viešą (Public) repozitoriją `git-bandymas` savo GitHub paskyroje: be README, be `.gitignore`, be licencijos ir nesusiekite jos su aplanku (susiesite patys kituose žingsniuose).
2. Pažiūrėkite sukurtos repozitorijos HTTPS nuorodą.

**Trečia dalis: susiejimas**

1. Pridėkite nuotolinę nuorodą vardu `origin`.
2. Patikrinkite, kad nuoroda pridėta: turi būti dvi eilutės (fetch ir push).
3. Nusiųskite šaką `main` į GitHub ir nustatykite, kad ji sektų `origin/main`.
4. Patikrinkite būseną: turi rašyti „up to date with 'origin/main'“.

**Ketvirta dalis: patikra GitHub**

1. Pažiūrėkite failus, esančius GitHub repozitorijoje: turi būti `pastabos.txt` ir `idejos.txt`.
2. Pažiūrėkite commit'us GitHub repozitorijoje: turi būti 1 užduoties commit'ai.

**Penkta dalis: tolesnis darbas tame pačiame aplanke**

1. Pridėkite eilutę į `idejos.txt`.
2. Padarykite commit su žinute „Papildytas idejos.txt“.
3. Nusiųskite į GitHub.
4. Pažiūrėkite commit'us GitHub repozitorijoje: turi atsirasti naujas commit.
