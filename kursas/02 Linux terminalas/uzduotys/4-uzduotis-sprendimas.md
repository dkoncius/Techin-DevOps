# 4 užduotis, sprendimas (dėstytojui): Teisės ir pirmas skriptas

Numeriai: dalis ir žingsnis kaip užduotyje (`4-uzduotis.md`). Rodoma su `docs/pastabos` ir `devops-projektas`; demonstracijoje naudokite kitą pavyzdį. Failus redaktoriuje atidarome iš terminalo: `nano FAILAS` (išsaugoti `Ctrl+O`, `Enter`, išeiti `Ctrl+X`).

Pirma dalis, 1–2. Skriptas:

```bash
cd ~/devops/devops-projektas
mkdir scripts
nano scripts/ataskaita.sh
```

Failo `scripts/ataskaita.sh` turinys (įrašykite ir išsaugokite):

```bash
#!/usr/bin/env bash
echo "Aplankas: $(pwd)"
echo "Failų ir aplankų docs/pastabos: $(ls docs/pastabos | wc -l | tr -d ' ')"
echo "Markdown failai:"
find . -name "*.md" -not -path "./.git/*"
echo "Eilutės su health:"
grep -n "health" app.py
```

Pirma dalis, 3. Pirmas paleidimas (`Permission denied`):

```bash
./scripts/ataskaita.sh
```

Antra dalis, 1–3. Vykdymo teisė, išvestis, `ls -l`:

```bash
chmod +x scripts/ataskaita.sh
./scripts/ataskaita.sh
./scripts/ataskaita.sh > docs/ataskaita.txt
ls -l scripts/ataskaita.sh
```

Trečia dalis, 1–3. Slaptas failas:

```bash
touch ~/devops/slaptas.txt
chmod 600 ~/devops/slaptas.txt
ls -l ~/devops/slaptas.txt
```

Laukiama: `-rw-------`.

Ketvirta dalis, 1–2. Du commit'ai:

```bash
git add scripts/ataskaita.sh
git commit -m "Pridėtas ataskaita.sh"
git add docs
git commit -m "Pridėta ataskaita"
git log --oneline
```

Ketvirta dalis, 3. Papildomai:

```bash
chmod -x scripts/ataskaita.sh
bash scripts/ataskaita.sh
chmod +x scripts/ataskaita.sh
```

`bash failas` skaito failą kaip argumentą, todėl `x` nereikia; `./failas` prašo sistemos jį vykdyti, tam reikia `x`.

Dažna klaida: skriptas paleistas ne projekto šaknyje, `app.py` nerandamas. Windows: CRLF (`bad interpreter`): kurti WSL redaktoriumi (`.gitattributes` su `*.sh text eol=lf`).
