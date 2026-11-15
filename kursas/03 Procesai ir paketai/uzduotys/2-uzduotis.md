# 2 užduotis: Aplinkos kintamasis skripte

1. **Tikslas:** parašyti skriptą, kuris skaito aplinkos kintamąjį, ir pamatyti, kad kintamasis gyvena tik savo terminale.
2. Atidarykite `nano scripts/aplinka.sh` (`mkdir -p scripts`, jei aplanko nėra) ir įrašykite:

```bash
#!/usr/bin/env bash
echo "PROJEKTO_VARDAS: ${PROJEKTO_VARDAS:-nenustatyta}"
echo "Proceso eilučių ps išvestyje: $(ps -e | wc -l | tr -d ' ')"
```

Išsaugokite ir išeikite. `chmod +x scripts/aplinka.sh`.
3. Be kintamojo: `./scripts/aplinka.sh > docs/aplinka.txt`. `cat docs/aplinka.txt` rodo `nenustatyta`.
4. Kintamasis tik vienai komandai, sena eilutė lieka: `PROJEKTO_VARDAS=mano ./scripts/aplinka.sh >> docs/aplinka.txt`. `cat docs/aplinka.txt` turi dvi poras eilučių, antroje yra `mano`.
5. Kintamasis visam langui: `export PROJEKTO_VARDAS=visas`, tada `./scripts/aplinka.sh`. Išvestyje `visas`.
6. Naujame terminalo lange: `cd ~/Desktop/devops/git-bandymas`, `echo $PROJEKTO_VARDAS` (tuščia), `./scripts/aplinka.sh` vėl rodo `nenustatyta`.
7. Kur ieškoma komandų: `echo $PATH`. Kur yra `ls`: `which ls`. Kelias rodo aplanką, kuriame guli `ls`.
8. Pirmas commit, tik skriptas: `git add scripts/aplinka.sh`, `git commit -m "Pridėtas aplinka.sh"`.
9. Antras commit: `git add docs`, `git commit -m "Pridėta aplinkos išvestis"`.
10. **Pateikimas:** `docs/aplinka.txt` nuotrauka, kur matosi ir `nenustatyta`, ir `mano`.

Jei užstrigote, pasižiūrėkite `procesai komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
