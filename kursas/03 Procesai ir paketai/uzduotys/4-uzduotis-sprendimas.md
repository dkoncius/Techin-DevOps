# 4 užduotis, sprendimas (dėstytojui): Kodas ir Pull Request

Numeriai: dalis ir žingsnis kaip užduotyje (`4-uzduotis.md`). Demonstracijoje naudokite kitą pavyzdį nei mokinių.

Pirma dalis, 1–2. Kodo skaitymas ir `.env`:

```bash
grep -n "os.environ" app.py > docs/nustatymai.txt
cat docs/nustatymai.txt
git check-ignore -v .env
```

Laukiama: `git check-ignore -v .env` rodo `.gitignore` eilutę.

Antra dalis, 1–4. Patikra, commit, siuntimas:

```bash
grep -rniE "password|token|secret" docs scripts
git add docs
git commit -m "Pridėti nustatymai"
git log --oneline
git push -u origin pamoka-03
```

Trečia dalis, 1–5. GitHub'e (naršyklėje): **Compare & pull request** → pavadinimas „Procesai ir paketai“ → aprašymas → **Files changed** → **Merge pull request**. Alternatyva: `gh pr create --title "Procesai ir paketai" --body "..."`, `gh pr merge --merge`. Tada:

```bash
git switch main
git pull
git branch -d pamoka-03
git push origin --delete pamoka-03
```

Trečia dalis, 6. Papildomai: `kill` siunčia `SIGTERM` (prašo baigti tvarkingai), `kill -9` siunčia `SIGKILL` (nutraukia iš karto); antrą naudoti tik kai procesas nereaguoja į pirmą.

Dažna klaida: PR sulietas GitHub'e, bet `main` kompiuteryje neatnaujintas (`git pull`); `git branch -d` atsisako, jei `main` neatnaujintas.
