# Rizikų lentelė (E reikalavimas)

| Rizika | Tikimybė | Poveikis | Priemonė | Būsena |
|--------|----------|----------|----------|--------|
| Slaptažodžiai repozitorijoje | vidutinė | aukštas | `.env` ignoruojamas, `.env.example`, K8s Secret kuriamas komanda, gitleaks CI | įgyvendinta |
| Konteineris veikia kaip root | vidutinė | aukštas | `USER 10001`, `runAsNonRoot`, `allowPrivilegeEscalation: false` | įgyvendinta |
| Pažeidžiami atvaizdai/priklausomybės | aukšta | vidutinis | Trivy CI (CRITICAL/HIGH), fiksuotos versijos | įgyvendinta |
| `/metrics` pasiekiamas iš interneto | vidutinė | žemas | Nginx `deny all`, Prometheus skaito tiesiogiai | įgyvendinta |
| Brutalus SSH | aukšta | aukštas | tik raktas, root išjungtas, fail2ban, NSG tik mano IP | įgyvendinta (Ansible/Terraform) |
| Duomenų praradimas | vidutinė | aukštas | `pg_dump` kas valandą, įrodytas atkūrimas | įgyvendinta |
| Nešifruotas srautas | vidutinė | vidutinis | TLS per Ingress + cert-manager, HSTS su TLS | K8s |
| `/metrics` per Ingress | vidutinė | žemas | Ingress `location = /metrics { return 403; }`; rasta ir ištaisyta testuojant | įgyvendinta |
| Konteineris gali rašyti į savo FS | vidutinė | vidutinis | `readOnlyRootFilesystem` + `emptyDir` /tmp; rasta Trivy | įgyvendinta |
| Paslaptys Helm values faile | vidutinė | aukštas | prod naudoja `existingSecret`; dev slaptažodis tik dev | įgyvendinta |
| Vienas DB egzempliorius (SPOF) | aukšta | vidutinis | priimta rizika; RTO/RPO žemiau | priimta |

## RTO / RPO

| Rodiklis | Reikšmė | Pagrindimas |
|----------|---------|-------------|
| **RPO** (kiek duomenų galima prarasti) | iki 1 val. | kopija kas valandą (`backup.sh` per cron; Kubernetes CronJob `0 * * * *`, prod `*/30`) |
| **RTO** (per kiek laiko atstatoma) | ≤ 15 min. | išmatuota: Compose ~1 min., Kubernetes (`k8s-restore.sh`) 14 s su mažu kiekiu duomenų |
