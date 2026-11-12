# 1 užduotis, sprendimas (dėstytojui): Argumentas ir sąlyga

Numeriai atitinka užduoties žingsnius (`1-uzduotis.md`). Demonstracijoje naudokite kitą pavyzdį nei mokinių.

2–3. Šaka:

```bash
cd ~/devops/devops-projektas
git switch main
git pull
git switch -c pamoka-04
```

4–8. Skriptas (1 versija):

```bash
mkdir -p scripts
cat > scripts/patikra.sh <<'EOS'
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
EOS
chmod +x scripts/patikra.sh
```

9–11. Paleidimas ir kodai:

```bash
./scripts/patikra.sh git; echo "kodas: $?"
./scripts/patikra.sh neegzistuoja; echo "kodas: $?"
./scripts/patikra.sh; echo "kodas: $?"
```

Laukiama kodai: 0, 1, 2. (Rašykite `echo $?` iškart po komandos, ne vėliau.)

12–14. Užrašai ir commit:

```bash
mkdir -p docs
printf '# Bash skriptai\n\n## Išėjimo kodai\n\n`./scripts/patikra.sh git` baigėsi kodu 0, `./scripts/patikra.sh neegzistuoja` kodu 1, o be argumento kodu 2.\n\nNaudojimo žinutę rašome į klaidų kanalą (`>&2`), kad ji nesimaišytų su įprasta išvestimi, kurią kita programa gali skaityti ar įrašyti į failą.\n' > docs/bash.md
git add scripts docs
git commit -m "Pridėtas patikra.sh"
```

Dažna klaida: `$1` be kabučių; trūksta tarpų aplink `[` ir `]`; `=` vietoj `-eq` su skaičiais; pamirštas `chmod +x`; `echo $?` po kitos komandos.
