# 3 užduotis: export ir paketai (brew / apt)

**1.** **Tikslas:** pamatyti, kad `export` galioja tik šiam langui, ir įdiegti `tree`.

**2.** Eiti į projektą ir patikrinti šaką:

- `cd ~/Desktop/devops/git-bandymas`
- `git branch`
- Turi būti: žvaigždutė prie `pamoka-02`

**3.** Atidaryti skriptą su `nano`:

- `nano scripts/ataskaita.sh`

**4.** Rodyklėmis nueiti į failo pabaigą, paspausti `Enter` ir įklijuoti vieną eilutę (**Mac: Cmd+V**):

- `echo "Projektas: ${PROJEKTO_VARDAS:-nenustatyta}"`
- Išsaugoti ir išeiti: `Ctrl+O`, `Enter`, `Ctrl+X`

**5.** Paleisti skriptą **be** `export`:

- `./scripts/ataskaita.sh`
- Turi būti:

```
Aplankas: git-bandymas
Eilutės:
2:db1 192.168.1.20
Projektas: nenustatyta
```

**6.** Nustatyti kintamąjį šiam langui ir paleisti skriptą. **Šio lango neuždarykite.**

- `export PROJEKTO_VARDAS=visas`
- `./scripts/ataskaita.sh`
- Turi būti: paskutinė eilutė `Projektas: visas`

**7.** Atidaryti naują terminalo langą ir paleisti skriptą:

- Naujas langas: **Mac** `Cmd+N`, **Ubuntu** `Ctrl+Alt+T`, **WSL / Windows Terminal** `Ctrl+Shift+T`
- `cd ~/Desktop/devops/git-bandymas`
- `./scripts/ataskaita.sh`
- Turi būti: paskutinė eilutė `Projektas: nenustatyta`
- Grįžkite į senąjį langą ir paleiskite `./scripts/ataskaita.sh` dar kartą: ten vis dar `Projektas: visas`

**8.** Įdiegti `tree`:

- Mac: `brew install tree` (nerašykite `sudo brew`)
- Ubuntu / WSL: `sudo apt update`
- Ubuntu / WSL: `sudo apt install -y tree`
- Mac, jei `brew: command not found`: Homebrew neįdiegtas, įdiekite pagal [brew.sh](https://brew.sh) instrukciją
- Jei neleidžia įrašyti, skaitykite, ką rašo terminalas, ir padarykite tą eilutę

**9.** Patikrinti, ar `tree` įdiegtas:

- `tree --version`
- `which tree`
- Turi būti: `tree --version` rodo versiją, `which tree` rodo kelią į programą

**10.** Pažiūrėti projekto medį:

- `cd ~/Desktop/devops/git-bandymas`
- `tree`
- Turi būti: aplankai `scripts` ir `uzrasai`, jų failai `ataskaita.sh` ir `serveriai.txt`, o šalia failas `ataskaita.txt`

**11.** Išsaugoti Git'e pakeistą skriptą:

- `git add scripts/ataskaita.sh`
- `git status`
- `git commit -m "Pridėtas projekto vardas"`
- `git log --oneline`
- Turi būti: `git status` rodo paruoštą `scripts/ataskaita.sh`, `ataskaita.txt` lieka „Untracked“
- Turi būti: `git log --oneline` viršuje `Pridėtas projekto vardas`

**12.** **Pateikimas:** dvi nuotraukos su `./scripts/ataskaita.sh`: iš naujo lango su `Projektas: nenustatyta` ir iš pagrindinio lango su `Projektas: visas`. Galite pridėti ir trečią nuotrauką po `tree`.

**13.** **Papildomai (nebūtina):** `bat` (kaip `cat`, bet su eilučių numeriais):

- Mac: `brew install bat`, tada `bat scripts/ataskaita.sh`
- Ubuntu / WSL: `sudo apt install -y bat`, tada `batcat scripts/ataskaita.sh`
- Turi būti: skripto eilutės su numeriais

**14.** `htop` (gyvas procesų sąrašas):

- Mac: `brew install htop`
- Ubuntu / WSL: `sudo apt install -y htop`
- `htop`
- Turi būti: procesų sąrašas. Išeiti: `q`

**15.** `cowsay` (karvė su burbulu):

- Mac: `brew install cowsay`
- Ubuntu / WSL: `sudo apt install -y cowsay`
- `cowsay Labas`
- Turi būti: karvė su burbulu „Labas“

**16.** `figlet` (didelės raidės):

- Mac: `brew install figlet`
- Ubuntu / WSL: `sudo apt install -y figlet`
- `figlet DevOps`
- Turi būti: žodis `DevOps` didelėmis raidėmis

**17.** Patikrinti, kur įdiegtos programos:

- `which htop cowsay figlet`
- Turi būti: trys keliai, pvz. `/opt/homebrew/bin/htop`
- `bat`: Mac `which bat`, Ubuntu `which batcat`

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
