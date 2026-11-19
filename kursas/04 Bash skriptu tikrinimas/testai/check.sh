#!/usr/bin/env bash
# Automatinis užduočių tikrintuvas.
#   ./testai/check.sh                      # visos užduotys
#   ./testai/check.sh 3                    # tik 3 užduotis
#   UZD_DIR=sprendimai ./testai/check.sh   # patikrinti sprendimus
#
# 1–2 užduotyse tikrinama, ką jūsų skriptas išveda.
# 3–6 užduotyse tikrinamas jūsų TESTAS: jis paleidžiamas su teisingu skriptu
# (turi būti žalias, kodas 0) ir su sugadintais (turi būti raudonas, kodas ne 0).
# Teisingos ir sugadintos skriptų versijos sukuriamos laikiname aplanke,
# todėl jūsų scripts/ aplanko failai nesvarbūs.

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
UZD_DIR="$ROOT/${UZD_DIR:-uzduotys}"
ONLY="${1:-}"
PASS=0
FAIL=0
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

green() { printf '\033[32m%s\033[0m\n' "$*"; }
red()   { printf '\033[31m%s\033[0m\n' "$*"; }
ok()    { green "  ✅ $1"; PASS=$((PASS + 1)); }
bad()   { red "  ❌ $1"; shift; for l in "$@"; do echo "     $l"; done; FAIL=$((FAIL + 1)); }

# ---------------------------------------------------------------- teisingi skriptai
V="$TMP/versijos"
mkdir -p "$V"

cat > "$V/patikra_geras.sh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -gt 0 ]; then
  irankiai=("$@")
else
  irankiai=(git python3 curl)
fi
failai=(uzrasai/serveriai.txt scripts/ataskaita.sh)
truksta=0

for irankis in "${irankiai[@]}"; do
  if command -v "$irankis" >/dev/null 2>&1; then
    echo "OK      $irankis"
  else
    echo "TRŪKSTA $irankis"
    truksta=$((truksta + 1))
  fi
done

for failas in "${failai[@]}"; do
  if [ -f "$failas" ]; then
    echo "OK      $failas"
  else
    echo "TRŪKSTA $failas"
    truksta=$((truksta + 1))
  fi
done

if [ -d docs ]; then
  echo "OK      docs/"
else
  echo "TRŪKSTA docs/"
  truksta=$((truksta + 1))
fi

if [ "$truksta" -gt 0 ]; then
  echo "Trūksta: $truksta" >&2
  exit 1
fi
EOF

cat > "$V/skaiciuok_geras.sh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Naudojimas: ./scripts/skaiciuok.sh a b" >&2
  exit 2
fi

for x in "$1" "$2"; do
  if ! [[ $x =~ ^-?[0-9]+$ ]]; then
    echo "Klaida: ne skaičius: $x" >&2
    exit 2
  fi
done

echo $(( $1 + $2 ))
EOF

# sugadink <šaltinis> <vardas> <sed komanda>  ->  $V/<vardas>.sh
sugadink() { LC_ALL=C sed "$3" "$V/$1.sh" > "$V/$2.sh"; }

sugadink patikra_geras   p_exit    '/^  exit 1$/d'
sugadink patikra_geras   p_neigia  's/if command -v/if ! command -v/'
sugadink patikra_geras   p_stderr  's/ >&2$//'
sugadink skaiciuok_geras s_suma    's/\$1 + \$2/$1 - $2/'
sugadink skaiciuok_geras s_kodas   's/exit 2/exit 1/'
sugadink skaiciuok_geras s_stderr  's/ >&2$//'
sugadink skaiciuok_geras s_skaicius 's/if ! \[\[ .* \]\]; then/if false; then/'

# ---------------------------------------------------------------- paleidimas
# paleisk <užduoties failas> <skriptas: patikra|skaiciuok> <versija>
#   -> U_OUT, U_ERR, U_KODAS
# Užduotis paleidžiama iš laikino projekto; ji naudoja ./scripts/<skriptas>.sh.
paleisk() {
  local failas=$1 skriptas=$2 versija=$3
  local p="$TMP/projektas"
  rm -rf "$p"
  mkdir -p "$p/uzrasai" "$p/scripts" "$p/docs"
  touch "$p/uzrasai/serveriai.txt" "$p/scripts/ataskaita.sh"
  chmod +x "$p/scripts/ataskaita.sh"
  cp "$V/$versija.sh" "$p/scripts/$skriptas.sh"
  chmod +x "$p/scripts/$skriptas.sh"
  U_OUT=$(cd "$p" && "$UZD_DIR/$failas" 2>"$TMP/err")
  U_KODAS=$?
  U_ERR=$(cat "$TMP/err")
}

