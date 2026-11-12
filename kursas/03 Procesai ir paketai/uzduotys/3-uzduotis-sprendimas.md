# 3 užduotis, sprendimas (dėstytojui): Paketas

Numeriai atitinka užduoties žingsnius (`3-uzduotis.md`). Demonstracijoje naudokite kitą pavyzdį nei mokinių.

2–5. Diegimas (Mac ir Ubuntu/WSL):

```bash
# Mac
brew update
brew install tree

# Ubuntu / WSL
sudo apt update
sudo apt install tree

# abiejose
tree --version
which tree
```

(Ubuntu/WSL ir Mac eilutes paleiskite tik savo sistemoje.)

6. Medis:

```bash
tree docs > docs/medis.txt
```

7. Ar įdiegtas: Mac `brew list tree`; Ubuntu `dpkg -s tree` (arba `apt list --installed`).

8–9. Lentelė ir commit:

```bash
printf '\n## Paketas\n\n| Veiksmas | Mac | Ubuntu (WSL) |\n|---|---|---|\n| Įdiegti | `brew install tree` | `sudo apt update` ir `sudo apt install tree` |\n| Versija | `tree --version` | `tree --version` |\n| Ar įdiegtas | `brew list tree` | `dpkg -s tree` |\n' >> docs/procesai.md
git add docs
git commit -m "Pridėtas paketas ir medis"
```

Dažna klaida: `sudo apt install` be `apt update` ir „Unable to locate package“; Mac studentas rašo `sudo brew`; Windows studentas diegia ne WSL terminale.
