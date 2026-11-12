# 2 užduotis: Ciklas per įrankius

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`: 1–3 plečia tą patį skriptą `scripts/patikra.sh`.

**Tikslas:** Išplėsti tą patį skriptą, kad jis patikrintų įrankių sąrašą ir suskaičiuotų, kiek trūksta.

**Pirma dalis: ciklas**

1. Pakeiskite `scripts/patikra.sh`: dabar jis priima bet kiek argumentų (įrankių), o be argumentų tikrina `git`, `python3`, `curl`.
2. Kiekvienam įrankiui ciklu išveskite „OK“ arba „TRŪKSTA“ ir pavadinimą.
3. Suskaičiuokite, kiek įrankių trūksta.
4. Jei trūksta bent vieno, išveskite į klaidų kanalą, kiek jų trūksta, ir baikite su kodu 1; kitaip su kodu 0.

**Antra dalis: paleidimas**

1. Paleiskite be argumentų ir pažiūrėkite išėjimo kodą.
2. Paleiskite su `git neegzistuoja kitas` ir pažiūrėkite išėjimo kodą.
3. Paleiskite tik su `git` ir pažiūrėkite išėjimo kodą.

**Trečia dalis: užrašai ir commit**

1. Skyriuje „Išėjimo kodai“ užrašykite, kuris paleidimas kokį kodą davė.
2. Pridėkite `scripts` ir `docs` ir padarykite commit su žinute „Skriptas tikrina įrankių sąrašą“.
