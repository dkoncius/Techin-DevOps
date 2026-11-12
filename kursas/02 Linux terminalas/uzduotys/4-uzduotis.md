# 4 užduotis: Teisės ir pirmas skriptas

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`.

**Tikslas:** Automatizuoti ranka darytus žingsnius skriptu, padaryti jį vykdomą ir nustatyti teises.

**Pirma dalis: skriptas**

1. Projekte sukurkite aplanką `scripts`.
2. Faile `scripts/ataskaita.sh` parašykite skriptą, kuris išveda: aplanką, kuriame paleistas; kiek failų ir aplankų yra `docs/pastabos`; visų `.md` failų sąrašą (be `.git`); `app.py` eilutes su žodžiu `health`.
3. Paleiskite skriptą iš projekto šaknies kaip programą.

**Antra dalis: vykdymo teisė**

1. Padarykite skriptą vykdomą ir paleiskite iš naujo.
2. Skripto išvestį įrašykite į failą `docs/ataskaita.txt`.
3. Pažiūrėkite skripto teises ilguoju sąrašu.

**Trečia dalis: slaptas failas**

1. Aplanke `~/devops` (ne projekte) sukurkite failą `slaptas.txt`.
2. Nustatykite teises taip, kad jį galėtų skaityti ir keisti tik savininkas.
3. Patikrinkite teises ilguoju sąrašu.

**Ketvirta dalis: du commit'ai**

1. Pridėkite tik `scripts/ataskaita.sh` ir padarykite commit su žinute „Pridėtas ataskaita.sh“.
2. Pridėkite visą aplanką `docs` ir padarykite commit su žinute „Pridėta ataskaita“.
3. **Papildomai:** nuimkite skriptui vykdymo teisę, paleiskite per `bash` ir paaiškinkite, kodėl jis vis tiek veikia; tada grąžinkite teisę.
