#!/usr/bin/env bash
# 1 užduotis. Išvestis ir kodas į kintamuosius
S="${1:-./scripts/patikra.sh}"

OUT=$("$S" git 2>/dev/null)
KODAS=$?
echo "git: kodas $KODAS"

OUT=$("$S" neegzistuoja 2>/dev/null)
KODAS=$?
echo "neegzistuoja: kodas $KODAS"
echo "neegzistuoja: $(printf '%s\n' "$OUT" | head -n 1)"
