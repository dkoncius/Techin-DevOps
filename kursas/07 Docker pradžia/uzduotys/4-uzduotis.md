# 4 užduotis: Sustabdyti ir ištrinti

1. **Tikslas:** sustabdyti konteinerį ir jį ištrinti, kad portas vėl būtų laisvas.
2. `docker stop kursas-web`. `curl -s -o /dev/null -w "%{http_code}\n" localhost:8080` grąžina `000`.
3. `docker ps` `kursas-web` nerodo. `docker ps -a` dar rodo.
4. `docker rm kursas-web`. `docker ps -a` jo nebėra.
5. `lsof -nP -i :8080` nieko neišveda.
6. **Papildomai:** `docker run -d --name kursas-web -p 8080:80 nginx:1.27` antrą kartą veikia, nes senasis ištrintas. Tada vėl `docker stop kursas-web` ir `docker rm kursas-web`.
7. **Pateikimas:** `docker ps -a` nuotrauka be `kursas-web`.

Jei užstrigote, pasižiūrėkite `docker komandos.md`.
