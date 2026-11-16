# 3 užduotis, sprendimas (dėstytojui): Github clone

Numeriai kaip užduotyje (`3-uzduotis.md`). Kopija kuriama aplanke `devops`, šalia `git-bandymas`. Demonstracijai klonuokite į `demo-c`, ne į `git-bandymas-kopija`.

2–4 žingsnis. Nuoroda iš GitHub svetainės: **Code** → **Local** → **HTTPS**. **Download ZIP** nenaudokite. Tada clone šalia:

```bash
cd ..
git clone https://github.com/<vartotojas>/git-bandymas.git git-bandymas-kopija
cd git-bandymas-kopija
ls
git log --oneline
```

`ls` rodo `pastabos.txt` ir `idejos.txt`. `git log --oneline` rodo 1 ir 2 užduočių commit'us.

5 žingsnis. Šaka ir naujas failas. Esamų failų nekeisti. `git commit -am` naujo failo neįtraukia, todėl reikia `git add`. Po `git add` `git status` rodo `klonas.txt` paruoštą commit:

```bash
git switch -c pridejimas
echo "klonas" > klonas.txt
git add klonas.txt
git status
git commit -m "Naujas failas klonas.txt"
git push -u origin pridejimas
```

6 žingsnis. Sujungimas:

```bash
git switch main
git merge pridejimas
git push
```

7 žingsnis. Trynimas kompiuteryje ir GitHub'e:

```bash
git branch -d pridejimas
git push origin --delete pridejimas
git branch
git ls-remote --heads origin
```

`git branch` rodo tik `main`. GitHub'e šakos `pridejimas` nėra.
