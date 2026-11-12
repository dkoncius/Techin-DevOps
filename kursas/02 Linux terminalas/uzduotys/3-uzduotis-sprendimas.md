# 3 užduotis, sprendimas (dėstytojui): Srautai ir paieška

Numeriai: dalis ir žingsnis kaip užduotyje (`3-uzduotis.md`). Rodoma su `docs/pastabos` ir `devops-projektas`; demonstracijoje naudokite kitą pavyzdį.

Pirma dalis, 1–5. `komandos.txt` ir rūšiavimas:

```bash
cd ~/devops/devops-projektas/docs/pastabos
echo ls > komandos.txt
echo cd >> komandos.txt
echo cp >> komandos.txt
echo mv >> komandos.txt
echo pwd >> komandos.txt
cat komandos.txt
sort komandos.txt
sort komandos.txt > komandos-abeceles.txt
echo "grep" >> komandos.txt
```

Antra dalis, 1–5. Peržiūra ir filtras:

```bash
wc -l komandos.txt
head -n 2 komandos.txt
tail -n 2 komandos.txt
cat komandos.txt | grep p
echo "Terminalas yra programa, kurioje komandas rašome tekstu." > terminalas.txt
```

Laukiama: `wc -l` rodo 6; `grep p` palieka `cp`, `pwd`, `grep`.

Trečia dalis, 1–3. Paieška projekte:

```bash
cd ~/devops/devops-projektas
grep -rn "health" . --exclude-dir=.git
grep -rn "health" . --exclude-dir=.git --exclude-dir=docs > docs/health.txt
find . -name "*.md" -not -path "./.git/*" > docs/failai.txt
```

Be `--exclude-dir=docs` į rezultatą patektų ir pats `docs/health.txt`. Žr. `man grep`, `man find`.

Ketvirta dalis, 1. Commit:

```bash
git add docs
git commit -m "Pridėtos pastabos ir paieškos rezultatai"
```

Dažna klaida: `>` vietoj `>>` ištrina turinį; `grep -r` be `--exclude-dir` įtraukia `.git`.
