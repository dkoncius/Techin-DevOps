# 4 užduotis: Pull Request

1. **Tikslas:** pateikti šios pamokos darbą per Pull Request. Programos `app.py` dar nėra.
2. Patikrinkite savo skriptą: `cd ~/Desktop/devops/git-bandymas`, `grep -n "PROJEKTO_VARDAS" scripts/aplinka.sh`. Eilutėje yra numatytoji reikšmė `nenustatyta`.
3. Patikra: `grep -rniE "password|token|secret" docs scripts`. Neturi rasti slaptažodžio ar rakto.
4. Commit: `git add docs scripts`, `git commit -m "Pridėti procesų užrašai"`. `git log --oneline` viršuje ta žinutė.
5. Nusiųskite: `git push -u origin pamoka-03`. `git status` seka `origin/pamoka-03`.
6. GitHub'e Pull Request iš `pamoka-03` į `main`. Pavadinimas „Procesai ir paketai“, Description vienas sakinys. **Files changed** rodo `docs` ir `scripts`. **Merge pull request**. Terminale: `gh pr create --title "Procesai ir paketai" --body "Procesai, aplinkos kintamasis ir paketas tree."`, tada `gh pr merge --merge`.
7. Atnaujinkite ir ištrinkite šaką: `git switch main`, `git pull`, `git branch -d pamoka-03`, `git push origin --delete pamoka-03`. `git branch` rodo tik `main`.
8. **Papildomai:** `kill PID` prašo procesą baigti. `kill -9 PID` nutraukia iš karto. Antrą naudokite tik kai procesas nebereaguoja į pirmą.
9. **Pateikimas:** sulieto Pull Request nuotrauka ir GitHub nuotrauka, kur liko tik `main`.

Jei užstrigote, pasižiūrėkite `procesai komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
