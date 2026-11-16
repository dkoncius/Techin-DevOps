# 3 užduotis: Projekto failų patikra

**1.** **Tikslas:** pačiam pridėti tam pačiam skriptui projekto failų patikrą.

**2.** Atidaryti skriptą:

- `nano scripts/patikra.sh`

**3.** Papildyti skriptą (esamo turinio netrinti):

- Prieš `truksta=0` pridėti sąrašą failų: `failai=(uzrasai/serveriai.txt scripts/ataskaita.sh)`
- Po ciklo per įrankius pridėti antrą ciklą per `"${failai[@]}"`: jei `[ -f "$failas" ]`, parašyti `OK` ir failą, jei ne, `TRŪKSTA` ir failą, ir padidinti `truksta`
- Dar vienas `if` aplankui: jei `[ -d docs ]`, parašyti `OK      docs/`, jei ne, `TRŪKSTA docs/` ir padidinti `truksta`
- Užuominos: antras ciklas kartoja tą patį principą kaip pirmas, tik `[ -f ... ]` vietoje `command -v`. Žr. `bash komandos.md`
- Išsaugoti: `Ctrl+O`, `Enter`, `Ctrl+X`

**4.** Paleisti iš projekto šaknies:

- `cd ~/Desktop/devops/git-bandymas`
- `./scripts/patikra.sh; echo "kodas: $?"`
- Turi būti: visi `OK`, kodas 0

**5.** Paleisti iš `docs`:

- `(cd docs && ../scripts/patikra.sh; echo "kodas: $?")`
- Turi būti: failai `TRŪKSTA`, kodas 1. Skriptas ieško failų tame aplanke, kuriame paleistas

**6.** Išsaugoti išvestį į failą:

- `./scripts/patikra.sh > docs/patikra.txt`
- `cat docs/patikra.txt`
- Turi būti: `cat` rodo `OK` eilutes

**7.** Išsaugoti Git'e:

- `git add scripts docs`
- `git commit -m "Patikra tikrina projekto failus"`
- Turi būti: `git log --oneline` viršuje `Patikra tikrina projekto failus`

**8.** **Pateikimas:** terminalo nuotrauka iš šaknies (kodas 0) ir iš `docs` (kodas 1).

Jei užstrigote, pasižiūrėkite `bash komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
