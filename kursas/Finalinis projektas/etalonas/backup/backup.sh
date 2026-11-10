#!/usr/bin/env bash
# Automatizuota DB kopija (G reikalavimas). Paleisti iš etalonas/ aplanko, pvz. per cron:
#   0 * * * * cd /opt/etalonas && ./backup/backup.sh
set -euo pipefail
cd "$(dirname "$0")/.."
set -a; . ./.env; set +a

OUT_DIR="${BACKUP_DIR:-./backup/out}"
KEEP="${BACKUP_KEEP:-7}"
mkdir -p "$OUT_DIR"
FILE="$OUT_DIR/notes-$(date +%Y%m%d-%H%M%S).sql.gz"

docker compose exec -T db pg_dump -U "$DB_USER" "$DB_NAME" | gzip > "$FILE"
[ -s "$FILE" ] || { echo "Kopija tuščia" >&2; rm -f "$FILE"; exit 1; }
echo "OK: $FILE"

# palikti tik naujausias $KEEP kopijų
ls -1t "$OUT_DIR"/notes-*.sql.gz | tail -n +"$((KEEP + 1))" | xargs -r rm -f
