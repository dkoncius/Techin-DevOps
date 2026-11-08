#!/usr/bin/env bash
# check.sh – pamokos 01 savitikra (Kas yra DevOps).
# Naudojimas: ./check.sh [kelias_i_projekta]   (arba nustatykite PROJEKTO_KELIAS)
# Skriptas tik skaito: nieko nekeičia ir neskaito .env turinio.
# Veikia macOS, Linux ir Git Bash.

set -euo pipefail

PROJEKTAS="${1:-${PROJEKTO_KELIAS:-$PWD}}"
KLAIDU=0

ok() { echo "OK: $1"; }
nepavyko() {
  echo "nepavyko, nes $1"
  if [ -n "${2:-}" ]; then echo "   Užuomina: $2"; fi
  KLAIDU=$((KLAIDU + 1))
}
pabaiga() {
  echo
  if [ "$KLAIDU" -eq 0 ]; then
    echo "Rezultatas: OK, visi tikrinimai praėjo."
    exit 0
  fi
  echo "Rezultatas: nepavyko ($KLAIDU). Pataisykite ir paleiskite iš naujo."
  exit 1
}

echo "Pamoka 01: tikrinu $PROJEKTAS"

# 1. Ar Git įdiegtas
if command -v git >/dev/null 2>&1; then
  ok "Git įdiegtas"
else
  nepavyko "komanda git nerasta" "įdiekite Git (git-scm.com) ir atidarykite terminalą iš naujo"
  pabaiga
fi

# 2. Ar tai Git repozitorija
if [ -d "$PROJEKTAS" ] && git -C "$PROJEKTAS" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  ok "aplankas yra Git repozitorija"
else
  nepavyko "$PROJEKTAS nėra Git repozitorija" "nurodykite kelią į nusiklonuotą savo devops-projektas aplanką"
  pabaiga
fi

# 3. Ar origin rodo į GitHub (ir ne į kurso repozitoriją)
ORIGIN="$(git -C "$PROJEKTAS" remote get-url origin 2>/dev/null || true)"
case "$ORIGIN" in
  "") nepavyko "nėra nuorodos origin" "klonuokite savo devops-projektas iš GitHub (git clone ...)" ;;
  *devops-kursas*) nepavyko "origin rodo į kurso repozitoriją devops-kursas" "darbo projektas turi būti jūsų kopija iš šablono devops-projektas" ;;
  *github.com*) ok "origin rodo į GitHub" ;;
  *) nepavyko "origin nerodo į GitHub" "patikrinkite komanda: git remote -v" ;;
esac

# 4. Ar nustatytas Git vardas ir el. paštas
VARDAS="$(git -C "$PROJEKTAS" config user.name 2>/dev/null || true)"
PASTAS="$(git -C "$PROJEKTAS" config user.email 2>/dev/null || true)"
if [ -n "$VARDAS" ] && [ -n "$PASTAS" ]; then
  ok "nustatyti user.name ir user.email"
else
  nepavyko "nenustatytas user.name arba user.email" "naudokite git config --global user.name ir git config --global user.email"
fi

# 5. Ar yra bent 2 commit'ai (šablono pradinis + jūsų sulietas pirmas PR)
KIEKIS="$(git -C "$PROJEKTAS" rev-list --count HEAD 2>/dev/null || echo 0)"
if [ "$KIEKIS" -ge 2 ]; then
  ok "yra bent 2 commit'ai ($KIEKIS)"
else
  nepavyko "yra tik $KIEKIS commit'as" "sulieję PR GitHub'e, savo kompiuteryje padarykite git pull"
fi

# 6. Ar yra šaka, sukurta šiai pamokai (vietinė arba nusiųsta į GitHub)
if git -C "$PROJEKTAS" rev-parse --verify --quiet "refs/heads/pamoka-01" >/dev/null \
   || git -C "$PROJEKTAS" rev-parse --verify --quiet "refs/remotes/origin/pamoka-01" >/dev/null; then
  ok "šaka pamoka-01 egzistuoja"
else
  nepavyko "šakos pamoka-01 nerasta" "sukurkite šaką komanda git switch -c pamoka-01 (ir nesunaikinkite jos, kol nesulieta)"
fi

# 7. Ar main šakoje yra docs/devops.md ir jis ne tuščias (turi būti sulietas PR)
if git -C "$PROJEKTAS" rev-parse --verify --quiet "refs/heads/main" >/dev/null; then
  TURINYS="$(git -C "$PROJEKTAS" show main:docs/devops.md 2>/dev/null || true)"
  if [ -n "$TURINYS" ]; then
    ok "main šakoje yra docs/devops.md ir jis ne tuščias"
  else
    nepavyko "main šakoje nėra docs/devops.md arba jis tuščias" "sulieti Pull Request GitHub'e, tada savo kompiuteryje git switch main ir git pull"
  fi
else
  nepavyko "vietinės šakos main nėra" "patikrinkite: git branch"
fi

pabaiga
