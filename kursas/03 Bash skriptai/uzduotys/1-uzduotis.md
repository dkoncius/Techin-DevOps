# 1 užduotis: Argumentai

1. **Tikslas:** pasisveikinimas su argumentu (`$1`).

**2.** Projektas ir aplankas (tik pirmą kartą). Į projekto šaknį įdėkite iš Teams aplanką `tests` (su `check.sh`):

```bash
cd ~/Desktop/devops/git-bandymas
git switch main
git pull
git switch -c pamoka-03
mkdir -p exercises
git branch
```

- Turi būti: žvaigždutė prie `pamoka-03`
- Turi būti: `ls` rodo `exercises` ir `tests`

**3.** `exercises/01_greet.sh`:

- Failas: `nano exercises/01_greet.sh`
- Įklijuoti kodą (**Mac: Cmd+V**, WSL: `Ctrl+Shift+V`), išsaugoti `Ctrl+O`, `Enter`, `Ctrl+X`

```bash
#!/usr/bin/env bash
# Exercise 1 – Greet
# Goal: greet the person whose name is given as the first argument.
#   ./01_greet.sh Ada  -> Hello, Ada!
#   ./01_greet.sh      -> Hello, stranger!      (no argument)
# Hint: "${1:-default}" gives $1, or "default" if $1 is empty.

# TODO: store the first argument (or "stranger") in a variable called name

# TODO: print the greeting

```

- `chmod +x exercises/01_greet.sh`
- Atlikti užduotį faile: pakeiskite kiekvieną `TODO`
- Testuoti: `bash tests/check.sh 1`
- Turi būti: visos patikros žalios

**4.** Commit į GitHub:

```bash
git add exercises/01_greet.sh
git commit -m "1 užduotis: Argumentai"
git push -u origin pamoka-03
```

- Turi būti: GitHub'e matomas `01_greet.sh`

**5.** **Pateikimas:** nuotrauka po `bash tests/check.sh 1` ir `git log --oneline`.

Jei užstrigote: `bash komandos.md`. Git: [cheat sheet](https://git-scm.com/cheat-sheet).