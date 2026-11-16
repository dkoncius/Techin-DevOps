# 1 užduotis, sprendimas (dėstytojui): Argumentas ir sąlyga

Numeriai atitinka užduoties žingsnius. Demonstracijoje naudojamas kitas pavyzdys (įrankis `python3`, ne `git`, šaka `demo-03`).

**2.** Pirma skripto versija:

```bash
mkdir -p scripts
nano scripts/patikra.sh
```

```bash
#!/usr/bin/env bash
irankis=git
echo "Tikrinu: $irankis"
if command -v "$irankis" >/dev/null 2>&1; then
  echo "OK      $irankis"
else
  echo "TRŪKSTA $irankis"
fi
```

```bash
chmod +x scripts/patikra.sh
./scripts/patikra.sh
```

Laukiama: `Tikrinu: git` ir `OK      git`.

**3.** Argumentas vietoj pastovaus vardo (pakeista viena eilutė):

```bash
#!/usr/bin/env bash
irankis="$1"
echo "Tikrinu: $irankis"
if command -v "$irankis" >/dev/null 2>&1; then
  echo "OK      $irankis"
else
  echo "TRŪKSTA $irankis"
fi
```

```bash
./scripts/patikra.sh python3
./scripts/patikra.sh neegzistuoja
```

Laukiama: `Tikrinu: python3` ir `OK      python3`, tada `Tikrinu: neegzistuoja` ir `TRŪKSTA neegzistuoja`.

**4.** Išėjimo kodas ir `set -euo pipefail`:

```bash
#!/usr/bin/env bash
set -euo pipefail

irankis="$1"
echo "Tikrinu: $irankis"
if command -v "$irankis" >/dev/null 2>&1; then
  echo "OK      $irankis"
else
  echo "TRŪKSTA $irankis"
  exit 1
fi
```

```bash
./scripts/patikra.sh git; echo "kodas: $?"
./scripts/patikra.sh neegzistuoja; echo "kodas: $?"
```

Laukiama: `kodas: 0`, tada `kodas: 1`.

**5.** Galutinis skriptas (apsauga nuo trūkstamo argumento, `echo "Tikrinu"` ištrintas):

```bash
#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Naudojimas: ./scripts/patikra.sh įrankis" >&2
  exit 2
fi

irankis="$1"

if command -v "$irankis" >/dev/null 2>&1; then
  echo "OK      $irankis"
else
  echo "TRŪKSTA $irankis"
  exit 1
fi
```

**6.** Paleidimai:

```bash
./scripts/patikra.sh git; echo "kodas: $?"
./scripts/patikra.sh neegzistuoja; echo "kodas: $?"
./scripts/patikra.sh; echo "kodas: $?"
```

Laukiama:

- `OK      git` ir `kodas: 0`
- `TRŪKSTA neegzistuoja` ir `kodas: 1`
- `Naudojimas: ./scripts/patikra.sh įrankis` ir `kodas: 2`

**7.** Užrašai:

```bash
mkdir -p docs
nano docs/bash.md
```

```markdown
# Bash skriptai

`./scripts/patikra.sh git` baigėsi kodu 0, `neegzistuoja` kodu 1, be argumento kodu 2.
```

**8.** Git:

```bash
git add scripts docs
git commit -m "Pridėtas patikra.sh"
git log --oneline
```

Laukiama: viršuje `Pridėtas patikra.sh`.

Dažnos klaidos: tarpai aplink `[` ir `]`, `$1` be kabučių, `echo $?` po kitos komandos, pamirštas `chmod +x`, `exit` po `else` pamirštas (kodas lieka 0), `mkdir -p scripts` praleistas ir failas neišsaugotas.
