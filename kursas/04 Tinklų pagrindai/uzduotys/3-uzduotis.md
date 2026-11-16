# 3 užduotis: Portai ir serverių stebėsena

**1.** **Tikslas:** rasti, kuris procesas klauso porto, pamatyti užimto porto klaidą ir pasirašyti mini stebėseną, kuri tikrina visus serverius iš sąrašo.

**2.** Pirmame lange paleisti serverį, antrame pažiūrėti, kas klauso porto:

- Pirmame lange: `python3 -m http.server 5001`
- Antrame lange: `lsof -nP -i :5001`
- Turi būti: eilutėje matosi `python` ir PID

**3.** Trečiame lange paleisti tą patį dar kartą:

- `python3 -m http.server 5001`
- Turi būti: paleidimas baigiasi klaida, kad adresas užimtas. Užrašykite tą eilutę į `docs/tinklai.md`

**4.** Antra kopija kitame porte (trečiame lange):

- `python3 -m http.server 5002`
- Ketvirtame lange: `curl -s -o /dev/null -w "%{http_code}\n" localhost:5002/`
- Turi būti: `200`. Pirmas langas ir toliau atsako per 5001

**5.** Sukurti serverių adresų sąrašą (vardai kaip 02 pamokoje):

- `mkdir -p uzrasai`
- `nano uzrasai/adresai.txt`
- Įklijuoti tekstą žemiau (`Cmd+V` Mac, `Ctrl+Shift+V` Ubuntu / WSL), tada išsaugoti: `Ctrl+O`, `Enter`, `Ctrl+X`

```
web1 http://localhost:5001
db1 http://localhost:5002
app1 http://localhost:5003
```

- Pasitikrinti, ar terminalas skaito failą po eilutę. Įklijuoti šį bloką (`Cmd+V` Mac, `Ctrl+Shift+V` Ubuntu / WSL):

```
while read -r vardas adresas; do
  echo "$vardas -> $adresas"
done < uzrasai/adresai.txt
```

- Turi būti: trys eilutės `web1 -> http://localhost:5001`, `db1 -> ...`, `app1 -> ...`

**6.** Pačiam parašyti stebėseną `scripts/stebesena.sh`:

- `nano scripts/stebesena.sh`
- Pirmos dvi eilutės: `#!/usr/bin/env bash` ir `set -euo pipefail`
- Skaityti `uzrasai/adresai.txt` po eilutę: `while read -r vardas adresas; do` ... `done < uzrasai/adresai.txt`
- Cikle kodą gauti iš ankstesnio skripto: `kodas=$(./scripts/http-kodas.sh "$adresas" || true)`
- Cikle parašyti serverio vardą ir kodą, pvz. `web1 200`
- Užuominos: `echo "$vardas $kodas"`. Žr. `tinklai komandos.md`
- Išsaugoti: `Ctrl+O`, `Enter`, `Ctrl+X`
- `chmod +x scripts/stebesena.sh`

**7.** Paleisti, kol veikia du serveriai (5001 ir 5002):

- `./scripts/stebesena.sh`
- Turi būti: `web1 200`, `db1 200`, `app1 000` (5003 niekas neklauso)

**8.** Sustabdyti abu serverius (`Ctrl+C` kiekviename lange) ir patikrinti:

- `lsof -nP -i :5001`
- `lsof -nP -i :5002`
- `./scripts/stebesena.sh`
- Turi būti: `lsof` nieko neišveda, stebėsena rodo visus tris `000`

**9.** Papildyti užrašus:

- `nano docs/tinklai.md`
- Įrašyti sakinį: du procesai negali klausyti to paties porto, nes sistema neturėtų kam perduoti užklausos
- Įrašyti, ką rodo `stebesena.sh`, kai serveriai veikia ir kai ne

**10.** **Pateikimas:** `lsof` nuotrauka su PID ir `./scripts/stebesena.sh` nuotrauka su `200` ir `000`.

Jei užstrigote, pasižiūrėkite `tinklai komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
