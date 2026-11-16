# 4 užduotis: Ignoravimas ir Pull Request

1. **Tikslas:** patikrinti `.gitignore`, atšaukti pakeitimą be `git reset --hard` ir pateikti darbą per Pull Request.
2. Sukurkite ignoravimo failą: `cd ~/Desktop/devops/git-bandymas`, `echo "*.log" > .gitignore`, `touch bandymas.log`. `git status --short` rodo `.gitignore`, ne `bandymas.log`.
3. Kuri eilutė ignoruoja: `git check-ignore -v bandymas.log`. Išvestyje yra `.gitignore` eilutė `*.log`.
4. Sugadinkite skriptą ir atšaukite: `echo "# sugadinta" >> scripts/patikra.sh`, `git status --short` rodo pakeitimą, `git restore scripts/patikra.sh`. `git status --short` skripto neberodo.
5. Įtraukite ir atšaukite staging: `echo "# pakeista" >> scripts/patikra.sh`, `git add scripts/patikra.sh`, `git restore --staged scripts/patikra.sh`, `git restore scripts/patikra.sh`. `git status --short` švarus, skriptas kaip buvęs.
6. Commit: `git add .gitignore`, `git commit -m "Ignoruojami .log failai"`. `git log --oneline` turi keturis jūsų commit'us.
7. Nusiųskite: `git push -u origin pamoka-03`.
8. Pull Request iš `pamoka-03` į `main`, pavadinimas „Bash skriptai“, vieno sakinio aprašas. **Files changed** rodo `.gitignore` ir `scripts`. **Merge pull request**. Terminale: `gh pr create --title "Bash skriptai" --body "Skriptas patikra.sh, ignoruojami .log."`, `gh pr merge --merge`.
9. Atnaujinkite ir ištrinkite šaką: `git switch main`, `git pull`, `git branch -d pamoka-03`, `git push origin --delete pamoka-03`. `git branch` rodo tik `main`.
10. **Papildomai:** `nano scripts/dydis.sh` su turiniu žemiau, `chmod +x scripts/dydis.sh`, `./scripts/dydis.sh uzrasai`. Išvestyje du skaičiai.

```bash
#!/usr/bin/env bash
set -euo pipefail
katalogas="${1:-.}"
echo "Failų: $(find "$katalogas" -maxdepth 1 -type f | wc -l | tr -d ' ')"
echo "Aplankų: $(find "$katalogas" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"
```

11. **Pateikimas:** sulieto Pull Request nuotrauka ir `git status --short`, kur nėra `bandymas.log`.

Jei užstrigote, pasižiūrėkite `bash komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
