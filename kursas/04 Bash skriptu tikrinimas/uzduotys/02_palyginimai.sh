#!/usr/bin/env bash
# 2 užduotis. Trys palyginimai (README 6–7 skyriai)
# Tikslas: trys patikros, kiekviena išveda vieną eilutę, kuri prasideda ✅ arba ❌.
#   1) git           -> išvestyje yra "OK      git" (šeši tarpai)
#   2) neegzistuoja  -> kodas 1
#   3) neegzistuoja  -> išvestyje NĖRA "Trūksta:" (ši eilutė turi eiti į klaidų kanalą)
# Su teisingu patikra.sh turi būti trys ✅. Su sugadintu kuri nors eilutė tampa ❌.

S="${1:-./scripts/patikra.sh}"

# 1 patikra (pavyzdys, jau parašyta)
OUT=$("$S" git 2>/dev/null)
if printf '%s\n' "$OUT" | grep -qF -- "OK      git"; then echo "✅ git -> OK"; else echo "❌ git -> OK"; fi

# TODO 1: paleiskite "$S" neegzistuoja, išvestis į OUT, kodas į KODAS

# TODO 2: patikra: KODAS lygus 1  ->  "✅ neegzistuoja -> kodas 1" arba "❌ neegzistuoja -> kodas 1"

# TODO 3: patikra: išvestyje NĖRA "Trūksta:"  ->  "✅ Trūksta: ne išvestyje" arba "❌ Trūksta: ne išvestyje"
