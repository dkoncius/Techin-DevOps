=== titulinė | Docker pradžia
06 pamoka · 3 valandos
- Kodėl konteineris
- `docker run`, `ps`, `logs`, `exec`, `stop`
Pastaba: ~15 min pradžioje. Virtuali mašina veža visą sistemą. Konteineris veža programą ir jos bibliotekas. Likęs laikas yra komandos.

=== pagalvokime
Pas jus veikia. Kolegai ne.
# Ką reikia perduoti kartu su kodu?
> Programą ir tai, ko jai reikia paleisti. Ne visą kompiuterį.
Pastaba: ~5 min. Šiandien svetimi image. Savo Dockerfile bus vėliau.

=== demonstracija | hello-world
```bash
docker run hello-world
docker ps
docker ps -a
```
+ `docker ps` tuščias. `docker ps -a` rodo `Exited`
Pastaba: ~8 min. Paskelbkite 1 užduotį.

=== demonstracija | Serveris fone
```bash
docker run -d --name demo-web -p 8888:80 nginx:1.27
docker ps
curl -s -o /dev/null -w "%{http_code}\n" localhost:8888
```
+ Kodas `200`. Naršyklėje `http://localhost:8888`
Pastaba: ~12 min. Kiti vardai: `demo-web` ir portas `8888`, ne `kursas-web` ir ne `8080`. Tag'as `1.27`, ne `latest`. Paskelbkite 2 užduotį.

=== demonstracija | Žurnalas
```bash
docker logs demo-web
docker exec demo-web nginx -v
```
+ Versijos eilutėje yra `1.27`
Pastaba: ~8 min. Paskelbkite 3 užduotį.

=== demonstracija | Sustabdymas
```bash
docker stop demo-web
docker rm demo-web
docker ps -a
```
+ `demo-web` nebėra
Pastaba: ~8 min. Nenaudokite `docker rm -f`. Paskelbkite 4 užduotį.

=== klaida | Kas stringa
+:: | `port is already allocated` | Kitas procesas laiko 8080. `lsof -nP -i :8080`
+:: | `Cannot connect to the Docker daemon` | Paleiskite Docker Desktop
Pastaba: ~5 min.

=== uzduotys | Užduotys
@uzduotys: auto, tik sąrašas

=== kita | 07 Image ir registrai
- Tag'as, sluoksniai, dydis
- Registras ir tokenas, ne slaptažodis
