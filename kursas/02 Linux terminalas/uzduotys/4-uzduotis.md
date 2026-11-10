# 4 užduotis: Teisės ir pirmas skriptas

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`. Atsakymus į „Kodėl“ rašote faile `docs/terminalas.md`.

1. **Tikslas:** Automatizuoti ranka darytus žingsnius skriptu, padaryti jį vykdomą ir paaiškinti teises.
2. Projekte sukurkite aplanką `scripts` ir faile `scripts/ataskaita.sh` parašykite skriptą, kuris išveda: aplanką, kuriame paleistas; kiek failų ir aplankų yra `docs/pastabos`; visų `.md` failų sąrašą (be `.git`); `app.py` eilutes su žodžiu `health`.
3. Paleiskite skriptą iš projekto šaknies kaip programą.
4. Faile `docs/terminalas.md` pridėkite skyrių „## Teisės“ ir užrašykite, kas atsitiko 3 žingsnyje ir kodėl.
5. Padarykite skriptą vykdomą ir paleiskite iš naujo.
6. Skripto išvestį įrašykite į failą `docs/ataskaita.txt`.
7. Pažiūrėkite skripto teises ilguoju sąrašu ir skyriuje „Teisės“ paaiškinkite, ką reiškia `-rwxr-xr-x` (savininkas, grupė, kiti).
8. Aplanke `~/devops` (ne projekte) sukurkite failą `slaptas.txt` ir nustatykite teises taip, kad jį galėtų skaityti ir keisti tik savininkas. Patikrinkite ilguoju sąrašu.
9. **Kodėl:** skyriuje „Teisės“ vienu sakiniu užrašykite, kodėl `.env` ir privatūs raktai neturi būti skaitomi kitų.
10. Padarykite du commit'us: pirmas tik `scripts/ataskaita.sh` (žinutė „Pridėtas ataskaita.sh“), antras visas `docs` aplankas (žinutė „Pridėta ataskaita“).
11. **Papildomai:** nuimkite skriptui vykdymo teisę, paleiskite per `bash` ir paaiškinkite, kodėl jis vis tiek veikia; tada grąžinkite teisę.
