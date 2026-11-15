# 3 užduotis: Kintamasis ir paketas

1. **Tikslas:** pamatyti, kad `export` galioja tik šiam langui, ir įdiegti `tree`.
2. Nueiti į projektą, patikrinti šaką. Nukopijuokite:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
```

- Žvaigždutė prie `pamoka-02`

3. Atidaryti naują skriptą su `nano`.

```bash
nano scripts/aplinka.sh
```

4. Įklijuoti skriptą (**Mac: Cmd+V**). Pirma eilutė nuo pat krašto, be tarpų prieš `#!`:
   - `${PROJEKTO_VARDAS:-nenustatyta}`: jei kintamasis nenustatytas, rodoma `nenustatyta`.

```bash
#!/usr/bin/env bash
echo "PROJEKTO_VARDAS: ${PROJEKTO_VARDAS:-nenustatyta}"
```

- Išsaugokite ir išeikite: `Ctrl+O`, `Enter`, `Ctrl+X`

5. Leisti paleisti skriptą kaip 2-užduotyje pradžioje be prieigos, paskui su:

```bash
scripts/aplinka.sh 
chmod +x scripts/aplinka.sh
ls -l scripts/aplinka.sh
scripts/aplinka.sh 
```

- `ls -l` rodo `-rwxr-xr-x`, yra `x`

6. Paleisti **be** `export`, rezultatą įrašyti į failą.

```bash
mkdir -p docs
./scripts/aplinka.sh > docs/aplinka.txt
cat docs/aplinka.txt
```

- `cat` rodo:

```
PROJEKTO_VARDAS: nenustatyta
```

7. Nustatyti kintamąjį šiam langui ir paleisti skriptą. **Šio lango neuždarykite.**

```bash
export PROJEKTO_VARDAS=visas
./scripts/aplinka.sh
```

```
PROJEKTO_VARDAS: visas
```

- `export` galioja tik šiame terminalo lange, kol jo neuždarote.

8. Naujas terminalo langas. Patikrinti, ar kintamasis persikėlė.
   - **Mac:** Terminal → Shell → New Window arba `Cmd+N`
   - **Ubuntu:** `Ctrl+Alt+T`
   - **WSL / Windows Terminal:** `Ctrl+Shift+T` (nauja kortelė)

```bash
cd ~/Desktop/devops/git-bandymas
./scripts/aplinka.sh
```

```
PROJEKTO_VARDAS: nenustatyta
```

- Naujas langas kintamojo nežino, `export` liko **senajame** lange. Grįžkite į senąjį langą ir paleiskite `./scripts/aplinka.sh` dar kartą: ten vis dar `visas`.

9. Įdiegti `tree` — programą, kuri rodo aplankų medį.

**Mac** (nerašykite `sudo brew`):

```bash
brew install tree
```

- Jei rašo `brew: command not found`, Homebrew neįdiegtas. Įdiekite pagal [brew.sh](https://brew.sh) instrukciją.
- Jei neleidžia įrašyti, skaitykite, ką rašo terminalas, ir padarykite tą eilutę. `sudo brew` nerašykite.

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

10. Pažiūrėti projekto medį su ką tik įdiegta programa.

```bash
cd ~/Desktop/devops/git-bandymas
tree
```

- tree
- Matote aplankus `docs`, `scripts`, `uzrasai` ir jų failus: `aplinka.txt`, `aplinka.sh`, `ataskaita.sh`, `produktai.txt`.

11. Commit. Į repozitoriją įeina skriptas ir `docs/aplinka.txt` (ten tik `nenustatyta`, be slaptų žodžių).

```bash
git add scripts/aplinka.sh docs
git status
git commit -m "Aplinka ir paketas"
git log --oneline
```

- `git status`: paruošti `scripts/aplinka.sh` ir `docs/aplinka.txt`. `ataskaita.txt` iš 2 užduoties lieka „Untracked“ — taip ir turi būti.
- `git log --oneline`: viršuje `Aplinka ir paketas`

12. **Pateikimas:**  dvi nuotraukos iš pagrindinio ir antro terminalo su užklausa ./scripts/aplinka.sh. Viename bus `PROJEKTO_VARDAS: nenustatyta`, kitame PROJEKTO_VARDAS: visas. Taip pat, ir tree galite pridėti trečia nuotrauką.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
