# 2 užduotis: Ciklas per įrankius

1. **Tikslas:** išplėsti tą patį `scripts/patikra.sh`, kad jis patikrintų įrankių sąrašą ir suskaičiuotų, kiek trūksta.
2. Perrašykite `nano scripts/patikra.sh` šiuo turiniu:

```bash
#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -gt 0 ]; then
  irankiai=("$@")
else
  irankiai=(git python3 curl)
fi

truksta=0

for irankis in "${irankiai[@]}"; do
  if command -v "$irankis" >/dev/null 2>&1; then
    echo "OK      $irankis"
  else
    echo "TRŪKSTA $irankis"
    truksta=$((truksta + 1))
  fi
done

if [ "$truksta" -gt 0 ]; then
  echo "Trūksta: $truksta" >&2
  exit 1
fi
```

3. Be argumentų: `./scripts/patikra.sh; echo "kodas: $?"`. Trys eilutės `OK` (`git`, `python3`, `curl`), kodas 0.
4. Su trūkstamais: `./scripts/patikra.sh git neegzistuoja kitas; echo "kodas: $?"`. Dvi `TRŪKSTA`, klaidų kanale `Trūksta: 2`, kodas 1.
5. Tik su `git`: `./scripts/patikra.sh git; echo "kodas: $?"`. Viena `OK`, kodas 0.
6. Gale `docs/bash.md` pridėkite sakinį: be argumentų kodas 0, su `git neegzistuoja kitas` kodas 1, tik su `git` kodas 0.
7. Commit: `git add scripts docs`, `git commit -m "Skriptas tikrina įrankių sąrašą"`.
8. **Pateikimas:** terminalo nuotrauka su trimis kodais 0, 1 ir 0.

Jei užstrigote, pasižiūrėkite `bash komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
