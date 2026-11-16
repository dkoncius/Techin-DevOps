# 2 užduotis: HTTP kodai ir skriptas

**1.** **Tikslas:** gauti skirtingus HTTP kodus ir parašyti skriptą, kuris juos tikrina.

**2.** Serveris iš 1 užduoties turi veikti (kitame lange `python3 -m http.server 5001`). Gauti tik kodą:

- `curl -s -o /dev/null -w "%{http_code}\n" localhost:5001/`
- `curl -s -o /dev/null -w "%{http_code}\n" localhost:5001/nera`
- Turi būti: pirma komanda `200`, antra `404`

**3.** Atidaryti failą skriptui:

- `nano scripts/http-kodas.sh`
- Pirmos dvi eilutės: `#!/usr/bin/env bash` ir `set -euo pipefail`
- Parašyti pačiam pagal aprašą:
- Jei argumentų skaičius nėra 1: į klaidų kanalą `Naudojimas: SKRIPTAS <url>` ir `exit 2` (`$0` yra skripto vardas)
- Kodą į kintamąjį `kodas` įrašyti taip (šią eilutę galite nusikopijuoti): `kodas=$(curl -s -o /dev/null -w "%{http_code}" "$1" || true)`
- Išvesti `kodas`
- Jei `kodas` lygus `200`: `exit 0`, kitaip `exit 1`
- Užuominos: `[ "$#" -ne 1 ]`, `[ "$kodas" = "200" ]`. Žr. `tinklai komandos.md`
- Išsaugoti: `Ctrl+O`, `Enter`, `Ctrl+X`

**4.** Leisti paleisti skriptą:

- `chmod +x scripts/http-kodas.sh`

**5.** Paleisti, kol serveris veikia:

- `./scripts/http-kodas.sh http://localhost:5001/; echo "kodas: $?"`
- `./scripts/http-kodas.sh http://localhost:5001/nera; echo "kodas: $?"`
- Turi būti: pirma `200` ir `0`, antra `404` ir `1`

**6.** Sustabdyti serverį jo lange (`Ctrl+C`) ir paleisti skriptą dar kartą:

- `./scripts/http-kodas.sh http://localhost:5001/; echo "kodas: $?"`
- Turi būti: `000` (niekas neklauso), skripto kodas `1`

**7.** Papildyti užrašus:

- `nano docs/tinklai.md`
- Pridėti skyrių „Kodai“: `/` → 200, `/nera` → 404, sustabdytas serveris → `000`

**8.** Išsaugoti Git'e:

- `git add scripts docs`
- `git commit -m "HTTP kodai ir http-kodas.sh"`
- Turi būti: `git log --oneline` viršuje `HTTP kodai ir http-kodas.sh`

**9.** **Pateikimas:** terminalo nuotrauka su kodais 200, 404 ir `000`.

Jei užstrigote, pasižiūrėkite `tinklai komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
