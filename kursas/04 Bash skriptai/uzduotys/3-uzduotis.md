# 3 užduotis: Projekto failų patikra

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`: 1–3 plečia tą patį skriptą `scripts/patikra.sh`.

**Tikslas:** Pridėti tam pačiam skriptui projekto failų patikrą.

**Pirma dalis: failų patikra**

1. Atidarykite iš terminalo redaktoriuje `scripts/patikra.sh` ir papildykite jį: po įrankių ciklo tikrina failus `app.py`, `requirements.txt`, `run.sh`, `.env.example` (kiekvienam „OK“ arba „TRŪKSTA“).
2. Pridėkite aplanko `docs` patikrą.
3. Į bendrą trūkstamų dalykų skaičių įtraukite ir trūkstamus failus bei aplanką.

**Antra dalis: paleidimas iš skirtingų vietų**

1. Paleiskite skriptą iš projekto šaknies.
2. Paleiskite jį iš `docs` aplanko ir pažiūrėkite, ką jis rodo ir kokį kodą grąžina.
3. Išsaugokite skripto išvestį iš projekto šaknies faile `docs/patikra.txt`.

**Trečia dalis: commit**

1. Pridėkite `scripts` ir `docs` ir padarykite commit su žinute „Patikra tikrina projekto failus“.
