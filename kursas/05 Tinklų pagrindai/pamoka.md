# 05 Tinklų pagrindai

Data: 2026-11-18 (trečiadienis)

## Klasės darbas

3 val. Skaidrėse **N** rodo pastabas. Kiekviena tema: skaidrės → jūsų demonstracija kitu pavyzdžiu → užduotis Teams'e → mokiniai daro savo. Užduotys eina viena gija: `curl` → HTTP kodai ir skriptas → portai → DNS ir Pull Request.

1. Pasitikrinimas po 04 (~10 min): parodykite 04 užduotis (komandos yra pačiose užduotyse); kam neveikė `if`, `for` ar išėjimo kodas, kartu randame priežastį
2. Demonstracija (~5 min), tada IP, portai ir DNS (~25 min): [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/05%20Tinkl%C5%B3%20pagrindai/skaidres.html), 1–9 skaidrės; `localhost`, portai 22, 80, 443, 3306, 5001, `lsof`, `nslookup`
3. HTTP ir `curl` (~30 min): skaidrės 10–12; metodai, kodai, `curl -i`, `-w`, `POST`
4. Pertrauka (~15 min)
5. Serveris, portai ir skriptas (~25 min), tada užduotys: skaidrės 9–13; `python3 -m http.server`, užimtas portas, `http-kodas.sh`. Flask dar nėra
6. Kita paskaita: SSH ir raktai

Nuorodos: [MDN: HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview), [HTTP kodai](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status), [curl](https://curl.se/docs/manpage.html)

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `4-uzduotis.md`. Skelbiate Teams'e po vieną: pirma demonstracija, tada darbas. Projektas veikia viename lange, komandos rašomos kitame. Komandos yra pačiose užduotyse. Atskiro sprendimo failo nėra. Lapas: `uzduotys/tinklai komandos.md`.

## Pamokos eiga (dėstytojui)

Patikrinta anksčiau: `scripts/http-kodas.sh` macOS (Bash 3.2) su `python3 -m http.server` (200 → kodas 0, 404 → kodas 1, sustabdytas serveris → `000`); `lsof -nP -i :PORTAS` rodo PID. Nepatikrinta: `curl` tiesiai prie Flask starterio, `nslookup` Ubuntu, `lsof` ir `dnsutils` diegimas WSL, Pull Request GitHub'e. Šiame perrašyme iš naujo nepaleista.

### Demonstracijos žingsniai

Rodykite kitu pavyzdžiu nei užduotyje: `python3 -m http.server 8080`, kelias `/pamiršau`, portas 8080. WSL, jei nėra komandos: `sudo apt install curl`, `lsof` arba `dnsutils`. `ss` kurse nenaudojame. Kasdienių darbų netikrinate.
