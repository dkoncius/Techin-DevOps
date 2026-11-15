# 2 užduotis: Redaguokite main ir šaką

1. **Tikslas:** redaguoti failus `main` šakoje, tada naujoje šakoje ir sujungti su main.
2. Darbą tęskite tame pačiame `git-bandymas` aplankale per terminala.
3. Sukurkite naują failą: `echo "darbas main" > main.txt`. Patikrinkite: `ls` ir `cat main.txt`. Sąraše yra `main.txt`, jame viena eilutė.
4. Išsaugokite ir nusiųskite į `main`: `git add .`, tada `git status` (`main.txt` paruoštas commit), `git commit -m "Naujas failas main.txt"`, `git push`. `git status` rašo „up to date with 'origin/main'“. GitHub'e yra `main.txt`.
5. Sukurkite šaką ir pereikite į ją: `git switch -c atnaujinimas`.
6. Pridėkite eilutę į tą patį failą: `echo "atnaujinimas" >> main.txt`. Patikrinkite: `cat main.txt`. Dvi eilutės: `darbas main` ir `atnaujinimas`. Tada `git branch`: žvaigždutė prie `atnaujinimas`, sąraše yra ir `main`.
7. Išsaugokite ir nusiųskite šaką: `git add .`, `git commit -m "Atnaujintas main.txt"`, `git push -u origin atnaujinimas`. GitHub istorija: `git log --oneline origin/atnaujinimas`. Viršuje „Atnaujintas main.txt“.
8. Grįžkite į `main`, sujunkite ir nusiųskite: `git switch main`, `git merge atnaujinimas`, `git push`. `git merge` parašys ar pavyko viskas.
9. Ištrinkite šaką kompiuteryje ir GitHub'e: `git branch -d atnaujinimas`, tada `git push origin --delete atnaujinimas`.
10. Tą patį kelią pakartokite su šaka `antras`:
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
11. Tą patį kelią pakartokite su šaka `trecias`:
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
12. **Pateikimas:** GitHub commit'ų lango ekrano nuotrauka.

Jei užstrigote, pasižiūrėkite [Git cheat sheet](https://git-scm.com/cheat-sheet).
