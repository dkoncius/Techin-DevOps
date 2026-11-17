# 4 užduotis: for ciklas

1. **Tikslas:** failų ir aplankų skaičiavimas su `for` ciklu.

**2.** Projektas:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
```

- Turi būti: žvaigždutė prie `pamoka-03`

**3.** `exercises/04_file_report.sh`:

- Failas: `nano exercises/04_file_report.sh`
- Įklijuoti kodą:

```bash
#!/usr/bin/env bash
# Exercise 4 – File report
# Goal: count files and sub-directories in a folder (default: current folder).
#   ./04_file_report.sh some_dir  ->  Files: 3
#                                     Directories: 1
#   Folder doesn't exist -> "Error: ..." on stderr, exit 1
# Hints: for item in "$dir"/*; do ... done
#        [[ -f $item ]] = regular file, [[ -d $item ]] = directory
set -euo pipefail

# TODO: set dir to $1, or . if no argument

# TODO: check that dir is a directory, otherwise error + exit 1

# TODO: loop over items and count files and directories

# TODO: print the two result lines

```

- `chmod +x exercises/04_file_report.sh`
- Atlikti užduotį faile: `TODO`
- Testuoti: `bash tests/check.sh 4`
- Turi būti: visos patikros žalios

**4.** Commit į GitHub:

```bash
git add exercises/04_file_report.sh
git commit -m "4 užduotis: for ciklas"
git push
```

**5.** **Pateikimas:** nuotrauka po `bash tests/check.sh 4` ir `git log --oneline`.

Jei užstrigote: `bash komandos.md`. Git: [cheat sheet](https://git-scm.com/cheat-sheet).