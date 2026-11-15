# 3 užduotis: Branch apsauga

1. **Tikslas:** apsaugoti `main` ir patikrinti, kad tiesioginis `git push` atmetamas.
2. GitHub'e: `devops-projektas` → Settings → Branches → Add branch protection rule (arba Rules → Rulesets). Branch name pattern: `main`. Pažymėkite **Require a pull request before merging**. Jei esate poroje, pažymėkite ir **Require approvals** (1). Išsaugokite. Repozitorija turi būti Public, kitaip nemokamame plane taisyklė gali neveikti.
3. Atnaujinkite: `cd ~/devops/devops-projektas`, `git switch main`, `git pull`. Pridėkite `README.md` gale eilutę `Bandymas tiesiai į main.` `git add README.md`, `git commit -m "Bandymas be PR"`, `git push`. GitHub atmeta. Užsirašykite klaidos eilutę.
4. Atšaukite vietinį commit'ą, failą grąžinkite: `git reset --soft HEAD~1`, `git restore .`. `git status` švarus, `git log --oneline` to commit'o nebėra. `git reset --hard` nenaudokite.
5. Tą patį pakeitimą per šaką: `git switch -c apsauga-patikra`. Pridėkite `README.md` eilutę `main keičiamas tik per PR.` `git add README.md`, `git commit -m "README: main tik per PR"`, `git push -u origin apsauga-patikra`. Atidarykite PR, suliekite, tada `git switch main`, `git pull`, `git branch -d apsauga-patikra`, `git push origin --delete apsauga-patikra`.
6. Į `docs/review.md` skyrių „Branch apsauga“ įrašykite atmesto `git push` eilutę ir sakinį: `main` verta apsaugoti, nes jame yra tai, kas paleidžiama; neperžiūrėtas pakeitimas gali sugadinti visiems.
7. Commit per naują šaką (tiesiai į `main` jau negalima): `git switch -c review-uzrasai`, `git add docs/review.md`, `git commit -m "Užrašyta peržiūra ir branch apsauga"`, `git push -u origin review-uzrasai`. PR, suliekite, `git switch main`, `git pull`.
8. **Papildomai:** `gh pr list --state all`. Sąraše matosi ir atviri, ir sulieti PR.
9. **Pateikimas:** atmesto `git push` į `main` nuotrauka ir sulietas PR, kuris tą patį pakeitimą įdėjo.

Jei užstrigote, pasižiūrėkite `github komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
