# 6 užduotis: Raudonas testas su geru skriptu

**1.** **Tikslas:** rasti dvi klaidas teste ir sutaisyti, kad su geru `patikra.sh` būtų žalias.

**2.** Naudokite tą patį `./testai/check.sh` (`./testai/check.sh 6`).

**3.** Projektas:

```bash
cd ~/Desktop/devops/bash-tikrinimas
OUT=$(./scripts/patikra.sh git)
echo "$OUT"
echo $?
```

- Palyginkite su tuo, ko tikisi šio testo eilutės

**4.** Skriptas jau starteryje: `uzduotys/6-uzduotis.sh`. Pataisykite dvi klaidas teste.

- `chmod +x uzduotys/6-uzduotis.sh`
- Atlikti užduotį faile: pataisykite testą, neištrinkite patikrų
- Testuoti: `./testai/check.sh 6`
- Turi būti: su geru skriptu — žalias, kodas 0

**5.** Commit į GitHub:

```bash
git add uzduotys/6-uzduotis.sh
git commit -m "6 užduotis: Raudonas testas"
git push
```

- Turi būti: GitHub'e matomas `uzduotys/6-uzduotis.sh`

**6.** **Pateikimas:** nuotrauka po `./testai/check.sh 6` ir `git log --oneline`.