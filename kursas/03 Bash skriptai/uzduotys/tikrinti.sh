#!/usr/bin/env bash
# Vienas patikros skriptas demonstracijai ir 1–6 užduotims (macOS ir Linux/WSL).
#   bash testai/tikrinti.sh demo              # ~/devops/demo-bash: scripts/sveikas.sh
#   bash tests/tikrinti.sh 3                  # git-bandymas: exercises/03_countdown.sh
#   bash tests/tikrinti.sh                    # visos užduotys
#   EX_DIR=solutions bash tests/tikrinti.sh   # etaloniniai sprendimai (dėstytojui)
# Paleiskite iš projekto šaknies (demo-bash arba git-bandymas).

# ---------- demonstracija (scripts/sveikas.sh) ----------
run_demo() {
  local script="${1:-scripts/sveikas.sh}"
  if [ ! -f "$script" ]; then
    echo "Nerastas skriptas: $script (paleiskite iš demo-bash šaknies)" >&2
    exit 2
  fi
  local S
  S="$(cd "$(dirname "$script")" && pwd)/$(basename "$script")"

  local TMP PASS FAIL
  TMP="$(mktemp -d)"
  trap 'rm -rf "$TMP"' EXIT
  PASS=0
  FAIL=0

  green() { printf '\033[32m%s\033[0m\n' "$*"; }
  red()   { printf '\033[31m%s\033[0m\n' "$*"; }
  ok()    { green "  ✅ $1"; PASS=$((PASS + 1)); }
  bad()   { red "  ❌ $1"; shift; for l in "$@"; do echo "     $l"; done; FAIL=$((FAIL + 1)); }

  local OUT ERR CODE
  run() {
    local dir=$1
    shift
    OUT=$(cd "$dir" && bash "$S" "$@" 2>"$TMP/err")
    CODE=$?
    ERR=$(cat "$TMP/err")
  }

  eq() {
    if [ "$OUT" = "$2" ] && [ "$CODE" -eq "$3" ]; then
      ok "$1"
    else
      bad "$1" "tikėtasi (kodas $3): $(printf '%s' "$2" | tr '\n' '|')" \
               "gauta    (kodas $CODE): $(printf '%s' "$OUT" | tr '\n' '|')"
    fi
  }

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

  err_has() {
    if [ -n "$ERR" ]; then ok "$1"; else bad "$1" "į klaidų kanalą (>&2) nieko neparašyta"; fi
  }

  echo "Skriptas $script"
  if head -n 1 "$S" | grep -q '^#!.*bash'; then ok "pirma eilutė nurodo bash"; else bad "pirma eilutė turi būti #!/usr/bin/env bash"; fi
  if [ -x "$S" ]; then ok "skriptas vykdomas (chmod +x)"; else bad "skriptas nevykdomas: chmod +x $script"; fi
  if grep -q 'set -euo pipefail' "$S"; then ok "yra set -euo pipefail"; else bad "trūksta set -euo pipefail"; fi
  if grep -q 'TODO' "$S"; then bad "dar liko TODO komentarų (ištrinkite juos, kai atliksite)"; fi

  run "$TMP" Ona Jonas
  has "Ona Jonas -> kodas 0, išvestyje Ona ir Jonas" 0 Ona Jonas
  run "$TMP" Ona
  has "Ona -> kodas 0, išvestyje Ona" 0 Ona
  run "$TMP"
  eq "be argumento -> nieko stdout, kodas 2" "" 2
  err_has "naudojimo žinutė eina į klaidų kanalą"

  echo
  local TOTAL=$((PASS + FAIL))
  if [ "$FAIL" -eq 0 ]; then
    green "Viskas gerai: $TOTAL / $TOTAL patikrų 🎉"
    exit 0
  else
    red "Išlaikyta $PASS / $TOTAL patikrų"
    exit 1
  fi
}

