# 3 užduotis: Projekto failų patikra

**1.** **Tikslas:** pridėti tam pačiam skriptui projekto failų ir aplanko patikrą.

**2.** Pasiruošimas:

- Tęskite savo `scripts/patikra.sh` iš 2 užduoties
- Jei 2 užduotis nepavyko, atsisiųskite 3 šabloną (jame ciklas per įrankius jau parašytas):

```bash
cd ~/Desktop/devops/pamoka-03
cp scripts/patikra.sh scripts/patikra-2.sh
curl -fsSL -o scripts/patikra.sh https://raw.githubusercontent.com/dkoncius/Techin-DevOps/main/kursas/03%20Bash%20skriptai/starteris/3-patikra.sh
chmod +x scripts/patikra.sh
bash testai/tikrinti.sh 3
```

- Turi būti: `bash testai/tikrinti.sh 3` rodo ❌, kol neužpildyti `TODO`

**3.** Užpildykite `TODO` faile `scripts/patikra.sh`:

- Masyvas su failais `uzrasai/serveriai.txt` ir `scripts/ataskaita.sh`, antras ciklas per failus (`-f`), patikra ar yra aplankas `docs` (`-d`); trūkstant kiekvieno padidinkite skaitiklį
- Turi būti: `bash testai/tikrinti.sh 3` rodo `Viskas gerai`

**4.** Paleiskite ranka ir po kiekvieno parodykite išėjimo kodą:

- Iš `pamoka-03` šaknies: visi `OK`, kodas 0
- Iš aplanko `docs`: failai `TRŪKSTA`, kodas 1 (skriptas ieško failų ten, kur paleistas)

**5.** **Pateikimas:** terminalo nuotrauka iš šaknies (kodas 0) ir iš `docs` (kodas 1).

Jei užstrigote, pasižiūrėkite `bash komandos.md`.
