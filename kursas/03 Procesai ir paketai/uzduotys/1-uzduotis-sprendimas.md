# 1 užduotis, sprendimas (dėstytojui): Procesai

Numeriai: dalis ir žingsnis kaip užduotyje (`1-uzduotis.md`). Demonstracijoje naudokite kitą pavyzdį nei mokinių. Failus redaktoriuje atidarome iš terminalo: `code FAILAS` (VS Code); jei `code` neįdiegta, `nano FAILAS` (išsaugoti `Ctrl+O`, `Enter`, išeiti `Ctrl+X`).

Pirma dalis, 1–2. Nauja šaka:

```bash
cd ~/devops/devops-projektas
git switch main
git pull
git switch -c pamoka-03
```

Antra dalis, 1–5. Procesas fone, PID, sustabdymas:

```bash
sleep 300 &
jobs
ps aux | grep sleep
kill <PID>
ps aux | grep sleep
```

PID yra antras `ps aux` stulpelis `sleep 300` eilutėje. Eilutė `grep sleep` yra paties `grep` procesas.

Trečia dalis, 1–3. Užrašai ir commit:

```bash
mkdir -p docs
code docs/procesai.md
```

Failo `docs/procesai.md` turinys (įrašykite ir išsaugokite):

```markdown
# Procesai ir paketai

## Procesas

`sleep 300 &` paleido procesą fone, `ps aux | grep sleep` parodė PID, `kill <PID>` jį sustabdė.
```

```bash
git add docs
git commit -m "Pradėtas procesai.md"
```

Trečia dalis, 3. Papildomai: `sleep 300`, tada `Ctrl+C` (procesas baigiamas); `sleep 300`, tada `Ctrl+Z` (sustabdomas ir paliekamas fone), `jobs`, `kill %1`. `Ctrl+C` nutraukia procesą, `Ctrl+Z` tik pristabdo.

Dažna klaida: `kill` su PID iš `grep` eilutės; `Ctrl+Z` vietoj `Ctrl+C`, procesas lieka fone.
