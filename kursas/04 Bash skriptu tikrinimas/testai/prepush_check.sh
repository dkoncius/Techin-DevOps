#!/usr/bin/env bash
# Patikra prieš push: ar aplankas paruoštas kelti į Git.
#   ./testai/prepush_check.sh
# Kodas 0 = galima kelti, 1 = pirma reikia ką nors pataisyti.

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT" || exit 1

ERRORS=0
WARNINGS=0
ok()   { printf '\033[32m  ✅ %s\033[0m\n' "$*"; }
warn() { printf '\033[33m  ⚠️  %s\033[0m\n' "$*"; WARNINGS=$((WARNINGS + 1)); }
bad()  { printf '\033[31m  ❌ %s\033[0m\n' "$*"; ERRORS=$((ERRORS + 1)); }

# ---------------------------------------------------------------- 1. struktūra
echo "1. Privalomi failai ir aplankai"
for d in scripts uzduotys sprendimai testai; do
  if [ -d "$d" ]; then ok "aplankas $d/"; else bad "trūksta aplanko $d/"; fi
done
for f in README.md .gitignore testai/check.sh scripts/patikra.sh scripts/skaiciuok.sh \
         uzduotys/0{1..6}_*.sh; do
  if [ -f "$f" ]; then ok "$f"; else bad "trūksta failo $f"; fi
done

# ---------------------------------------------------------------- 2. .sh failai
echo "2. Skriptai (shebang, vykdomas, sintaksė)"
while IFS= read -r -d '' f; do
  problemos=""
  head -n 1 "$f" | grep -q '^#!.*bash' || problemos="$problemos; nėra bash shebang"
  [ -x "$f" ] || problemos="$problemos; nevykdomas (chmod +x $f)"
  bash -n "$f" 2>/dev/null || problemos="$problemos; sintaksės klaida (bash -n $f)"
  grep -q $'\r' "$f" && problemos="$problemos; Windows eilučių pabaigos"
  if [ -z "$problemos" ]; then
    ok "$f"
  else
    bad "$f${problemos}"
  fi
done < <(find . -name '*.sh' -not -path './.git/*' -print0 | sort -z)

# ---------------------------------------------------------------- 3. nebaigta
echo "3. Nebaigtas darbas"
todo=$(grep -l 'TODO' uzduotys/*.sh 2>/dev/null)
if [ -z "$todo" ]; then
  ok "uzduotys/ neliko TODO"
else
  warn "TODO dar yra: $(echo $todo)"
fi
if ./testai/check.sh >/dev/null 2>&1; then
  ok "visos užduočių patikros praeina"
else
  warn "kai kurios užduotys dar nepraeina (./testai/check.sh)"
fi

# ---------------------------------------------------------------- 4. šiukšlės
echo "4. Šiukšlės ir dideli failai"
junk=$(find . -not -path './.git/*' -type f \
       \( -name '.DS_Store' -o -name 'Thumbs.db' -o -name '*.swp' \
          -o -name '*~' -o -name '*.tmp' -o -name '*.log' \) )
if [ -z "$junk" ]; then ok "šiukšlių nėra"; else warn "rasta šiukšlių (ar jos .gitignore?): $(echo $junk)"; fi
big=$(find . -not -path './.git/*' -type f -size +1M)
if [ -z "$big" ]; then ok "nėra failų didesnių nei 1 MB"; else bad "dideli failai: $(echo $big)"; fi

# ---------------------------------------------------------------- 5. slaptažodžiai
echo "5. Slaptažodžiai ir raktai"
secrets=$(grep -rIlE --exclude-dir=.git --exclude=prepush_check.sh \
  '(password|passwd|secret|api[_-]?key|token)[[:space:]]*=[[:space:]]*["'\''][^"'\'']+|BEGIN (RSA|OPENSSH) PRIVATE KEY|ghp_[A-Za-z0-9]{20,}' . )
if [ -z "$secrets" ]; then ok "slaptažodžių ir raktų nerasta"; else bad "galimi slapti duomenys: $(echo $secrets)"; fi

# ---------------------------------------------------------------- 6. Git
echo "6. Git"
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  bad "ne Git repozitorija (git init)"
else
  ok "Git repozitorija"
  if git log -1 >/dev/null 2>&1; then ok "yra bent vienas commit'as"; else bad "commit'ų nėra (git add . && git commit -m '...')"; fi
  branch=$(git branch --show-current 2>/dev/null)
  [ -n "$branch" ] && ok "šaka: $branch"
  if [ -n "$(git status --porcelain)" ]; then
    warn "yra neįrašytų pakeitimų:"; git status --short | sed 's/^/        /'
  else
    ok "darbinis medis švarus"
  fi
  if git remote | grep -q .; then
    ok "remote: $(git remote get-url "$(git remote | head -n 1)")"
    if git rev-parse --abbrev-ref '@{u}' >/dev/null 2>&1; then
      ok "$(git rev-list --count '@{u}..HEAD') commit'(ai) paruošti push"
    else
      warn "dar nėra upstream (pirmas push: git push -u origin $branch)"
    fi
  else
    warn "remote nenustatytas (git remote add origin <url>)"
  fi
  tracked_junk=$(git ls-files | grep -E '(\.DS_Store|\.swp|~)$')
  [ -z "$tracked_junk" ] || bad "Git seka šiukšles: $tracked_junk (git rm --cached <failas>)"
fi

# ---------------------------------------------------------------- santrauka
echo
if [ "$ERRORS" -gt 0 ]; then
  printf '\033[31m❌ %d klaida(-os), %d įspėjimas(-ai): pirma pataisykite klaidas.\033[0m\n' "$ERRORS" "$WARNINGS"
  exit 1
fi
printf '\033[32m✅ Galima kelti\033[0m (%d įspėjimas(-ai))\n' "$WARNINGS"
exit 0
