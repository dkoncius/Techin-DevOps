# 1 užduotis: Githubs basics

**1.** **Tikslas:** sukurti aplanką su dviem failais ir nusiųsti juos į GitHub šaką `main`.

**2.** Atidaryti terminalą ir pereiti į `devops`:

- `cd ~/Desktop/devops`
- Jei aplankas kitur, naudokite savo kelią

**3.** Sukurti aplanką ir pereiti į jį:

- `mkdir git-bandymas`
- `cd git-bandymas`

**4.** Sukurti du failus:

- `echo "pirma pastaba" > pastabos.txt`
- `echo "pirma idėja" > idejos.txt`

**5.** Patikrinti failus:

- `ls`
- `cat pastabos.txt idejos.txt`
- Turi būti: sąraše abu failai, kiekviename po vieną eilutę

**6.** Sukurti Git repozitoriją ir šaką `main`:

- `git init`
- `git branch -m main`

**7.** Pažiūrėti būseną:

- `git status`
- Turi būti: abu failai dar neįtraukti

**8.** Pridėti visus failus ir patikrinti:

- `git add .`
- `git status`
- Turi būti: abu failai paruošti commit

**9.** Išsaugoti ir pažiūrėti istoriją:

- `git commit -m "Du failai"`
- `git log --oneline`
- Turi būti: viena eilutė „Du failai“

**10.** Patikrinti prisijungimą prie GitHub:

- `gh auth status`
- Jei neprisijungta: `gh auth login`, pasirinkite HTTPS

**11.** Sukurti GitHub repozitoriją ir nusiųsti `main`:

- `gh repo create` (be vardo ir be vėliavų)
- **What would you like to do?** Push an existing local repository to github.com
- **Path to local repository:** `.`
- **Repository name:** `git-bandymas`
- **Repository owner:** jūsų paskyra
- **Description:** tuščia (`Enter`)
- **Visibility:** Public
- **Add a remote?** Yes
- **What should the new remote be called?** `origin`
- **Would you like to push commits from the current branch to "origin"?** Yes
- Turi būti: Created repository, Added remote, Pushed commits, `main` seka `origin/main`

**12.** Patikrinti:

- `git remote -v`
- `git status`
- Turi būti: `git remote -v` rodo dvi eilutes (fetch ir push), `git status` rašo „up to date with 'origin/main'“, GitHub'e yra `pastabos.txt` ir `idejos.txt`

**13.** **Pateikimas:** GitHub sukurtos repozitorijos nuotrauka.

Jei užstrigote, pasižiūrėkite [Git cheat sheet](https://git-scm.com/cheat-sheet).
