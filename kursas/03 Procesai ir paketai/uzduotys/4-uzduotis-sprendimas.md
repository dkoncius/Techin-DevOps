# 4 užduotis, sprendimas (dėstytojui): Kodas ir Pull Request

Numeriai atitinka užduoties žingsnius (`4-uzduotis.md`). Demonstracijoje naudokite kitą pavyzdį nei mokinių.

2–6. Kodo skaitymas ir užrašai:

```bash
grep -n "os.environ" app.py > docs/nustatymai.txt
cat docs/nustatymai.txt
cat .env.example
APP_COLOR=red python3 -c "import os; print(os.environ.get('APP_COLOR', 'blue'))"
python3 -c "import os; print(os.environ.get('APP_COLOR', 'blue'))"
git check-ignore -v .env
printf '\n## Nustatymai\n\nJei `APP_COLOR` nenustatytas, programa naudoja `blue`; po `export APP_COLOR=red` naudoja `red`.\n\nKai `DB_HOST` nenustatytas, programa naudoja vietinį SQLite failą, o ne MySQL.\n\nSlaptažodis laikomas aplinkos kintamajame, nes kode jis patektų į Git ir į visų kopijas.\n' >> docs/procesai.md
```

Laukiama: `red`, tada `blue`; `git check-ignore -v .env` rodo `.gitignore` eilutę.

7–10. Patikra, commit, siuntimas:

```bash
grep -rniE "password|token|secret" docs scripts
git add docs
git commit -m "Pridėti nustatymai"
git log --oneline
git push -u origin pamoka-03
```

11–15. GitHub'e (naršyklėje): **Compare & pull request** → pavadinimas „Procesai ir paketai“ → aprašymas → **Files changed** → **Merge pull request**. Alternatyva: `gh pr create --title "Procesai ir paketai" --body "..."`, `gh pr merge --merge`. Tada:

```bash
git switch main
git pull
git branch -d pamoka-03
git push origin --delete pamoka-03
```

16. Papildomai: `kill` siunčia `SIGTERM` (prašo baigti tvarkingai), `kill -9` siunčia `SIGKILL` (nutraukia iš karto); antrą naudoti tik kai procesas nereaguoja į pirmą.

Dažna klaida: PR sulietas GitHub'e, bet `main` kompiuteryje neatnaujintas (`git pull`); `git branch -d` atsisako, jei `main` neatnaujintas.
