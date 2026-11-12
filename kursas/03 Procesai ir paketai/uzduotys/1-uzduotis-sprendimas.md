# 1 užduotis, sprendimas (dėstytojui): Procesai

Numeriai atitinka užduoties žingsnius (`1-uzduotis.md`). Demonstracijoje naudokite kitą pavyzdį nei mokinių.

2–3. Nauja šaka:

```bash
cd ~/devops/devops-projektas
git switch main
git pull
git switch -c pamoka-03
```

4–8. Procesas fone, PID, sustabdymas:

```bash
sleep 300 &
jobs
ps aux | grep sleep
kill <PID>
ps aux | grep sleep
```

PID yra antras `ps aux` stulpelis `sleep 300` eilutėje. Eilutė `grep sleep` yra paties `grep` procesas.

9–11. Užrašai ir commit:

```bash
mkdir -p docs
printf '# Procesai ir paketai\n\n## Procesas\n\n`sleep 300 &` paleido procesą fone, `ps aux | grep sleep` parodė PID, `kill <PID>` jį sustabdė.\n' > docs/procesai.md
git add docs
git commit -m "Pradėtas procesai.md"
```

12. Papildomai: `sleep 300`, tada `Ctrl+C` (procesas baigiamas); `sleep 300`, tada `Ctrl+Z` (sustabdomas ir paliekamas fone), `jobs`, `kill %1`. `Ctrl+C` nutraukia procesą, `Ctrl+Z` tik pristabdo.

Dažna klaida: `kill` su PID iš `grep` eilutės; `Ctrl+Z` vietoj `Ctrl+C`, procesas lieka fone.
