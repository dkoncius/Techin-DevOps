# 7 užduotis: Atšaukimas ir Pull Request

1. **Tikslas:** `git restore` be `git reset --hard` ir Pull Request į `main`. Detaliau: `git komandos.md`.

**2.** Projektas:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
git status
```

- Turi būti: žvaigždutė prie `pamoka-03`
- Turi būti: `git status` — švaru (užbaikite 1–6 užduotis)

**3.** Atšaukti pakeitimą faile:

```bash
echo "# juodrastis" >> exercises/01_greet.sh
git restore exercises/01_greet.sh
bash tests/check.sh 1
```

- Turi būti: failas kaip buvo, patikra žalia

**4.** `.gitignore` ir commit:

```bash
echo "*.log" > .gitignore
git add .gitignore
git commit -m "7 užduotis: .gitignore"
git push
```

- Turi būti: `git status` nerodo `.log` failų

**5.** Pull Request į `main` — terminale `gh pr create --base main --title "Pamoka 03: Bash skriptai" --body "Šeši Bash skriptai."` arba naršyklėje **Compare & pull request** (`base`: `main`, `compare`: `pamoka-03`).

**6.** Sulieti PR (**Create a merge commit**), tada:

```bash
git switch main
git pull
git branch -d pamoka-03
git push origin --delete pamoka-03
```

**7.** **Pateikimas:** GitHub su sulietu PR ir `git log --oneline` terminale.

Jei užstrigote: `git komandos.md`. Git: [cheat sheet](https://git-scm.com/cheat-sheet).