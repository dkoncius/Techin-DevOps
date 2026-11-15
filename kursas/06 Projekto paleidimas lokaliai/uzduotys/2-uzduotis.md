# 2 užduotis: Paleiskite ir pažiūrėkite

1. **Tikslas:** paleisti projektą ir užrašyti, ką grąžina `/health` ir `/status`.
2. `cd ~/devops/devops-projektas`. Paleiskite: `./run.sh`. Pirmas kartas gali užtrukti, kol susikuria `.venv`. Naršyklėje `http://localhost:5001` atsidaro puslapis. Ubuntu, jei trūksta aplinkos: `sudo apt install python3-venv`.
3. Kitame lange: `curl localhost:5001/health` grąžina `{"status": "ok"}`. `curl localhost:5001/status` grąžina versiją ir DB būseną. Kompiuterio vardo į užrašus nerašykite.
4. Sustabdykite (`Ctrl+C` paleidimo lange). `lsof -nP -i :5001` nieko neišveda.
5. Testai: `.venv/bin/pytest`. Trys testai praeina, pabaigoje `passed`.
6. Prisiminkite Python, kurį mokėtės pas Karoliną. `grep -n "health" app.py`. Matote funkciją, kuri grąžina būseną `ok`. Kodo nekeiskite.
7. Užrašykite `nano docs/paleidimas.md`:

```markdown
# Projekto paleidimas

## Paleidimas

`./run.sh` paleido projektą. `/health` grąžino `{"status": "ok"}`. `/status` grąžino versiją ir DB būseną. `pytest` praėjo 3 testus.
```

8. **Pateikimas:** terminalo nuotrauka su abiem `curl` atsakymais ir `pytest` eilute `passed`.

Jei užstrigote, pasižiūrėkite `paleidimas komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
