#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Naudojimas: $0 <portas>" >&2
  exit 2
fi
if ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$1" -lt 1 ] || [ "$1" -gt 65535 ]; then
  echo "Portas turi būti skaičius 1–65535: $1" >&2
  exit 2
fi

if lsof -nP -iTCP:"$1" -sTCP:LISTEN >/dev/null 2>&1; then
  echo "Portas $1 užimtas"
  exit 1
fi
echo "Portas $1 laisvas"
