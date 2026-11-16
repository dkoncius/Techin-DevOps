# 2 užduotis, sprendimas (dėstytojui): HTTP kodai ir skriptas

Numeriai atitinka užduoties žingsnius. Demonstracijoje serveris `python3 -m http.server 8080`, kelias `/pamiršau`.

**3.** `scripts/http-kodas.sh`:

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

**5–6.** Laukiama: `/` → `200` ir kodas 0, `/nera` → `404` ir kodas 1, sustabdytas serveris → `000` ir kodas 1.

Dažnos klaidos: `|| true` pamirštas (su `set -e` skriptas sustoja be `000`), `$1` be kabučių, `=` su tarpais kaip `[ "$kodas"="200" ]`.
