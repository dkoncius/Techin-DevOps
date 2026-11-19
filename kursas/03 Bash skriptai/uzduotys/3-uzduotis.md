# 3 užduotis: while ciklas

**1.** **Tikslas:** atgalinis skaičiavimas su `while` ciklu.

**2.** Naudokite tą patį `tikrinti.sh` skriptą (`bash tests/tikrinti.sh 3`).

**3.** Projektas:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
```

- Turi būti: žvaigždutė prie `pamoka-03`

4. Į exercises/03_countdown.sh įsikelkite apačioje pridėta failą arba jo kopiją.

- `chmod +x exercises/03_countdown.sh`
- Atlikti užduotį faile: pakeiskite kiekvieną `TODO`
- Testuoti: `bash tests/tikrinti.sh 3`
- Turi būti: visos patikros žalios

**5.** Commit į GitHub:

```bash
git add exercises/03_countdown.sh
git commit -m "3 užduotis: while ciklas"
git push
```

- Turi būti: GitHub'e matomas `03_countdown.sh`

**6.** **Pateikimas:** nuotrauka po `bash tests/tikrinti.sh 3` ir `git log --oneline`.