# 4 užduotis, sprendimas (dėstytojui): Teisės ir pirmas skriptas

Numeriai atitinka užduoties žingsnius (`4-uzduotis.md`). Rodoma su `docs/pastabos` ir `devops-projektas`; demonstracijoje naudokite kitą pavyzdį.

2–3. Skriptas (redaktoriumi arba taip):

```bash
cd ~/devops/devops-projektas
mkdir scripts
cat > scripts/ataskaita.sh <<'EOS'
#!/usr/bin/env bash
echo "Aplankas: $(pwd)"
echo "Failų ir aplankų docs/pastabos: $(ls docs/pastabos | wc -l | tr -d ' ')"
echo "Markdown failai:"
find . -name "*.md" -not -path "./.git/*"
echo "Eilutės su health:"
grep -n "health" app.py
EOS
```

4. Pirmas paleidimas (`Permission denied`):

```bash
./scripts/ataskaita.sh
```

5–7. Vykdymo teisė, išvestis, `ls -l`:

```bash
chmod +x scripts/ataskaita.sh
./scripts/ataskaita.sh
./scripts/ataskaita.sh > docs/ataskaita.txt
ls -l scripts/ataskaita.sh
```

8–10. Slaptas failas:

```bash
touch ~/devops/slaptas.txt
chmod 600 ~/devops/slaptas.txt
ls -l ~/devops/slaptas.txt
```

Laukiama: `-rw-------`.

11–12. Du commit'ai:

```bash
git add scripts/ataskaita.sh
git commit -m "Pridėtas ataskaita.sh"
git add docs
git commit -m "Pridėta ataskaita"
git log --oneline
```

13. Papildomai:

```bash
chmod -x scripts/ataskaita.sh
bash scripts/ataskaita.sh
chmod +x scripts/ataskaita.sh
```

`bash failas` skaito failą kaip argumentą, todėl `x` nereikia; `./failas` prašo sistemos jį vykdyti, tam reikia `x`.

Dažna klaida: skriptas paleistas ne projekto šaknyje, `app.py` nerandamas. Windows: CRLF (`bad interpreter`): kurti WSL redaktoriumi (`.gitattributes` su `*.sh text eol=lf`).
