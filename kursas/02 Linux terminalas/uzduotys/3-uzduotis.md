# 3 užduotis: Srautai ir paieška

1. **Tikslas:** užpildyti pastabas, sujungti komandas per srautus ir išsaugoti paieškos rezultatus.
2. Eikite į užrašus, jei dar ne ten: `cd ~/Desktop/devops/git-bandymas/uzrasai`. Į `komandos.txt` įrašykite po vieną eilutę:
   - `echo ls > komandos.txt`
   - `echo cd >> komandos.txt`
   - `echo cp >> komandos.txt`
   - `echo mv >> komandos.txt`
   - `echo pwd >> komandos.txt`
   `cat komandos.txt` rodo penkias eilutes ta tvarka. Pirma eilutė naudoja `>`, kitos `>>`.
3. Surūšiuokite ekrane: `sort komandos.txt`. Įrašykite į naują failą: `sort komandos.txt > komandos-abeceles.txt`. `cat komandos-abeceles.txt` rodo tas pačias eilutes abėcėlės tvarka.
4. Pridėkite eilutę neperrašydami senų: `echo grep >> komandos.txt`. `cat komandos.txt` gale turi `grep`.
5. Suskaičiuokite: `wc -l komandos.txt`. Rodo 6.
6. Pirmos dvi eilutės: `head -n 2 komandos.txt`. Paskutinės dvi: `tail -n 2 komandos.txt`.
7. Vamzdis: `cat komandos.txt | grep p`. Lieka eilutės su raide `p`: `cp`, `pwd`, `grep`.
8. Perrašykite `terminalas.txt`: `echo "Terminalas yra programa, kurioje komandas rašome tekstu." > terminalas.txt`. `cat terminalas.txt` rodo vieną eilutę.
9. Grįžkite į aplanko šaknį: `cd ~/Desktop/devops/git-bandymas`. Suraskite žodį `Terminalas`: `grep -rn "Terminalas" . --exclude-dir=.git`. Sąraše yra `uzrasai.md`, `.git` nėra.
10. Tą patį rezultatą be aplanko `uzrasai` įrašykite: `grep -rn "Terminalas" . --exclude-dir=.git --exclude-dir=uzrasai > paieska.txt`. `cat paieska.txt` nerodo kelių iš `uzrasai/`.
11. Visų `.md` sąrašas be `.git`: `find . -name "*.md" -not -path "./.git/*" > failai.txt`. `cat failai.txt` turi `./uzrasai.md` ir neturi `.git`.
12. Išsaugokite ta pačia eiga kaip 1 užduotyje. Žinutė: „Pridėtos pastabos ir paieškos rezultatai“. Istorijos viršuje turi būti ta žinutė. Komandas rasite Git cheat sheet.
13. **Pateikimas:** terminalo nuotrauka, kur matosi `grep` rezultatas su `Terminalas`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
