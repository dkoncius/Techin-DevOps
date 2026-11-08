#!/usr/bin/env bash
# publikuoti.sh – nukopijuoja pamoką į viešo repo „devops-kursas“ klono aplanką.
#
# Naudojimas:
#   export DEVOPS_KURSAS_DIR=/kelias/i/devops-kursas     # viešo repo klonas
#   ./publikuoti.sh NN               # pamoka.md, uzduotys.md, check.sh
#   ./publikuoti.sh NN --sprendimai  # mokytojas/sprendimai/NN/ -> .../sprendimai/
#
# Skriptas TIK kopijuoja failus. Jis nedaro git add/commit/push – peržiūrėkite ir
# išsiųskite patys. Esamų failų neperrašo be patvirtinimo.
# Veikia macOS, Linux ir Git Bash.

set -euo pipefail

SKRIPTO_DIR="$(cd "$(dirname "$0")" && pwd)"
SAKNIS="$(cd "$SKRIPTO_DIR/.." && pwd)"
PAMOKOS_SALTINIS="$SAKNIS/kursas/pamokos"
SPRENDIMU_SALTINIS="$SAKNIS/mokytojas/sprendimai"

klaida() {
  echo "Klaida: $1" >&2
  exit 1
}

naudojimas() {
  echo "Naudojimas: DEVOPS_KURSAS_DIR=/kelias/i/devops-kursas ./publikuoti.sh NN [--sprendimai]"
}

# Klausia patvirtinimo; grąžina 0 tik jei atsakyta „taip“
patvirtinti() {
  local atsakymas=""
  printf '%s Rašykite "taip": ' "$1"
  read -r atsakymas || atsakymas=""
  [ "$atsakymas" = "taip" ]
}

# Įspėja, jei nukopijuotuose failuose atrodo esama slaptų duomenų (rodo tik failų vardus)
slaptu_paieska() {
  local kelias="$1" rasta
  rasta="$(grep -rIlE 'password|secret|token|BEGIN .*PRIVATE KEY|AccountKey' "$kelias" 2>/dev/null || true)"
  if [ -n "$rasta" ]; then
    echo
    echo "DĖMESIO: šiuose failuose rasta žodžių password/secret/token/PRIVATE KEY/AccountKey."
    echo "Peržiūrėkite prieš commit (gali būti nekaltas paaiškinimas):"
    echo "$rasta"
  fi
}

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  naudojimas
  exit 1
fi

NR="$1"
SPRENDIMAI="nera"
if [ "$#" -eq 2 ]; then
  [ "$2" = "--sprendimai" ] || { naudojimas; exit 1; }
  SPRENDIMAI="taip"
fi

case "$NR" in
  [0-9][0-9]) ;;
  *) klaida "numeris turi būti dviejų skaitmenų (01–80), gauta: '$NR'" ;;
esac
if [ "$((10#$NR))" -lt 1 ] || [ "$((10#$NR))" -gt 80 ]; then
  klaida "numeris turi būti tarp 01 ir 80"
fi

[ -n "${DEVOPS_KURSAS_DIR:-}" ] || klaida "nenustatytas DEVOPS_KURSAS_DIR (viešo repo klono kelias)"
[ -d "$DEVOPS_KURSAS_DIR" ] || klaida "DEVOPS_KURSAS_DIR aplanko nėra: $DEVOPS_KURSAS_DIR"
CELE="$(cd "$DEVOPS_KURSAS_DIR" && pwd)"

# Apsauga: tikslas neturi būti šis privatus repo
if [ "$CELE" = "$SAKNIS" ]; then
  klaida "DEVOPS_KURSAS_DIR rodo į privatų repo. Reikia atskiro viešo repo klono."
fi
if [ ! -d "$CELE/.git" ]; then
  echo "Perspėjimas: $CELE neatrodo kaip git klonas (nėra .git)."
fi

# Pamokos aplanko pavadinimas (pvz. "01 Kas yra DevOps")
PAMOKA_DIR=""
for d in "$PAMOKOS_SALTINIS"/"$NR "*; do
  if [ -d "$d" ]; then
    PAMOKA_DIR="$d"
    break
  fi
done
[ -n "$PAMOKA_DIR" ] || klaida "pamokos $NR aplanko nerasta: $PAMOKOS_SALTINIS"
PAVADINIMAS="$(basename "$PAMOKA_DIR")"
CELES_PAMOKA="$CELE/pamokos/$PAVADINIMAS"

if [ "$SPRENDIMAI" = "nera" ]; then
  # --- pamoka.md, uzduotys.md, check.sh ---
  kopijuojami=""
  for f in pamoka.md uzduotys.md check.sh; do
    [ -f "$PAMOKA_DIR/$f" ] && kopijuojami="$kopijuojami $f"
  done
  [ -n "$kopijuojami" ] || klaida "pamokoje $NR nėra nei pamoka.md, nei uzduotys.md, nei check.sh"

  esami=""
  for f in $kopijuojami; do
    [ -e "$CELES_PAMOKA/$f" ] && esami="$esami $f"
  done
  if [ -n "$esami" ]; then
    echo "Tikslo aplanke jau yra:$esami"
    patvirtinti "Perrašyti?" || { echo "Atšaukta. Nieko nepakeista."; exit 0; }
  fi

  mkdir -p "$CELES_PAMOKA"
  for f in $kopijuojami; do
    cp -p "$PAMOKA_DIR/$f" "$CELES_PAMOKA/$f"
    echo "Nukopijuota: pamokos/$PAVADINIMAS/$f"
  done
  slaptu_paieska "$CELES_PAMOKA"
else
  # --- sprendimai ---
  SALTINIS="$SPRENDIMU_SALTINIS/$NR"
  [ -d "$SALTINIS" ] || klaida "sprendimų aplanko nėra: $SALTINIS"
  if [ -z "$(find "$SALTINIS" -type f ! -name '.gitkeep' | head -n 1)" ]; then
    klaida "sprendimai/$NR dar tušti (yra tik .gitkeep). Nėra ką publikuoti."
  fi

  CELES_SPRENDIMAI="$CELES_PAMOKA/sprendimai"
  if [ -e "$CELES_SPRENDIMAI" ]; then
    echo "Tikslo aplankas jau yra: pamokos/$PAVADINIMAS/sprendimai"
    patvirtinti "Uždėti ant esamo (vienodų vardų failai bus perrašyti)?" || { echo "Atšaukta. Nieko nepakeista."; exit 0; }
  fi

  mkdir -p "$CELES_SPRENDIMAI"
  tar -cf - --exclude=.gitkeep --exclude=.env --exclude=.git -C "$SALTINIS" . | tar -xf - -C "$CELES_SPRENDIMAI"
  echo "Nukopijuota: sprendimai/$NR -> pamokos/$PAVADINIMAS/sprendimai"
  slaptu_paieska "$CELES_SPRENDIMAI"
fi

echo
echo "Baigta. Peržiūrėkite pakeitimus ($CELE) ir patys darykite git commit bei git push."
