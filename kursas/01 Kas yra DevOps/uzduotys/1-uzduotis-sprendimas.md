# 1 užduotis, sprendimas (dėstytojui): Sukurkite repozitoriją terminale

Numeriai atitinka užduoties žingsnius (`1-uzduotis.md`). Rodoma aplanke `devops`, tuo pačiu pavadinimu `git-bandymas` kaip studentų.

2–5. Aplankas:

```bash
cd ~/Desktop/devops
mkdir git-bandymas
cd git-bandymas
```

6–9. Failai ir patikra:

```bash
echo "pirma pastaba" > pastabos.txt
echo "pirma idėja" > idejos.txt
ls
cat pastabos.txt idejos.txt
```

10–15. Repozitorija ir pirmas commit:

```bash
git init
git status
git add pastabos.txt idejos.txt
git status
git commit -m "Du failai"
git log --oneline
```

16–20. Šaka su pakeitimu:

```bash
git switch -c papildymas
git branch
echo "antra pastaba" >> pastabos.txt
git commit -am "Papildytas pastabos.txt"
git log --oneline
```

21–26. Sujungimas:

```bash
git switch main
cat pastabos.txt
git merge papildymas
cat pastabos.txt
git branch -d papildymas
git log --oneline --graph --all
```

27. Kodėl (pavyzdys): istorija rodo, kas ir kada pasikeitė ir leidžia grįžti; šaka saugo veikiantį `main`, kol pakeitimas dar netikrintas.

28. Papildomai (iki sujungimo, žingsnis po 20):

```bash
git switch main
echo "antra idėja" >> idejos.txt
git commit -am "Papildytas idejos.txt"
git merge papildymas -m "Sujungta papildymas"
git log --oneline --graph --all
```
