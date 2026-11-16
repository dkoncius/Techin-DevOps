# 1 užduotis: Nano failų redagavimas

1. **Tikslas:** šakoje `pamoka-02` su `nano` pataisyti sąrašą: ištrinti pasikartojančias eilutes, pataisyti kainas ir pridėti `€`.
2. Eiti į projektą:

```bash
cd ~/Desktop/devops/git-bandymas
pwd
ls
```

- Turi būti: `pwd` baigiasi `git-bandymas`, `ls` rodo `pastabos.txt` ir `idejos.txt`

3. Atnaujinti `main` ir sukurti šaką:

```bash
git switch main
git pull
git switch -c pamoka-02
git branch
```

- Turi būti: žvaigždutė prie `pamoka-02`

4. Sukurti aplanką ir atidaryti failą su `nano`:

```bash
mkdir -p uzrasai
cd uzrasai
nano produktai.txt
```

- Turi būti: atsidaro `nano`, viršuje `produktai.txt`, apačioje klavišų meniu

5. Įklijuoti sąrašą (**Mac: Cmd+V**, ne `Ctrl+V`; Ubuntu / WSL: `Ctrl+Shift+V`):

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

6. Sutvarkyti sąrašą, kad failas atrodytų taip:

```
pienas 1.20 €
duona 0.90 €
obuoliai 2.00 €
kava 3.50 €
arbata 2.40 €
sultys 1.50 €
```

- Redaguoti galite **rodyklėmis**, `Backspace` ir rašydami
- Arba `nano` komandomis: `Ctrl+W` randa tekstą (paskui `Enter`), `Ctrl+K` iškerpa eilutę, `Ctrl+E` nušoka į eilutės galą
- Jei viršuje `UW PICO`: atšaukimo nėra
- Sugadinote? `Ctrl+X`, **N**, vėl `nano produktai.txt` ir pradėkite nuo 5 žingsnio

7. Išsaugoti ir išeiti: `Ctrl+O`, `Enter`, `Ctrl+X`.
8. Patikrinti failą:

```bash
cat produktai.txt
```

- Turi būti: tas pats sąrašas kaip 6 žingsnyje

9. Išsaugoti pakeitimą Git'e ir nusiųsti į GitHub:

```bash
cd ..
git add uzrasai/produktai.txt
git commit -m "Sutvarkyti produktai.txt"
git log --oneline
git push -u origin pamoka-02
```

- Turi būti: `git log --oneline` viršuje `Sutvarkyti produktai.txt`
- `main` kol kas nekeičiamas: į jį šaką sulieksite 4 užduotyje per Pull Request

10. **Pateikimas:** nuotrauka po `cat produktai.txt` ir `git log --oneline`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Nano klavišams: [Nano cheat sheet](https://linuxize.com/cheatsheet/nano/). Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
