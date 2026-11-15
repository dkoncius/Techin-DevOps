# 2 užduotis: HTTP kodai ir skriptas

1. **Tikslas:** gauti skirtingus HTTP kodus ir parašyti skriptą, kuris juos tikrina.
2. Tik kodas: `curl -s -o /dev/null -w "%{http_code}\n" localhost:5001/`. Išvestis `200`. Tas pats keliui `/nera`: `404`.
3. Atidarykite `nano scripts/http-kodas.sh` ir įrašykite:

```bash
#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Naudojimas: $0 <url>" >&2
  exit 2
fi

kodas=$(curl -s -o /dev/null -w "%{http_code}" "$1" || true)
echo "$kodas"

if [ "$kodas" = "200" ]; then
  exit 0
fi
exit 1
```

`chmod +x scripts/http-kodas.sh`.
4. Kol serveris veikia: `./scripts/http-kodas.sh http://localhost:5001/; echo "kodas: $?"` rodo `200` ir `0`. Su `/nera` rodo `404` ir `1`.
5. Sustabdykite serverį tame lange (`Ctrl+C`) ir paleiskite skriptą dar kartą. `curl` išveda `000` (niekas neklauso), skripto kodas `1`.
6. Papildykite `docs/tinklai.md` skyriumi „Kodai“: `/` → 200, `/nera` → 404, sustabdytas serveris → `000`.
7. Commit: `git add scripts docs`, `git commit -m "HTTP kodai ir http-kodas.sh"`.
8. **Pateikimas:** terminalo nuotrauka su kodais 200, 404 ir `000`.

Jei užstrigote, pasižiūrėkite `tinklai komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
