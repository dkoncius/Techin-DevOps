#!/usr/bin/env bash
# Automatinė užduočių 1, 2 ir 3 patikra (veikia macOS ir Linux/WSL).
#   bash testai/tikrinti.sh demo                   # tikrina demonstracijos scripts/sveikas.sh
#   bash testai/tikrinti.sh 1                      # tikrina scripts/patikra.sh pagal 1 užduotį
#   bash testai/tikrinti.sh 2
#   bash testai/tikrinti.sh 3
#   bash testai/tikrinti.sh 1 kelias/iki/skripto   # kitas skriptas
# Paleiskite iš projekto šaknies (ten, kur yra aplankas scripts).

N="${1:-}"
case "$N" in
  demo|1|2|3) ;;
  *) echo "Naudojimas: bash testai/tikrinti.sh demo|1|2|3 [skriptas]" >&2; exit 2 ;;
esac

if [ "$N" = demo ]; then
  SCRIPT="${2:-scripts/sveikas.sh}"
else
  SCRIPT="${2:-scripts/patikra.sh}"
fi
if [ ! -f "$SCRIPT" ]; then
  echo "Nerastas skriptas: $SCRIPT (paleiskite iš projekto šaknies)" >&2
  exit 2
fi
S="$(cd "$(dirname "$SCRIPT")" && pwd)/$(basename "$SCRIPT")"

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

PASS=0
FAIL=0
green() { printf '\033[32m%s\033[0m\n' "$*"; }
red()   { printf '\033[31m%s\033[0m\n' "$*"; }
ok()    { green "  ✅ $1"; PASS=$((PASS + 1)); }
bad()   { red "  ❌ $1"; shift; for l in "$@"; do echo "     $l"; done; FAIL=$((FAIL + 1)); }

# run <katalogas> [argumentai...]  ->  OUT, ERR, CODE
run() {
  local dir=$1
  shift
  OUT=$(cd "$dir" && bash "$S" "$@" 2>"$TMP/err")
  CODE=$?
  ERR=$(cat "$TMP/err")
}

# eq <aprašas> <tikėtas stdout> <tikėtas kodas>   (naudoja paskutinį run)
eq() {
  if [ "$OUT" = "$2" ] && [ "$CODE" -eq "$3" ]; then
    ok "$1"
  else
    bad "$1" "tikėtasi (kodas $3): $(printf '%s' "$2" | tr '\n' '|')" \
             "gauta    (kodas $CODE): $(printf '%s' "$OUT" | tr '\n' '|')"
  fi
}

# has <aprašas> <tikėtas kodas> <tekstas>...   (išvestyje turi būti kiekvienas tekstas, tikslus žodžių tekstas nesvarbus)
has() {
  local desc=$1 want_code=$2 miss="" t
  shift 2
  for t in "$@"; do
    case "$OUT" in *"$t"*) ;; *) miss="$miss $t" ;; esac
  done
  if [ -z "$miss" ] && [ "$CODE" -eq "$want_code" ]; then
    ok "$desc"
  else
    bad "$desc" "tikėtasi (kodas $want_code), išvestyje turi būti: $*" \
             "gauta    (kodas $CODE): $(printf '%s' "$OUT" | tr '\n' '|')"
  fi
}

# err_eq <aprašas> <tikėtas stderr>
err_eq() {
  if [ "$ERR" = "$2" ]; then
    ok "$1"
  else
    bad "$1" "klaidų kanale tikėtasi: $2" "klaidų kanale gauta:   $ERR"
  fi
}

# err_has <aprašas>  -> stderr netuščias
err_has() {
  if [ -n "$ERR" ]; then ok "$1"; else bad "$1" "į klaidų kanalą (>&2) nieko neparašyta"; fi
}

# bendros patikros
echo "Skriptas $SCRIPT"
if head -n 1 "$SCRIPT" | grep -q '^#!.*bash'; then ok "pirma eilutė nurodo bash"; else bad "pirma eilutė turi būti #!/usr/bin/env bash"; fi
if [ -x "$SCRIPT" ]; then ok "skriptas vykdomas (chmod +x)"; else bad "skriptas nevykdomas: chmod +x $SCRIPT"; fi
if grep -q 'set -euo pipefail' "$SCRIPT"; then ok "yra set -euo pipefail"; else bad "trūksta set -euo pipefail"; fi
if grep -q 'TODO' "$SCRIPT"; then bad "dar liko TODO komentarų (ištrinkite juos, kai atliksite)"; fi

