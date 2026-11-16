# 1 užduotis: Argumentai ir išėjimo kodas

**1.** **Tikslas:** užpildyti šabloną `scripts/patikra.sh`, kad skriptas tikrintų įrankį pagal argumentą ir grąžintų išėjimo kodą.

**2.** Pasiruošimas:

- Mac: terminale pirma parašykite `bash` (Ubuntu / WSL nieko nereikia)
- Atsisiųskite paruošimo skriptą ir paleiskite jį:

```bash
cd ~/Desktop/devops
curl -fsSL -O https://raw.githubusercontent.com/dkoncius/Techin-DevOps/main/kursas/03%20Bash%20skriptai/starteris/paruosti.sh
bash paruosti.sh
cd pamoka-03
bash testai/tikrinti.sh 1
```

- Skriptas `paruosti.sh` sukuria aplanką `pamoka-03` ir atsisiunčia patikrą bei šabloną `scripts/patikra.sh`; jei norite, perskaitykite jį: `cat ~/Desktop/devops/paruosti.sh`
- Jei `curl` rašo klaidą, patikrinkite internetą
- Turi būti: `bash testai/tikrinti.sh 1` rodo ❌ (šablonas dar tuščias)

**3.** Užpildykite visus `TODO` faile `scripts/patikra.sh` (`nano scripts/patikra.sh`):

- Griežtas režimas, naudojimo žinutė į klaidų kanalą su kodu 2, kintamasis `irankis` iš pirmo argumento, `OK` arba `TRŪKSTA` su kodu 1
- Turi būti: `bash testai/tikrinti.sh 1` rodo `Viskas gerai`

**4.** Paleiskite ranka su `git`, su `neegzistuoja` ir be argumento, po kiekvieno iškart parodykite išėjimo kodą:

- Turi būti: `OK      git` ir kodas 0, `TRŪKSTA neegzistuoja` ir kodas 1, naudojimo žinutė ir kodas 2

**5.** **Pateikimas:** terminalo nuotrauka su trimis paleidimais ir kodais 0, 1, 2 bei `Viskas gerai`.

Jei užstrigote, pasižiūrėkite `bash komandos.md`.
