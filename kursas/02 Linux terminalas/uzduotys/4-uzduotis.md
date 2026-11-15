# 4 užduotis: Pull Request

1. **Tikslas:** pateikti šios pamokos darbą per Pull Request.
2. `cd ~/Desktop/devops/git-bandymas`. Patikrinkite, kad nėra slaptažodžio: `grep -rniE "password|token|secret" uzrasai scripts docs`. Tokios eilutės neturi būti.
3. Nusiųskite šaką: `git push -u origin pamoka-02`. `git status` seka `origin/pamoka-02`.
4. Sukurkite Pull Request iš `pamoka-02` į `main`. Pavadinimas „Terminalas“. Description: vienas sakinys. Tada **Merge pull request**. Terminale: `gh pr create --title "Terminalas" --body "Skriptas, aplinka ir tree."`, tada `gh pr merge --merge`.
5. Grįžkite ir ištrinkite šaką: `git switch main`, `git pull`, `git branch -d pamoka-02`, `git push origin --delete pamoka-02`. `git branch` rodo tik `main`.
6. **Pateikimas:** sulieto Pull Request nuotrauka.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
