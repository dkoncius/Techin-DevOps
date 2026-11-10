#!/usr/bin/env bash
# Atkūrimas iš kopijos: ./backup/restore.sh backup/out/notes-XXXX.sql.gz
set -euo pipefail
cd "$(dirname "$0")/.."
set -a; . ./.env; set +a
FILE="${1:?nurodykite kopijos failą}"

docker compose exec -T db psql -U "$DB_USER" -d postgres -c "DROP DATABASE IF EXISTS $DB_NAME WITH (FORCE)"
docker compose exec -T db psql -U "$DB_USER" -d postgres -c "CREATE DATABASE $DB_NAME"
gunzip -c "$FILE" | docker compose exec -T db psql -U "$DB_USER" -d "$DB_NAME" -q
echo "Atkurta iš $FILE"
