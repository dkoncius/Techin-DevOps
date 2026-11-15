# 3 užduotis: Nusiklonuokite kitur

1. **Tikslas:** nusiklonuoti `git-bandymas` šalia, tame pačiame `devops` aplanke, susitvarkyti prieigą ir ten pakartoti šaką: naujas failas `klonas.txt`, commit, push, sujungimas, trynimas kompiuteryje ir GitHub'e.
2. Esate aplanke `git-bandymas`. Išeikite į `devops`: `cd ..`. Kopija bus šalia `git-bandymas`.
3. GitHub'e atidarykite savo `git-bandymas`. Paspauskite žalią **Code**, skirtuką **Local**, **HTTPS** ir nukopijuokite nuorodą. Terminale: `git clone <nuoroda> git-bandymas-kopija`. **Download ZIP** nenaudokite: tame aplanke nėra Git istorijos.
4. Pereikite į kopiją ir patikrinkite, kad istorija atėjo: `cd git-bandymas-kopija`, `ls`, `git log --oneline`. Yra `pastabos.txt`, `idejos.txt` ir ankstesni commit'ai.
5. Sukurkite šaką `pridejimas` ir naują failą, esamų nekeiskite. Naujam failui `git commit -am` neužtenka.
   - `git switch -c pridejimas`
   - `echo "klonas" > klonas.txt`
   - `git add klonas.txt`
   - `git status`
   - `git commit -m "Naujas failas klonas.txt"`
   - `git push -u origin pridejimas`
6. Sujunkite `pridejimas` į `main` ir nusiųskite `main`.
7. Ištrinkite šaką `pridejimas` kompiuteryje ir GitHub'e. GitHub'e: `git push origin --delete pridejimas`. Šios komandos cheat sheet nėra. Kompiuteryje šaką trina kortelė „Delete a branch“.
8. **Pateikimas:** terminalo ekrano nuotrauka, kai visos šakos jau ištrintos, ir GitHub repozitorijos nuotrauka, kur liko tik `main`.

Jei užstrigote, pasižiūrėkite [Git cheat sheet](https://git-scm.com/cheat-sheet).
