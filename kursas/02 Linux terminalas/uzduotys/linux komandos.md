# Linux komandos

## Vieta ir failai
- `pwd` → kur esu
- `ls` → kas yra aplanke (`ls -l` su teisėmis)
- `cd APLANKAS` → pereina (`cd ..` aukštyn)
- `mkdir -p KELIAS` → sukuria aplanką
- `touch FAILAS` → sukuria tuščią failą
- `nano FAILAS` → redaktorius (`Ctrl+O`, `Enter`, `Ctrl+X`)
- `cat FAILAS` → parodo turinį
- `grep -n "TEKSTAS" FAILAS` → randa eilutę su numeriu
- `KOMANDA > FAILAS` → rezultatą įrašo į failą

## Teisės ir skriptas
- `chmod +x FAILAS` → leidžia vykdyti
- `chmod 600 FAILAS` → tik savininkas skaito ir rašo
- `./SKRIPTAS.sh` → paleidžia skriptą

## Procesas ir kintamasis
- `KOMANDA &` → paleidžia fone, pvz. `sleep 30 &`
- `ps aux | grep VARDAS` → randa procesą (PID yra antras stulpelis)
- `kill PID` → prašo procesą baigti
- `export VARDAS=reikšmė` → kintamasis tik šiam langui
- `echo $VARDAS` → parodo kintamąjį
- `which KOMANDA` → kur komanda yra

## Paketas
- `brew install PAKETAS` → Mac, be `sudo`
- `sudo apt update` → Ubuntu / WSL, atnaujina sąrašą
- `sudo apt install PAKETAS` → Ubuntu / WSL
- `PROGRAMA --version` → versija
