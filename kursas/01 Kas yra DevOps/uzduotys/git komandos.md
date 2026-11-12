# Git komandos pradedantiesiems

## Pradžia
- `git init` → initialize: sukuria naują Git repozitoriją aplanke
- `git clone URL` → clone: nukopijuoja repozitoriją iš GitHub
- `git remote add origin URL` → prideda nuotolinę repozitoriją (`git remote -v` parodo)

## Kasdienis darbas
- `git status` → parodo, kas pakeista ir kas paruošta commit'ui
- `git add FAILAS` → įtraukia pakeitimus į staging (`git add .` visus)
- `git commit -m "ŽINUTĖ"` → išsaugo pakeitimus su žinute (`-am` kartu su `add` jau sekamiems failams)
- `git log --oneline` → trumpa commit istorija (`--graph --all` su šakų medžiu)

## Šakos
- `git branch` → parodo šakas (`-d ŠAKA` ištrina sujungtą, `-D ŠAKA` priverstinai)
- `git switch ŠAKA` → pereina į šaką (`-c ŠAKA` sukuria naują ir pereina)
- `git merge ŠAKA` → sujungia šaką į dabartinę

## GitHub
- `git push` → išsiunčia commit'us į GitHub (`-u origin ŠAKA` pirmą kartą)
- `git pull` → atsisiunčia pakeitimus iš GitHub
- `git push origin --delete ŠAKA` → ištrina šaką GitHub'e
- `gh repo view VARDAS --json url -q .url` → parodo repozitorijos nuorodą
- `gh auth status` → GitHub CLI: ar esi prisijungęs
- `gh repo create VARDAS --public` → sukuria repozitoriją GitHub'e

## Pagalba ir failai
- `git KOMANDA --help` → oficiali dokumentacija (pvz. `git branch --help`, išeiti `q`)
- `nano FAILAS` → terminalo redaktorius (išsaugoti `Ctrl+O`, `Enter`, išeiti `Ctrl+X`)

## Atšaukimas
- `git restore FAILAS` → atšaukia faile padarytus pakeitimus
- `git restore --staged FAILAS` → atšaukia `git add` veiksmą
- `git reset --hard HASH` → atstato projektą į konkrečią commit versiją
