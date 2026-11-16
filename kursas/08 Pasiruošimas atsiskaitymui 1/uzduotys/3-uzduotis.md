# 3 užduotis: .env nėra Git'e

**1.** **Tikslas:** patikrinti, kad slapti nustatymai neįkelti.

**2.** Eiti į projektą ir patikrinti:

- `cd ~/devops/devops-projektas`
- `git check-ignore -v .env`
- `git status --short`
- `git log --oneline`
- Turi būti: `git check-ignore -v` rodo `.gitignore` eilutę, `git status --short` nerodo `.env`, `git log --oneline` nerodo commit'o, kurio žinutėje būtų `.env` turinys

**3.** **Pateikimas:** `git status --short` nuotrauka be `.env`.

Jei užstrigote, pasižiūrėkite 05 pamokos `paleidimas komandos.md`.
