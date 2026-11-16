# 3 užduotis: Github clone

**1.** **Tikslas:** nusiklonuoti `git-bandymas` šalia, tame pačiame `devops` aplanke, susitvarkyti prieigą ir ten pakartoti šaką: naujas failas `klonas.txt`, commit, push, sujungimas, trynimas kompiuteryje ir GitHub'e.

**2.** Išeiti iš `git-bandymas` į `devops` (kopija bus šalia):

- `cd ..`

**3.** Nusiklonuoti:

- GitHub'e atidarykite savo `git-bandymas`, paspauskite žalią **Code**, skirtuką **Local**, **HTTPS** ir nukopijuokite nuorodą
- `git clone NUORODA git-bandymas-kopija`
- **Download ZIP** nenaudokite: tame aplanke nėra Git istorijos

**4.** Pereiti į kopiją ir patikrinti istoriją:

- `cd git-bandymas-kopija`
- `ls`
- `git log --oneline`
- Turi būti: yra `pastabos.txt`, `idejos.txt` ir ankstesni commit'ai

**5.** Sukurti šaką `pridejimas` ir naują failą (esamų nekeisti; naujam failui `git commit -am` neužtenka):

- `git switch -c pridejimas`
- `echo "klonas" > klonas.txt`
- `git add klonas.txt`
- `git status`
- `git commit -m "Naujas failas klonas.txt"`
- `git push -u origin pridejimas`

**6.** Sujungti `pridejimas` į `main` ir nusiųsti `main`:

- `git switch main`
- `git merge pridejimas`
- `git push`

**7.** Ištrinti šaką kompiuteryje ir GitHub'e:

- `git branch -d pridejimas`
- `git push origin --delete pridejimas`
- Šios paskutinės komandos cheat sheet nėra

**8.** **Pateikimas:** terminalo ekrano nuotrauka, kai visos šakos jau ištrintos, ir GitHub repozitorijos nuotrauka, kur liko tik `main`.

Jei užstrigote, pasižiūrėkite [Git cheat sheet](https://git-scm.com/cheat-sheet).
