# 2 užduotis, sprendimas (dėstytojui): HTTP kodai ir skriptas

Numeriai atitinka užduoties žingsnius. Demonstracijoje serveris `python3 -m http.server 8080`, kelias `/pamiršau`.

**2.** Serveris viename lange, kodai kitame:

```bash
python3 -m http.server 5001
curl -s -o /dev/null -w "%{http_code}\n" localhost:5001/
curl -s -o /dev/null -w "%{http_code}\n" localhost:5001/nera
curl -s -o /dev/null -w "%{http_code}\n" localhost:5999
```

Laukiama: `200`, `404`, tada `000` (niekas neklauso, `curl` pats baigiasi klaida, todėl skripte reikia `|| true`).

**3.** Failas ir turinys:

```bash
nano scripts/http-kodas.sh
```

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

**4.** Teisė vykdyti:

```bash
chmod +x scripts/http-kodas.sh
```

**5.** Kol serveris veikia:

```bash
./scripts/http-kodas.sh http://localhost:5001/; echo "kodas: $?"
./scripts/http-kodas.sh http://localhost:5001/nera; echo "kodas: $?"
```

Laukiama: `200` ir `kodas: 0`, tada `404` ir `kodas: 1`.

**6.** Sustabdytas serveris (`Ctrl+C` jo lange):

```bash
./scripts/http-kodas.sh http://localhost:5001/; echo "kodas: $?"
```

Laukiama: `000` ir `kodas: 1`.

**7.** Užrašai:

```bash
nano docs/tinklai.md
```

Skyrius „Kodai“: `/` → 200, `/nera` → 404, sustabdytas serveris → `000`.

**8.** Git:

```bash
git add scripts docs
git commit -m "HTTP kodai ir http-kodas.sh"
git log --oneline
```

Laukiama: viršuje `HTTP kodai ir http-kodas.sh`.

Dažnos klaidos: `|| true` pamirštas (su `set -e` skriptas sustoja be `000`), `$1` be kabučių, `[ "$kodas"="200" ]` be tarpų aplink `=`.
