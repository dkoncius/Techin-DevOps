# 3 užduotis: Pirmas testas faile

**1.** **Tikslas:** testas `patikra.sh` su `PASS`, `FAIL` ir `exit 1`, kai yra ❌.

**2.** Projektas:

```bash
cd ~/Desktop/devops/bash-tikrinimas
```

**3.** Skriptas jau starteryje: `uzduotys/3-uzduotis.sh`. Pakeiskite `TODO`.

- `chmod +x uzduotys/3-uzduotis.sh`
- Atlikti užduotį faile: pakeiskite kiekvieną `TODO`
- Teste nerašykite `set -euo pipefail`
- Testuoti: `./testai/check.sh 3`
- Turi būti: `./testai/check.sh 3` baigiasi kodu 0; paleidus `./uzduotys/3-uzduotis.sh` — žalia išvestis ir `kodas: 0`

**4.** Commit į GitHub:

```bash
git add uzduotys/3-uzduotis.sh
git commit -m "3 užduotis: Pirmas testas faile"
git push
```

- Turi būti: GitHub'e matomas `uzduotys/3-uzduotis.sh`

**5.** **Pateikimas:** nuotrauka po `./testai/check.sh 3` ir `git log --oneline`.