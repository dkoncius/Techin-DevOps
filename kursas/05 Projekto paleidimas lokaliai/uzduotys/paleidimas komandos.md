# Paleidimas

- `gh repo create devops-projektas --template dkoncius/devops-projektas-starter-template --public`
- `git clone` į `~/devops`, ne į Desktop ir ne į `/mnt/c`
- `./run.sh` → naršyklė `http://localhost:5001`
- `curl localhost:5001/health` → `{"status": "ok"}`
- `curl localhost:5001/status` → versija ir DB būsena
- `.venv/bin/pytest` → 3 testai `passed`
- `cp .env.example .env` (į Git nekelti)
- `git check-ignore -v .env`
- `./paleisti.sh` → kodas 0, kai `/health` atsako 200
- `PORT=5002 ./paleisti.sh` → tas pats kitame porte
