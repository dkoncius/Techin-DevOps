# 2 užduotis: if ir lyginis skaičius

1. **Tikslas:** lyginis arba nelyginis skaičius su `if` ir išėjimo kodu.

**2.** Projektas:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
```

- Turi būti: žvaigždutė prie `pamoka-03`

**3.** `exercises/02_even_odd.sh`:

- Failas: `nano exercises/02_even_odd.sh`
- Įklijuoti kodą:

```bash
#!/usr/bin/env bash
# Exercise 2 – Even or odd
# Goal:
#   ./02_even_odd.sh 4    -> 4 is even
#   ./02_even_odd.sh 7    -> 7 is odd
#   ./02_even_odd.sh      -> "Usage: ..." on stderr, exit code 1
#   ./02_even_odd.sh abc  -> "Error: ..." on stderr, exit code 2
# Hints: [[ $n =~ ^-?[0-9]+$ ]] checks for a whole number.
#        (( n % 2 == 0 )) is true when n is even.
set -euo pipefail

# TODO: if there are no arguments, print usage to stderr (>&2) and exit 1

# TODO: if $1 is not a number, print an error to stderr and exit 2

# TODO: print "<n> is even" or "<n> is odd"

```

- `chmod +x exercises/02_even_odd.sh`
- Atlikti užduotį faile: `TODO`
- Testuoti: `bash tests/tikrinti.sh 2`
- Turi būti: visos patikros žalios

**4.** Commit į GitHub:

```bash
git add exercises/02_even_odd.sh
git commit -m "2 užduotis: if ir lyginis skaičius"
git push
```

**5.** **Pateikimas:** nuotrauka po `bash tests/tikrinti.sh 2` ir `git log --oneline`.

Jei užstrigote: `bash komandos.md`. Git: [cheat sheet](https://git-scm.com/cheat-sheet).