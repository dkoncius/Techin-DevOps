# 2 užduotis: Palyginimai

**1.** **Tikslas:** trys patikros, kiekviena išveda vieną eilutę ✅ arba ❌ (`=`, `-eq`, `grep -qF`, `!`).

**2.** Projektas:

```bash
cd ~/Desktop/devops/bash-tikrinimas
pwd
```

- Turi būti: tas pats aplankas kaip 1 užduotyje

**3.** Skriptas jau starteryje: `uzduotys/2-uzduotis.sh`. Pakeiskite `TODO`.

- `chmod +x uzduotys/2-uzduotis.sh`
- Atlikti užduotį faile: pakeiskite kiekvieną `TODO`
- Testuoti: `./testai/check.sh 2`
- Turi būti: visos patikros žalios, eilutės: `✅ git -> OK`, `✅ neegzistuoja -> kodas 1`, `✅ Trūksta: ne išvestyje`

**4.** Commit į GitHub:

```bash
git add uzduotys/2-uzduotis.sh
git commit -m "2 užduotis: Palyginimai"
git push
```

- Turi būti: GitHub'e matomas `uzduotys/2-uzduotis.sh`

**5.** **Pateikimas:** nuotrauka po `./testai/check.sh 2` ir `git log --oneline`.