# 2 užduotis: Aplinkos kintamasis skripte

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte` (`~/devops/devops-projektas`).

**Tikslas:** Parašyti skriptą, kuris naudoja aplinkos kintamąjį su numatytąja reikšme, ir pamatyti, kad kintamasis gyvena tik savo terminale.

**Pirma dalis: skriptas**

1. Faile `scripts/aplinka.sh` parašykite skriptą (kaip `ataskaita.sh` per 02 pamoką): jis išveda kintamojo `PROJEKTO_VARDAS` reikšmę (o jei nenustatytas, žodį „nenustatyta“) ir kiek eilučių yra procesų sąrašo išvestyje.
2. Padarykite skriptą vykdomą.

**Antra dalis: kintamasis vienai komandai**

1. Paleiskite skriptą be kintamojo ir išvestį įrašykite į naują failą `docs/aplinka.txt`.
2. Paleiskite skriptą su `PROJEKTO_VARDAS=mano` (kintamasis tik šiai komandai) ir išvestį **pridėkite** prie `docs/aplinka.txt`, nepersirašydami pirmos.

**Trečia dalis: kintamasis visam langui**

1. Nustatykite `PROJEKTO_VARDAS` visam terminalo langui, paleiskite skriptą ir patikrinkite, kad jis mato kintamąjį.
2. Atidarykite naują terminalo langą, eikite į projektą ir paleiskite skriptą dar kartą. Pažiūrėkite, ar kintamasis ten yra.
3. Išveskite, kur terminalas ieško komandų (kintamasis `PATH`).
4. Suraskite, kuriame aplanke yra komanda `ls`.

**Ketvirta dalis: du commit'ai**

1. Pridėkite tik `scripts/aplinka.sh` ir padarykite commit su žinute „Pridėtas aplinka.sh“.
2. Pridėkite visą aplanką `docs` ir padarykite commit su žinute „Pridėta aplinkos išvestis“.
