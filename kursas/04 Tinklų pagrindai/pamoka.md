# 04 Tinklų pagrindai

Data: 2026-11-18 (trečiadienis)

## Klasės darbas

Anksčiau mokėsi: 03 pamokoje argumentus, `if`, `for` ir išėjimo kodą; pas Edgarą matė Apache / Nginx portus ir SSH. `curl`, HTTP kodų, DNS ir portų paieškos (`lsof`) dar nemokėsi.

Prisiminsime skriptą su išėjimo kodu ir tai, kad serveriai klauso portų, o mokysimės, kas yra IP ir DNS, kaip veikia HTTP (kodai 200, 404) ir kaip su `curl` patikrinti, ar serveris veikia. Pabaigoje turėsime mini stebėseną `scripts/stebesena.sh`: ji paima serverių vardus iš 02 pamokos stiliaus sąrašo ir parodo, kurie atsako (`200`), o kurie ne (`000`).

1. Pasitikrinimas po 03: parodykite 03 užduotis (komandos yra pačiose užduotyse); kam neveikė `if`, `for` ar išėjimo kodas, kartu randame priežastį
2. Demonstracija, tada IP, portai ir DNS: [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/04%20Tinkl%C5%B3%20pagrindai/skaidres.html), 1–9 skaidrės; `localhost`, portai 22, 80, 443, 3306, 5001, `lsof`, `nslookup`
3. HTTP ir `curl`: skaidrės 10–12; metodai, kodai, `curl -i`, `-w`, `POST`
4. Pertrauka
5. Serveris, portai ir skriptas, tada užduotys: skaidrės 9–14; `python3 -m http.server`, užimtas portas, `http-kodas.sh`. Flask dar nėra
6. Kita paskaita: SSH ir raktai

Nuorodos: [MDN: HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview), [HTTP kodai](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status), [curl](https://curl.se/docs/manpage.html)

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `4-uzduotis.md`. Skelbiate Teams'e po vieną: pirma demonstracija, tada darbas. Projektas veikia viename lange, komandos rašomos kitame. Komandos yra pačiose užduotyse. 2 užduotyje skriptą mokiniai rašo patys, pilnas kodas yra `uzduotys/2-uzduotis-sprendimas.md`. Lapas: `uzduotys/tinklai komandos.md`.

## Pamokos eiga (dėstytojui)

Patikrinta anksčiau: `scripts/http-kodas.sh` macOS (Bash 3.2) su `python3 -m http.server` (200 → kodas 0, 404 → kodas 1, sustabdytas serveris → `000`); `lsof -nP -i :PORTAS` rodo PID. Nepatikrinta: `curl` tiesiai prie Flask starterio, `nslookup` Ubuntu, `lsof` ir `dnsutils` diegimas WSL, Pull Request GitHub'e. Šiame perrašyme iš naujo nepaleista.

### Demonstracijos žingsniai

Rodykite kitu pavyzdžiu nei užduotyje: `python3 -m http.server 8080`, kelias `/pamiršau`, portas 8080. WSL, jei nėra komandos: `sudo apt install curl`, `lsof` arba `dnsutils`. `ss` kurse nenaudojame. Kasdienių darbų netikrinate.
