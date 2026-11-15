# 1 užduotis: Issue ir geras PR

1. **Tikslas:** susieti Issue su Pull Request ir parašyti aiškų aprašą.
2. Sukurkite Issue. Terminale, projekto aplanke: `gh issue create --title "Papildyti README paleidimo skyriumi" --body "README trūksta, kaip aš paleidžiu projektą savo kompiuteryje. Reikia trumpo skyriaus su žingsniais."` Naršyklėje: Issues → New issue, tas pats pavadinimas. Užsirašykite numerį, pavyzdžiui `#3`.
3. Šaka: `cd ~/devops/devops-projektas`, `git switch main`, `git pull`, `git switch -c readme-paleidimas`.
4. `README.md` gale pridėkite:

```markdown
## Mano pastabos

- Projektą paleidžiu aplanke `~/devops/devops-projektas`.
- Komanda: `./run.sh`.
- Sustabdau lange, kuriame jis veikia: `Ctrl+C`.
```

5. Commit ir siuntimas: `git add README.md`, `git commit -m "README: kaip paleidžiu projektą"`, `git push -u origin readme-paleidimas`.
6. Pull Request, dar nesuliekite. Aprašo pabaigoje `Closes #3` (savo numeris). Terminale: `gh pr create --title "README paleidimo pastabos" --body "Pridėtas skyrius, kaip paleidžiu ir kaip sustabdau. Patikra: atidarykite README. Closes #3"`. Naršyklėje: Compare & pull request, tas pats tekstas.
7. **Pateikimas:** Pull Request nuotrauka su aprašu ir `Closes #N`. Mygtuko Merge dar nėra paspausto.

Jei užstrigote, pasižiūrėkite `github komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
