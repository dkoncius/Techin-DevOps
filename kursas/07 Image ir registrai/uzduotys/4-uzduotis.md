# 4 užduotis: Registras

1. **Tikslas:** atskirti viešą image nuo prisijungimo prie registro.
2. `nginx:1.27` atsisiuntėte be paskyros, nes image viešas.
3. `docker login` prašo vartotojo ir slaptažodžio. Slaptažodžio vietoje rašomas access token, ne GitHub ar Docker Hub slaptažodis. Šioje pamokoje nieko neįkeliate, todėl prisijungti neprivalote.
4. Jei neturite tokeno, sustokite po 2 žingsnio. Jei turite: `docker login`, įveskite vartotoją ir tokeną. `Login Succeeded`. Tada `docker logout`.
5. **Pateikimas:** `docker images` nuotrauka su `nginx` tag'u `1.27`. Prisijungimo ekrano su tokenu nefotografuokite.

Jei užstrigote, pasižiūrėkite `docker komandos.md`.
