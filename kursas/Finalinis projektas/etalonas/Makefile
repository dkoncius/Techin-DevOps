# Dažniausios komandos. Reikia: docker, kubectl, helm (PATH arba ~/.local/bin).
.PHONY: test up down check monitor backup k8s-up k8s-check k8s-down ansible-test tf-local
test:        ## aplikacijos testai ir lint
	cd app && python3 -m pytest -q && ruff check .
up:          ## Compose: API + DB + Nginx
	@test -f .env || cp .env.example .env
	docker compose up -d --build
down:
	docker compose down
check:       ## patikrinimo scenarijus (Compose)
	./scripts/check.sh
monitor:     ## + Prometheus, Alertmanager, Loki, Grafana (:3000, admin/admin)
	docker compose -f docker-compose.yml -f docker-compose.monitoring.yml up -d --build
backup:
	./backup/backup.sh
k8s-up:      ## Kubernetes: ingress-nginx, cert-manager, dev + prod (Helm)
	./local/scripts/up.sh
k8s-check:   ## patikra per HTTPS (Ingress)
	kubectl -n ingress-nginx port-forward svc/ingress-nginx-controller 8443:443 & sleep 3; \
	CURL_OPTS="-k --resolve etalonas.example.lt:8443:127.0.0.1" SKIP_BACKUP=1 ./scripts/check.sh https://etalonas.example.lt:8443; \
	kill %1
k8s-down:
	-helm uninstall etalonas -n dev
	-helm uninstall etalonas -n prod
ansible-test: ## Ansible rolė prieš SSH serverį Docker konteineryje
	./ansible/test-konteineryje.sh
tf-local:    ## Terraform: lokalus stendas (macOS: DOCKER_HOST=unix://$$HOME/.docker/run/docker.sock)
	cd terraform/local && terraform init && terraform apply -var "db_password=$$(openssl rand -hex 10)"
