# 2 užduotis: Skriptas ir teisės

1. **Tikslas:** skriptas ieško žodžio, kuris parašytas tik faile `slaptas.txt`, ir radinį įrašo į ataskaitą.
2. Eiti į projektą ir patikrinti šaką:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
```

- Turi būti: žvaigždutė prie `pamoka-02`

3. Sukurti aplanką skriptams:

```bash
mkdir -p scripts
ls
```

- Turi būti: `ls` sąraše yra `scripts` ir `uzrasai`

4. Sukurti žodžio failą aplanke `devops` (vienu lygiu aukščiau už projektą) ir perskaityti:

```bash
cd ..
echo db1 > slaptas.txt
cat slaptas.txt
```

- Turi būti: `cat` rodo `db1`

5. Užrakinti failą ir bandyti perskaityti:

```bash
chmod 000 slaptas.txt
cat slaptas.txt
```

- Turi būti: `cat: slaptas.txt: Permission denied`

6. Atrakinti failą (tik jūs skaitote ir rašote) ir vėl perskaityti:

```bash
chmod 600 slaptas.txt
cat slaptas.txt
ls -l slaptas.txt
```

- Turi būti: `cat` rodo `db1`, `ls -l` eilutė prasideda `-rw-------`

7. Grįžti į projektą ir atidaryti skriptą su `nano`:

```bash
cd git-bandymas
nano scripts/ataskaita.sh
```

8. Įklijuoti skriptą (**Mac: Cmd+V**). Pirma eilutė nuo pat krašto, be tarpų:

```bash
#!/usr/bin/env bash
echo "Aplankas: $(basename "$(pwd)")"
echo "Eilutės:"
grep -n -f ../slaptas.txt uzrasai/serveriai.txt
```

- Išsaugoti ir išeiti: `Ctrl+O`, `Enter`, `Ctrl+X`

9. Paleisti skriptą:

```bash
./scripts/ataskaita.sh
```

- Turi būti: `permission denied` (Ubuntu / WSL: `Permission denied`)

10. Leisti paleisti skriptą:

```bash
chmod +x scripts/ataskaita.sh
ls -l scripts/ataskaita.sh
```

- Turi būti: `ls -l` eilutė prasideda `-rwxr-xr-x`

11. Paleisti skriptą dar kartą:

```bash
./scripts/ataskaita.sh
```

- Turi būti:

```
Aplankas: git-bandymas
Eilutės:
2:db1 192.168.1.20
```

12. Išvestį įrašyti į failą:

```bash
./scripts/ataskaita.sh > ataskaita.txt
cat ataskaita.txt
```

- Turi būti: `cat` rodo tą pačią išvestį kaip 11 žingsnyje

13. Išsaugoti Git'e tik skriptą (`ataskaita.txt` nededame):

```bash
git add scripts/ataskaita.sh
git status
git commit -m "Pridėtas ataskaita.sh"
git log --oneline
```

- Turi būti: `git status` rodo paruoštą `scripts/ataskaita.sh`, `ataskaita.txt` kaip „Untracked“, `slaptas.txt` nerodomas
- Turi būti: `git log --oneline` viršuje `Pridėtas ataskaita.sh`

14. **Pateikimas:** nuotrauka po `cat ataskaita.txt` ir `git log --oneline`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Nano klavišams: [Nano cheat sheet](https://linuxize.com/cheatsheet/nano/). Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
