# 4 užduotis: Projekto failų patikra

**1.** **Tikslas:** pačiam pridėti tam pačiam skriptui projekto failų patikrą.

**2.** Atidarykite `scripts/patikra.sh` nano ir papildykite skriptą (esamo turinio netrinti):

- Prieš skaitiklio eilutę sukurkite sąrašą failų: `uzrasai/serveriai.txt` ir `scripts/ataskaita.sh`
- Po ciklo per įrankius pridėkite antrą ciklą per failus: jei failas yra, parašykite `OK` ir failą, jei ne, `TRŪKSTA` ir failą, ir padidinkite skaitiklį
- Dar viena sąlyga aplankui `docs`: jei yra, parašykite `OK      docs/`, jei ne, `TRŪKSTA docs/` ir padidinkite skaitiklį
- Antras ciklas kartoja pirmojo principą, tik tikrina failą, ne įrankį
- Sintaksė: `bash komandos.md`
- Išsaugokite failą

**3.** Paleisti iš projekto šaknies ir parodyti išėjimo kodą:

- Turi būti: visi `OK`, kodas 0

**4.** Paleisti iš aplanko `docs` ir parodyti išėjimo kodą:

- Turi būti: failai `TRŪKSTA`, kodas 1. Skriptas ieško failų tame aplanke, kuriame paleistas

**5.** Išsaugoti išvestį į failą:

- Skripto išvestį nukreipkite į `docs/patikra.txt` ir parodykite to failo turinį
- Turi būti: matosi `OK` eilutės

**6.** Išsaugoti Git'e:

- Įtraukite `scripts` ir `docs` į commit su žinute `Patikra tikrina projekto failus`
- Turi būti: `git log --oneline` viršuje `Patikra tikrina projekto failus`

**7.** **Pateikimas:** terminalo nuotrauka iš šaknies (kodas 0) ir iš `docs` (kodas 1).

Jei užstrigote, pasižiūrėkite `bash komandos.md` ir `git komandos.md`. Daugiau Git komandų: [Git cheat sheet](https://git-scm.com/cheat-sheet).
