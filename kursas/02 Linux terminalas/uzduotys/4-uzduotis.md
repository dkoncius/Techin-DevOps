# 4 užduotis: Pull Request

1. **Tikslas:** pateikti šios pamokos darbą per Pull Request (PR), t. y. prašymą sulieti šaką `pamoka-02` į `main`.
2. Eiti į projektą ir patikrinti šaką:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
git status
```

- Turi būti: žvaigždutė prie `pamoka-02`
- Turi būti: `git status` rodo „nothing added to commit“ ir „Untracked files: ataskaita.txt“
- Rodo kitus pakeistus failus („Changes not staged“ ar „Changes to be committed“)? Pirmiausia užbaikite 1–3 užduotis

3. Peržiūrėti, kas keliaus į GitHub:

```bash
git log --oneline main..HEAD
git diff --stat main..HEAD
```

- Turi būti: `git log` rodo tris commit'us: `Sutvarkyti produktai.txt`, `Pridėtas ataskaita.sh`, `Aplinka ir paketas`
- Turi būti: `git diff --stat` rodo keturis failus: `uzrasai/produktai.txt`, `scripts/ataskaita.sh`, `scripts/aplinka.sh`, `docs/aplinka.txt`
- Sąraše nėra `slaptas.txt` ir `ataskaita.txt`

4. Patikrinti, ar failuose nėra slaptažodžių ar raktų:

```bash
grep -rniE "password|token|secret" uzrasai scripts docs
```

- Turi būti: tuščia išvestis
- Radote eilutę? Peržiūrėkite ją: į PR neturi patekti slaptažodžiai ar raktai

5. Nusiųsti šaką į GitHub:

```bash
git push -u origin pamoka-02
git status
```

- Turi būti: `git status` rodo „Your branch is up to date with 'origin/pamoka-02'“
- Klaida dėl prisijungimo? `gh auth status`, jei reikia, `gh auth login` (HTTPS)

6. Sukurti PR iš `pamoka-02` į `main`. Pasirinkite **vieną** būdą.

**Naršyklėje:**

- Atidarykite savo `git-bandymas` repozitoriją GitHub'e
- Spauskite **Compare & pull request** (arba Pull requests → New pull request)
- base: `main`, compare: `pamoka-02`
- Title: **Pamoka 02: nano, skriptai, aplinka**
- Description: „Sutvarkytas sąrašas, ataskaitos ir aplinkos skriptai.“
- **Create pull request**

**Terminale** (jei turite `gh`):

```bash
gh pr create --base main --title "Pamoka 02: nano, skriptai, aplinka" --body "Sutvarkytas sąrašas, ataskaitos ir aplinkos skriptai."
```

- Turi būti: `gh` atspausdina PR nuorodą. Atidarykite ją, skiltyje **Files changed** matote tuos pačius keturis failus kaip 3 žingsnyje

7. Sulieti (merge), kai peržiūrėjote pakeitimus.

**Naršyklėje:**

- Pasirinkite **Create a merge commit** (ne Squash, ne Rebase)
- **Merge pull request** → **Confirm merge**
- Mygtuko **Delete branch** dar nespauskite

**Terminale:**

```bash
gh pr merge --merge
```

- Jei `gh` klausia „Delete the branch locally and on GitHub?“, atsakykite **N**
- Turi būti: PR būsena **Merged** (violetinė)

8. Atnaujinti `main` ir ištrinti šaką kompiuteryje ir GitHub'e:

```bash
git switch main
git pull
git branch -d pamoka-02
git push origin --delete pamoka-02
git branch
git log --oneline
```

- Turi būti: `git branch` rodo tik `main`
- Turi būti: `git log` viršuje `Merge pull request #...`, po juo šios pamokos commit'ai
- `git push origin --delete` rašo „remote ref does not exist“? Šaka jau ištrinta, viskas gerai
- `git branch -d` rašo „not fully merged“? PR suliejote su Squash arba Rebase. Patikrinkite `ls scripts` ir trinkite su `git branch -D pamoka-02`

9. **Pateikimas:** Github repozitorijos nuoroda su išskleista branches dalimi po `git branch` ir terminalas po `git log --oneline`

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet). Pull Request: [About pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests).
