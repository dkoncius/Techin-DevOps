# 1 užduotis: Nano failų redagavimas

1. **Tikslas:** šakoje `pamoka-02` su `nano` faile rasti eilutę, ištrinti pasikartojančią, pataisyti klaidas ir pridėti simbolį.
2. **Atsidaryti aplankale terminalą:**

```bash
cd ~/Desktop/devops/git-bandymas
pwd
ls
```

- `pwd` baigiasi `git-bandymas`
- `ls` rodo `pastabos.txt` ir `idejos.txt`

3. Atnaujinti `main` ir sukurti šaką. Nukopijuokite:

```bash
git switch main
git pull
git switch -c pamoka-02
git branch
```

- Žvaigždutė prie `pamoka-02`

4. Sukurti aplanką ir atidaryti failą su `nano`:

```bash
mkdir -p uzrasai
cd uzrasai
nano produktai.txt
```

- Atsidaro langas, viršuje `produktai.txt`, apačioje klavišų meniu.
- Jei viršuje parašyta `UW PICO`, tai Pico: atšaukimo (undo) nėra, išsaugoti `Ctrl+O`, ne `Ctrl+S`.
- **Mac:** komandas terminale ir tekstą į `nano` įklijuokite **Cmd+V** (arba Edit → Paste). `**Ctrl+V` nano** — „kitas puslapis“, ne iškarpinė.
- **Ubuntu / WSL:** į terminalą dažniausiai **Ctrl+Shift+V**; į `nano` — taip pat arba dešinio klavišo Paste.
- **Mac patogumas:** failas trumpas — dažnai užtenka **rodyklių** ir **Backspace**. Įklijuoti visada **Cmd+V**; redagavimui `nano` apačioje — **Ctrl** (ne Cmd). Jei maišosi: pirmiausia išmokite **Cmd+V**, **Ctrl+K** (iškirpti eilutę), **Ctrl+O**, **Ctrl+X**; `Ctrl+W` / `Ctrl+E` galite vėliau, kai reikia ilgo failo.

5. Įklijuoti pradinį sąrašą (**Mac: Cmd+V**):

```
pienas 1.20
duona 0.90
Pienas 1.20
obuoliai 2
kava 3,50
duona 0.90
arbata
sultys 1.5 eur
```

- `Ctrl+U` įklijuoja tai, ką ką tik iškirpote su `Ctrl+K`. Tai ne atšaukimas.
- Sugadinote? `Ctrl+X`, **N**, vėl `nano produktai.txt` ir pradėkite nuo šio žingsnio.

6. **I**štrinti eilutę `Pienas 1.20`. Eilutė `pienas 1.20` lieka. (Mac: gali **rodyklėmis** nuslinkti iki `Pienas`, tada `Ctrl+K` — be `Ctrl+W`.)
   - Greičiau: `Ctrl+W`, `Pienas`, `Enter`
   - Paieška nekreipia dėmesio į didžiąsias raides, todėl gali sustoti ant `pienas` (1 eilutė). Tada dar kartą `Ctrl+W`, `Enter`, kol žymeklis bus ant `Pienas`.
   - `Ctrl+K` iškerpa visą eilutę
7. trinti antrą `duona 0.90`. Pirma lieka.
   - `Ctrl+Y` kelis kartus, kol žymeklis bus pirmoje eilutėje (`pienas`) `Ctrl+K iškirpti.`
   - `Ctrl+W`, `duona`, `Enter`, kartokite kol pasieksite pirma duona.
   - `Ctrl+W`, `Enter` (antra duona, po `kava`)
   - `Ctrl+K iškirpti.`
8. **P**ataisyti kainas. `Ctrl+W` randa eilutę, tada rodyklės, `Backspace` ir rašymas:
   - `obuoliai 2` → `obuoliai 2.00` (`Ctrl+E`, įrašykite `.00`)
   - `kava 3,50` → `kava 3.50` (kablelį pakeiskite tašku)
   - `arbata` → `arbata 2.40` (`Ctrl+E`, įrašykite  `2.40` su tarpu priekyje)
   - `sultys 1.5 eur` → `sultys 1.50` (`Ctrl+E`, `Backspace` ištrinkite  `eur` kartu su tarpu, įrašykite `0`)
9. **K**iekvienos eilutės gale nukopijuokite ir pridėkite  `€` (tarpas ir euro ženklas): `pienas`, `duona`, `obuoliai`, `kava`, `arbata`, `sultys`.
   - `Ctrl+W`, prekės pavadinimas, `Enter`, `Ctrl+E`, tarpas, `€`Taip pat, visada galima naudoti ir rodykles.
10. Išsaugoti, išeiti, patikrinti.
    - `Ctrl+O`, `Enter`, `Ctrl+X`

```bash
cat produktai.txt
```

```
pienas 1.20 €
duona 0.90 €
obuoliai 2.00 €
kava 3.50 €
arbata 2.40 €
sultys 1.50 €
sūris 4.10 €
```

12. **Išsaugom viską per Github terminale:**

```bash
cd ..
git add uzrasai/produktai.txt
git commit -m "Sutvarkyti produktai.txt"
git log --oneline
git push -u origin pamoka-02
git switch main
git merge pamoka-02
git push
git switch pamoka-02
```

**13.Pateikimas:** nuotrauka po `cat produktai.txt` ir `git log --oneline`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Nano klavišams: [Nano cheat sheet](https://linuxize.com/cheatsheet/nano/). Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).