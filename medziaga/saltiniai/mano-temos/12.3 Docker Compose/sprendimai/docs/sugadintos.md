# Sugadintos compose bylos

Dokumentacija: Compose file reference, https://docs.docker.com/reference/compose-file/

## sugadinta-1.yml
1. Simptomas: `docker compose -f sugadinta-1.yml config` sustoja su `services.nginx.port false schema`.
2. Priežastis: `nginx` servise parašyta `port:`, o raktas vadinasi `ports:`.
3. Pataisymas: `port:` pakeista į `ports:` (žr. `pataisyta-1.yml`).
4. Patikra: `docker compose -f pataisyta-1.yml up -d`, `curl -s http://localhost:8080/health` grąžina `{"db":"up","status":"ok"}`.

## sugadinta-2.yml
1. Simptomas: `config` praeina, bet `curl http://localhost:8080/health` grąžina 503; `docker compose logs api` rodo `connection refused`.
2. Priežastis: `DATABASE_URL` baigiasi `@localhost:5432`. Konteinerio viduje `localhost` yra pats API konteineris.
3. Pataisymas: `@localhost:5432` pakeista į `@db:5432` (serviso vardas), žr. `pataisyta-2.yml`.
4. Patikra: `curl -s http://localhost:8080/health` grąžina `{"db":"up","status":"ok"}`.

## sugadinta-3.yml
1. Simptomas: `service "db" refers to undefined volume pgdata: invalid compose project`.
2. Priežastis: `db` naudoja volume `pgdata`, bet failo gale nėra aukščiausio lygio `volumes:` bloko.
3. Pataisymas: pridėta `volumes:` su `pgdata:` (žr. `pataisyta-3.yml`).
4. Patikra: `up -d` pavyksta, `/health` grąžina 200.
