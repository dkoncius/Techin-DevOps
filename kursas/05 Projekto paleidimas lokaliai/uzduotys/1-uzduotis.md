# 1 užduotis: Savo projekto kopija

1. **Tikslas:** iš šablono susikurti savo `devops-projektas` ir nusiklonuoti jį į `~/devops`.
2. Naršyklėje atidarykite `https://github.com/dkoncius/devops-projektas-starter-template`. **Use this template** → **Create a new repository**. Pavadinimas `devops-projektas`, **Public**, be README (šablonas jį jau turi).
3. Terminale tą patį daro: `gh repo create devops-projektas --template dkoncius/devops-projektas-starter-template --public`.
4. Klonuokite ne į Desktop ir ne į `/mnt/c`: `mkdir -p ~/devops`, `cd ~/devops`, `git clone https://github.com/<jūsų-vardas>/devops-projektas.git`. `cd devops-projektas`.
5. `git remote -v` rodo jūsų GitHub vardą, ne `dkoncius`. `pwd` baigiasi `devops-projektas`.
6. Sukurkite šaką: `git switch -c pamoka-05`. `git branch` rodo žvaigždutę prie `pamoka-05`.
7. **Pateikimas:** `git remote -v` nuotrauka, kurioje matosi jūsų vardas.

Jei užstrigote, pasižiūrėkite `paleidimas komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
