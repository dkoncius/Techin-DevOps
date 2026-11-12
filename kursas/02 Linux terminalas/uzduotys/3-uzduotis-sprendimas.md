# 3 užduotis, sprendimas (dėstytojui): Srautai ir paieška

Numeriai atitinka užduoties žingsnius (`3-uzduotis.md`). Rodoma su `docs/pastabos` ir `devops-projektas`; demonstracijoje naudokite kitą pavyzdį.

2–6. `komandos.txt` ir rūšiavimas:

```bash
cd ~/devops/devops-projektas/docs/pastabos
printf 'ls\ncd\ncp\nmv\npwd\n' > komandos.txt
cat komandos.txt
sort komandos.txt
sort komandos.txt > komandos-abeceles.txt
echo "grep" >> komandos.txt
```

7–11. Peržiūra ir filtras:

```bash
wc -l komandos.txt
head -n 2 komandos.txt
tail -n 2 komandos.txt
cat komandos.txt | grep p
echo "Terminalas yra programa, kurioje komandas rašome tekstu." > terminalas.txt
```

Laukiama: `wc -l` rodo 6; `grep p` palieka `cp`, `pwd`, `grep`.

12–14. Paieška projekte:

```bash
cd ~/devops/devops-projektas
grep -rn "health" . --exclude-dir=.git
grep -rn "health" . --exclude-dir=.git --exclude-dir=docs > docs/health.txt
find . -name "*.md" -not -path "./.git/*" > docs/failai.txt
```

Be `--exclude-dir=docs` į rezultatą patektų ir pats `docs/health.txt`. Žr. `man grep`, `man find`.

15. Commit:

```bash
git add docs
git commit -m "Pridėtos pastabos ir paieškos rezultatai"
```

Dažna klaida: `>` vietoj `>>` ištrina turinį; `grep -r` be `--exclude-dir` įtraukia `.git`.
