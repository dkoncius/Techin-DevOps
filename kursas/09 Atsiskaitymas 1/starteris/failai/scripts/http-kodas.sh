#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Naudojimas: $0 <url>" >&2
  exit 2
fi

kodas=$(curl -s -o /dev/null -w "%{http_code}" "$1")
echo "$kodas"
