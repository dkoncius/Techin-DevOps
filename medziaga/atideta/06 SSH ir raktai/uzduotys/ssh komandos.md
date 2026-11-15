# SSH komandos

## Raktas
- `ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_kursas -C "kursas"` → nauja pora atskirame faile
- `ls -l ~/.ssh` → teisės: aplankas `700`, privatus `600`, `.pub` `644`
- `chmod 700 ~/.ssh` ir `chmod 600 ~/.ssh/id_ed25519_kursas`
- `cut -c1-40 ~/.ssh/id_ed25519_kursas.pub` → tik viešo rakto pradžia
- Privataus failo (be `.pub`) neatidarykite ir nesiųskite

## GitHub
- `gh ssh-key add ~/.ssh/id_ed25519_kursas.pub --title kursas`
- `ssh -T git@github.com` → `Hi <vartotojas>!`
- `git remote set-url origin git@github.com:<vartotojas>/devops-projektas.git`

## Konfliktas
- `git merge ŠAKA` → jei ta pati eilutė keista abiejose, faile atsiranda `<<<<<<<`, `=======`, `>>>>>>>`
- Po sutvarkymo: `git add` ir `git commit`
- `git merge --abort` → nutraukia nebaigtą sujungimą

Raktų nelaikykite `/mnt/c`: ten teisės neveikia.
