# 1 užduotis: Commit'ai ir diff

1. **Tikslas:** peržiūrėti pakeitimus prieš commit ir padaryti du aiškius commit'us.
2. Atnaujinkite ir sukurkite šaką: `cd ~/devops/devops-projektas`, `git switch main`, `git pull`, `git switch -c pamoka-07`.
3. `nano docs/git.md` (sukurkite `docs`, jei nėra):

```markdown
# Git

## Diff

`git diff` rodo pakeitimus, kurie dar nepridėti. `git diff --staged` rodo jau pridėtus.
```

`README.md` gale pridėkite vieną eilutę: `Mano pastaba: mokausi peržiūrėti pakeitimus prieš commit.`
4. Prieš pridėjimą: `git diff`. Matosi abu failai. Pridėkite tik vieną: `git add docs/git.md`. `git diff` dabar tuščias tam failui. `git diff --staged` rodo `docs/git.md`. `git status` rodo `README.md` kaip nepridėtą.
5. Pirmas commit: `git commit -m "Užrašyta, ką rodo git diff"`. Antras: `git add README.md`, `git commit -m "README: viena eilutė apie peržiūrą prieš commit"`.
6. Paskutinis commit: `git show`. Matosi tik `README.md` pakeitimas.
7. **Pateikimas:** `git log --oneline` nuotrauka su dviem žinutėmis ir `git diff --staged` prieš pirmą commit.

Jei užstrigote, pasižiūrėkite [Git cheat sheet](https://git-scm.com/cheat-sheet).
