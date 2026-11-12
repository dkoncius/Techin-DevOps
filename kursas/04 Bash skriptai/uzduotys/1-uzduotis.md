# 1 užduotis: Argumentas ir `if`

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`: 1–3 plečia tą patį skriptą `scripts/patikra.sh`. Atsakymus į „Kodėl“ rašote faile `docs/bash.md`.

1. **Tikslas:** Parašyti skriptą, kuris tikrina vieną įrankį pagal argumentą ir grąžina išėjimo kodą.
2. Eikite į savo `devops-projektas`, persijunkite į `main` ir atnaujinkite jį iš GitHub.
3. Sukurkite šaką `pamoka-04` ir persijunkite į ją.
4. Sukurkite `scripts/patikra.sh` su `#!/usr/bin/env bash` ir `set -euo pipefail`.
5. Skriptas priima vieną argumentą: įrankio pavadinimą.
6. Jei argumento nėra, skriptas į klaidų kanalą parašo naudojimo žinutę ir baigia su kodu 2.
7. Jei įrankis yra, skriptas išveda „OK“ ir pavadinimą; jei jo nėra, išveda „TRŪKSTA“ ir pavadinimą ir baigia su kodu 1.
8. Padarykite skriptą vykdomą.
9. Paleiskite jį su `git`, su `neegzistuoja` ir be argumento; po kiekvieno paleidimo pažiūrėkite išėjimo kodą.
10. Faile `docs/bash.md` (aplanką `docs` turite iš 02 ir 03) parašykite antraštę „# Bash skriptai“ ir skyrių „## Išėjimo kodai“ su trimis kodais, kuriuos gavote.
11. **Kodėl:** skyriuje „Išėjimo kodai“ vienu sakiniu užrašykite, kodėl naudojimo žinutę rašome į klaidų kanalą, o ne į įprastą išvestį.
12. Padarykite commit su žinute „Pridėtas patikra.sh“.
