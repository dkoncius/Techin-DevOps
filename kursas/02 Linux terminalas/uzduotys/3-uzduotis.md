# 3 užduotis: Procesas, kintamasis ir paketas

1. **Tikslas:** sustabdyti savo procesą, pamatyti, kad `export` galioja tik šiam langui, ir įdiegti `tree`.
2. Nueiti į projektą, patikrinti šaką. Nukopijuokite:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
```

   - Žvaigždutė prie `pamoka-02`
3. Paleisti komandą fone.
   - `sleep 600` laukia 10 minučių ir nieko nerodo. Tiek laiko užteks surasti ir sustabdyti procesą.
   - `&` gale reiškia: paleisti fone, terminalas lieka laisvas.

```bash
sleep 600 &
```

   - Pasirodo eilutė, pvz., `[1] 12345`. Skaičius yra **PID** (proceso numeris).
4. Rasti savo procesą. Tas pats terminalo langas.

```bash
ps aux | grep sleep
```

   - `ps aux` rodo visus veikiančius procesus, `grep sleep` palieka tik eilutes su žodžiu `sleep`.
   - Jūsų procesas yra eilutė su `sleep 600`. **Antrasis stulpelis** yra PID.
   - Eilutė su `grep sleep` yra pačios paieškos procesas, ne jūsų.

```
USER   PID  ... COMMAND
you  12345  ... sleep 600
you  12346  ... grep sleep
```

5. Sustabdyti procesą. Vietoje `12345` įrašykite **savo** PID:

```bash
kill 12345
ps aux | grep sleep
```

   - `kill` prašo proceso sustoti.
   - Gali pasirodyti pranešimas `Terminated` arba `terminated sleep 600`.
   - Sąraše `sleep 600` nebėra, lieka tik `grep sleep`.
6. Atidaryti naują skriptą su `nano`.

```bash
nano scripts/aplinka.sh
```

7. Įklijuoti skriptą (**Mac: Cmd+V**). Pirma eilutė nuo pat krašto, be tarpų prieš `#!`:
   - `${PROJEKTO_VARDAS:-nenustatyta}`: jei kintamasis nenustatytas, rodoma `nenustatyta`.

```bash
#!/usr/bin/env bash
echo "PROJEKTO_VARDAS: ${PROJEKTO_VARDAS:-nenustatyta}"
```

   - Išsaugokite ir išeikite: `Ctrl+O`, `Enter`, `Ctrl+X`
8. Leisti paleisti skriptą (kaip 2 užduotyje).

```bash
chmod +x scripts/aplinka.sh
ls -l scripts/aplinka.sh
```

   - `ls -l` rodo `-rwxr-xr-x`, yra `x`
9. Paleisti **be** `export`, rezultatą įrašyti į failą.

```bash
mkdir -p docs
./scripts/aplinka.sh > docs/aplinka.txt
cat docs/aplinka.txt
```

   - `cat` rodo:

```
PROJEKTO_VARDAS: nenustatyta
```

10. Nustatyti kintamąjį šiam langui ir paleisti skriptą. **Šio lango neuždarykite.**

```bash
export PROJEKTO_VARDAS=visas
./scripts/aplinka.sh
```

   - Išvestis:

```
PROJEKTO_VARDAS: visas
```

   - `export` galioja tik šiame terminalo lange, kol jo neuždarote.
11. Naujas terminalo langas. Patikrinti, ar kintamasis persikėlė.
    - **Mac:** Terminal → Shell → New Window arba `Cmd+N`
    - **Ubuntu:** `Ctrl+Alt+T`
    - **WSL / Windows Terminal:** `Ctrl+Shift+T` (nauja kortelė)

```bash
cd ~/Desktop/devops/git-bandymas
./scripts/aplinka.sh
```

   - Išvestis:

```
PROJEKTO_VARDAS: nenustatyta
```

   - Naujas langas kintamojo nežino, `export` liko **senajame** lange. Grįžkite į senąjį langą ir paleiskite `./scripts/aplinka.sh` dar kartą: ten vis dar `visas`.
12. Įdiegti `tree` — programą, kuri rodo aplankų medį.

**Mac** (nerašykite `sudo brew`):

```bash
brew install tree
```

   - Jei rašo `brew: command not found`, Homebrew neįdiegtas. Įdiekite pagal [brew.sh](https://brew.sh) instrukciją.

**Ubuntu / WSL:**

```bash
sudo apt update
sudo apt install -y tree
```

   Patikrinkite:

```bash
tree --version
which tree
```

   - `tree --version` rodo versiją, `which tree` rodo kelią į programą.
13. Pažiūrėti projekto medį su ką tik įdiegta programa.

```bash
cd ~/Desktop/devops/git-bandymas
tree
```

   - Matote aplankus `docs`, `scripts`, `uzrasai` ir jų failus: `aplinka.txt`, `aplinka.sh`, `ataskaita.sh`, `produktai.txt`.
14. Commit. Į repozitoriją įeina skriptas ir `docs/aplinka.txt` (ten tik `nenustatyta`, be slaptų žodžių).

```bash
git add scripts/aplinka.sh docs
git status
git commit -m "Aplinka ir paketas"
git log --oneline
```

   - `git status`: paruošti `scripts/aplinka.sh` ir `docs/aplinka.txt`. `ataskaita.txt` iš 2 užduoties lieka „Untracked“ — taip ir turi būti.
   - `git log --oneline`: viršuje `Aplinka ir paketas`
15. **Pateikimas:** nuotrauka iš naujo lango su `PROJEKTO_VARDAS: nenustatyta` ir nuotrauka po `tree`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
