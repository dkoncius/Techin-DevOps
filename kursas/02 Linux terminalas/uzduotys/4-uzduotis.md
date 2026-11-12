# 4 užduotis: Teisės ir pirmas skriptas

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`.

**Tikslas:** Automatizuoti ranka darytus žingsnius skriptu, padaryti jį vykdomą ir nustatyti teises.

**1 dalis: skriptas**

2. Projekte sukurkite aplanką `scripts`.
3. Faile `scripts/ataskaita.sh` parašykite skriptą, kuris išveda: aplanką, kuriame paleistas; kiek failų ir aplankų yra `docs/pastabos`; visų `.md` failų sąrašą (be `.git`); `app.py` eilutes su žodžiu `health`.
4. Paleiskite skriptą iš projekto šaknies kaip programą.

**2 dalis: vykdymo teisė**

5. Padarykite skriptą vykdomą ir paleiskite iš naujo.
6. Skripto išvestį įrašykite į failą `docs/ataskaita.txt`.
7. Pažiūrėkite skripto teises ilguoju sąrašu.

**3 dalis: slaptas failas**

8. Aplanke `~/devops` (ne projekte) sukurkite failą `slaptas.txt`.
9. Nustatykite teises taip, kad jį galėtų skaityti ir keisti tik savininkas.
10. Patikrinkite teises ilguoju sąrašu.

**4 dalis: du commit'ai**

11. Pridėkite tik `scripts/ataskaita.sh` ir padarykite commit su žinute „Pridėtas ataskaita.sh“.
12. Pridėkite visą aplanką `docs` ir padarykite commit su žinute „Pridėta ataskaita“.
13. **Papildomai:** nuimkite skriptui vykdymo teisę, paleiskite per `bash` ir paaiškinkite, kodėl jis vis tiek veikia; tada grąžinkite teisę.
