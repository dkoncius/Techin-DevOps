# 1 užduotis: Argumentas ir sąlyga

1. **Tikslas:** parašyti skriptą, kuris tikrina vieną įrankį pagal argumentą ir grąžina išėjimo kodą.
2. Atnaujinkite ir sukurkite šaką: `cd ~/Desktop/devops/git-bandymas`, `git switch main`, `git pull`, `git switch -c pamoka-04`.
3. Atidarykite `nano scripts/patikra.sh` (`mkdir -p scripts`) ir įrašykite:

```bash
#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Naudojimas: ./scripts/patikra.sh įrankis" >&2
  exit 2
fi

if command -v "$1" >/dev/null 2>&1; then
  echo "OK      $1"
else
  echo "TRŪKSTA $1"
  exit 1
fi
```

`chmod +x scripts/patikra.sh`.
4. Su `git`: `./scripts/patikra.sh git; echo "kodas: $?"`. Išvestis `OK      git`, kodas 0. `echo $?` rašykite iškart, ne po kitos komandos.
5. Su neegzistuojančiu: `./scripts/patikra.sh neegzistuoja; echo "kodas: $?"`. `TRŪKSTA neegzistuoja`, kodas 1.
6. Be argumento: `./scripts/patikra.sh; echo "kodas: $?"`. Žinutė klaidų kanale, kodas 2.
7. Užrašykite `nano docs/bash.md` (`mkdir -p docs`):

```markdown
# Bash skriptai

## Išėjimo kodai

`./scripts/patikra.sh git` baigėsi kodu 0, `neegzistuoja` kodu 1, be argumento kodu 2.
```

8. Commit: `git add scripts docs`, `git commit -m "Pridėtas patikra.sh"`.
9. **Pateikimas:** terminalo nuotrauka su trimis paleidimais ir kodais 0, 1 ir 2.

Jei užstrigote, pasižiūrėkite `bash komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
