# 3 užduotis: Konfliktas po pull

1. **Tikslas:** susidurti su konfliktu, kai kita kopija pakeitė tą pačią eilutę, ir jį išspręsti.
2. Kad `git pull` sujungtų ir neklausinėtų: `git config --global pull.rebase false`.
3. Nusiųskite šaką: `git push -u origin pamoka-07`. Antra kopija šalia, ne vietoj projekto: `cd ~/devops`, `git clone git@github.com:<vartotojas>/devops-projektas.git devops-projektas-kopija`. Jei `origin` dar HTTPS, klonuokite tą HTTPS adresą. `cd devops-projektas-kopija`, `git switch pamoka-07`.
4. Kopijoje pakeiskite pirmą `docs/git.md` eilutę į `# Git (kopija)`. `git add docs/git.md`, `git commit -m "Kopija pakeitė pirmą eilutę"`, `git push`.
5. Originale: `cd ~/devops/devops-projektas`. Tą pačią eilutę pakeiskite į `# Git (originalas)`. `git add docs/git.md`, `git commit -m "Originalas pakeitė pirmą eilutę"`.
6. `git pull`. Git rašo `CONFLICT`. Faile yra `<<<<<<<`, `=======` ir `>>>>>>>`.
7. `nano docs/git.md`. Palikite vieną pirmą eilutę `# Git` ir ištrinkite visus žymeklius. `git add docs/git.md`, `git commit -m "Sujungtas konfliktas po pull"`, `git push`.
8. Ištrinkite tik kopiją: `cd ~/devops`, `rm -r devops-projektas-kopija`. `ls ~/devops` neberodo `devops-projektas-kopija`. Projekto `devops-projektas` nelieskite.
9. **Pateikimas:** konflikto failo nuotrauka su žymekliais ir `git status` po sujungimo, kai žymeklių nebėra.

Jei užstrigote, pasižiūrėkite [Git cheat sheet](https://git-scm.com/cheat-sheet).
