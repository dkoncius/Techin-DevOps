# 4 užduotis: Teisės ir pirmas skriptas

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Atsakymus į „Kodėl“ rašote faile `docs/terminalas.md` savo projekte.

1. **Tikslas:** Parašyti pirmą Bash skriptą, padaryti jį vykdomą ir paaiškinti teises.
2. Projekte sukurkite aplanką `scripts` ir faile `scripts/terminalas.sh` parašykite skriptą, kuris išveda aplanką, kuriame paleistas, failų ir aplankų skaičių jame ir 3 paskutinius Git commit'us.
3. Paleiskite skriptą iš projekto šaknies kaip programą.
4. Faile `docs/terminalas.md` pridėkite skyrių „## Teisės“ ir užrašykite, kas atsitiko 3 žingsnyje ir kodėl.
5. Padarykite skriptą vykdomą ir paleiskite iš naujo.
6. Pažiūrėkite skripto teises ilguoju sąrašu ir skyriuje „Teisės“ paaiškinkite, ką reiškia `-rwxr-xr-x` (savininkas, grupė, kiti).
7. Aplanke `bandymas` sukurkite failą `slaptas.txt` ir nustatykite teises taip, kad jį galėtų skaityti ir keisti tik savininkas. Patikrinkite ilguoju sąrašu.
8. **Kodėl:** skyriuje „Teisės“ vienu sakiniu užrašykite, kodėl `.env` ir privatūs raktai neturi būti skaitomi kitų.
9. Padarykite du commit'us: pirmas tik `scripts/terminalas.sh` (žinutė „Pridėtas terminalas.sh“), antras visas `docs` aplankas (žinutė „Pridėtas terminalas.md“).
10. **Papildomai:** nuimkite skriptui vykdymo teisę, paleiskite per `bash` ir paaiškinkite, kodėl jis vis tiek veikia; tada grąžinkite teisę.
