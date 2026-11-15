# 4 užduotis: Merge konfliktas ir Pull Request

1. **Tikslas:** sąmoningai sukelti merge konfliktą, jį išspręsti ir pateikti darbą per Pull Request.
2. `docs/ssh.md` gale pridėkite eilutę `Raktų pora: nežinau.` Commit: `git add docs/ssh.md`, `git commit -m "Konfliktui: pradinė eilutė"`.
3. Šaka: `git switch -c pamoka-06-a`. Tą eilutę pakeiskite į `Raktų pora: du failai.` `git add docs/ssh.md`, `git commit -m "Konfliktui: du failai"`.
4. Grįžkite: `git switch pamoka-06`. Tą pačią eilutę pakeiskite į `Raktų pora: privatus ir viešas raktas.` `git add docs/ssh.md`, `git commit -m "Konfliktui: privatus ir viešas"`.
5. Sujunkite: `git merge pamoka-06-a`. Git rašo `CONFLICT`. `git status` rodo `docs/ssh.md` kaip neišspręstą.
6. Atidarykite `nano docs/ssh.md`. Palikite vieną eilutę: `Raktų pora: du failai, privatus ir viešas.` Ištrinkite `<<<<<<<`, `=======` ir `>>>>>>>`. `git add docs/ssh.md`, `git commit -m "Sujungtas konfliktas"`.
7. Patikra: `grep -n "PRIVATE KEY" docs scripts` nieko neranda. `git log --oneline --graph` rodo sujungimą.
8. Nusiųskite: `git push -u origin pamoka-06`. Pull Request į `main`, pavadinimas „SSH ir raktai“. **Merge pull request**. Terminale: `gh pr create --title "SSH ir raktai" --body "Raktas, teisės ir išspręstas konfliktas."`, `gh pr merge --merge`.
9. Atnaujinkite ir ištrinkite šakas: `git switch main`, `git pull`, `git branch -d pamoka-06`, `git branch -d pamoka-06-a`, `git push origin --delete pamoka-06`.
10. **Papildomai:** `git merge --abort` nutraukia nebaigtą sujungimą ir grąžina šaką į būseną prieš `git merge`. Naudokite, kai žymeklių dar nenorite taisyti.
11. **Pateikimas:** `git log --oneline --graph` nuotrauka su sujungimu ir sulietas Pull Request. Privataus rakto nuotraukoje nėra.

Jei užstrigote, pasižiūrėkite `ssh komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
