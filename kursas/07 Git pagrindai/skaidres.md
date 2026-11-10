=== titulinė | Git pagrindai
07 pamoka · 1 etapas
- Peržiūrėti pakeitimus prieš commit ir rašyti aiškius commit'us
- Laikinai padėti darbą (`stash`) ir saugiai atšaukti (`revert`)
- Išspręsti konfliktą po `git pull`
Pastaba: ~10 min pasitikrinimas po 06. Parodykite `git log --oneline --graph` su konflikto sujungimu.

=== pagalvokime
Du žmonės tą pačią minutę pakeičia tą pačią failo eilutę.
# Kieno pakeitimas laimi?
> Kaip du redaktoriai, taisantys tą patį sakinį: be susitarimo vienas ištrintų kito darbą.
Pastaba: ~3 min. Jie jau matė konfliktą 06 pamokoje; šiandien tikra situacija su dviem kopijomis.

=== tekstas | Geras commit'as
| Blogai | Gerai |
|---|---|
| „pakeitimai“ | ?„Pridėta README paleidimo skiltis“ |
| Visas darbas viename commit | ?Viena mintis, vienas commit |
| „fix“ | ?„Pataisytas /health atsakymo kodas“ |
Pastaba: ~8 min. Parodykite `git diff`, `git diff --staged`, `git show`.

=== komanda | Pakeitimų peržiūra
```bash
git diff
git add docs/git.md
git diff --staged
git commit -m "Papildytas docs/git.md"
```
+ `git diff` dar nepridėta, `git diff --staged` jau pridėta
+ `git add -p` pridedama dalimis
Pastaba: ~10 min. Kitas pavyzdys: `a.txt`, `b.txt`. Dažna klaida: `git diff` tuščias, nes jau `add`.

=== tekstas | Laikinas darbas ir atšaukimas
| Situacija | Komanda |
|---|---|
| Nebaigtas darbas, reikia kitos šakos | ?`git stash`, vėliau `git stash pop` |
| Atšaukti commit'ą palikus istoriją | ?`git revert HEAD` |
| Ištrinti pakeitimus (tik vietinį darbą) | ?`git reset --hard` |
Pastaba: ~15 min. `revert` sukuria naują commit'ą; `reset --hard` perrašo istoriją, todėl pavojingas.

=== schema | Konfliktas po pull
```excalidraw
file: konfliktas-po-pull
box github | GitHub main | 1.2,0 | gray
box a | Kopija A\npakeitė eilutę ir nusiuntė | 0,1.2 | blue | 1.1,1
box b | Kopija B\npakeitė tą pačią eilutę | 2.4,1.2 | pink | 1.1,1
arrow a -> github | push
arrow github -> b | pull: konfliktas
```
Pastaba: ~5 min. B turi išspręsti konfliktą ranka, tada `git add`, `git commit`, `git push`.

=== komanda | Konflikto sprendimas
```bash
git pull
git status
```
```bash+
# redaktoriuje paliekate vieną tekstą, tada:
git add docs/git.md
git commit
git push
```
- `git fetch` tik atsisiunčia, `git pull` = `fetch` + `merge`
- `git config --global pull.rebase false`: kad `pull` neklausinėtų
Pastaba: ~20 min. Antra kopija `demo-kopija`. Dažna klaida: Git klausia „divergent branches“ (nenustatyta `pull.rebase false`); `git commit` be `add`.

=== klaida | Dažnos klaidos
:: | „divergent branches“ | `git config --global pull.rebase false`
:: | `stash` nepaima naujo failo | Naudokite `git stash -u`
:: | `revert` atidaro redaktorių | Išeikite `:wq` arba `--no-edit`
:: | Žymekliai paliko faile | Pašalinkite visus tris prieš `git add`
Pastaba: ~3 min.

=== uzduotys | Užduotys
@uzduotys: auto
Pastaba: Skelbkite po vieną. 3 užduotyje antra kopija `devops-projektas-kopija` turi būti ištrinta pabaigoje.

=== kita | Kita pamoka
GitHub Pull Request: aprašas, review, branch apsauga
