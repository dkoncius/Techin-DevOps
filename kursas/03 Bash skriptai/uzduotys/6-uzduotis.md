# 6 užduotis: Atsarginė kopija

1. **Tikslas:** nukopijuoti visus `.txt` failus iš vieno aplanko į kitą.

**2.** Projektas:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
```

- Turi būti: žvaigždutė prie `pamoka-03`

**3.** `exercises/06_backup.sh`:

- Failas: `nano exercises/06_backup.sh`
- Įklijuoti kodą:

```bash
#!/usr/bin/env bash
# Exercise 6 – Backup .txt files
# Goal: copy every .txt file from a source folder into a backup folder.
#   ./06_backup.sh notes backup  -> Backed up 2 file(s) to backup
# Rules:
#   - exactly 2 arguments, otherwise usage on stderr + exit 1
#   - source folder must exist, otherwise error on stderr + exit 1
#   - create the backup folder if it doesn't exist (mkdir -p)
#   - copy only .txt files; other files are ignored
#   - if there are no .txt files, print "Backed up 0 file(s) to <dir>"
set -euo pipefail

# TODO: check the number of arguments

# TODO: check the source folder

# TODO: create the backup folder

# TODO: copy the .txt files and count them

# TODO: print the summary line

```

- `chmod +x exercises/06_backup.sh`
- Atlikti užduotį faile: `TODO`
- Testuoti: `bash tests/check.sh 6`
- Turi būti: visos patikros žalios

**4.** Commit į GitHub:

```bash
git add exercises/06_backup.sh
git commit -m "6 užduotis: Atsarginė kopija"
git push
```

**5.** **Pateikimas:** nuotrauka po `bash tests/check.sh 6` ir `git log --oneline`.

Jei užstrigote: `bash komandos.md`. Git: [cheat sheet](https://git-scm.com/cheat-sheet).