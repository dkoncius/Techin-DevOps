# 2 užduotis: Ciklas per įrankius

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`: 1–3 plečia tą patį skriptą `scripts/patikra.sh`. Atsakymus į „Kodėl“ rašote faile `docs/bash.md`.

1. **Tikslas:** Išplėsti tą patį skriptą, kad jis patikrintų įrankių sąrašą ir suskaičiuotų, kiek trūksta.
2. Pakeiskite `scripts/patikra.sh`: dabar jis priima bet kiek argumentų (įrankių), o be argumentų tikrina `git`, `python3`, `curl`.
3. Kiekvienam įrankiui išveskite „OK“ arba „TRŪKSTA“ ir pavadinimą ciklu.
4. Suskaičiuokite, kiek įrankių trūksta.
5. Jei trūksta bent vieno, išveskite į klaidų kanalą, kiek jų trūksta, ir baikite su kodu 1; kitaip su kodu 0.
6. Paleiskite be argumentų, su `git neegzistuoja kitas` ir su vienu įrankiu; po kiekvieno paleidimo pažiūrėkite išėjimo kodą.
7. Skyriuje „Išėjimo kodai“ užrašykite, kuris paleidimas koks kodas buvo.
8. **Kodėl:** to paties skyriaus pabaigoje vienu sakiniu paaiškinkite, kodėl CI ir `&&` žiūri į išėjimo kodą, o ne į tekstą „OK“.
9. Padarykite commit su žinute „Skriptas tikrina įrankių sąrašą“.
