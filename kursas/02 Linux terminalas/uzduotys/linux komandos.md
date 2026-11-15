# Linux komandos

## Vieta ir failai
- `Tab` → užbaigia komandą ar failo/aplanko vardą; du kartus `Tab` rodo galimus variantus (kelias su tarpais — kabutės)
- `pwd` → kur esu
- `ls` → kas yra aplanke (`ls -l` su teisėmis)
- `cd APLANKAS` → pereina (`cd ..` aukštyn)
- `mkdir -p KELIAS` → sukuria aplanką
- `touch FAILAS` → sukuria tuščią failą
- `nano FAILAS` → redaktorius; **Mac:** įklijuoti **Cmd+V**, redaguoti trumpame faile — rodyklės + `Backspace` ok; `Ctrl+V` = kitas puslapis; WSL dažnai `Ctrl+Shift+V` (`Ctrl+O` išsaugo, `Ctrl+X` išeina, `Ctrl+G` pagalba, `Ctrl+K` kerpa, `Ctrl+U` įklijuoja ką tik iškirptą, **ne** undo; Pico — undo nėra, `Ctrl+X` + **N** ir iš naujo; `Ctrl+A` / `Ctrl+E` eilutės kraštai, `Ctrl+Y` / `Ctrl+V` puslapiai, `Ctrl+W` paieška, `Ctrl+W` ir `Enter` kitą)
- `cat FAILAS` → parodo turinį
- `grep -n "TEKSTAS" FAILAS` → randa eilutę su numeriu
- `grep -n -f ZODZIAI FAILAS` → žodį ima iš kito failo
- `KOMANDA > FAILAS` → rezultatą įrašo į failą

## Teisės ir skriptas
- `#!/usr/bin/env bash` → pirma eilutė: šauktukas, env, bash
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
