#!/usr/bin/env bash
# Išbando rolę prieš tikrą SSH serverį Docker konteineryje (be Azure/VM).
# fail2ban praleidžiamas: konteineryje nėra auth.log. Reikia: docker, ansible, community.general.
set -euo pipefail
cd "$(dirname "$0")"
T=$(mktemp -d); trap 'docker rm -f ansible-target >/dev/null 2>&1; rm -rf "$T"' EXIT
ssh-keygen -q -t ed25519 -N '' -f "$T/k"
docker rm -f ansible-target >/dev/null 2>&1 || true
docker run -d --name ansible-target --cap-add NET_ADMIN -p 2222:22 ubuntu:22.04 bash -c '
 apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq openssh-server python3 sudo iptables >/dev/null &&
 useradd -m -s /bin/bash azureuser && echo "azureuser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/az &&
 mkdir -p /home/azureuser/.ssh /run/sshd && echo "'"$(cat "$T/k.pub")"'" > /home/azureuser/.ssh/authorized_keys &&
 chown -R azureuser:azureuser /home/azureuser/.ssh && chmod 700 /home/azureuser/.ssh && chmod 600 /home/azureuser/.ssh/authorized_keys &&
 service ssh start && exec sleep infinity' >/dev/null
SSH="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR -p 2222"
for _ in $(seq 1 40); do $SSH -o ConnectTimeout=2 -i "$T/k" azureuser@127.0.0.1 true 2>/dev/null && break; sleep 3; done
printf '[web]\ntest ansible_host=127.0.0.1 ansible_port=2222 ansible_user=azureuser ansible_ssh_private_key_file=%s/k\n' "$T" > "$T/inv.ini"
PB=(ansible-playbook -i "$T/inv.ini" site.yml --skip-tags fail2ban -e '{"hardening_packages":["ufw","fail2ban","openssh-server"]}' -e ansible_python_interpreter=/usr/bin/python3)
"${PB[@]}" | tail -12 || true
echo "--- antras paleidimas (idempotentiškumas)"; "${PB[@]}" | grep -E "^test "
echo "--- patikra:"
$SSH -o PubkeyAuthentication=no -o PreferredAuthentications=password -o ConnectTimeout=3 azureuser@127.0.0.1 true 2>&1 | tail -1 || true
docker exec ansible-target bash -c 'ufw status | grep -c ALLOW; stat -c "%a %U" /opt/etalonas/.env'
