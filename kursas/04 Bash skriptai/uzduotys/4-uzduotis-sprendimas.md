# 4 užduotis, sprendimas (dėstytojui): Tikras skriptas, ignoravimas ir Pull Request

Numeriai atitinka užduoties žingsnius (`4-uzduotis.md`). Demonstracijoje naudokite kitą pavyzdį nei mokinių.

2–3. `run.sh` ir užrašai:

```bash
cat run.sh
printf '\n## run.sh\n\n- `set -euo pipefail` sustabdo skriptą pirmoje klaidoje, nenustatytame kintamajame ir nepavykusiame vamzdyje.\n- `cd "$(dirname "$0")"` pereina į skripto aplanką, kad jis veiktų iš bet kur.\n- `[ -d .venv ] || python3 -m venv .venv` sukuria virtualią aplinką tik jei jos dar nėra.\n- `.venv/bin/pip install -q -r requirements.txt` įdiegia priklausomybes tyliai.\n- `exec` paleidžia serverį porte iš `PORT` arba 5001.\n\n`.env` neina į Git, nes jame slaptos reikšmės; `.env.example` eina, nes rodo, kokių kintamųjų reikia, be pačių reikšmių.\n' >> docs/bash.md
```

(Pasitikrinkite, ar jūsų `run.sh` eilutės atitinka šį sąrašą.)

4–7. `.env` ir `*.log`:

```bash
cp .env.example .env
git status --short
git check-ignore -v .env
echo "*.log" >> .gitignore
touch bandymas.log
git status --short
```

Laukiama: `.env` ir `bandymas.log` `git status` nerodo; rodoma tik pakeista `.gitignore`.

8–11. Sugadinimas ir atšaukimas:

```bash
tail -n +2 scripts/patikra.sh > scripts/tmp.sh && mv scripts/tmp.sh scripts/patikra.sh
git status --short
git restore scripts/patikra.sh
git status --short
echo "# pakeista" >> scripts/patikra.sh
git add scripts/patikra.sh
git restore --staged scripts/patikra.sh
git restore scripts/patikra.sh
git status --short
```

`git reset --hard` neišmokstame: jis ištrintų ir kitus neįrašytus pakeitimus.

12–15. Commit'ai ir siuntimas:

```bash
git add .gitignore
git commit -m "Ignoruojami .log failai"
git add docs
git commit -m "Pridėtas bash.md"
git log --oneline
git push -u origin pamoka-04
```

16–19. GitHub'e: **Compare & pull request** → „Bash skriptai“ → aprašymas → **Files changed** → **Merge pull request**. Alternatyva: `gh pr create` ir `gh pr merge --merge`. Tada:

```bash
git switch main
git pull
git branch -d pamoka-04
git push origin --delete pamoka-04
```

20. Papildomai:

```bash
cat > scripts/dydis.sh <<'EOS'
#!/usr/bin/env bash
set -euo pipefail
katalogas="${1:-.}"
echo "Failų: $(find "$katalogas" -maxdepth 1 -type f | wc -l | tr -d ' ')"
echo "Aplankų: $(find "$katalogas" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"
EOS
chmod +x scripts/dydis.sh
./scripts/dydis.sh docs
```

Dažna klaida: failas jau buvo `git add`, todėl `.gitignore` jam nebeveikia (`git rm --cached`); PR sulietas GitHub'e, bet `main` kompiuteryje neatnaujintas (`git pull`).
