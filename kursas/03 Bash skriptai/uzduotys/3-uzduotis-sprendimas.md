# 3 užduotis, sprendimas (dėstytojui): Ciklas per įrankius

Numeriai atitinka užduoties žingsnius. Demonstracijoje kiti įrankiai (`python3`, `node`).

**2.** Atidaryti `nano scripts/patikra.sh`. Turinys (pirmos dvi eilutės lieka, likusi dalis perrašyta):

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

**3.** Be argumentų:

```bash
./scripts/patikra.sh; echo "kodas: $?"
```

Laukiama: `OK      git`, `OK      python3`, `OK      curl`, `kodas: 0`. Naudojamas numatytasis sąrašas (`else` šaka).

**4.** Su trimis argumentais:

```bash
./scripts/patikra.sh git neegzistuoja kitas; echo "kodas: $?"
```

Laukiama: `OK      git`, dvi `TRŪKSTA`, `Trūksta: 2`, `kodas: 1`. Argumentai pakeičia sąrašą, skaitiklis suskaičiuoja du trūkstamus.

**5.** Tik `git`:

```bash
./scripts/patikra.sh git; echo "kodas: $?"
```

Laukiama: viena `OK`, `kodas: 0`. Skaitiklis lieka 0, todėl `if` pabaigoje nevykdomas.

**6.** Užrašai:

```bash
nano docs/bash.md
```

Gale pridėti (mokinio žodžiais): be argumentų kodas 0, su `git neegzistuoja kitas` kodas 1, tik su `git` kodas 0.

**7.** Git:

```bash
git add scripts docs
git commit -m "Skriptas tikrina įrankių sąrašą"
git log --oneline
```

Laukiama: viršuje `Skriptas tikrina įrankių sąrašą`.

Dažnos klaidos: `"${irankiai[@]}"` be kabučių arba be `@`, `truksta=$truksta+1` vietoje `$(( ))`, `set -u` su neapibrėžtu `truksta`.
