# 2 užduotis: Aplinkos kintamasis skripte

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte` (`~/devops/devops-projektas`). Atsakymus į „Kodėl“ rašote faile `docs/procesai.md`.

**Tikslas:** Parašyti skriptą, kuris naudoja aplinkos kintamąjį su numatytąja reikšme, ir pamatyti, kad kintamasis gyvena tik savo terminale.

**1 dalis: skriptas**

2. Faile `scripts/aplinka.sh` parašykite skriptą (kaip `ataskaita.sh` per 02 pamoką): jis išveda kintamojo `PROJEKTO_VARDAS` reikšmę (o jei nenustatytas, žodį „nenustatyta“) ir kiek eilučių yra procesų sąrašo išvestyje.
3. Padarykite skriptą vykdomą.

**2 dalis: kintamasis vienai komandai**

4. Paleiskite skriptą be kintamojo ir išvestį įrašykite į naują failą `docs/aplinka.txt`.
5. Paleiskite skriptą su `PROJEKTO_VARDAS=mano` (kintamasis tik šiai komandai) ir išvestį **pridėkite** prie `docs/aplinka.txt`, nepersirašydami pirmos.

**3 dalis: kintamasis visam langui**

6. Nustatykite `PROJEKTO_VARDAS` visam terminalo langui, paleiskite skriptą ir patikrinkite, kad jis mato kintamąjį.
7. Atidarykite naują terminalo langą, eikite į projektą ir paleiskite skriptą dar kartą. Pažiūrėkite, ar kintamasis ten yra.
8. Išveskite, kur terminalas ieško komandų (kintamasis `PATH`).
9. Suraskite, kuriame aplanke yra komanda `ls`.

**4 dalis: užrašai ir du commit'ai**

10. Faile `docs/procesai.md` pridėkite skyrių „## Aplinkos kintamieji“ ir užrašykite, ką pamatėte 6 ir 7 žingsniuose.
11. **Kodėl:** to paties skyriaus pabaigoje vienu sakiniu paaiškinkite, kodėl `./scripts/aplinka.sh` rašome su `./`, o `ls` be jo (kaip čia susiję `PATH`).
12. Pridėkite tik `scripts/aplinka.sh` ir padarykite commit su žinute „Pridėtas aplinka.sh“.
13. Pridėkite visą aplanką `docs` ir padarykite commit su žinute „Pridėta aplinkos išvestis“.
