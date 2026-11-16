# 4 užduotis: Ignoravimas ir Pull Request

**1.** **Tikslas:** patikrinti `.gitignore`, atšaukti pakeitimą be `git reset --hard` ir pateikti darbą per Pull Request.

**2.** Sukurti ignoravimo failą:

- `cd ~/Desktop/devops/git-bandymas`
- `echo "*.log" > .gitignore`
- `touch bandymas.log`
- `git status --short`
- Turi būti: rodo `.gitignore`, ne `bandymas.log`

**3.** Pažiūrėti, kuri eilutė ignoruoja:

- `git check-ignore -v bandymas.log`
- Turi būti: išvestyje `.gitignore` eilutė `*.log`

**4.** Sugadinti skriptą ir atšaukti:

- `echo "# sugadinta" >> scripts/patikra.sh`
- `git status --short`
- `git restore scripts/patikra.sh`
- `git status --short`
- Turi būti: pirmas `git status --short` rodo pakeitimą, antras skripto neberodo

**5.** Įtraukti pakeitimą ir atšaukti jį du kartus:

- `echo "# pakeista" >> scripts/patikra.sh`
- `git add scripts/patikra.sh`
- `git restore --staged scripts/patikra.sh`
- `git restore scripts/patikra.sh`
- `git status --short`
- Turi būti: švaru, skriptas kaip buvęs

**6.** Išsaugoti ignoravimo failą:

- `git add .gitignore`
- `git commit -m "Ignoruojami .log failai"`
- `git log --oneline`
- Turi būti: `git log --oneline` turi keturis jūsų commit'us

**7.** Nusiųsti šaką:

- `git push -u origin pamoka-03`

**8.** Pull Request iš `pamoka-03` į `main`. Terminale:

- `gh pr create --title "Bash skriptai" --body "Skriptas patikra.sh, ignoruojami .log."`
- `gh pr merge --merge`
- Arba naršyklėje: pavadinimas „Bash skriptai“, vieno sakinio aprašas, **Files changed** rodo `.gitignore` ir `scripts`, tada **Merge pull request**

**9.** Atnaujinti `main` ir ištrinti šaką:

- `git switch main`
- `git pull`
- `git branch -d pamoka-03`
- `git push origin --delete pamoka-03`
- `git branch`
- Turi būti: `git branch` rodo tik `main`

**10.** **Papildomai:** skriptas, skaičiuojantis failus ir aplankus. Atidaryti `nano scripts/dydis.sh`, įklijuoti tekstą žemiau, tada:

- `chmod +x scripts/dydis.sh`
- `./scripts/dydis.sh uzrasai`
- Turi būti: išvestyje du skaičiai

```bash
#!/usr/bin/env bash
set -euo pipefail
katalogas="${1:-.}"
echo "Failų: $(find "$katalogas" -maxdepth 1 -type f | wc -l | tr -d ' ')"
echo "Aplankų: $(find "$katalogas" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"
```

**11.** **Pateikimas:** sulieto Pull Request nuotrauka ir `git status --short`, kur nėra `bandymas.log`.

Jei užstrigote, pasižiūrėkite `bash komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
