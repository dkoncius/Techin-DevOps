# 3 užduotis: Procesas, kintamasis ir paketas

1. **Tikslas:** sustabdyti savo procesą, pamatyti, kad `export` galioja tik šiam langui, ir įdiegti `tree`.
2. `cd ~/Desktop/devops/git-bandymas`. Paleiskite foninį procesą: `sleep 30 &`.
3. Raskite jį: `ps aux | grep sleep`. PID yra antras stulpelis eilutėje `sleep 30`. Eilutė su `grep` yra ne jūsų procesas.
4. Sustabdykite: `kill` ir tas PID. Dar kartą `ps aux | grep sleep`. `sleep 30` nebėra.
5. `nano scripts/aplinka.sh` ir įrašykite:

```bash
#!/usr/bin/env bash
echo "PROJEKTO_VARDAS: ${PROJEKTO_VARDAS:-nenustatyta}"
```

Išsaugokite `Ctrl+O`, `Enter`, `Ctrl+X`.
6. Leiskite vykdyti: `chmod +x scripts/aplinka.sh`.
7. Sukurkite aplanką ir paleiskite: `mkdir -p docs`, tada `./scripts/aplinka.sh > docs/aplinka.txt`. `cat docs/aplinka.txt` rodo `nenustatyta`.
8. Nustatykite kintamąjį šiam langui: `export PROJEKTO_VARDAS=visas`, tada `./scripts/aplinka.sh`. Išvestyje `visas`.
9. Atidarykite naują terminalo langą: `cd ~/Desktop/devops/git-bandymas`, `echo $PROJEKTO_VARDAS`. Išvestis tuščia. `export` liko senajame lange.
10. Įdiekite `tree`. Mac: `brew install tree`. Ubuntu / WSL: `sudo apt update`, tada `sudo apt install tree`. Mac'e nerašykite `sudo brew`. `tree --version` rodo versiją. `which tree` rodo kelią.
11. Išsaugokite: `git add scripts/aplinka.sh docs`, `git commit -m "Aplinka ir paketas"`.
12. **Pateikimas:** nuotrauka, kur naujas langas nerodo `visas`, ir `tree --version`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
