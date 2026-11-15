# 2 užduotis: Serveris fone

1. **Tikslas:** paleisti web serverį fone ir pasiekti jį per naršyklę.
2. `docker run -d --name kursas-web -p 8080:80 nginx:1.27`. Išvestis yra ilgas ID.
3. `docker ps` rodo `kursas-web`, stulpelyje PORTS yra `0.0.0.0:8080->80/tcp`.
4. `curl -s -o /dev/null -w "%{http_code}\n" localhost:8080` grąžina `200`. Naršyklėje `http://localhost:8080` rodo nginx puslapį.
5. **Pateikimas:** `docker ps` nuotrauka ir naršyklės puslapis.

Jei užstrigote, pasižiūrėkite `docker komandos.md`.
