# 3 užduotis, sprendimas (dėstytojui): Portai ir serverių stebėsena

Numeriai atitinka užduoties žingsnius. Demonstracijoje serveriai 8080 ir 8081, vardai `demo1`, `demo2`.

**2–4.** Serveriai ir portai:

```bash
python3 -m http.server 5001
lsof -nP -i :5001
python3 -m http.server 5001
python3 -m http.server 5002
curl -s -o /dev/null -w "%{http_code}\n" localhost:5002/
```

Laukiama: `lsof` rodo `python` ir PID; antras `5001` baigiasi klaida „Address already in use“; `200` iš 5002.

**5.** Adresų sąrašas:

```bash
mkdir -p uzrasai
nano uzrasai/adresai.txt
```

```
web1 http://localhost:5001
db1 http://localhost:5002
app1 http://localhost:5003
```

```bash
while read -r vardas adresas; do echo "$vardas -> $adresas"; done < uzrasai/adresai.txt
```

Laukiama: trys eilutės `web1 -> http://localhost:5001`, `db1 -> ...`, `app1 -> ...`.

**6.** Stebėsena:

```bash
nano scripts/stebesena.sh
```

```bash
#!/usr/bin/env bash
set -euo pipefail

while read -r vardas adresas; do
  kodas=$(./scripts/http-kodas.sh "$adresas" || true)
  echo "$vardas $kodas"
done < uzrasai/adresai.txt
```

```bash
chmod +x scripts/stebesena.sh
```

**7.** Kol veikia 5001 ir 5002:

```bash
./scripts/stebesena.sh
```

Laukiama: `web1 200`, `db1 200`, `app1 000`.

**8.** Sustabdžius serverius (`Ctrl+C`):

```bash
lsof -nP -i :5001
lsof -nP -i :5002
./scripts/stebesena.sh
```

Laukiama: `lsof` nieko neišveda; `web1 000`, `db1 000`, `app1 000`.

**9.** Užrašai: `nano docs/tinklai.md`. Išsaugojimas Git'e yra 4 užduotyje (`git add docs scripts uzrasai`).

Dažnos klaidos: be `|| true` ciklas sustoja ties pirmu serveriu, kuris neatsako; `read` be `-r`; paleidimas ne iš projekto šaknies (`./scripts/http-kodas.sh` nerastas); `http-kodas.sh` be `chmod +x`.
