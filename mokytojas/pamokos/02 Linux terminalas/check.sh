#!/usr/bin/env bash
# check.sh – pamokos 02 savitikra (Linux terminalas).
# Naudojimas: ./check.sh [kelias_i_projekta]   (arba nustatykite PROJEKTO_KELIAS)
# Skriptas tik skaito: nieko nekeičia ir neskaito .env turinio.
# Veikia macOS (bash 3.2) ir Ubuntu (WSL).

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

echo "Pamoka 02: tikrinu $PROJEKTAS"

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

# 5. Ar yra šaka šiai pamokai (vietinė arba nusiųsta į GitHub)
SAKA=""
if git -C "$PROJEKTAS" rev-parse --verify --quiet "refs/heads/pamoka-02" >/dev/null; then
  SAKA="pamoka-02"
elif git -C "$PROJEKTAS" rev-parse --verify --quiet "refs/remotes/origin/pamoka-02" >/dev/null; then
  SAKA="origin/pamoka-02"
fi
if [ -n "$SAKA" ]; then
  ok "šaka pamoka-02 egzistuoja"
else
  nepavyko "šakos pamoka-02 nerasta" "sukurkite šaką komanda git switch -c pamoka-02"
fi

# 6. Ar šakoje yra jūsų commit'as (paskutinio commit'o autoriaus el. paštas sutampa su jūsų)
if [ -n "$SAKA" ]; then
  AUTORIUS="$(git -C "$PROJEKTAS" log -1 --format=%ae "$SAKA" 2>/dev/null || true)"
  if [ -n "$PASTAS" ] && [ "$AUTORIUS" = "$PASTAS" ]; then
    ok "šakoje yra jūsų commit'as"
  else
    nepavyko "paskutinis šakos commit'as ne jūsų (autorius: ${AUTORIUS:-nėra})" "padarykite git add ir git commit šioje šakoje"
  fi
fi

# 7. Ar nėra neįkomituotų pakeitimų
if [ -z "$(git -C "$PROJEKTAS" status --porcelain 2>/dev/null)" ]; then
  ok "visi pakeitimai įkomituoti"
else
  nepavyko "yra neįkomituotų pakeitimų" "pažiūrėkite git status, tada git add ir git commit"
fi

pabaiga
