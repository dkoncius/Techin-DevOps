# 3 užduotis: Paketas

1. **Tikslas:** įdiegti paketą `tree` savo sistemoje ir žinoti abiejų sistemų komandas.
2. Atnaujinkite sąrašą ir įdiekite. Mac: `brew update`, `brew install tree`. Ubuntu / WSL: `sudo apt update`, `sudo apt install tree`. Paleiskite tik savo sistemos eilutes. Mac'e nerašykite `sudo brew`.
3. Patikrinkite: `tree --version` išveda versiją. `which tree` rodo kelią.
4. Ar jau įdiegtas. Mac: `brew list tree`. Ubuntu / WSL: `dpkg -s tree`. Komanda baigiasi be klaidos.
5. Medis: `tree docs > docs/medis.txt`. `cat docs/medis.txt` rodo `docs` aplankų medį.
6. Papildykite `docs/procesai.md` skyriumi (atidarykite `nano docs/procesai.md`):

```markdown
## Paketas

| Veiksmas | Mac | Ubuntu (WSL) |
|---|---|---|
| Įdiegti | `brew install tree` | `sudo apt update` ir `sudo apt install tree` |
| Versija | `tree --version` | `tree --version` |
| Ar įdiegtas | `brew list tree` | `dpkg -s tree` |
```

7. Išsaugokite: `git add docs`, `git commit -m "Pridėtas paketas ir medis"`.
8. **Pateikimas:** terminalo nuotrauka su `tree --version` ir `docs/medis.txt` turiniu.

Jei užstrigote, pasižiūrėkite `procesai komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
