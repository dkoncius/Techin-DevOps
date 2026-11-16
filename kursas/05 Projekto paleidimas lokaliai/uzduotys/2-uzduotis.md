# 2 užduotis: Paleiskite ir pažiūrėkite

**1.** **Tikslas:** paleisti projektą ir užrašyti, ką grąžina `/health` ir `/status`.

**2.** Paleisti projektą:

- `cd ~/devops/devops-projektas`
- `./run.sh`
- Turi būti: pirmą kartą gali užtrukti, kol susikuria `.venv`; naršyklėje `http://localhost:5001` atsidaro puslapis
- Ubuntu, jei trūksta aplinkos: `sudo apt install python3-venv`

**3.** Kitame lange paklausti serverio:

- `curl localhost:5001/health`
- `curl localhost:5001/status`
- Turi būti: `/health` grąžina `{"status": "ok"}`, `/status` grąžina versiją ir DB būseną. Kompiuterio vardo į užrašus nerašykite

**4.** Patikrinti savo projektą 04 pamokos stebėsena (projektas turi veikti, o `git-bandymas` turi turėti sulietą 04 Pull Request):

- Trečiame lange: `cd ~/Desktop/devops/git-bandymas`
- `git switch main`
- `git pull`
- `./scripts/stebesena.sh`
- Turi būti: `web1 200` (tai jūsų Flask projekte, portas 5001), `db1 000` ir `app1 000` (ten nieko neklauso)
- Jei `stebesena.sh` nėra, 04 Pull Request dar nesuliestas: pirmiausia užbaikite 04 užduotis

**5.** Sustabdyti projektą (`Ctrl+C` paleidimo lange) ir patikrinti:

- `lsof -nP -i :5001`
- Turi būti: nieko neišveda

**6.** Paleisti testus:

- `.venv/bin/pytest`
- Turi būti: trys testai praeina, pabaigoje `passed`

**7.** Prisiminti Python, kurį mokėtės pas Karoliną, ir surasti `/health` kode:

- `grep -n "health" app.py`
- Turi būti: matote funkciją, kuri grąžina būseną `ok`. Kodo nekeiskite

**8.** Užrašyti rezultatą:

- `mkdir -p docs`
- `nano docs/paleidimas.md`
- Įklijuoti tekstą žemiau (`Cmd+V` Mac, `Ctrl+Shift+V` Ubuntu / WSL), tada išsaugoti: `Ctrl+O`, `Enter`, `Ctrl+X`

```markdown
# Projekto paleidimas

## Paleidimas

`./run.sh` paleido projektą. `/health` grąžino `{"status": "ok"}`. `/status` grąžino versiją ir DB būseną. `pytest` praėjo 3 testus.
```

**9.** **Pateikimas:** terminalo nuotrauka su abiem `curl` atsakymais ir `pytest` eilute `passed`.

Jei užstrigote, pasižiūrėkite `paleidimas komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
