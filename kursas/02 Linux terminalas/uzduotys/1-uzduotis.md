# 1 užduotis: Nano: failų redagavimas

**1.** **Tikslas:** šakoje `pamoka-02` su `nano` sutvarkyti serverių sąrašą: ištrinti pasikartojančią ir nereikalingą eilutę, kiekvieną eilutę užrašyti kaip `vardas IP`.

**2.** Eiti į projektą:

- `cd ~/Desktop/devops/git-bandymas`
- `pwd`
- `ls`
- Turi būti: `pwd` baigiasi `git-bandymas`, `ls` rodo `pastabos.txt` ir `idejos.txt`

**3.** Atnaujinti `main` ir sukurti šaką:

- `git switch main`
- `git pull`
- `git switch -c pamoka-02`
- `git branch`
- Turi būti: žvaigždutė prie `pamoka-02`

**4.** Sukurti aplanką ir atidaryti failą su `nano`:

- `mkdir -p uzrasai`
- `cd uzrasai`
- `nano serveriai.txt`
- Turi būti: atsidaro `nano`, viršuje `serveriai.txt`, apačioje klavišų meniu

**5.** Įklijuoti visą šį tekstą į `nano` (**Mac: Cmd+V**, ne `Ctrl+V`; Ubuntu / WSL: `Ctrl+Shift+V`):

```
web1 192.168.1.10
Web1 192.168.1.10
db1    192.168.1.20
app-1,192.168.1.30
backup:192.168.1.40
test 192.168.1.99
```

**6.** Sutvarkyti failą, kad jis atrodytų taip (vardas mažosiomis, vienas tarpas, be skyrybos, be pasikartojimų ir be `test`):

```
web1 192.168.1.10
db1 192.168.1.20
app1 192.168.1.30
backup 192.168.1.40
```

- Redaguoti galite **rodyklėmis**, `Backspace` ir rašydami
- Arba `nano` komandomis: `Ctrl+W` randa tekstą (paskui `Enter`), `Ctrl+K` iškerpa eilutę, `Ctrl+E` nušoka į eilutės galą
- Jei viršuje `UW PICO`: atšaukimo nėra
- Sugadinote? `Ctrl+X`, **N**, vėl `nano serveriai.txt` ir pradėkite nuo 5 žingsnio

**7.** Išsaugoti ir išeiti: `Ctrl+O`, `Enter`, `Ctrl+X`.

**8.** Patikrinti failą:

- `cat serveriai.txt`
- Turi būti: tas pats turinys kaip 6 žingsnyje

**9.** Išsaugoti pakeitimą Git'e ir nusiųsti į GitHub:

- `cd ..`
- `git add uzrasai/serveriai.txt`
- `git commit -m "Sutvarkyti serveriai.txt"`
- `git log --oneline`
- `git push -u origin pamoka-02`
- Turi būti: `git log --oneline` viršuje `Sutvarkyti serveriai.txt`
- `main` kol kas nekeičiamas: į jį šaką sulieksite 4 užduotyje per Pull Request

**10.** **Pateikimas:** nuotrauka po `cat serveriai.txt` ir `git log --oneline`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Nano klavišams: [Nano cheat sheet](https://linuxize.com/cheatsheet/nano/). Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
