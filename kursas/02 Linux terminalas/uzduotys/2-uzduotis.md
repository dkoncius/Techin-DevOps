# 2 užduotis: Skriptas ir teisės

1. **Tikslas:** tą pačią paiešką padaryti skriptu ir uždaryti failą kitiems.
2. `cd ~/Desktop/devops/git-bandymas`. Sukurkite aplanką: `mkdir -p scripts`. `ls` rodo `scripts`.
3. Nebūtina atsidaryti scripts aplankalo, kad kurti ir redaguoti failus. `nano scripts/ataskaita.sh` ir įrašykite:

```bash
#!/usr/bin/env bash
echo "Aplankas: $(pwd)"
echo "Eilutės su Terminalas:"
grep -n "Terminalas" uzrasai.md
```

Išsaugokite `Ctrl+O`, `Enter`, `Ctrl+X`.
4. Paleiskite: `./scripts/ataskaita.sh`. Laukiama: `Permission denied`.
5. Leiskite vykdyti ir paleiskite dar kartą: `chmod +x scripts/ataskaita.sh`, tada `./scripts/ataskaita.sh`. Išvestyje yra aplankas ir eilutė su `Terminalas`.
6. Įrašykite išvestį į failą: `./scripts/ataskaita.sh > ataskaita.txt`. `cat ataskaita.txt` rodo tą pačią išvestį.
7. Uždarykite failą kitiems: `touch ~/Desktop/devops/slaptas.txt`, `chmod 600 ~/Desktop/devops/slaptas.txt`. `ls -l ~/Desktop/devops/slaptas.txt` rodo `-rw-------`.
8. Išsaugokite: `git add scripts/ataskaita.sh ataskaita.txt`, `git commit -m "Pridėtas ataskaita.sh"`. `git log --oneline` viršuje ta žinutė.
9. **Pateikimas:** nuotrauka po `ls -l scripts/ataskaita.sh` ir `cat ataskaita.txt`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
