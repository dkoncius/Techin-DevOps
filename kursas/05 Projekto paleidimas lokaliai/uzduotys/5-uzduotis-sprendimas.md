# 5 užduotis, sprendimas (dėstytojui): visa grandinė

Vertinimas pagal patikros sąrašą. Skriptas gali skirtis nuo 4 užduoties versijos, jei grąžina tuos pačius kodus.

```bash
gh repo create serveris-2 --template dkoncius/devops-projektas-starter-template --public
mkdir -p ~/devops
cd ~/devops
git clone https://github.com/JŪSŲ-VARDAS/serveris-2.git
cd serveris-2
git switch -c grandine
cp .env.example .env
nano .env
nano paleisti.sh
chmod +x paleisti.sh
./paleisti.sh; echo "kodas: $?"
PORT=5005 ./paleisti.sh; echo "kodas: $?"
cd /tmp && ~/devops/serveris-2/paleisti.sh; cd ~/devops/serveris-2
nano README.md
git status
git add paleisti.sh README.md
git commit -m "Pridėtas paleisti.sh ir README"
git push -u origin grandine
gh pr create --title "Visa grandinė" --body "paleisti.sh, .env ir README."
gh pr merge --merge
git switch main
git pull
```

`.env`:

```
APP_COLOR=blue
APP_VERSION=2.0
```

`paleisti.sh`: galutinė versija iš `4-uzduotis-sprendimas.md`.

Dažnos klaidos: `.env` patenka į `git add .` (jei `.gitignore` jo neapima), `kill` pamirštas ir portas lieka užimtas, skriptas neveikia iš `/tmp` (trūksta `cd "$(dirname "$0")"`), `PORT` nustatytas po `.env` įkėlimo, PR sulietas nepatikrinus `git status`.

Nepatikrinta: ši užduotis nebuvo paleista su tikru šablonu, tik remiasi 1–4 užduotimis.
