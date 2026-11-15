# 4 užduotis: Grafikas ir Pull Request

1. **Tikslas:** perskaityti istoriją ir pateikti darbą per Pull Request.
2. `cd ~/devops/devops-projektas`, `git log --oneline --graph --all`. Grafike matosi `Revert` ir sujungimo commit'as.
3. Patikra: `grep -rniE "password|token|secret" docs`. Neturi rasti slaptažodžio.
4. Pull Request iš `pamoka-07` į `main`, pavadinimas „Git pagrindai“. **Merge pull request**. Terminale: `gh pr create --title "Git pagrindai" --body "diff, revert ir konfliktas po pull."`, `gh pr merge --merge`.
5. Atnaujinkite ir ištrinkite šaką: `git switch main`, `git pull`, `git branch -d pamoka-07`, `git push origin --delete pamoka-07`. `git branch` rodo tik `main`.
6. **Papildomai:** [Learn Git Branching](https://learngitbranching.js.org/) skyriuje „Remote“ `git fetch` atsisiunčia, bet jūsų failų nekeičia. `git pull` yra `fetch` ir sujungimas.
7. **Pateikimas:** `git log --oneline --graph` nuotrauka ir sulietas Pull Request. GitHub'e liko tik `main`.

Jei užstrigote, pasižiūrėkite [Git cheat sheet](https://git-scm.com/cheat-sheet).
