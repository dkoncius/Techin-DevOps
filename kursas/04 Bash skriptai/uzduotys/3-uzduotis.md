# 3 užduotis: Projekto failų patikra

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`: 1–3 plečia tą patį skriptą `scripts/patikra.sh`. Atsakymus į „Kodėl“ rašote faile `docs/bash.md`.

**Tikslas:** Pridėti tam pačiam skriptui projekto failų patikrą ir suprasti `[ ]` ir `[[ ]]`.

**1 dalis: failų patikra**

2. Papildykite `scripts/patikra.sh`: po įrankių ciklo tikrina failus `app.py`, `requirements.txt`, `run.sh`, `.env.example` (kiekvienam „OK“ arba „TRŪKSTA“).
3. Pridėkite aplanko `docs` patikrą.
4. Į bendrą trūkstamų dalykų skaičių įtraukite ir trūkstamus failus bei aplanką.

**2 dalis: paleidimas iš skirtingų vietų**

5. Paleiskite skriptą iš projekto šaknies.
6. Paleiskite jį iš `docs` aplanko ir pažiūrėkite, ką jis rodo ir kokį kodą grąžina.
7. Išsaugokite skripto išvestį iš projekto šaknies faile `docs/patikra.txt`.

**3 dalis: užrašai ir commit**

8. Pagal oficialią dokumentaciją suraskite, kuo skiriasi `[ ]` ir `[[ ]]` (žingsnių čia nėra, tik tikslas), ir faile `docs/bash.md` pridėkite skyrių „## Testai“ su atsakymu vienu sakiniu.
9. **Kodėl:** skyriuje „Testai“ vienu sakiniu užrašykite, kodėl su `set -e` skriptas sustoja pirmoje klaidoje, o ne važiuoja toliau.
10. Pridėkite `scripts` ir `docs` ir padarykite commit su žinute „Patikra tikrina projekto failus“.
