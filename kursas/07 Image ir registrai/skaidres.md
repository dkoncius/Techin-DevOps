=== titulinė | Image ir registrai
07 pamoka
- Konkretus tag'as
- Sluoksniai ir dydis
- Registras
Pastaba: ~5 min. `latest` gali pasikeisti be jūsų žinios.

=== demonstracija | Tag'as
```bash
docker pull httpd:2.4
docker images httpd
```
+ Stulpelyje TAG yra `2.4`
Pastaba: ~10 min. Mokinių image yra `nginx:1.27`, ne `httpd`. Paskelbkite 1 užduotį.

=== demonstracija | Sluoksniai
```bash
docker history httpd:2.4
```
+ Kiekviena eilutė yra sluoksnis
Pastaba: ~8 min. Paskelbkite 2 užduotį.

=== demonstracija | Dydis
```bash
docker pull busybox:1.36
docker images
docker image rm busybox:1.36
```
+ `busybox` mažesnis. Po `rm` jo nėra
Pastaba: ~10 min. Mokiniai trina `alpine:3.20`, ne `busybox`. Paskelbkite 3 užduotį.

=== demonstracija | Registras
```bash
docker login
docker logout
```
+ `Login Succeeded`. Slaptažodžio vietoje access token
Pastaba: ~8 min. Ekrane tokeno nerodykite. Mokiniai šioje pamokoje nieko neįkelia. Prisijungti neprivaloma. Paskelbkite 4 užduotį.

=== uzduotys | Užduotys
@uzduotys: auto, tik sąrašas

=== kita | 08 Pasiruošimas
- Naujos temos nėra
- 2026-11-25 paskaitos nėra
- Tikriname `paleisti.sh` ir tris PR