# ---------- užduotys (exercises/*.sh) ----------
run_exercises() {
  local ONLY="${1:-}"

  if ! command -v timeout >/dev/null 2>&1; then
    timeout() { local s=$1; shift; perl -e 'alarm shift; exec @ARGV' "$s" "$@"; }
  fi

  local ROOT EX_DIR PASS FAIL TMP
  ROOT="$(cd "$(dirname "$0")/.." && pwd)"
  EX_DIR="$ROOT/${EX_DIR:-exercises}"
  if [ ! -d "$EX_DIR" ]; then
    echo "Nerastas aplankas $EX_DIR — užduotims paleiskite iš git-bandymas su tests/tikrinti.sh" >&2
    echo "Demonstracijai: bash testai/tikrinti.sh demo" >&2
    exit 2
  fi

  PASS=0
  FAIL=0
  TMP="$(mktemp -d)"
  trap 'rm -rf "$TMP"' EXIT

  green() { printf '\033[32m%s\033[0m\n' "$*"; }
  red()   { printf '\033[31m%s\033[0m\n' "$*"; }

  expect() {
    local desc=$1 want_out=$2 want_code=$3 script=$4
    shift 4
    local out code
    out=$(cd "$TMP" && timeout 5 bash "$EX_DIR/$script" "$@" 2>/dev/null)
    code=$?
    if [[ $out == "$want_out" && $code -eq $want_code ]]; then
      green "  ✅ $desc"
      PASS=$((PASS + 1))
    else
      red "  ❌ $desc"
      echo "     expected (exit $want_code): $(printf '%s' "$want_out" | tr '\n' '|')"
      echo "     got      (exit $code): $(printf '%s' "$out" | tr '\n' '|')"
      FAIL=$((FAIL + 1))
    fi
  }

  expect_stderr() {
    local desc=$1 script=$2
    shift 2
    local err
    err=$(cd "$TMP" && timeout 5 bash "$EX_DIR/$script" "$@" 2>&1 >/dev/null)
    if [[ -n $err ]]; then
      green "  ✅ $desc"
      PASS=$((PASS + 1))
    else
      red "  ❌ $desc (nothing was printed to stderr)"
      FAIL=$((FAIL + 1))
    fi
  }

  should_run() { [[ -z $ONLY || $ONLY == "$1" ]]; }

  if should_run 1; then
    echo "Exercise 1 – greet"
    expect "with a name"       "Hello, Ada!"      0 01_greet.sh Ada
    expect "with no argument"  "Hello, stranger!" 0 01_greet.sh
    expect "name with a space" "Hello, Ada Lovelace!" 0 01_greet.sh "Ada Lovelace"
  fi

  if should_run 2; then
    echo "Exercise 2 – even/odd"
    expect "4 is even"         "4 is even" 0 02_even_odd.sh 4
    expect "7 is odd"          "7 is odd"  0 02_even_odd.sh 7
    expect "0 is even"         "0 is even" 0 02_even_odd.sh 0
    expect "no argument -> exit 1" "" 1 02_even_odd.sh
    expect "not a number -> exit 2" "" 2 02_even_odd.sh abc
    expect_stderr "usage goes to stderr" 02_even_odd.sh
  fi

  if should_run 3; then
    echo "Exercise 3 – countdown"
    expect "from 3"     $'3\n2\n1\nLiftoff!' 0 03_countdown.sh 3
    expect "default 5"  $'5\n4\n3\n2\n1\nLiftoff!' 0 03_countdown.sh
    expect "from 0"     "Liftoff!" 0 03_countdown.sh 0
  fi

  if should_run 4; then
    echo "Exercise 4 – file report"
    mkdir -p "$TMP/d4/sub1" "$TMP/d4/sub2"
    touch "$TMP/d4/a.txt" "$TMP/d4/b.sh" "$TMP/d4/c"
    mkdir -p "$TMP/empty4"
    expect "3 files, 2 dirs"   $'Files: 3\nDirectories: 2' 0 04_file_report.sh d4
    expect "empty folder"      $'Files: 0\nDirectories: 0' 0 04_file_report.sh empty4
    expect "missing folder -> exit 1" "" 1 04_file_report.sh nope
    expect_stderr "error goes to stderr" 04_file_report.sh nope
  fi

  if should_run 5; then
    echo "Exercise 5 – grade"
    expect "95 -> A"  "Grade: A" 0 05_grade.sh 95
    expect "90 -> A"  "Grade: A" 0 05_grade.sh 90
    expect "85 -> B"  "Grade: B" 0 05_grade.sh 85
    expect "70 -> C"  "Grade: C" 0 05_grade.sh 70
    expect "65 -> D"  "Grade: D" 0 05_grade.sh 65
    expect "0 -> F"   "Grade: F" 0 05_grade.sh 0
    expect "120 -> exit 1" "" 1 05_grade.sh 120
    expect "abc -> exit 1" "" 1 05_grade.sh abc
    if grep -qE '^\s*(function\s+)?to_grade\s*(\(\))?\s*\{?' "$EX_DIR/05_grade.sh"; then
      green "  ✅ has a to_grade function"; PASS=$((PASS + 1))
    else
      red "  ❌ no function called to_grade found"; FAIL=$((FAIL + 1))
    fi
  fi

  if should_run 6; then
    echo "Exercise 6 ⭐ – backup"
    mkdir -p "$TMP/src6" "$TMP/notxt6"
    echo hi > "$TMP/src6/one.txt"
    echo yo > "$TMP/src6/two.txt"
    echo no > "$TMP/src6/skip.md"
    expect "copies 2 .txt files" "Backed up 2 file(s) to bk6" 0 06_backup.sh src6 bk6
    if [[ -f $TMP/bk6/one.txt && -f $TMP/bk6/two.txt && ! -e $TMP/bk6/skip.md ]]; then
      green "  ✅ backup folder has exactly the .txt files"; PASS=$((PASS + 1))
    else
      red "  ❌ backup folder content is wrong"; FAIL=$((FAIL + 1))
    fi
    expect "no .txt files"       "Backed up 0 file(s) to bk6b" 0 06_backup.sh notxt6 bk6b
    expect "missing source -> exit 1" "" 1 06_backup.sh nope bk6c
    expect "wrong arg count -> exit 1" "" 1 06_backup.sh src6
  fi

  echo
  local TOTAL=$((PASS + FAIL))
  if [[ $FAIL -eq 0 ]]; then
    green "All $TOTAL checks passed 🎉"
    exit 0
  else
    red "$PASS / $TOTAL checks passed"
    exit 1
  fi
}

MODE="${1:-}"
case "$MODE" in
  demo) run_demo "$2" ;;
  ''|1|2|3|4|5|6) run_exercises "$MODE" ;;
  *)
    echo "Naudojimas: bash …/tikrinti.sh demo [skriptas]" >&2
    echo "           bash …/tikrinti.sh [1-6]" >&2
    exit 2
    ;;
esac