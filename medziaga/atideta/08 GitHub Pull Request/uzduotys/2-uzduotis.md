# 2 užduotis: Peržiūra poroje

1. **Tikslas:** peržiūrėti kito žmogaus Pull Request ir atsakyti į savo.
2. GitHub'e: savo `devops-projektas` → Settings → Collaborators → Add people. Įveskite porininko vardą. Porininkas priima kvietimą iš el. pašto. Jūs priimate jo kvietimą.
3. Porininko repozitorijoje atidarykite jo Pull Request → Files changed. Prie vienos eilutės paspauskite `+` ir parašykite, ko trūksta (pavyzdžiui, kaip sustabdyti serverį). Tada Review changes → Request changes ir vienas bendras sakinys.
4. Savo šakoje atsakykite nauju commit'u: `git switch readme-paleidimas`, papildykite README pagal komentarą, `git add README.md`, `git commit -m "README: atsakyta į peržiūros komentarą"`, `git push`.
5. Porininkas atidaro jūsų PR ir paspaudžia Review changes → Approve. Jūs suliejate: **Merge pull request** arba `gh pr merge --merge`. Issue tampa Closed.
6. Užrašykite `nano docs/review.md`:

```markdown
# Review ir branch apsauga

## Review

Gavau komentarą prie README eilutės. Atsakiau nauju commit'u toje pačioje šakoje. Peržiūrėdamas kito PR tikrinau, ar aprašas sutampa su pakeitimu.
```

7. **Pateikimas:** nuotrauka su Request changes, Approve ir uždarytu Issue.

Jei užstrigote, pasižiūrėkite `github komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
