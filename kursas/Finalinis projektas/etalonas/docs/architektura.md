# Architektūra

```mermaid
flowchart LR
  dev[Programuotojas] -->|git push| gh[GitHub]
  gh --> ci[GitHub Actions: ruff, pytest, Trivy, gitleaks, build]
  ci -->|atvaizdas| ghcr[(GHCR)]
  ci -->|nauja image.tag Git'e| gh
  gh -->|sinchronizuoja| argo[Argo CD]
  argo --> k8s

  subgraph k8s[Kubernetes: namespace dev / prod]
    ing[Ingress nginx + TLS cert-manager] --> api[API x2]
    api --> pg[(PostgreSQL StatefulSet + PVC)]
    cron[CronJob pg_dump] --> bk[(Kopijų PVC)]
    cron --> pg
  end

  user[Vartotojas] -->|HTTPS| ing
  subgraph mon[Stebėjimas]
    prom[Prometheus] --> graf[Grafana]
    loki[Loki] --> graf
    prom --> am[Alertmanager]
  end
  prom -. skaito /metrics .-> api
  api -. logai .-> loki
```

## Aplinkos
| Aplinka | Įrankis | Paskirtis |
|---|---|---|
| Compose | `docker-compose.yml` | 1 etapas, greitas lokalus paleidimas |
| Kubernetes dev / prod | Helm (`values-dev.yaml`, `local/values-local.yaml`) | 2 etapas; tas pats chart'as, skirtingos values |
| VM | Terraform (`azure/terraform`) + Ansible (`ansible/`) | A reikalavimas |
| Lokalus Terraform | `terraform/local` | 28 sav. pamokos pavyzdys be debesies |
