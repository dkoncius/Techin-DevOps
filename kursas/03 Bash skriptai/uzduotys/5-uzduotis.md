# 5 užduotis: Funkcija

1. **Tikslas:** pažymių skaičiuoklė su funkcija `to_grade`.

**2.** Projektas:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
```

- Turi būti: žvaigždutė prie `pamoka-03`

**3.** `exercises/05_grade.sh`:

- Failas: `nano exercises/05_grade.sh`
- Įklijuoti kodą:

```bash
#!/usr/bin/env bash
# Exercise 5 – Grade calculator
# Goal: turn a score 0-100 into a letter grade.
#   90-100 A | 80-89 B | 70-79 C | 60-69 D | 0-59 F
#   ./05_grade.sh 85   -> Grade: B
#   ./05_grade.sh 120  -> "Error: ..." on stderr, exit 1
#   ./05_grade.sh abc  -> "Error: ..." on stderr, exit 1
# You MUST write a function called to_grade that echoes the letter.
set -euo pipefail

# TODO: write the function to_grade() { ... }

# TODO: read the score from $1 and validate it (whole number, 0-100)

# TODO: print "Grade: <letter>" using $(to_grade "$score")

```

- `chmod +x exercises/05_grade.sh`
- Atlikti užduotį faile: `TODO`
- Testuoti: `bash tests/check.sh 5`
- Turi būti: visos patikros žalios

**4.** Commit į GitHub:

```bash
git add exercises/05_grade.sh
git commit -m "5 užduotis: Funkcija"
git push
```

**5.** **Pateikimas:** nuotrauka po `bash tests/check.sh 5` ir `git log --oneline`.

Jei užstrigote: `bash komandos.md`. Git: [cheat sheet](https://git-scm.com/cheat-sheet).