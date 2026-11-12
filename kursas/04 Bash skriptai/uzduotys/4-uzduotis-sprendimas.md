# 4 užduotis, sprendimas (dėstytojui): Tikras skriptas, ignoravimas ir Pull Request

Numeriai atitinka užduoties žingsnius (`4-uzduotis.md`). Demonstracijoje naudokite kitą pavyzdį nei mokinių.

2–5. `.env` ir `*.log`:

```bash
cp .env.example .env
git status --short
git check-ignore -v .env
echo "*.log" >> .gitignore
touch bandymas.log
git status --short
```

Laukiama: `.env` ir `bandymas.log` `git status` nerodo; rodoma tik pakeista `.gitignore`.

6–9. Sugadinimas ir atšaukimas:

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

10–12. Commit'ai ir siuntimas:

```bash
git add .gitignore
git commit -m "Ignoruojami .log failai"
git log --oneline
git push -u origin pamoka-04
```

13–16. GitHub'e: **Compare & pull request** → „Bash skriptai“ → aprašymas → **Files changed** → **Merge pull request**. Alternatyva: `gh pr create` ir `gh pr merge --merge`. Tada:

```bash
git switch main
git pull
git branch -d pamoka-04
git push origin --delete pamoka-04
```

17. Papildomai:

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
