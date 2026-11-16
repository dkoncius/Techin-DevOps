# Git komandos

Čia yra Git komandos, kurių reikia 03 užduotyse. Pavyzdžiuose naudojami kiti vardai nei užduotyse, todėl komandą reikia pritaikyti.

## Šakos
- `git switch main` → perjungti į `main`
- `git switch -c ŠAKA` → sukurti šaką ir ją pasirinkti
- `git branch` → rodo šakas, žvaigždutė prie dabartinės
- `git push -u origin ŠAKA` → nusiunčia šaką į GitHub
- `git branch -d ŠAKA` → ištrina šaką kompiuteryje
- `git push origin --delete ŠAKA` → ištrina šaką GitHub'e

## Atnaujinimas, pakeitimai, commit ir Pull Request
- `git pull` → atsisiųsti naujausius pakeitimus
- `git status --short` → trumpa būsena
- `echo "*.log" > .gitignore` → sukuria `.gitignore` su viena eilute
- `touch FAILAS` → sukuria tuščią failą
- `git check-ignore -v FAILAS` → kuri `.gitignore` eilutė ignoruoja failą
- `echo "# tekstas" >> FAILAS` → prideda eilutę failo gale
- `git restore FAILAS` → atšaukia pakeitimą faile (dar neįtrauktą)
- `git add FAILAS` → įtraukia į staging
- `git restore --staged FAILAS` → išima iš staging, failo nepaliečia
- `git add scripts docs` → įtraukia du aplankus
- `git commit -m "žinutė"` → išsaugo commit
- `git log --oneline` → commit sąrašas
- `gh pr create --title "Pavadinimas" --body "Aprašas"` → sukuria Pull Request
- `gh pr merge --merge` → sulieja Pull Request