# eilutes <tekstas>  ->  vienoje eilutėje, | vietoj naujų eilučių
eilutes() { printf '%s' "$1" | tr '\n' '|'; }

# pirmi_simboliai <tekstas>  ->  kiekvienos eilutės pirmas žodis (✅ arba ❌), per tarpą
pirmi_simboliai() { printf '%s\n' "$1" | awk 'NF {printf "%s%s", (n++ ? " " : ""), $1}'; }

# bendros_patikros <failas>  ->  shebang, TODO, set -e, exit 1 (testams)
bendros_patikros() {
  local f="$UZD_DIR/$1" testas=$2
  if [ ! -f "$f" ]; then bad "nerastas failas $1"; return 1; fi
  if head -n 1 "$f" | grep -q '^#!.*bash'; then ok "pirma eilutė nurodo bash"; else bad "pirma eilutė turi būti #!/usr/bin/env bash"; fi
  if grep -q 'TODO' "$f"; then bad "dar liko TODO" "atlikite ir ištrinkite TODO komentarus"; fi
  if [ "$testas" = taip ]; then
    if grep -qE '^[[:space:]]*set[[:space:]]+-[a-z]*e' "$f"; then
      bad "teste yra set -e" "testas sustoja ties pirmu skriptu, kuris grąžina ne 0 — set -e teste nerašykite"
    else
      ok "nėra set -e"
    fi
    if grep -q 'exit 1' "$f"; then ok "yra exit 1"; else bad "trūksta exit 1, kai FAIL didesnis už 0"; fi
  fi
  return 0
}

# zalias <failas> <skriptas>  ->  testas su teisingu skriptu turi būti žalias (grąžina 1, jei ne)
zalias() {
  paleisk "$1" "$2" "${2}_geras"
  if [ "$U_KODAS" -eq 0 ]; then
    ok "su teisingu $2.sh testas žalias (kodas 0)"
    return 0
  fi
  bad "su teisingu $2.sh testas raudonas (kodas $U_KODAS)" "jūsų testas tikisi ne to, ką daro teisingas skriptas. Paskutinės eilutės:"
  printf '%s\n' "$U_OUT" | tail -n 6 | sed 's/^/       | /'
  red "     Pirma pataisykite testą, kad su teisingu skriptu būtų žalias. Sugadintų versijų netikrinu."
  return 1
}

# pagauna <failas> <skriptas> <versija> <aprašas> <patarimas>
pagauna() {
  paleisk "$1" "$2" "$3"
  if [ "$U_KODAS" -ne 0 ]; then
    ok "pagauna klaidą: $4"
  else
    bad "nepagauna klaidos: $4" "testas liko žalias (kodas 0), nors skriptas sugadintas" "patarimas: $5"
  fi
}

# kiek_zaliu <tekstas>  ->  kiek eilučių su ✅
kiek_zaliu() { printf '%s\n' "$1" | grep -c '✅'; }

run() { [ -z "$ONLY" ] || [ "$ONLY" = "$1" ]; }

# ---------------------------------------------------------------- užduotys
if run 1; then
  echo "1 užduotis – OUT ir KODAS"
  F=1-uzduotis.sh
  if bendros_patikros "$F" ne; then
    paleisk "$F" patikra patikra_geras
    WANT=$'git: kodas 0\nneegzistuoja: kodas 1\nneegzistuoja: TRŪKSTA neegzistuoja'
    if [ "$U_OUT" = "$WANT" ]; then
      ok "išvestis teisinga"
    else
      bad "išvestis neteisinga" "tikėtasi: $(eilutes "$WANT")" "gauta:    $(eilutes "$U_OUT")"
    fi
    if [ -z "$U_ERR" ]; then
      ok "ekrane nėra klaidų kanalo (Trūksta: 1 paslėptas)"
    else
      bad "klaidų kanale: $U_ERR" "paslėpkite jį su 2>/dev/null"
    fi
    paleisk "$F" patikra p_exit
    if printf '%s\n' "$U_OUT" | grep -qx 'neegzistuoja: kodas 0'; then
      ok "kodas imamas iš \$?, ne įrašytas ranka"
    else
      bad "kai skriptas baigiasi kodu 0, turi būti 'neegzistuoja: kodas 0'" "ar kodą imate iš \$? iškart po komandos?"
    fi
  fi
