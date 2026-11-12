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

28. Papildomai (pakartoti 16–19 su nauja šaka ir prieš sujungimą papildyti `main`):

```bash
git switch -c antra-saka
echo "dar viena pastaba" >> pastabos.txt
git commit -am "Papildyta antra-saka"
git switch main
echo "antra idėja" >> idejos.txt
git commit -am "Papildytas idejos.txt"
git merge antra-saka -m "Sujungta antra-saka"
git log --oneline --graph --all
```

Pastaba: pirmas sujungimas (23) yra „fast-forward“, todėl istorija tiesi; tik šiame žingsnyje atsiranda sujungimo commit'as ir grafike matyti dvi šakos.
