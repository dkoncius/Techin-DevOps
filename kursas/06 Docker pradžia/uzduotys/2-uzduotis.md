# 2 užduotis: Serveris fone

**1.** **Tikslas:** paleisti web serverį fone, pasiekti jį per naršyklę ir pakeisti jo puslapį savo.

**2.** Paleisti nginx fone:

- `docker run -d --name kursas-web -p 8080:80 nginx:1.27`
- Turi būti: išvestis yra ilgas ID

**3.** Pažiūrėti, kas veikia:

- `docker ps`
- Turi būti: rodo `kursas-web`, stulpelyje PORTS yra `0.0.0.0:8080->80/tcp`

**4.** Paklausti serverio:

- `curl -s -o /dev/null -w "%{http_code}\n" localhost:8080`
- Turi būti: `200`. Naršyklėje `http://localhost:8080` rodo nginx puslapį

**5.** Pakeisti nginx puslapį savo puslapiu:

- `echo "<h1>Mano serveris veikia konteineryje</h1>" > index.html`
- `docker cp index.html kursas-web:/usr/share/nginx/html/index.html`
- `curl -s localhost:8080`
- Turi būti: `curl` rodo jūsų eilutę su `<h1>`, naršyklėje `http://localhost:8080` rodo jūsų antraštę

**6.** **Pateikimas:** `docker ps` nuotrauka ir naršyklės puslapis su jūsų antrašte.

Jei užstrigote, pasižiūrėkite `docker komandos.md`.
