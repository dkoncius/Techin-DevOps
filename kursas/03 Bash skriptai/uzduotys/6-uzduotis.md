# 6 užduotis: Atsarginė kopija

**1.** **Tikslas:** nukopijuoti visus `.txt` failus iš vieno aplanko į kitą.

**2.** Naudokite tą patį `tikrinti.sh` skriptą (`bash tests/tikrinti.sh 6`).

**3.** Projektas:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
```

- Turi būti: žvaigždutė prie `pamoka-03`

4. Į exercises/06_backup įsikelkite apačioje pridėta failą arba jo kopiją.

- `chmod +x exercises/06_backup.sh`
- Atlikti užduotį faile: pakeiskite kiekvieną `TODO`
- Testuoti: `bash tests/tikrinti.sh 6`
- Turi būti: visos patikros žalios

**5.** Commit į GitHub:

```bash
git add exercises/06_backup.sh
git commit -m "6 užduotis: Atsarginė kopija"
git push
```

- Turi būti: GitHub'e matomas `06_backup.sh`

**6.** **Pateikimas:** nuotrauka po `bash tests/tikrinti.sh 6` ir `git log --oneline`.

Jei užstrigote: `bash komandos.md`. Git: [cheat sheet](https://git-scm.com/cheat-sheet).