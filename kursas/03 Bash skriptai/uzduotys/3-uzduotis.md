# 3 užduotis: while ciklas

1. **Tikslas:** atgalinis skaičiavimas su `while` ciklu.

**2.** Projektas:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
```

- Turi būti: žvaigždutė prie `pamoka-03`

**3.** `exercises/03_countdown.sh`:

- Failas: `nano exercises/03_countdown.sh`
- Įklijuoti kodą:

```bash
#!/usr/bin/env bash
# Exercise 3 – Countdown
# Goal: count down from N (default 5), one number per line, then "Liftoff!"
#   ./03_countdown.sh 3  ->  3
#                            2
#                            1
#                            Liftoff!
# Use a while loop.
set -euo pipefail

# TODO: set count to $1, or 5 if no argument

# TODO: while count is greater than 0, print it and subtract 1

# TODO: print Liftoff!

```

- `chmod +x exercises/03_countdown.sh`
- Atlikti užduotį faile: `TODO`
- Testuoti: `bash tests/check.sh 3`
- Turi būti: visos patikros žalios

**4.** Commit į GitHub:

```bash
git add exercises/03_countdown.sh
git commit -m "3 užduotis: while ciklas"
git push
```

**5.** **Pateikimas:** nuotrauka po `bash tests/check.sh 3` ir `git log --oneline`.

Jei užstrigote: `bash komandos.md`. Git: [cheat sheet](https://git-scm.com/cheat-sheet).