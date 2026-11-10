#!/usr/bin/env bash
# STATUSAS: neišbandyta (peržiūrėta, nepaleista)
# Lokaliame Kubernetes (Docker Desktop Kubernetes, kind mazgas): sukuria API atvaizdą ir įkelia į mazgą, įdiegia ingress-nginx ir cert-manager, išleidžia dev ir prod per Helm.
# Argo CD diegimas ir `kubectl apply -f local/argocd/application.yaml` yra RANKINIAI žingsniai (žr. local/README.md); šis skriptas jų nedaro.
# Reikia: docker, kubectl, helm (~/.local/bin arba PATH) ir veikiančio klasterio (kubectl get nodes).
set -euo pipefail
cd "$(dirname "$0")/../.."
export PATH="$HOME/.local/bin:$PATH"
NODE="${KIND_NODE:-desktop-control-plane}"      # Docker Desktop kind mazgo konteineris
CHART=helm/miniplatforma
LOC=(--set image.repository=etalonas-api --set image.tag=local --set image.pullPolicy=Never)

echo "==> 1/5 API atvaizdas ir įkėlimas į mazgą (be registry)"
docker build -q -t etalonas-api:local app >/dev/null
docker save etalonas-api:local | docker exec -i "$NODE" ctr -n k8s.io images import - >/dev/null

echo "==> 2/5 ingress-nginx"
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx >/dev/null 2>&1 || true
helm repo add jetstack https://charts.jetstack.io >/dev/null 2>&1 || true
helm repo update >/dev/null
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx --create-namespace \
  --set controller.service.type=ClusterIP --set controller.allowSnippetAnnotations=true \
  --set controller.config.annotations-risk-level=Critical --wait --timeout 5m >/dev/null

echo "==> 3/5 cert-manager + self-signed išdavėjas"
helm upgrade --install cert-manager jetstack/cert-manager -n cert-manager --create-namespace \
  --set crds.enabled=true --wait --timeout 5m >/dev/null
for i in $(seq 1 20); do kubectl apply -f k8s/cluster-issuer.yaml >/dev/null 2>&1 && break; sleep 3; done

echo "==> 4/5 dev (slaptažodis iš values) ir prod (slaptažodis atskiras Secret)"
for ns in dev prod; do kubectl create ns "$ns" --dry-run=client -o yaml | kubectl apply -f - >/dev/null; done
kubectl -n prod get secret db-secret >/dev/null 2>&1 || \
  kubectl -n prod create secret generic db-secret --from-literal=DB_PASSWORD="$(openssl rand -hex 12)" >/dev/null
helm upgrade --install etalonas $CHART -n dev  -f $CHART/values-dev.yaml  "${LOC[@]}" >/dev/null
# be --wait: kopijų PVC (WaitForFirstConsumer) lieka Pending iki pirmo CronJob paleidimo
helm upgrade --install etalonas $CHART -n prod -f local/values-local.yaml "${LOC[@]}" >/dev/null

echo "==> 5/5 laukiame, kol pod'ai pasiruoš"
for ns in dev prod; do
  kubectl -n "$ns" rollout status statefulset/etalonas-postgres --timeout=240s >/dev/null
  kubectl -n "$ns" rollout status deploy/etalonas-api --timeout=240s >/dev/null
done
kubectl -n prod get certificate

cat <<EOT

Paruošta. Patikra:
  kubectl -n ingress-nginx port-forward svc/ingress-nginx-controller 8443:443 &
  ./local/scripts/test.sh
EOT
