# 3 užduotis: .env nėra Git'e

1. **Tikslas:** patikrinti, kad slapti nustatymai neįkelti.
2. `cd ~/devops/devops-projektas`.
3. `git check-ignore -v .env` rodo `.gitignore` eilutę.
4. `git status --short` nerodo `.env`.
5. `git log --oneline` nerodo commit'o, kurio žinutėje būtų `.env` turinys.
6. **Pateikimas:** `git status --short` nuotrauka be `.env`.

Jei užstrigote, pasižiūrėkite 06 pamokos `paleidimas komandos.md`.
