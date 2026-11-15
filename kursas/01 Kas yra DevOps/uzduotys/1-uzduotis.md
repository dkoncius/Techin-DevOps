# 1 užduotis: Įkelkite į main per GitHub

1. **Tikslas:** sukurti aplanką su dviem failais ir nusiųsti juos į GitHub šaką `main`.
2. Atidarykite terminalą ir pereikite į `devops`: `cd ~/Desktop/devops`. Jei aplankas kitur, naudokite savo kelią.
3. Sukurkite aplanką ir pereikite į jį: `mkdir git-bandymas`, tada `cd git-bandymas`.
4. Sukurkite du failus: `echo "pirma pastaba" > pastabos.txt` ir `echo "pirma idėja" > idejos.txt`.
5. Patikrinkite: `ls` ir `cat pastabos.txt idejos.txt`. Sąraše abu failai, kiekviename po vieną eilutę.
6. Sukurkite Git repozitoriją ir šaką `main`: `git init`, tada `git branch -m main`.
7. Pažiūrėkite būseną: `git status`. Abu failai dar neįtraukti.
8. Pridėkite visus failus ir aplankus šiame aplanke ir patikrinkite: `git add .`, tada `git status`. Abu paruošti commit.
9. Išsaugokite: `git commit -m "Du failai"`. Istorija: `git log --oneline`, viena eilutė „Du failai“.
10. Prisijunkite prie GitHub, jei dar nesate: `gh auth status`. Jei ne, `gh auth login` ir pasirinkite HTTPS.
11. Sukurkite GitHub repozitoriją ir nusiųskite `main`: `gh repo create` (be vardo ir be vėliavų). Rinkitės:
    - **What would you like to do?** Push an existing local repository to github.com
    - **Path to local repository:** `.`
    - **Repository name:** `git-bandymas`
    - **Repository owner:** jūsų paskyra
    - **Description:** tuščia (`Enter`)
    - **Visibility:** Public
    - **Add a remote?** Yes
    - **What should the new remote be called?** `origin`
    - **Would you like to push commits from the current branch to "origin"?** Yes
    - Terminale: Created repository, Added remote, Pushed commits, `main` seka `origin/main`.
12. Patikrinkite: `git remote -v`. Dvi eilutės, fetch ir push. `git status` rašo „up to date with 'origin/main'“. GitHub'e yra `pastabos.txt` ir `idejos.txt`.
13. **Pateikimas:** Github sukurtos repozitorijos nuotrauka.

Jei užstrigote, pasižiūrėkite [Git cheat sheet](https://git-scm.com/cheat-sheet).
