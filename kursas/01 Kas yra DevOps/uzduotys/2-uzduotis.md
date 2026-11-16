# 2 užduotis: Github branching

**1.** **Tikslas:** redaguoti failus `main` šakoje, tada naujoje šakoje ir sujungti su `main`.

**2.** Darbą tęsti tame pačiame `git-bandymas` aplanke per terminalą.

**3.** Sukurti naują failą:

- `echo "darbas main" > main.txt`
- `ls`
- `cat main.txt`
- Turi būti: sąraše yra `main.txt`, jame viena eilutė

**4.** Išsaugoti ir nusiųsti į `main`:

- `git add .`
- `git status`
- `git commit -m "Naujas failas main.txt"`
- `git push`
- Turi būti: `git status` prieš commit rodo paruoštą `main.txt`, po `push` rašo „up to date with 'origin/main'“, GitHub'e yra `main.txt`

**5.** Sukurti šaką ir pereiti į ją:

- `git switch -c atnaujinimas`

**6.** Pridėti eilutę į tą patį failą:

- `echo "atnaujinimas" >> main.txt`
- `cat main.txt`
- `git branch`
- Turi būti: `cat` rodo dvi eilutes (`darbas main` ir `atnaujinimas`), `git branch` rodo žvaigždutę prie `atnaujinimas`, sąraše yra ir `main`

**7.** Išsaugoti ir nusiųsti šaką:

- `git add .`
- `git commit -m "Atnaujintas main.txt"`
- `git push -u origin atnaujinimas`
- `git log --oneline origin/atnaujinimas`
- Turi būti: viršuje „Atnaujintas main.txt“

**8.** Grįžti į `main`, sujungti ir nusiųsti:

- `git switch main`
- `git merge atnaujinimas`
- `git push`
- Turi būti: `git merge` parašo, kad pavyko

**9.** Ištrinti šaką kompiuteryje ir GitHub'e:

- `git branch -d atnaujinimas`
- `git push origin --delete atnaujinimas`

**10.** Tą patį kelią pakartoti su šaka `antras`:

- `git switch -c antras`
- `echo "antras" >> main.txt`
- `git add .`
- `git commit -m "Šaka antras"`
- `git push -u origin antras`
- `git switch main`
- `git merge antras`
- `git push`
- `git branch -d antras`
- `git push origin --delete antras`

**11.** Tą patį kelią pakartoti su šaka `trecias`:

- `git switch -c trecias`
- `echo "trecias" >> main.txt`
- `git add .`
- `git commit -m "Šaka trecias"`
- `git push -u origin trecias`
- `git switch main`
- `git merge trecias`
- `git push`
- `git branch -d trecias`
- `git push origin --delete trecias`

**12.** **Pateikimas:** GitHub commit'ų lango ekrano nuotrauka.

Jei užstrigote, pasižiūrėkite [Git cheat sheet](https://git-scm.com/cheat-sheet).
