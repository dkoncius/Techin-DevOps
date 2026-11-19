#!/usr/bin/env bash
# 2 užduotis. Trys palyginimai

OUT=$(./scripts/patikra.sh git 2>/dev/null)
if printf '%s\n' "$OUT" | grep -qF -- "OK      git"; then echo "✅ git -> OK"; else echo "❌ git -> OK"; fi

OUT=$(./scripts/patikra.sh neegzistuoja 2>/dev/null)
KODAS=$?
if [ "$KODAS" -eq 1 ]; then echo "✅ neegzistuoja -> kodas 1"; else echo "❌ neegzistuoja -> kodas 1"; fi

if ! printf '%s\n' "$OUT" | grep -qF -- "Trūksta:"; then echo "✅ Trūksta: ne išvestyje"; else echo "❌ Trūksta: ne išvestyje"; fi