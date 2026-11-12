# 1 užduotis, sprendimas (dėstytojui): Argumentas ir sąlyga

Numeriai: dalis ir žingsnis kaip užduotyje (`1-uzduotis.md`). Demonstracijoje naudokite kitą pavyzdį nei mokinių. Failus redaktoriuje atidarome iš terminalo: `nano FAILAS` (išsaugoti `Ctrl+O`, `Enter`, išeiti `Ctrl+X`).

Pirma dalis, 1–2. Šaka:

```bash
cd ~/devops/devops-projektas
git switch main
git pull
git switch -c pamoka-04
```

Pirma dalis, 3–7. Skriptas (1 versija):

```bash
mkdir -p scripts
nano scripts/patikra.sh
```

Failo `scripts/patikra.sh` turinys (įrašykite ir išsaugokite):

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

```bash
chmod +x scripts/patikra.sh
```

Antra dalis, 1–3. Paleidimas ir kodai:

```bash
./scripts/patikra.sh git; echo "kodas: $?"
./scripts/patikra.sh neegzistuoja; echo "kodas: $?"
./scripts/patikra.sh; echo "kodas: $?"
```

Laukiama kodai: 0, 1, 2. (Rašykite `echo $?` iškart po komandos, ne vėliau.)

Trečia dalis, 1–2. Užrašai ir commit:

```bash
mkdir -p docs
nano docs/bash.md
```

Failo `docs/bash.md` turinys (įrašykite ir išsaugokite):

```markdown
# Bash skriptai

## Išėjimo kodai

`./scripts/patikra.sh git` baigėsi kodu 0, `./scripts/patikra.sh neegzistuoja` kodu 1, o be argumento kodu 2.
```

```bash
git add scripts docs
git commit -m "Pridėtas patikra.sh"
```

Dažna klaida: `$1` be kabučių; trūksta tarpų aplink `[` ir `]`; `=` vietoj `-eq` su skaičiais; pamirštas `chmod +x`; `echo $?` po kitos komandos.
