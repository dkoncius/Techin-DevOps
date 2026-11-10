# TODO: etalonas

Kas padaryta ir išbandyta: žr. [README.md](README.md). Čia tik tai, kas liko.

## Reikia jūsų paskyrų (aš negaliu padaryti vienas)
- [ ] **Azure**: paskyra ir VM jau yra (`terraform plan` rodo „No changes“). Liko pasitikrinti kainą (žr. `azure/terraform/README.md`) ir išbandyti `destroy`; po darbo `./azure/scripts/deallocate.sh`.
- [ ] **Domenas** (~10 €/mėn.) + Let's Encrypt ClusterIssuer vietoje `selfsigned`.

## Techninis darbas
- [ ] up.sh (`local/scripts/up.sh`) perrašyti ir išbandyti: iki 12–13 sav.
- [ ] **Argo CD**: Argo CD ir Application objektai (`etalonas-prod`, `etalonas-azure`) jau veikia abiejuose klasteriuose; liko išbandyti sinchronizavimą ir drift taisymą (automated/selfHeal dar neįjungta).
- [ ] **Kubernetes stebėjimas**: Prometheus, Grafana ir Loki klasteryje (dabar tik Compose), ServiceMonitor/scrape ir perspėjimai.
- [ ] **fail2ban** išbandyti tikroje VM (konteineryje praleistas).
- [ ] **Ansible prieš tikrą Azure VM** (VM jau sukurta).
- [ ] **Vault** (neprivalomas, plane 25.1): paslaptis iš Vault vietoje K8s Secret.
- [ ] **Helm/K8s gedimas Nr. 3 (blogas Secret)** išbandyti iki galo: po `rollout restart` pod'ai turi nukristi.
- [x] Į CI pridėti `trivy config` ir Helm `lint` (`helm lint` dar neįvykdytas CI).
- [ ] Grafana skydelis: pridėti serverio resursus (node_exporter), nes 26.3 pamoka to reikalauja: iki 26.3 (2027-03-10), JSON provisioning.

## Pamokos ir egzaminas
- [ ] **Pamokų skill'as** (`.claude/skills/pamokos-medziaga`): skaidrės + užduotis iš etalono dalių pagal `programa/iki-gruodzio.md`. Pirma tema: Dockerfile ir Compose (12.2–12.3).
- [ ] Suderinti etaloną su pamokų planu: `HEALTHCHECK`, `pg_dump` vs Restic (27.4).
- [ ] **Egzamino aplikacija**: nauja, atskira (ne užrašai), su savo repozitorija, vertinimo lapu ir 3–4 gedimais.
- [ ] Tas pats `scripts/check.sh` pritaikytas egzamino aplikacijai.
- [ ] Vienas puslapis „prieš / po“ studentams (iš `planas.md` 4 skyriaus).
- [ ] Atsakyti į atvirus planavimo klausimus (`programa/visi-metai.md`): Azure variantas A/B/C iki 2027-04-16.

## Žinomi apribojimai
- `helm install --wait` prod'ui stringa, kol kopijų PVC `Pending` (aprašyta `docs/runbook.md`).
- Terraform Docker provider macOS: `DOCKER_HOST=unix://$HOME/.docker/run/docker.sock`.
- Įrankiai (`helm`, `terraform`, `ansible-playbook`) yra `~/.local/bin`, ne per Homebrew (nebuvo teisių).
- [ ] Lenktynių sąlyga: du gunicorn worker'iai vienu metu daro `create_all` prieš tuščią PostgreSQL, vienas nulūžta (UniqueViolation); Kubernetes paslepia restartu; sprendimas atskiroje šakoje (`pg_advisory_lock` arba `IntegrityError` gaudymas): prie 13.x / 14.4, gali likti kaip sugadinta užduotis.

## Azure kreditai
- Azure prenumerata yra kreditų tipo: likutis €179,54 (2026-11-07), kreditai galioja iki ~2026-12-06 (29 dienos). Pasibaigus „services will be paused“.
- [ ] Išsiaiškinti, kur dingo ~€20 nuo pradinio likučio: portalas → Cost Management + Billing → Credits (pradinis balansas, likutis, galiojimas); Cost analysis rodo „NotFound“, bandyti rytoj; `az resource list` rodo tik `rg-etalonas` ir `NetworkWatcherRG`, nieko pamiršto.
- [ ] Iki ~2026-12-06 nuspręsti: Upgrade to Pay-As-You-Go (tada galioja 35 € biudžetas ir perspėjimai) arba mokyklos prenumerata (laiškas `laiskas-mokyklai-azure.md`, kurso dokumentuose, ne šiame repo). Bendras k3s mokiniams turi veikti nuo 2026-11-30.
- [ ] Po 2026-11-07 patikrinti Credits skiltį kasdien kelias dienas ir užrašyti, kiek kreditų sunaudoja veikianti VM.
- [ ] Azure VM faktiškai yra `Standard_B2s_v2` (ne B2ms); pataisyti dokumentuose, jei dar rodo B2ms.

## Darbai pagal paskaitas
Terminai up.sh, node_exporter ir create_all punktams įrašyti prie esamų punktų aukščiau.
- [ ] Starterio šablono repozitorija iš `app/` (programa + testai + README su „app contract“: `/health`, konfigūracija per env, DB per `DATABASE_URL`, logai į stdout; be infrastruktūros): iki 2026-11-24 (12.2).
- [ ] Ingress + TLS (lokaliai ir Azure, adresas per https, dingtų „Not Secure“): iki 2026-12-08 (14.2).
- [ ] `ci.yml`: pašalinti dubliuotą lint/template (eilutės ~55 ir ~62); atnaujinti GitHub Actions versijas (Node 20 įspėjimai).
- [ ] Senas `terraform/azure/` aplankas diske (state, tfvars, `.terraform/`): ištrinti tik po kelių dienų, kai viskas patvirtinta; atsarginė kopija `~/etalonas-tfstate-backup-2026-11-07/`.
- [ ] Kasdien po darbo: `az vm deallocate` ir patikrinti portale „Stopped (deallocated)“.
