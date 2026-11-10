# Nginx balansavimas

1. `docker-compose.balansavimas.yml` turi `api1` ir `api2` (tas pats atvaizdas), `nginx/balansavimas.conf` turi `upstream api_pool` su abiem.
2. Ciklas `curl -sI .../health | grep -i x-upstream` rodo du adresus pakaitomis.
3. Sustabdžius `api1`, pirmas atsakymas rodo du adresus (`a, b`: pirmas nepavyko, antras atsakė), toliau tik `api2` adresą.
