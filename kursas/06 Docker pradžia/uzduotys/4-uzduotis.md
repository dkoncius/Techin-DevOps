# 4 užduotis: Sustabdyti ir ištrinti

**1.** **Tikslas:** sustabdyti konteinerį ir jį ištrinti, kad portas vėl būtų laisvas.

**2.** Sustabdyti:

- `docker stop kursas-web`
- `curl -s -o /dev/null -w "%{http_code}\n" localhost:8080`
- Turi būti: `curl` grąžina `000`

**3.** Pažiūrėti sąrašus:

- `docker ps`
- `docker ps -a`
- Turi būti: `docker ps` `kursas-web` nerodo, `docker ps -a` dar rodo

**4.** Ištrinti:

- `docker rm kursas-web`
- `docker ps -a`
- Turi būti: `kursas-web` nebėra

**5.** Patikrinti portą:

- `lsof -nP -i :8080`
- Turi būti: nieko neišveda

**6.** **Papildomai:** paleisti antrą kartą su tuo pačiu vardu ir vėl ištrinti:

- `docker run -d --name kursas-web -p 8080:80 nginx:1.27`
- `docker stop kursas-web`
- `docker rm kursas-web`
- Turi būti: antrą kartą veikia, nes senasis ištrintas

**7.** **Pateikimas:** `docker ps -a` nuotrauka be `kursas-web`.

Jei užstrigote, pasižiūrėkite `docker komandos.md`.
