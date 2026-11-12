# 1 užduotis: Argumentas ir sąlyga

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`: 1–3 plečia tą patį skriptą `scripts/patikra.sh`.

**Tikslas:** Parašyti skriptą, kuris tikrina vieną įrankį pagal argumentą ir grąžina išėjimo kodą.

**Pirma dalis: nauja šaka ir skriptas**

1. Eikite į savo `devops-projektas`, persijunkite į `main` ir atnaujinkite jį iš GitHub.
2. Sukurkite šaką `pamoka-04` ir persijunkite į ją.
3. Sukurkite `scripts/patikra.sh`, atidarykite jį iš terminalo redaktoriuje ir parašykite `#!/usr/bin/env bash` ir `set -euo pipefail`.
4. Skriptas priima vieną argumentą: įrankio pavadinimą.
5. Jei argumento nėra, skriptas į klaidų kanalą parašo naudojimo žinutę ir baigia su kodu 2.
6. Jei įrankis yra, skriptas išveda „OK“ ir pavadinimą; jei jo nėra, išveda „TRŪKSTA“ ir pavadinimą ir baigia su kodu 1.
7. Padarykite skriptą vykdomą.

**Antra dalis: paleidimas ir kodai**

1. Paleiskite skriptą su `git` ir pažiūrėkite išėjimo kodą.
2. Paleiskite jį su `neegzistuoja` ir pažiūrėkite išėjimo kodą.
3. Paleiskite jį be argumento ir pažiūrėkite išėjimo kodą.

**Trečia dalis: užrašai ir commit**

1. Atidarykite iš terminalo redaktoriuje `docs/bash.md` (aplanką `docs` turite iš 02 ir 03) ir parašykite antraštę `# Bash skriptai` ir skyrių `## Išėjimo kodai` su trimis kodais, kuriuos gavote.
2. Pridėkite `scripts` ir `docs` ir padarykite commit su žinute „Pridėtas patikra.sh“.
