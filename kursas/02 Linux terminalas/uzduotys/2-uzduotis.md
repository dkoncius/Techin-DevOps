# 2 užduotis: Skriptas ir teisės

1. **Tikslas:** skriptas ieško žodžio, kuris parašytas tik faile `slaptas.txt`, ir radinį įrašo į ataskaitą.
2. Nueiti į projektą, patikrinti šaką ir sukurti aplanką. Nukopijuokite:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
mkdir -p scripts
ls
```

   - Žvaigždutė prie `pamoka-02` (dirbame toje pačioje šakoje kaip 1 užduotyje)
   - `ls` rodo `scripts` ir `uzrasai`
3. Sukurti žodžio failą aplanke `devops` (vienu lygiu aukščiau už projektą).
   - Jame nėra programos, tik viena eilutė `kava`. Skripte šio žodžio nebus: `grep` jį perskaitys iš čia ir ieškos 1 užduoties sąraše `uzrasai/produktai.txt`.
   - Failas yra už projekto ribų, todėl niekada nepateks į Git.
   - `chmod 600` leidžia skaityti ir rašyti tik jums. Jūs failo savininkas, todėl jūsų skriptas jį perskaito.

```bash
cd ..
echo kava > slaptas.txt
chmod 600 slaptas.txt
cat slaptas.txt
ls -l slaptas.txt
```

   - `cat` rodo `kava`
   - `ls -l` eilutės pradžioje rodo `-rw-------`
4. Grįžti į projektą ir atidaryti naują skriptą su `nano`:

```bash
cd git-bandymas
nano scripts/ataskaita.sh
```

5. Įklijuoti skriptą (**Mac: Cmd+V**). Pirma eilutė turi prasidėti nuo pat krašto, be tarpų:
   - `#!` sako sistemai, kuria programa paleisti failą
   - `/usr/bin/env bash` randa `bash` ir Mac, ir Ubuntu
   - `grep -f` žodį ima iš `slaptas.txt`, o ne iš skripto
   - `-n` prie radinio parašo eilutės numerį

```bash
#!/usr/bin/env bash
echo "Aplankas: $(basename "$(pwd)")"
echo "Eilutės:"
grep -n -f ../slaptas.txt uzrasai/produktai.txt
```

   - Išsaugokite ir išeikite: `Ctrl+O`, `Enter`, `Ctrl+X`. Nano klavišai yra 1 užduotyje.
6. Paleisti skriptą.

```bash
./scripts/ataskaita.sh
```

   - Klaida `Permission denied`: failas sukurtas, bet dar neturi leidimo būti paleistas.
   - Patikrinkite: `ls -l scripts/ataskaita.sh` rodo `-rw-r--r--`, `x` raidės nėra.
7. Leisti paleisti ir paleisti dar kartą.

```bash
chmod +x scripts/ataskaita.sh
ls -l scripts/ataskaita.sh
./scripts/ataskaita.sh
```

   - `ls -l` rodo `-rwxr-xr-x`, atsirado `x`
   - Išvestis:

```
Aplankas: git-bandymas
Eilutės:
4:kava 3.50 €
```

   - Skriptą paleiskite tik iš `git-bandymas` aplanko: keliai `../slaptas.txt` ir `uzrasai/produktai.txt` skaičiuojami nuo ten, kur esate.
8. Išvestį įrašyti į failą. `ataskaita.txt` kurti nereikia, `>` jį sukuria. `./` reiškia „šiame aplanke“.

```bash
./scripts/ataskaita.sh > ataskaita.txt
cat ataskaita.txt
```

   - `cat` rodo tą pačią išvestį kaip 7 žingsnyje, su `4:kava 3.50 €`
9. Išsaugoti skriptą Git'e. Į commit dedamas tik skriptas. `ataskaita.txt` lieka jūsų kompiuteryje, nes joje yra slaptas žodis. `slaptas.txt` yra už projekto ribų, todėl Git jo net nemato.

```bash
git add scripts/ataskaita.sh
git status
git commit -m "Pridėtas ataskaita.sh"
git log --oneline
```

   - `git status`: paruoštas commit tik `scripts/ataskaita.sh`, `ataskaita.txt` rodomas kaip „Untracked“, `slaptas.txt` nerodomas
   - `git log --oneline`: viršuje `Pridėtas ataskaita.sh`
10. **Pateikimas:** nuotrauka po `cat ataskaita.txt` ir `git log --oneline`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Nano klavišams: [Nano cheat sheet](https://linuxize.com/cheatsheet/nano/). Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
