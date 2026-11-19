# 1 užduotis: Argumentai

**1.** **Tikslas:** pasisveikinimas su argumentu (`$1`).

**2.** Naudokite tą patį `tikrinti.sh` skriptą.

**3.** Projektas ir šaka (tik pirmą kartą):

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

4. Į exercises/01_greetsh įsikelkite apačioje pridėta failą arba jo kopiją.

- `chmod +x exercises/01_greet.sh`
- Atlikti užduotį faile: pakeiskite kiekvieną `TODO`
- Testuoti: `bash tests/tikrinti.sh 1`
- Turi būti: visos patikros žalios

**5.** Commit į GitHub:

```bash
git add exercises/01_greet.sh
git commit -m "1 užduotis: Argumentai"
git push -u origin pamoka-03
```

- Turi būti: GitHub'e matomas `01_greet.sh`

**6.** **Pateikimas:** nuotrauka po `bash tests/tikrinti.sh 1` ir `git log --oneline`.