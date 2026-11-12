# 1 užduotis, sprendimas (dėstytojui): Sukurkite repozitoriją terminale

Numeriai: dalis ir žingsnis kaip užduotyje (`1-uzduotis.md`). Rodoma aplanke `devops`, tuo pačiu pavadinimu `git-bandymas` kaip studentų.

Pirma dalis, 1–4. Aplankas:

```bash
cd ~/Desktop/devops
mkdir git-bandymas
cd git-bandymas
```

Pirma dalis, 5–8. Failai ir patikra:

```bash
echo "pirma pastaba" > pastabos.txt
echo "pirma idėja" > idejos.txt
ls
cat pastabos.txt idejos.txt
```

Antra dalis, 1–6. Repozitorija ir pirmas commit:

```bash
git init
git status
git add pastabos.txt idejos.txt
git status
git commit -m "Du failai"
git log --oneline
```

Trečia dalis, 1–5. Šaka su pakeitimu:

```bash
git switch -c papildymas
git branch
echo "antra pastaba" >> pastabos.txt
git commit -am "Papildytas pastabos.txt"
git log --oneline
```

Ketvirta dalis, 1–6. Sujungimas:

```bash
git switch main
cat pastabos.txt
git merge papildymas
cat pastabos.txt
git branch -d papildymas
git log --oneline --graph --all
```

Penkta dalis, 1–8. Papildomai (sujungimas su išsišakojimu):

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

Pastaba: pirmas sujungimas (ketvirta dalis, 3 žingsnis) yra „fast-forward“, todėl istorija tiesi; tik penktoje dalyje atsiranda sujungimo commit'as ir grafike matyti dvi šakos.
