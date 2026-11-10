# Runbook

## Greita būklės patikra
```bash
./scripts/check.sh                 # visi punktai turi būti PASS
docker compose ps
docker compose logs --tail=50 api
```

## Incidentai

| Simptomas | Pirmas žingsnis | Dažniausia priežastis |
|-----------|-----------------|-----------------------|
| `/health` 503, `db: down` | `docker compose logs db` | DB nepakilo / blogas slaptažodis / pilnas diskas |
| 502 iš Nginx | `docker compose logs nginx` | `api` nepasiekiamas / blogas `proxy_pass` |
| `/notes` 500 | `docker compose logs api` | trūksta lentelės → atkurti iš kopijos |

## Atkūrimas iš kopijos
```bash
ls -1t backup/out | head
./backup/restore.sh backup/out/notes-YYYYMMDD-HHMMSS.sql.gz
docker compose restart api
./scripts/check.sh
```

## Atnaujinimas
Sukurti tag'ą `vX.Y.Z` → CI sukuria atvaizdą GHCR → atnaujinti `image.tag` Helm values (arba Argo CD pats) → `helm upgrade`.

## Kubernetes
```bash
kubectl -n prod get pods,pvc,certificate
kubectl -n prod logs deploy/etalonas-api --tail=50
kubectl -n prod describe pod <pod>       # Events: ErrImagePull, OOMKilled ...
helm history etalonas -n prod
helm rollback etalonas -n prod           # grįžti į paskutinę veikiančią versiją
```

| Simptomas | Priežastis | Veiksmas |
|---|---|---|
| `ErrImagePull` | blogas atvaizdas/žyma | `helm rollback`, pataisyti `image.tag` |
| `CrashLoopBackOff` + `OOMKilled` | per mažas `limits.memory` | padidinti limitą, `helm upgrade` |
| Pakeistas Secret, bet pod'ai tie patys | Secret pokytis nerestartina pod'ų | `kubectl rollout restart deploy/etalonas-api` |
| `helm install --wait` nutrūksta | kopijų PVC `Pending` iki pirmo CronJob | netaikyti `--wait` prod'ui arba paleisti `kubectl create job --from=cronjob/etalonas-backup x` |

### Kopija ir atkūrimas
```bash
kubectl -n prod create job --from=cronjob/etalonas-backup rankinis-$(date +%s)
./backup/k8s-restore.sh prod            # atkuria naujausią kopiją ir perkrauna API
```
