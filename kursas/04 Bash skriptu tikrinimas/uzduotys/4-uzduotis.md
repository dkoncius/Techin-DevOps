# 4 užduotis: skaiciuok.sh testas

**1.** **Tikslas:** nuo nulio parašyti testą `skaiciuok.sh` (teisingi ir blogi atvejai).

**2.** Pirmiausia pažiūrėkite, ką daro skriptas:

```bash
cd ~/Desktop/devops/bash-tikrinimas
./scripts/skaiciuok.sh 2 3
echo "kodas: $?"
./scripts/skaiciuok.sh 2>/dev/null; echo "kodas: $?"
./scripts/skaiciuok.sh abc 1 2>/dev/null; echo "kodas: $?"
```

- Turi būti: `5` ir kodas `0`; be argumentų — tuščia išvestis ir kodas `2`; `abc 1` — kodas `2`

**3.** Skriptas jau starteryje: `uzduotys/4-uzduotis.sh`. Užpildykite `TODO` (testas nuo nulio).

- `chmod +x uzduotys/4-uzduotis.sh`
- Atlikti užduotį faile: užpildykite kiekvieną `TODO` (bent keturios patikros, paskutinė — savo idėja)
- Testuoti: `./testai/check.sh 4`
- Turi būti: tikrintuvas žalias; sugadinus `skaiciuok.sh` testas turi tapti raudonas (tada `git restore scripts/skaiciuok.sh`)

**4.** Commit į GitHub:

```bash
git add uzduotys/4-uzduotis.sh
git commit -m "4 užduotis: skaiciuok.sh testas"
git push
```

- Turi būti: GitHub'e matomas `uzduotys/4-uzduotis.sh`

**5.** **Pateikimas:** nuotrauka po `./testai/check.sh 4` ir `git log --oneline`.