# 5 užduotis: Visada žalias testas

**1.** **Tikslas:** rasti, kodėl testas lieka žalias su sugadintu `patikra.sh`, ir sutaisyti (TRIS trūkumus).

**2.** Naudokite tą patį `./testai/check.sh` (`./testai/check.sh 5`).

**3.** Projektas:

```bash
cd ~/Desktop/devops/bash-tikrinimas
```

**4.** Skriptas jau starteryje: `uzduotys/5-uzduotis.sh`. Pataisykite testą (neištrinkite patikrų).

- `chmod +x uzduotys/5-uzduotis.sh`
- Sugadinkite `scripts/patikra.sh` pagal README 10 skyrių, paleiskite testą, tada sutaisykite testą
- Testuoti: `./testai/check.sh 5`
- Turi būti: su geru `patikra.sh` — žalias; tikrintuvas patvirtina, kad su sugadintu skriptu testas raudonas

**5.** Commit į GitHub:

```bash
git add uzduotys/5-uzduotis.sh
git commit -m "5 užduotis: Visada žalias testas"
git push
```

- Turi būti: GitHub'e matomas `uzduotys/5-uzduotis.sh`

**6.** **Pateikimas:** nuotrauka po `./testai/check.sh 5` ir `git log --oneline`.