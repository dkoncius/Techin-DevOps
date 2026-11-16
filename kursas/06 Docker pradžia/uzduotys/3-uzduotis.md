# 3 užduotis: Žurnalas ir vidus

**1.** **Tikslas:** perskaityti konteinerio žurnalą ir paleisti komandą jo viduje.

**2.** Perskaityti žurnalą:

- `docker logs kursas-web`
- Turi būti: matosi užklausa į `/`

**3.** Paleisti komandą konteinerio viduje:

- `docker exec kursas-web cat /etc/nginx/nginx.conf`
- Turi būti: failo pradžioje yra `worker_processes`

**4.** Pažiūrėti nginx versiją:

- `docker exec kursas-web nginx -v`
- Turi būti: eilutėje yra `1.27`

**5.** **Pateikimas:** `docker logs` nuotrauka ir `nginx -v` eilutė.

Jei užstrigote, pasižiūrėkite `docker komandos.md`.
