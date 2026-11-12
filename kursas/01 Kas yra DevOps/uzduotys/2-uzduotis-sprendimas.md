# 2 užduotis, sprendimas (dėstytojui): Sukurkite repozitoriją GitHub ir susiekite

Numeriai atitinka užduoties žingsnius (`2-uzduotis.md`). Viskas daroma terminale. Rodoma aplanke `git-bandymas`.

2–4. Aplankas ir prisijungimas:

```bash
cd ~/Desktop/devops/git-bandymas
pwd
gh auth status
# jei neprisijungta: gh auth login (GitHub.com, HTTPS)
```

5–6. Tuščia repozitorija GitHub (be `--source` ir `--push`, kad susiejimas liktų rankinis):

```bash
gh repo create git-bandymas --public
gh repo view git-bandymas --json url -q .url
```

7–10. Susiejimas ranka:

```bash
git remote add origin https://github.com/<vartotojas>/git-bandymas.git
git remote -v
git push -u origin main
git status
```

11–12. Patikra GitHub:

```bash
gh api repos/{owner}/{repo}/contents --jq '.[].name'
gh api repos/{owner}/{repo}/commits --jq '.[].commit.message'
```

Jei iš karto po pirmo `push` `gh api` grąžina 404 („No commit found for the ref“), palaukite kelias sekundes ir pakartokite: GitHub dar neatnaujino duomenų.

13–16. Tolesnis darbas:

```bash
echo "trečia idėja" >> idejos.txt
git commit -am "Papildytas idejos.txt"
git push
gh api repos/{owner}/{repo}/commits --jq '.[].commit.message'
```

