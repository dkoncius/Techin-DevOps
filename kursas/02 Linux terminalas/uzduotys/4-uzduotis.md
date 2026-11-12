# 4 užduotis: Teisės ir pirmas skriptas

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`. Atsakymus į „Kodėl“ rašote faile `docs/terminalas.md`.

**Tikslas:** Automatizuoti ranka darytus žingsnius skriptu, padaryti jį vykdomą ir paaiškinti teises.

**1 dalis: skriptas**

2. Projekte sukurkite aplanką `scripts`.
3. Faile `scripts/ataskaita.sh` parašykite skriptą, kuris išveda: aplanką, kuriame paleistas; kiek failų ir aplankų yra `docs/pastabos`; visų `.md` failų sąrašą (be `.git`); `app.py` eilutes su žodžiu `health`.
4. Paleiskite skriptą iš projekto šaknies kaip programą.
5. Faile `docs/terminalas.md` pridėkite skyrių „## Teisės“ ir užrašykite, kas atsitiko 4 žingsnyje ir kodėl.

**2 dalis: vykdymo teisė**

6. Padarykite skriptą vykdomą ir paleiskite iš naujo.
7. Skripto išvestį įrašykite į failą `docs/ataskaita.txt`.
8. Pažiūrėkite skripto teises ilguoju sąrašu.
9. Skyriuje „Teisės“ paaiškinkite, ką reiškia `-rwxr-xr-x` (savininkas, grupė, kiti).

**3 dalis: slaptas failas**

10. Aplanke `~/devops` (ne projekte) sukurkite failą `slaptas.txt`.
11. Nustatykite teises taip, kad jį galėtų skaityti ir keisti tik savininkas.
12. Patikrinkite teises ilguoju sąrašu.
13. **Kodėl:** skyriuje „Teisės“ vienu sakiniu užrašykite, kodėl `.env` ir privatūs raktai neturi būti skaitomi kitų.

**4 dalis: du commit'ai**

14. Pridėkite tik `scripts/ataskaita.sh` ir padarykite commit su žinute „Pridėtas ataskaita.sh“.
15. Pridėkite visą aplanką `docs` ir padarykite commit su žinute „Pridėta ataskaita“.
16. **Papildomai:** nuimkite skriptui vykdymo teisę, paleiskite per `bash` ir paaiškinkite, kodėl jis vis tiek veikia; tada grąžinkite teisę.
