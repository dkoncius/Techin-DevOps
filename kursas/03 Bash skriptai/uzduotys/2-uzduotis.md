# 2 užduotis: Ciklas per įrankius

**1.** **Tikslas:** išplėsti `scripts/patikra.sh`, kad jis patikrintų įrankių sąrašą ir suskaičiuotų, kiek trūksta.

**2.** Pasiruošimas:

- Mac: terminale pirma parašykite `bash`
- Pirma pasidarykite 1 užduoties kopiją (`patikra-1.sh`), tada atsisiųskite naują šabloną (jis perrašo `scripts/patikra.sh`):

```bash
cd ~/Desktop/devops/pamoka-03
cp scripts/patikra.sh scripts/patikra-1.sh
curl -fsSL -o scripts/patikra.sh https://raw.githubusercontent.com/dkoncius/Techin-DevOps/main/kursas/03%20Bash%20skriptai/starteris/2-patikra.sh
chmod +x scripts/patikra.sh
bash testai/tikrinti.sh 2
```

- Turi būti: `bash testai/tikrinti.sh 2` rodo ❌ (šablonas dar tuščias)

**3.** Užpildykite visus `TODO` faile `scripts/patikra.sh`:

- Masyvas įrankių (argumentai arba `git`, `python3`, `curl`), skaitiklis trūkstamiems, ciklas, klaidų kanale `Trūksta: SKAIČIUS` ir kodas 1
- Turi būti: `bash testai/tikrinti.sh 2` rodo `Viskas gerai`

**4.** Paleiskite ranka ir po kiekvieno parodykite išėjimo kodą:

- Be argumentų: trys `OK` (`git`, `python3`, `curl`), kodas 0
- Su `git neegzistuoja kitas`: dvi `TRŪKSTA`, klaidų kanale `Trūksta: 2`, kodas 1

**5.** **Pateikimas:** terminalo nuotrauka su abiem paleidimais, kodais ir `Viskas gerai`.

Jei užstrigote, pasižiūrėkite `bash komandos.md`.
