# 1 užduotis, sprendimas (dėstytojui): Savo projektas

Numeriai: dalis ir žingsnis kaip užduotyje (`1-uzduotis.md`). Rodoma su `docs/pastabos` ir `devops-projektas`; demonstracijoje naudokite kitą pavyzdį.

Pirma dalis, 1–3. Naršyklėje (nėra komandos): šablono puslapis → **Use this template** → **Create a new repository** → pavadinimas `devops-projektas`, **Public**. Alternatyva terminale: `gh repo create devops-projektas --template dkoncius/devops-projektas-starter-template --public`.

Antra dalis, 1–4. Klonavimas ir patikra:

```bash
cd ~/devops
git clone https://github.com/<JŪSŲ-VARDAS>/devops-projektas.git
cd devops-projektas
git remote -v
```

`git remote -v` turi rodyti `<JŪSŲ-VARDAS>/devops-projektas`, o ne `starter-template`.

Trečia dalis, 1–4. Šaka, `docs`, commit:

```bash
git switch -c pamoka-02
mkdir docs
echo "# Terminalas" > docs/terminalas.md
git status
git add docs
git commit -m "Pradėtas terminalas.md"
```

Dažna klaida: klonuojamas pats šablonas (`starter-template`); klonuojama į `/mnt/c` (WSL): perkelti į `~/devops`.
