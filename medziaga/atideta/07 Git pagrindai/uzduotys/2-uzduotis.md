# 2 užduotis: stash ir revert

1. **Tikslas:** laikinai padėti pusiau padarytą darbą ir atšaukti pakeitimą nauju commit'u.
2. Papildykite `docs/git.md` eilute `Nebaigtas darbas.` Commit nedarykite. `git stash`. `git status` švarus. `git switch main`, tada `git switch pamoka-07`. `git stash pop`. Eilutė `Nebaigtas darbas.` vėl faile.
3. Blogas commit: ištrinkite visą `docs/git.md` turinį (`nano`, palikite tuščią). `git add docs/git.md`, `git commit -m "Blogas pakeitimas: ištrintas git.md"`.
4. Atšaukite nauju commit'u: `git revert --no-edit HEAD`. `git log --oneline` rodo ir `Blogas pakeitimas`, ir `Revert "Blogas pakeitimas"`. `docs/git.md` vėl turi seną tekstą.
5. Į `docs/git.md` skyrių „Revert“ įrašykite: `git revert` sukuria naują commit'ą, kuris atšaukia ankstesnį, todėl istorija lieka. `git reset --hard` istoriją pastumia atgal ir ištrina neįrašytus pakeitimus. Jį naudokite tik vietiniam darbui, kuris dar nenusiųstas.
6. Commit: `git add docs/git.md`, `git commit -m "Užrašyta, kuo revert skiriasi nuo reset"`.
7. **Pateikimas:** `git log --oneline` nuotrauka, kur matosi ir blogas, ir `Revert` commit'as.

Jei užstrigote, pasižiūrėkite [Git cheat sheet](https://git-scm.com/cheat-sheet).
