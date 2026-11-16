# 4 užduotis: Pull Request

1. **Tikslas:** pateikti šios pamokos darbą per Pull Request (PR), t. y. prašymą sulieti šaką `pamoka-02` į `main`.
2. Nueiti į projektą ir patikrinti šaką. Nukopijuokite:

```bash
cd ~/Desktop/devops/git-bandymas
git branch
git status
```

- Žvaigždutė prie `pamoka-02`
- `git status` rodo „nothing added to commit“ ir „Untracked files: ataskaita.txt“. Taip ir turi būti: `ataskaita.txt` su slaptu žodžiu sąmoningai nededamas į Git (2 užduotis).
- Jei `git status` rodo kitų pakeistų failų („Changes not staged“ ar „Changes to be committed“), pirmiausia užbaikite 1–3 užduotis.

3. Peržiūrėti, kas keliaus į GitHub.

```bash
git log --oneline main..HEAD
git diff --stat main..HEAD
```

- `git log` rodo tris šios pamokos commit'us: `Sutvarkytas produktai.txt`, `Pridėtas ataskaita.sh`, `Aplinka ir paketas`
- `git diff --stat` rodo keturis failus: `uzrasai/produktai.txt`, `scripts/ataskaita.sh`, `scripts/aplinka.sh`, `docs/aplinka.txt`
- Sąraše **nėra** `slaptas.txt` (jis už projekto ribų) ir `ataskaita.txt` (lieka tik kompiuteryje)

4. Patikrinti, ar failuose nėra aiškių slaptažodžių ar raktų.

```bash
grep -rniE "password|token|secret" uzrasai scripts docs
```

- Tuščia išvestis — gerai.
- Radote eilutę? Peržiūrėkite ją. Į PR neturi patekti slaptažodžiai ar raktai.

5. Nusiųsti šaką į GitHub. `-u` reikia tik pirmą kartą, vėliau užtenka `git push`.

```bash
git push -u origin pamoka-02
git status
```

- `git status` rodo „Your branch is up to date with 'origin/pamoka-02'“
- Klaida dėl prisijungimo? Patikrinkite `gh auth status`, jei reikia, `gh auth login` (pasirinkite HTTPS).

6. Sukurti PR iš `pamoka-02` į `main`. Pasirinkite **vieną** būdą.

**Naršyklėje:**

- Atidarykite savo `git-bandymas` repozitoriją GitHub'e
- Spauskite **Compare & pull request** (arba Pull requests → New pull request)
- base: `main`, compare: `pamoka-02`
- Title: **Pamoka 02: nano, skriptai, aplinka**
- Description: vienas sakinys, pvz., „Sutvarkytas sąrašas, ataskaitos ir aplinkos skriptai.“
- **Create pull request**

**Terminale** (jei turite `gh`):

```bash
gh pr create --base main --title "Pamoka 02: nano, skriptai, aplinka" --body "Sutvarkytas sąrašas, ataskaitos ir aplinkos skriptai."
```

- `gh` atspausdina PR nuorodą. Atidarykite ją ir skiltyje **Files changed** peržiūrėkite tuos pačius keturis failus kaip 3 žingsnyje.

7. Sulieti (merge), kai peržiūrėjote pakeitimus.

**Naršyklėje:**

- Prie mygtuko pasirinkite **Create a merge commit** (ne Squash, ne Rebase)
- **Merge pull request** → **Confirm merge**
- Mygtuko **Delete branch** dar nespauskite — šaką ištrinsite 8 žingsnyje

**Terminale:**

```bash
gh pr merge --merge
```

- Jei `gh` klausia „Delete the branch locally and on GitHub?“, atsakykite **N**.
- PR būsena tampa **Merged** (violetinė).

8. Atnaujinti vietinį `main` ir ištrinti šaką kompiuteryje ir GitHub'e.

```bash
git switch main
git pull
git branch -d pamoka-02
git push origin --delete pamoka-02
git branch
git log --oneline
```

- `git branch` rodo tik `main`
- `git log` viršuje `Merge pull request #...`, po juo šios pamokos commit'ai
- `git push origin --delete` rašo „remote ref does not exist“? Šaka GitHub'e jau ištrinta automatiškai — viskas gerai.
- `git branch -d` rašo „not fully merged“? PR suliejote su Squash arba Rebase. Patikrinkite, ar failai yra `main` (`ls scripts`), ir trinkite su `git branch -D pamoka-02`.

9. **Pateikimas:** Github repozitorijos nuoroda su išskleista branches dalimi po `git branch` ir terminalas po `git log --oneline`

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet). Pull Request: [About pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests).
