# Tinklų komandos

## HTTP
- `curl -s localhost:5001/` → atsakymo kūnas (paprastas `python3 -m http.server`)
- `curl -i ADRESAS` → antraštės ir kūnas; pirma eilutė yra HTTP kodas
- `curl -s -o /dev/null -w "%{http_code}\n" ADRESAS` → tik kodas; `000` reiškia, kad niekas neklauso
- `curl -X POST -H 'Content-Type: application/json' -d '{"name":"X"}' ADRESAS` → siunčia JSON
- `curl -L ADRESAS` → seka 3xx nukreipimą pagal antraštę `Location`

## Portai ir vardai
- `lsof -nP -i :5001` → kas klauso porto; PID yra procesų stulpelyje
- `python3 -m http.server 5002` → antra kopija kitame porte
- `nslookup localhost` → vardas į adresą; `127.0.0.1` yra šis kompiuteris

## Jei komandos nėra (Ubuntu / WSL)
- `sudo apt install curl`
- `sudo apt install lsof`
- `sudo apt install dnsutils`