# tikėtas rezultatas dabartinėje sistemoje
exp_tool() { if command -v "$1" >/dev/null 2>&1; then echo "OK      $1"; else echo "TRŪKSTA $1"; fi; }

# ---------- demonstracija ----------
if [ "$N" = demo ]; then
  run "$TMP" Ona Jonas
  has "Ona Jonas -> kodas 0, išvestyje Ona ir Jonas" 0 Ona Jonas
  run "$TMP" Ona
  has "Ona -> kodas 0, išvestyje Ona" 0 Ona
  run "$TMP"
  eq "be argumento -> nieko stdout, kodas 2" "" 2
  err_has "naudojimo žinutė eina į klaidų kanalą"
fi

# ---------- 1 užduotis ----------
if [ "$N" = 1 ]; then
  echo "1 užduotis: argumentai ir išėjimo kodas"
  run "$TMP" git
  eq "git -> OK, kodas 0" "OK      git" 0
  run "$TMP" neegzistuoja
  eq "neegzistuoja -> TRŪKSTA, kodas 1" "TRŪKSTA neegzistuoja" 1
  run "$TMP"
  eq "be argumento -> nieko stdout, kodas 2" "" 2
  err_has "naudojimo žinutė eina į klaidų kanalą"
  if grep -q 'Tikrinu' "$SCRIPT"; then bad "eilutę 'Tikrinu: ...' reikėjo ištrinti"; fi
fi

# ---------- 2 užduotis ----------
if [ "$N" = 2 ]; then
  echo "2 užduotis: ciklas per įrankius"
  want=$(for t in git python3 curl; do exp_tool "$t"; done)
  code=0
  echo "$want" | grep -q TRŪKSTA && code=1
  run "$TMP"
  eq "be argumentų tikrina git, python3, curl" "$want" "$code"
  run "$TMP" git neegzistuoja kitas
  eq "git neegzistuoja kitas -> kodas 1" $'OK      git\nTRŪKSTA neegzistuoja\nTRŪKSTA kitas' 1
  err_eq "klaidų kanale: Trūksta: 2" "Trūksta: 2"
  run "$TMP" git
  eq "tik git -> kodas 0" "OK      git" 0
  run "$TMP" git git
  eq "du argumentai -> abu tikrinami" $'OK      git\nOK      git' 0
fi

# ---------- 3 užduotis ----------
if [ "$N" = 3 ]; then
  echo "3 užduotis: projekto failų patikra"
  P="$TMP/projektas"
  mkdir -p "$P/uzrasai" "$P/scripts" "$P/docs"
  touch "$P/uzrasai/serveriai.txt" "$P/scripts/ataskaita.sh"

  run "$P" git
  eq "iš šaknies su git: OK, du failai, docs/" $'OK      git\nOK      uzrasai/serveriai.txt\nOK      scripts/ataskaita.sh\nOK      docs/' 0

  run "$P"
  want=$(for t in git python3 curl; do exp_tool "$t"; done; printf 'OK      uzrasai/serveriai.txt\nOK      scripts/ataskaita.sh\nOK      docs/')
  code=0
  echo "$want" | grep -q TRŪKSTA && code=1
  eq "iš šaknies be argumentų: įrankiai, failai, docs/" "$want" "$code"

  run "$P/docs" git
  eq "iš docs: failai ir docs/ TRŪKSTA, kodas 1" $'OK      git\nTRŪKSTA uzrasai/serveriai.txt\nTRŪKSTA scripts/ataskaita.sh\nTRŪKSTA docs/' 1
  err_eq "klaidų kanale: Trūksta: 3" "Trūksta: 3"

  rm "$P/scripts/ataskaita.sh"
  run "$P" git
  eq "trūksta vieno failo -> kodas 1" $'OK      git\nOK      uzrasai/serveriai.txt\nTRŪKSTA scripts/ataskaita.sh\nOK      docs/' 1
  err_eq "klaidų kanale: Trūksta: 1" "Trūksta: 1"

  touch "$P/scripts/ataskaita.sh"
  rmdir "$P/docs"
  run "$P" git
  eq "nėra aplanko docs -> kodas 1" $'OK      git\nOK      uzrasai/serveriai.txt\nOK      scripts/ataskaita.sh\nTRŪKSTA docs/' 1
fi

echo
TOTAL=$((PASS + FAIL))
if [ "$FAIL" -eq 0 ]; then
  green "Viskas gerai: $TOTAL / $TOTAL patikrų 🎉"
  exit 0
else
  red "Išlaikyta $PASS / $TOTAL patikrų"
  exit 1
fi
