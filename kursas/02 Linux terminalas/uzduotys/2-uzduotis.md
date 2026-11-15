# 2 užduotis: Navigacija ir failai

1. **Tikslas:** judėti po `git-bandymas` ir sukurti užrašų aplankų struktūrą.
2. Eikite į tą patį aplanką ir pažiūrėkite, kur esate: `cd ~/Desktop/devops/git-bandymas`, `pwd`. Kelias baigiasi `git-bandymas`.
3. Pažiūrėkite turinį su paslėptais failais: `ls -la`. Sąraše yra `.git`.
4. Pereikite į `static` ir grįžkite santykiniu keliu: `cd static`, tada `cd ..`. `pwd` vėl projekto šaknis.
5. Išeikite absoliučiu keliu ir grįžkite: `cd ~/Desktop/devops`, tada `cd ~/Desktop/devops/git-bandymas`. `pwd` rodo `git-bandymas`.
6. Sukurkite grandinę, kurios dar nėra: `mkdir -p uzrasai/archyvas`.
7. Sukurkite tuščius failus: `cd uzrasai`, `touch terminalas.txt git.txt komandos.txt`. `ls` rodo `archyvas`, `terminalas.txt`, `git.txt`, `komandos.txt`.
8. Nukopijuokite du failus: `cp terminalas.txt git.txt archyvas`. `ls archyvas` rodo `terminalas.txt` ir `git.txt`.
9. Pervadinkite ir perkelkite atgal: `mv archyvas/git.txt archyvas/git-senas.txt`, tada `mv archyvas/git-senas.txt .`. `ls` rodo `git-senas.txt`, `ls archyvas` rodo tik `terminalas.txt`.
10. **Papildomai:** `man ls` (išeiti `q`) suraskite rikiavimą pagal dydį ir išbandykite: `ls -lS ~/Desktop/devops/git-bandymas`.
11. **Pateikimas:** terminalo nuotrauka po `ls -R uzrasai`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
