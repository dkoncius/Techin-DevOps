#!/usr/bin/env bash
# Atkūrimas Kubernetes aplinkoje iš CronJob kopijos.
# Naudojimas: ./backup/k8s-restore.sh <namespace> [release=etalonas] [kopijos-failas|latest]
set -euo pipefail
NS="${1:?namespace}"; REL="${2:-etalonas}"; FILE="${3:-latest}"
DB_POD="${REL}-postgres-0"; SECRET="${DB_SECRET:-db-secret}"
PW=$(kubectl -n "$NS" get secret "$SECRET" -o jsonpath='{.data.DB_PASSWORD}' | base64 -d)

# kopijų PVC prijungiame laikinam pod'ui
kubectl -n "$NS" delete pod restore-helper --ignore-not-found >/dev/null
kubectl -n "$NS" apply -f - >/dev/null <<EOF
apiVersion: v1
kind: Pod
metadata: {name: restore-helper}
spec:
  restartPolicy: Never
  containers:
    - name: h
      image: postgres:16-alpine
      command: ["sleep", "600"]
      env: [{name: PGPASSWORD, value: "$PW"}]
      volumeMounts: [{name: b, mountPath: /backup}]
  volumes: [{name: b, persistentVolumeClaim: {claimName: ${REL}-backup}}]
EOF
kubectl -n "$NS" wait --for=condition=Ready pod/restore-helper --timeout=90s >/dev/null
[ "$FILE" = latest ] && FILE=$(kubectl -n "$NS" exec restore-helper -- sh -c 'ls -1t /backup/notes-*.sql.gz | head -1')
echo "Atkuriama iš: $FILE"
kubectl -n "$NS" exec restore-helper -- sh -c "
  psql -h ${REL}-postgres -U notes -d postgres -qc 'DROP DATABASE IF EXISTS notes WITH (FORCE)' &&
  psql -h ${REL}-postgres -U notes -d postgres -qc 'CREATE DATABASE notes' &&
  gunzip -c $FILE | psql -h ${REL}-postgres -U notes -d notes -q"
kubectl -n "$NS" delete pod restore-helper --wait=false >/dev/null
kubectl -n "$NS" rollout restart deploy/${REL}-api >/dev/null
kubectl -n "$NS" rollout status deploy/${REL}-api --timeout=120s | tail -1
