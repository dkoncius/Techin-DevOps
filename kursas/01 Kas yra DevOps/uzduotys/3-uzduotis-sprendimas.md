# 3 užduotis, sprendimas (dėstytojui): Nusiklonuokite savo repozitoriją

Numeriai: dalis ir žingsnis kaip užduotyje (`3-uzduotis.md`). Failus redaktoriuje atidarome iš terminalo: `nano FAILAS` (išsaugoti `Ctrl+O`, `Enter`, išeiti `Ctrl+X`). Rodoma aplanke `devops`, tuo pačiu pavadinimu `git-bandymas` kaip studentų.

Pirma dalis, 1–7. Clone ir patikra:

```bash
cd ~/Desktop/devops
gh repo view git-bandymas --json url -q .url
git clone https://github.com/<vartotojas>/git-bandymas.git git-bandymas-kopija
cd git-bandymas-kopija
ls
git remote -v
git log --oneline
```

Antra dalis, 1–7. Dokumentas (pavyzdinis tekstas žemiau):

```bash
nano devops-dokumentas.md
```

Po išsaugojimo:

```bash
git add devops-dokumentas.md
git commit -m "Pridėta, kur gali lūžti"
git push
```

Patikra GitHub:

```bash
gh api repos/{owner}/{repo}/contents --jq '.[].name'
```

Trečia dalis, 1–7. Šaka `skyriai`:

```bash
git switch -c skyriai
nano devops-dokumentas.md   # pridėti skyrių `## Kodėl DevOps`
git commit -am "Pridėta, kodėl DevOps"
git push -u origin skyriai
git switch main
```

Patikra GitHub šakų ir `main` failo:

```bash
git ls-remote --heads origin
git branch
grep "Kodėl DevOps" devops-dokumentas.md   # `main` šakoje nieko neturi rasti
```

Ketvirta dalis, 1–5. Sujungimas ir trynimas:

```bash
git merge skyriai
git push
git branch -d skyriai
git push origin --delete skyriai
git log --oneline --graph --all
```

Penkta dalis, 1–4. `git branch --help` (ieškoti `-d` ir `-D`), parašyti skyrių `## Git` dokumente (`nano devops-dokumentas.md`) ir:

```bash
git commit -am "Pridėta apie šakų trynimą"
git push
```

Penkta dalis, 5. Patikra: `grep -rniE "password|slaptažod|[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" .` (neturi rasti nieko)

#### Pavyzdinis `devops-dokumentas.md`

```markdown
# Kas yra DevOps

DevOps yra būdas, kaip kūrėjai ir sistemų administratoriai dirba kartu, kad programa greitai ir saugiai pasiektų vartotoją. Pagrindinė idėja: kuo daugiau žingsnių automatizuoti ir kuo dažniau išleisti mažus pakeitimus. Tai ne vienas įrankis, o darbo kultūra ir procesas.

## Kur gali lūžti

1. Testai: jei jų nėra, klaida pasiekia vartotoją.
2. Diegimas: ranka diegiant, galima pamiršti žingsnį ir serveris veiks kitaip nei kompiuteryje.

## Kodėl DevOps

DevOps leidžia komandai išleisti pakeitimus greičiau ir su mažesne rizika, nes daug žingsnių atlieka automatika. Klaidas randame anksti, o ne pas vartotoją.
```