fi

if run 2; then
  echo "2 užduotis – trys palyginimai"
  F=2-uzduotis.sh
  if bendros_patikros "$F" ne; then
    # versija | tikėtina | aprašas
    while IFS='|' read -r versija want aprasas; do
      paleisk "$F" patikra "$versija"
      got=$(pirmi_simboliai "$U_OUT")
      if [ "$got" = "$want" ]; then
        ok "$aprasas: $got"
      else
        bad "$aprasas" "tikėtasi: $want" "gauta:    $got" "visa išvestis: $(eilutes "$U_OUT")"
      fi
    done <<'EOF'
patikra_geras|✅ ✅ ✅|teisingas skriptas
p_neigia|❌ ❌ ✅|OK ir TRŪKSTA sukeisti (1 ir 2 patikros ❌)
p_exit|✅ ❌ ✅|skriptas visada kodas 0 (2 patikra ❌)
p_stderr|✅ ✅ ❌|Trūksta: išvestyje (3 patikra ❌)
EOF
  fi
fi

if run 3; then
  echo "3 užduotis – pirmas testas faile"
  F=3-uzduotis.sh
  if bendros_patikros "$F" taip && zalias "$F" patikra; then
    if [ "$(kiek_zaliu "$U_OUT")" -ge 3 ]; then ok "bent 3 patikros"; else bad "per mažai patikrų: reikia bent 3 ✅"; fi
    pagauna "$F" patikra p_exit   "skriptas visada baigiasi kodu 0" "patikrinkite kodą su neegzistuoja: turi būti 1"
    pagauna "$F" patikra p_neigia "OK ir TRŪKSTA sukeisti vietomis" "patikrinkite, kad su git išvestyje yra OK      git"
    pagauna "$F" patikra p_stderr "Trūksta: rašoma į išvestį" "patikrinkite, kad išvestyje NĖRA Trūksta: (README 6 skyrius, ženklas !)"
  fi
fi

if run 4; then
  echo "4 užduotis – skaiciuok.sh testas"
  F=4-uzduotis.sh
  if bendros_patikros "$F" taip && zalias "$F" skaiciuok; then
    if [ "$(kiek_zaliu "$U_OUT")" -ge 4 ]; then ok "bent 4 patikros"; else bad "per mažai patikrų: reikia bent 4 ✅"; fi
    pagauna "$F" skaiciuok s_suma     "skaičiuoja a - b vietoj a + b" "patikrinkite, kad 2 3 išveda tiksliai 5"
    pagauna "$F" skaiciuok s_kodas    "klaidos kodas 1 vietoj 2" "patikrinkite kodą be argumentų ir su abc: turi būti 2"
    pagauna "$F" skaiciuok s_stderr   "klaidos rašomos į išvestį" "patikrinkite, kad be argumentų išvestis tuščia"
    pagauna "$F" skaiciuok s_skaicius "netikrina, ar argumentas skaičius" "patikrinkite abc 1: išvestis tuščia, kodas 2"
  fi
fi

if run 5; then
  echo "5 užduotis – testas visada žalias"
  F=5-uzduotis.sh
  if bendros_patikros "$F" taip && zalias "$F" patikra; then
    pagauna "$F" patikra p_exit   "skriptas visada baigiasi kodu 0" "ar testas tikrina KODAS?"
    pagauna "$F" patikra p_neigia "OK ir TRŪKSTA sukeisti vietomis" "ar ieškote viso teksto TRŪKSTA neegzistuoja, ne tik žodžio?"
  fi
fi

if run 6; then
  echo "6 užduotis ⭐ – testas raudonas, nors skriptas geras"
  F=6-uzduotis.sh
  if bendros_patikros "$F" taip && zalias "$F" patikra; then
    if printf '%s\n' "$U_OUT" | grep -qF 'Išlaikyta 2 / 2'; then ok "abi patikros liko"; else bad "turi likti abi patikros: Išlaikyta 2 / 2"; fi
    pagauna "$F" patikra p_exit   "skriptas visada baigiasi kodu 0" "neegzistuoja kodo patikra turi likti"
    pagauna "$F" patikra p_neigia "OK ir TRŪKSTA sukeisti vietomis" "git patikra turi likti"
  fi
fi

echo
TOTAL=$((PASS + FAIL))
if [ "$FAIL" -eq 0 ]; then
  green "Visos $TOTAL patikros praėjo 🎉"
  exit 0
else
  red "Išlaikyta $PASS / $TOTAL"
  exit 1
fi
