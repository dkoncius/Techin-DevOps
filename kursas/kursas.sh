#!/usr/bin/env bash
# kursas.sh – pagalbinis kurso skriptas studentams.
#
# Naudojimas:
#   ./kursas.sh patikrinti NN [kelias_i_projekta]
#   ./kursas.sh atstatyti  NN [kelias_i_projekta]
#
# NN – pamokos numeris (01–80). Kelią į savo projektą (devops-projektas kopiją)
# galima duoti antruoju argumentu arba aplinkos kintamuoju PROJEKTO_KELIAS.
#
# Veikia macOS, Linux ir Git Bash (Windows). Nenaudoja GNU-specifinių parametrų.

set -euo pipefail

# Kurso aplankas (ten, kur guli šis skriptas)
KURSO_DIR="$(cd "$(dirname "$0")" && pwd)"
PAMOKOS_DIR="$KURSO_DIR/pamokos"

naudojimas() {
  echo "Naudojimas:"
  echo "  ./kursas.sh patikrinti NN [kelias_i_projekta]"
  echo "  ./kursas.sh atstatyti  NN [kelias_i_projekta]"
  echo "Kelią į projektą galima nurodyti ir kintamuoju PROJEKTO_KELIAS."
}

klaida() {
  echo "Klaida: $1" >&2
  exit 1
}

# Grąžina pamokos aplanko kelią pagal numerį (pvz. "01" -> .../pamokos/01 Kas yra DevOps)
rasti_pamokos_aplanka() {
  local nr="$1" d
  for d in "$PAMOKOS_DIR"/"$nr "*; do
    if [ -d "$d" ]; then
      echo "$d"
      return 0
    fi
  done
  return 1
}

# Tikrina, ar numeris yra dviejų skaitmenų ir 01–80
tikrinti_numeri() {
  case "$1" in
    [0-9][0-9]) ;;
    *) klaida "pamokos numeris turi būti dviejų skaitmenų (01–80), gauta: '$1'" ;;
  esac
  local n=$((10#$1))
  if [ "$n" -lt 1 ] || [ "$n" -gt 80 ]; then
    klaida "pamokos numeris turi būti tarp 01 ir 80, gauta: '$1'"
  fi
}

# Ar sprendimo projekto aplanke yra tikrų failų (ne tik README/.gitkeep)?
turi_projekto_failu() {
  [ -n "$(find "$1" -type f ! -name 'README.md' ! -name '.gitkeep' | head -n 1)" ]
}

# Kopijuoja aplanko turinį į kitą, praleisdamas .git, .env ir .venv
kopijuoti_be_slaptu() {
  local is="$1" i="$2"
  tar -cf - --exclude=.git --exclude=.env --exclude=.venv -C "$is" . | tar -xf - -C "$i"
}

komanda_patikrinti() {
  local nr="$1" projektas="${2:-${PROJEKTO_KELIAS:-$PWD}}"
  local aplankas
  aplankas="$(rasti_pamokos_aplanka "$nr")" || klaida "pamokos $nr aplanko nerasta. Ar padarėte git pull?"
  if [ ! -f "$aplankas/check.sh" ]; then
    echo "Pamokai $nr check.sh dar nėra. Pabandykite po git pull."
    exit 1
  fi
  [ -d "$projektas" ] || klaida "projekto aplanko nėra: $projektas"
  PROJEKTO_KELIAS="$projektas" bash "$aplankas/check.sh" "$projektas"
}

komanda_atstatyti() {
  local nr="$1" projektas="${2:-${PROJEKTO_KELIAS:-}}"

  if [ -z "$projektas" ]; then
    klaida "nenurodytas projekto kelias. Pvz.: ./kursas.sh atstatyti $nr ~/devops-projektas (arba nustatykite PROJEKTO_KELIAS)"
  fi
  [ -d "$projektas" ] || klaida "projekto aplanko nėra: $projektas"
  projektas="$(cd "$projektas" && pwd)"

  # Apsauga: neleidžiame „atstatyti“ paties kurso aplanko
  if [ "$projektas" = "$KURSO_DIR" ]; then
    klaida "nurodytas kurso aplankas, o ne jūsų projektas"
  fi

  local aplankas
  aplankas="$(rasti_pamokos_aplanka "$nr")" || klaida "pamokos $nr aplanko nerasta. Ar padarėte git pull?"

  # Jei pamokos sprendimas dar neįkeltas – sustojame
  if [ ! -d "$aplankas/sprendimai" ]; then
    echo "Pamokos $nr sprendimas bus įkeltas kitos pamokos pradžioje. Padarykite git pull tada."
    exit 0
  fi

  # Ieškome paskutinės projekto būsenos: pamokoje NN arba artimiausioje ankstesnėje
  local i=$((10#$nr)) pnr pd saltinis=""
  while [ "$i" -ge 1 ]; do
    pnr="$(printf '%02d' "$i")"
    if pd="$(rasti_pamokos_aplanka "$pnr")" && [ -d "$pd/sprendimai/projektas" ] \
        && turi_projekto_failu "$pd/sprendimai/projektas"; then
      saltinis="$pd/sprendimai/projektas"
      break
    fi
    i=$((i - 1))
  done

  if [ -z "$saltinis" ]; then
    echo "Iki pamokos $nr projekto būsenos sprendimuose dar nėra (ji bus papildyta)."
    echo "Nieko nekeičiame."
    exit 0
  fi

  local laikas atsarginis
  laikas="$(date +%Y%m%d-%H%M%S)"
  atsarginis="$(dirname "$projektas")/projektas.atsarginis-$laikas"

  echo "Projekto būsena po pamokos $nr bus paimta iš:"
  echo "  $saltinis"
  echo "Jūsų projektas:           $projektas"
  echo "Atsarginė kopija (be .git ir .env) bus čia:"
  echo "  $atsarginis"
  echo
  echo "Sprendimo failai bus uždėti ant jūsų projekto (failai su tuo pačiu vardu bus perrašyti,"
  echo "kiti jūsų failai liks). Aplankų .git ir .env neliečiame."
  printf 'Tęsti? Rašykite "taip": '
  local atsakymas=""
  read -r atsakymas || atsakymas=""
  if [ "$atsakymas" != "taip" ]; then
    echo "Atšaukta. Nieko nepakeista."
    exit 0
  fi

  mkdir "$atsarginis" || klaida "nepavyko sukurti $atsarginis"
  kopijuoti_be_slaptu "$projektas" "$atsarginis"
  echo "Atsarginė kopija sukurta."

  kopijuoti_be_slaptu "$saltinis" "$projektas"
  echo "Atstatyta. Pažiūrėkite, kas pasikeitė: git status (jūsų projekte)."
}

# --- pagrindinė dalis ---
if [ "$#" -lt 2 ]; then
  naudojimas
  exit 1
fi

KOMANDA="$1"
NR="$2"
tikrinti_numeri "$NR"

case "$KOMANDA" in
  patikrinti) komanda_patikrinti "$NR" "${3:-}" ;;
  atstatyti)  komanda_atstatyti  "$NR" "${3:-}" ;;
  *) naudojimas; exit 1 ;;
esac
