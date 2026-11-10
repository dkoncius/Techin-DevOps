# Gedimų scenarijai (egzaminui ir pratyboms)

Egzamino metu studentui atsitiktinai paskiriamas vienas gedimas. Studentas turi **diagnozuoti ir pataisyti**, o gynime paaiškinti priežastį. Visus Compose variantus galima išbandyti iš `etalonas/`.

| # | Gedimas | Kaip sugadinti (Compose) | Simptomas | Kaip diagnozuoti | Taisymas |
|---|---------|--------------------------|-----------|------------------|----------|
| 1 | Blogas DB slaptažodis | `.env` pakeisti `DB_PASSWORD`, `docker compose up -d api` (DB tomas jau turi seną) | `/health` 503, `db: down` | `docker compose logs api db` → `password authentication failed` | Grąžinti slaptažodį arba `ALTER USER` |
| 2 | Pilnas diskas | `docker compose exec db fallocate -l 100G /var/lib/postgresql/data/pad` (arba mažas tmpfs) | Rašymas į DB meta klaidą | `df -h`, `docker system df`, DB logai `No space left` | Ištrinti failą, išvalyti `docker system prune`, nustatyti perspėjimą |
| 3 | Neteisingas Nginx upstream | `nginx/default.conf` `proxy_pass http://api:8001;` | 502 Bad Gateway | `docker compose logs nginx` → `connect() failed` | Pataisyti portą, `nginx -t`, reload |
| 4 | Sugadinta DB | `docker compose exec db psql -U notes -d notes -c "DROP TABLE notes"` | `/notes` 500 | API logai `relation "notes" does not exist` | `./backup/restore.sh <failas>`, `docker compose restart api` |

## Kubernetes variantai

| # | Gedimas | Kaip sugadinti | Diagnozė |
|---|---------|----------------|----------|
| 1 | Blogas Secret | `kubectl -n etalonas create secret ... --dry-run=client -o yaml \| kubectl apply -f -` su kita reikšme | `kubectl logs`, pod'ai `CrashLoop`/not ready |
| 2 | Neteisingas Ingress | `host` ar `service.name` klaida | `kubectl describe ingress`, 404/502 |
| 3 | Per mažas `limits.memory` | `limits.memory: 8Mi` | `OOMKilled` per `kubectl describe pod` |
| 4 | Neegzistuojantis atvaizdas | `image: ...:tag-nera` | `ImagePullBackOff` |

## Vertinimas
Diagnozės žingsniai (kur žiūrėjo pirmiausia) yra svarbiau už patį pataisymą. Mokytojas žiūri: logai → hipotezė → patikrinimas → taisymas → įrodymas (`scripts/check.sh` žalias).

## Išbandymo rezultatai (Kubernetes, Helm)
| Gedimas | Išbandyta | Rezultatas |
|---|---|---|
| Neegzistuojantis atvaizdas | taip | `ErrImagePull`, senas pod'as dirba toliau (rolling update), `helm rollback` atstato |
| Per mažas atminties limitas (8Mi) | taip | `CrashLoopBackOff`, paskutinė būsena `OOMKilled` |
| Blogas DB slaptažodis per Helm | taip, **nesukėlė gedimo iškart** | Secret pasikeitė, bet veikiantys pod'ai nesikrovė. Gedimas atsiranda tik po `rollout restart` - gera pamoka |
| Sugadinta DB (`DROP TABLE`) | taip | `/notes` 500; `k8s-restore.sh` atkuria per 14 s |
