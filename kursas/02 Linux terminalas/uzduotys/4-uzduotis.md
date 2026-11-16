# 4 užduotis: Pull Request

**1.** **Tikslas:** pateikti šios pamokos darbą per Pull Request (PR), t. y. prašymą sulieti šaką `pamoka-02` į `main`.

**2.** Eiti į projektą ir patikrinti šaką:

- `cd ~/Desktop/devops/git-bandymas`
- `git branch`
- `git status`
- Turi būti: žvaigždutė prie `pamoka-02`
- Turi būti: `git status` rodo „nothing added to commit“ ir „Untracked files: ataskaita.txt“
- Rodo kitus pakeistus failus („Changes not staged“ ar „Changes to be committed“)? Pirmiausia užbaikite 1–3 užduotis

**3.** Peržiūrėti, kas keliaus į GitHub:

- `git log --oneline main..HEAD`
- `git diff --stat main..HEAD`
- Turi būti: `git log` rodo tris commit'us: `Sutvarkyti serveriai.txt`, `Pridėtas ataskaita.sh`, `Pridėtas projekto vardas`
- Turi būti: `git diff --stat` rodo du failus: `uzrasai/serveriai.txt`, `scripts/ataskaita.sh`
- Sąraše nėra `slaptas.txt` ir `ataskaita.txt`

**4.** Nusiųsti šaką į GitHub:

- `git push -u origin pamoka-02`
- `git status`
- Turi būti: `git status` rodo „Your branch is up to date with 'origin/pamoka-02'“
- Klaida dėl prisijungimo? `gh auth status`, jei reikia, `gh auth login` (HTTPS)

**5.** Sukurti PR iš `pamoka-02` į `main`. Pasirinkite **vieną** būdą. Terminale (jei turite `gh`):

- `gh pr create --base main --title "Pamoka 02: nano, skriptai, aplinka" --body "Sutvarkytas serveriai.txt, ataskaitos skriptas su kintamuoju."`
- Turi būti: `gh` atspausdina PR nuorodą. Atidarykite ją, skiltyje **Files changed** matote tuos pačius du failus kaip 3 žingsnyje

**6.** Arba naršyklėje:

- Atidarykite savo `git-bandymas` repozitoriją GitHub'e
- Spauskite **Compare & pull request** (arba Pull requests → New pull request)
- base: `main`, compare: `pamoka-02`
- Title: `Pamoka 02: nano, skriptai, aplinka`
- Description: `Sutvarkytas serveriai.txt, ataskaitos skriptas su kintamuoju.`
- **Create pull request**

**7.** Sulieti (merge), kai peržiūrėjote pakeitimus. Terminale:

- `gh pr merge --merge`
- Jei `gh` klausia „Delete the branch locally and on GitHub?“, atsakykite **N**
- Turi būti: PR būsena **Merged** (violetinė)

**8.** Arba naršyklėje sulieti:

- Pasirinkite **Create a merge commit** (ne Squash, ne Rebase)
- **Merge pull request**, tada **Confirm merge**
- Mygtuko **Delete branch** dar nespauskite

**9.** Atnaujinti `main` ir ištrinti šaką kompiuteryje ir GitHub'e:

- `git switch main`
- `git pull`
- `git branch -d pamoka-02`
- `git push origin --delete pamoka-02`
- `git branch`
- `git log --oneline`
- Turi būti: `git branch` rodo tik `main`
- Turi būti: `git log` viršuje `Merge pull request #...`, po juo šios pamokos commit'ai
- `git push origin --delete` rašo „remote ref does not exist“? Šaka jau ištrinta, viskas gerai
- `git branch -d` rašo „not fully merged“? PR suliejote su Squash arba Rebase. Patikrinkite `ls scripts` ir trinkite su `git branch -D pamoka-02`

**10.** **Pateikimas:** GitHub repozitorijos nuoroda su išskleista branches dalimi po `git branch` ir terminalas po `git log --oneline`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet). Pull Request: [About pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests).
