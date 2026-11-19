# 1 užduotis: OUT ir KODAS

**1.** **Tikslas:** paleisti `patikra.sh` du kartus ir parodyti išvestį, kodą ir pirmą išvesties eilutę (`2>/dev/null`).

**2.** Projektas (starteris jau išarchyvuotas):

```bash
cd ~/Desktop/devops/bash-tikrinimas
pwd
chmod +x scripts/*.sh testai/*.sh pavyzdziai/*.sh
./scripts/patikra.sh git
```

- Turi būti: `pwd` rodo aplanką su `README.md`, `scripts/`, `testai/`
- Turi būti: eilutės su `OK      git` ir `kodas: 0`

**3.** Skriptas jau yra starteryje: `uzduotys/1-uzduotis.sh`. Atidarykite ir pakeiskite kiekvieną `TODO`.

- `chmod +x uzduotys/1-uzduotis.sh`
- Atlikti užduotį faile: pakeiskite kiekvieną `TODO`
- Testuoti: `./testai/check.sh 1`
- Turi būti: keturios žalios patikros

**4.** Tikrintuvas rodo tokią išvestį (pavyzdys):

```text
git: kodas 0
neegzistuoja: kodas 1
neegzistuoja: TRŪKSTA neegzistuoja
```

- Turi būti: ekrane nėra `Trūksta: 1` (stderr paslėptas)

**5.** Commit į GitHub (jei dar nepadarėte `git init` — README skyrius „Pirmą kartą“):

```bash
git add uzduotys/1-uzduotis.sh
git commit -m "1 užduotis: OUT ir KODAS"
git push
```

- Turi būti: GitHub'e matomas `uzduotys/1-uzduotis.sh`

**6.** **Pateikimas:** nuotrauka po `./testai/check.sh 1` ir `git log --oneline`.