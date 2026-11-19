#!/usr/bin/env bash
# 1 užduotis. Išvestis ir kodas į kintamuosius

OUT=$(./scripts/patikra.sh git 2>/dev/null)
KODAS=$?
echo "git: kodas $KODAS"

OUT=$(./scripts/patikra.sh neegzistuoja 2>/dev/null)
KODAS=$?
echo "neegzistuoja: kodas $KODAS"
echo "neegzistuoja: $(printf '%s\n' "$OUT" | head -n 1)"