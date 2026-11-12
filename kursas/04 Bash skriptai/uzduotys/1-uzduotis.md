# 1 užduotis: Argumentas ir sąlyga

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`: 1–3 plečia tą patį skriptą `scripts/patikra.sh`. Atsakymus į „Kodėl“ rašote faile `docs/bash.md`.

**Tikslas:** Parašyti skriptą, kuris tikrina vieną įrankį pagal argumentą ir grąžina išėjimo kodą.

**1 dalis: nauja šaka ir skriptas**

2. Eikite į savo `devops-projektas`, persijunkite į `main` ir atnaujinkite jį iš GitHub.
3. Sukurkite šaką `pamoka-04` ir persijunkite į ją.
4. Sukurkite `scripts/patikra.sh` su `#!/usr/bin/env bash` ir `set -euo pipefail`.
5. Skriptas priima vieną argumentą: įrankio pavadinimą.
6. Jei argumento nėra, skriptas į klaidų kanalą parašo naudojimo žinutę ir baigia su kodu 2.
7. Jei įrankis yra, skriptas išveda „OK“ ir pavadinimą; jei jo nėra, išveda „TRŪKSTA“ ir pavadinimą ir baigia su kodu 1.
8. Padarykite skriptą vykdomą.

**2 dalis: paleidimas ir kodai**

9. Paleiskite skriptą su `git` ir pažiūrėkite išėjimo kodą.
10. Paleiskite jį su `neegzistuoja` ir pažiūrėkite išėjimo kodą.
11. Paleiskite jį be argumento ir pažiūrėkite išėjimo kodą.

**3 dalis: užrašai ir commit**

12. Faile `docs/bash.md` (aplanką `docs` turite iš 02 ir 03) parašykite antraštę „# Bash skriptai“ ir skyrių „## Išėjimo kodai“ su trimis kodais, kuriuos gavote.
13. **Kodėl:** skyriuje „Išėjimo kodai“ vienu sakiniu užrašykite, kodėl naudojimo žinutę rašome į klaidų kanalą, o ne į įprastą išvestį.
14. Pridėkite `scripts` ir `docs` ir padarykite commit su žinute „Pridėtas patikra.sh“.
