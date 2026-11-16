# Paleidimo komandos

## Projektas
- `./run.sh` → paleidžia, naršyklėje `http://localhost:5001`
- `curl localhost:5001/health` ir `curl localhost:5001/status`
- `lsof -nP -i :5001` → tuščia išvestis reiškia, kad portas laisvas
- `.venv/bin/pytest` → testai iš projekto aplinkos
- `git restore app.py` → grąžina nesukommit'intą failą

## Nustatymai
- `cp .env.example .env` → savo nustatymai; `.env` į Git nekeliamas
- `git check-ignore -v .env` → kuri `.gitignore` eilutė jį ignoruoja

## paleisti.sh
- `./paleisti.sh` → kodas 0, kai `/health` atsako 200
- `PORT=5002 ./paleisti.sh` → tas pats kitu portu
- Ubuntu / WSL, jei nėra `venv`: `sudo apt install python3-venv`
- Projektą laikykite `~/devops`, ne `Desktop` ir ne `/mnt/c`
