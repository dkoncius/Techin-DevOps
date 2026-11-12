# 3 užduotis: Projekto failų patikra

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`: 1–3 plečia tą patį skriptą `scripts/patikra.sh`. Atsakymus į „Kodėl“ rašote faile `docs/bash.md`.

1. **Tikslas:** Pridėti tam pačiam skriptui projekto failų patikrą ir suprasti `[ ]` ir `[[ ]]`.
2. Papildykite `scripts/patikra.sh`: po įrankių ciklo tikrina failus `app.py`, `requirements.txt`, `run.sh`, `.env.example` (kiekvienam „OK“ arba „TRŪKSTA“) ir aplanką `docs`.
3. Į bendrą trūkstamų dalykų skaičių įtraukite ir trūkstamus failus bei aplanką.
4. Jei skriptas paleistas ne projekto šaknyje, jis trūkstamus failus pažymi „TRŪKSTA“ ir baigia su kodu 1; paleiskite jį iš `docs` aplanko ir iš projekto šaknies.
5. Pagal oficialią dokumentaciją suraskite, kuo skiriasi `[ ]` ir `[[ ]]` (žingsnių čia nėra, tik tikslas), ir skyriuje „Testai“ faile `docs/bash.md` užrašykite vienu sakiniu.
6. Išsaugokite skripto išvestį iš projekto šaknies faile `docs/patikra.txt`.
7. **Kodėl:** skyriuje „Testai“ vienu sakiniu užrašykite, kodėl su `set -e` skriptas sustoja pirmoje klaidoje, o ne važiuoja toliau.
8. Padarykite commit su žinute „Patikra tikrina projekto failus“.
