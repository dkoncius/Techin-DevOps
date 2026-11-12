# 4 užduotis, sprendimas (dėstytojui): Tikras skriptas, ignoravimas ir Pull Request

Numeriai: dalis ir žingsnis kaip užduotyje (`4-uzduotis.md`). Demonstracijoje naudokite kitą pavyzdį nei mokinių. Failus redaktoriuje atidarome iš terminalo: `nano FAILAS` (išsaugoti `Ctrl+O`, `Enter`, išeiti `Ctrl+X`).

Pirma dalis, 1–4. `.env` ir `*.log`:

```bash
cp .env.example .env
git status --short
git check-ignore -v .env
echo "*.log" >> .gitignore
touch bandymas.log
git status --short
```

Laukiama: `.env` ir `bandymas.log` `git status` nerodo; rodoma tik pakeista `.gitignore`.

Antra dalis, 1–4. Sugadinimas ir atšaukimas:

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

Trečia dalis, 1–3. Commit'ai ir siuntimas:

```bash
git add .gitignore
git commit -m "Ignoruojami .log failai"
git log --oneline
git push -u origin pamoka-04
```

Trečia dalis, 4–7. GitHub'e: **Compare & pull request** → „Bash skriptai“ → aprašymas → **Files changed** → **Merge pull request**. Alternatyva: `gh pr create` ir `gh pr merge --merge`. Tada:

```bash
git switch main
git pull
git branch -d pamoka-04
git push origin --delete pamoka-04
```

Trečia dalis, 8. Papildomai:

```bash
nano scripts/dydis.sh
```

Failo `scripts/dydis.sh` turinys (įrašykite ir išsaugokite):

```bash
#!/usr/bin/env bash
set -euo pipefail
katalogas="${1:-.}"
echo "Failų: $(find "$katalogas" -maxdepth 1 -type f | wc -l | tr -d ' ')"
echo "Aplankų: $(find "$katalogas" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"
```

```bash
chmod +x scripts/dydis.sh
./scripts/dydis.sh docs
```

Dažna klaida: failas jau buvo `git add`, todėl `.gitignore` jam nebeveikia (`git rm --cached`); PR sulietas GitHub'e, bet `main` kompiuteryje neatnaujintas (`git pull`).
