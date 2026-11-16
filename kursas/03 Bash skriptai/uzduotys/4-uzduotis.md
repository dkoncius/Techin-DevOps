# 4 užduotis: Ignoravimas ir Pull Request

**1.** **Tikslas:** patikrinti `.gitignore`, atšaukti pakeitimą be `git reset --hard` ir pateikti darbą per Pull Request.

**2.** Pasiruošti `git-bandymas` projektą (pagal 1–3 užduočių darbą `pamoka-03` aplanke):

- Eikite į `~/Desktop/devops/git-bandymas`, perjunkite į `main`, atsisiųskite pakeitimus ir sukurkite šaką `pamoka-03`
- Nukopijuokite savo `~/Desktop/devops/pamoka-03/scripts/patikra.sh` į `scripts/`, įtraukite ir išsaugokite su žinute `Pridėtas patikra.sh`
- Turi būti: `git log --oneline` viršuje `Pridėtas patikra.sh`, žvaigždutė prie `pamoka-03`

**3.** Sukurti ignoravimo failą:

- Projekte `git-bandymas` sukurkite `.gitignore` su viena eilute `*.log`
- Sukurkite tuščią failą `bandymas.log`
- Parodykite trumpą Git būseną
- Turi būti: rodo `.gitignore`, ne `bandymas.log`

**4.** Pažiūrėti, kuri eilutė ignoruoja:

- Paklauskite Git, kuri `.gitignore` eilutė ignoruoja `bandymas.log`
- Turi būti: išvestyje `.gitignore` eilutė `*.log`

**5.** Sugadinti skriptą ir atšaukti:

- Į `scripts/patikra.sh` gale pridėkite eilutę `# sugadinta` (be redaktoriaus, viena komanda)
- Parodykite Git būseną, atšaukite pakeitimą faile (ne `git reset --hard`) ir vėl parodykite būseną
- Turi būti: pirma būsena rodo pakeitimą, antra skripto neberodo

**6.** Įtraukti pakeitimą ir atšaukti jį du kartus:

- Į `scripts/patikra.sh` gale pridėkite eilutę `# pakeista` ir įtraukite failą į staging
- Išimkite failą iš staging, tada atšaukite pakeitimą faile
- Parodykite Git būseną
- Turi būti: švaru, skriptas kaip buvęs

**7.** Išsaugoti ignoravimo failą:

- Įtraukite `.gitignore` į commit su žinute `Ignoruojami .log failai`
- Turi būti: `git log --oneline` turi du jūsų commit'us

**8.** Nusiųsti šaką `pamoka-03` į GitHub (su `-u`).

**9.** Pull Request iš `pamoka-03` į `main`:

- Terminale sukurkite ir sulieskite Pull Request: pavadinimas `Bash skriptai`, aprašas vienas sakinys
- Arba naršyklėje: **Files changed** rodo `.gitignore` ir `scripts`, tada **Merge pull request**

**10.** Atnaujinti `main` ir ištrinti šaką:

- Perjunkite į `main` ir atsisiųskite pakeitimus
- Ištrinkite `pamoka-03` vietoje ir GitHub'e
- Turi būti: `git branch` rodo tik `main`

**11.** **Papildomai:** skriptas, skaičiuojantis failus ir aplankus. Sukurti `scripts/dydis.sh` nano, įklijuoti tekstą žemiau, leisti vykdyti ir paleisti su argumentu `uzrasai`. Turi būti: išvestyje du skaičiai

```bash
#!/usr/bin/env bash
set -euo pipefail
katalogas="${1:-.}"
echo "Failų: $(find "$katalogas" -maxdepth 1 -type f | wc -l | tr -d ' ')"
echo "Aplankų: $(find "$katalogas" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"
```

**12.** **Pateikimas:** sulieto Pull Request nuotrauka ir `git status --short`, kur nėra `bandymas.log`.

Jei užstrigote, pasižiūrėkite `bash komandos.md` ir `git komandos.md`. Daugiau Git komandų: [Git cheat sheet](https://git-scm.com/cheat-sheet).
