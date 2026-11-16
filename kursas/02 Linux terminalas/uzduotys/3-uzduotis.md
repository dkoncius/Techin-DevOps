# 3 užduotis: Kintamasis ir paketas

1. **Tikslas:** pamatyti, kad `export` galioja tik šiam langui, ir įdiegti `tree`.
2. Eiti į projektą ir patikrinti šaką:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
```

- Turi būti: žvaigždutė prie `pamoka-02`

3. Atidaryti naują skriptą su `nano`:

```bash
nano scripts/aplinka.sh
```

4. Įklijuoti skriptą (**Mac: Cmd+V**). Pirma eilutė nuo pat krašto, be tarpų prieš `#!`:

```bash
#!/usr/bin/env bash
echo "PROJEKTO_VARDAS: ${PROJEKTO_VARDAS:-nenustatyta}"
```

- Išsaugoti ir išeiti: `Ctrl+O`, `Enter`, `Ctrl+X`

5. Leisti paleisti skriptą:

```bash
chmod +x scripts/aplinka.sh
ls -l scripts/aplinka.sh
```

- Turi būti: `ls -l` eilutė prasideda `-rwxr-xr-x`

6. Paleisti **be** `export`, rezultatą įrašyti į failą:

```bash
mkdir -p docs
./scripts/aplinka.sh > docs/aplinka.txt
cat docs/aplinka.txt
```

- Turi būti:

```
PROJEKTO_VARDAS: nenustatyta
```

7. Nustatyti kintamąjį šiam langui ir paleisti skriptą. **Šio lango neuždarykite.**

```bash
export PROJEKTO_VARDAS=visas
./scripts/aplinka.sh
```

- Turi būti:

```
PROJEKTO_VARDAS: visas
```

8. Atidaryti naują terminalo langą ir paleisti skriptą:
   - **Mac:** `Cmd+N`
   - **Ubuntu:** `Ctrl+Alt+T`
   - **WSL / Windows Terminal:** `Ctrl+Shift+T`

```bash
cd ~/Desktop/devops/git-bandymas
./scripts/aplinka.sh
```

- Turi būti:

```
PROJEKTO_VARDAS: nenustatyta
```

- Grįžkite į senąjį langą ir paleiskite `./scripts/aplinka.sh` dar kartą: ten vis dar `visas`

9. Įdiegti `tree`.

**Mac** (nerašykite `sudo brew`):

```bash
brew install tree
```

- Jei rašo `brew: command not found`, Homebrew neįdiegtas. Įdiekite pagal [brew.sh](https://brew.sh) instrukciją
- Jei neleidžia įrašyti, skaitykite, ką rašo terminalas, ir padarykite tą eilutę. `sudo brew` nerašykite

**Ubuntu / WSL:**

```bash
sudo apt update
sudo apt install -y tree
```

10. Patikrinti, ar `tree` įdiegtas:

```bash
tree --version
which tree
```

- Turi būti: `tree --version` rodo versiją, `which tree` rodo kelią į programą

11. Pažiūrėti projekto medį:

```bash
cd ~/Desktop/devops/git-bandymas
tree
```

- Turi būti: aplankai `docs`, `scripts`, `uzrasai` ir jų failai `aplinka.txt`, `aplinka.sh`, `ataskaita.sh`, `produktai.txt`

12. Išsaugoti Git'e skriptą ir `docs/aplinka.txt` (ten tik `nenustatyta`):

```bash
git add scripts/aplinka.sh docs
git status
git commit -m "Aplinka ir paketas"
git log --oneline
```

- Turi būti: `git status` rodo paruoštus `scripts/aplinka.sh` ir `docs/aplinka.txt`, `ataskaita.txt` lieka „Untracked“
- Turi būti: `git log --oneline` viršuje `Aplinka ir paketas`

13. **Pateikimas:** dvi nuotraukos su `./scripts/aplinka.sh`: iš naujo lango su `PROJEKTO_VARDAS: nenustatyta` ir iš pagrindinio lango su `PROJEKTO_VARDAS: visas`. Galite pridėti ir trečią nuotrauką po `tree`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
