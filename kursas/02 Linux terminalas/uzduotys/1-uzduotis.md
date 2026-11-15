# 1 užduotis: Failas ir šaka

1. **Tikslas:** tame pačiame `git-bandymas` sukurti `uzrasai.md` ir pradėti šaką `pamoka-02`.
2. Atidarykite terminalą ir eikite į aplanką: `cd ~/Desktop/devops/git-bandymas`. `pwd` baigiasi `git-bandymas`. `ls` rodo `pastabos.txt` ir `idejos.txt`.
3. Atnaujinkite `main` ir sukurkite šaką: `git switch main`, `git pull`, `git switch -c pamoka-02`. `git branch` rodo žvaigždutę prie `pamoka-02`.
4. Sukurkite aplanką: `mkdir -p uzrasai`. `ls` rodo `uzrasai`.
5. Atidarykite failą: `nano uzrasai.md`. Įrašykite `# Terminalas`. Išsaugokite `Ctrl+O`, `Enter`, išeikite `Ctrl+X`.
6. Raskite eilutę: `grep -n "Terminalas" uzrasai.md`. Išvestyje yra eilutės numeris ir `Terminalas`. Jeigu padarete klaida, galite išeiti su `ctrl+C`
7. Išsaugokite Git: `git add uzrasai.md`, `git status` rodo `uzrasai.md` paruoštą, `git commit -m "Pradėtas uzrasai.md"`. `git log --oneline` viršuje ta žinutė.
8. **Pateikimas:** terminalo nuotrauka po `git log --oneline.`

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
