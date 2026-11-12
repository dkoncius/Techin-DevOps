# Linux komandos pradedantiesiems

## Judėjimas
- `pwd` → print working directory: kur esu
- `ls` → list: parodo failus (`ls -l` su detalėmis, `ls -a` su paslėptais, `ls -R` su pogrupiais)
- `cd APLANKAS` → change directory: pereina į aplanką (`cd ..` aukštyn, `cd ~` į namus)

## Failai ir aplankai
- `mkdir -p KELIAS` → make directory: sukuria aplanką (ir tarpinius)
- `touch FAILAS` → sukuria tuščią failą
- `cp ŠALTINIS TIKSLAS` → copy: nukopijuoja
- `mv ŠALTINIS TIKSLAS` → move: perkelia arba pervadina
- `cat FAILAS` → concatenate: parodo failo turinį
- `code FAILAS` → atidaro failą VS Code redaktoriuje (jei failo nėra, sukuria išsaugojus)
- `nano FAILAS` → terminalo redaktorius (išsaugoti `Ctrl+O`, `Enter`, išeiti `Ctrl+X`)

## Srautai ir paieška
- `echo "TEKSTAS"` → išveda tekstą
- `KOMANDA > FAILAS` → rezultatą įrašo į failą (perrašo)
- `KOMANDA >> FAILAS` → rezultatą prideda gale
- `KOMANDA1 | KOMANDA2` → pirmos rezultatą perduoda antrai
- `sort FAILAS` → surikiuoja eilutes
- `head -n 2 FAILAS` → pirmos eilutės (`tail` paskutinės)
- `wc -l FAILAS` → suskaičiuoja eilutes
- `grep "TEKSTAS" FAILAS` → randa eilutes su tekstu (`-r` aplanke, `-n` su numeriu)
- `find . -name "*.md"` → randa failus pagal vardą

## Teisės ir skriptai
- `ls -l FAILAS` → rodo teises (`rwx`: skaityti, rašyti, vykdyti)
- `chmod +x FAILAS` → change mode: leidžia vykdyti (x = execute)
- `chmod 600 FAILAS` → tik savininkas skaito ir rašo
- `./SKRIPTAS.sh` → paleidžia skriptą

## Pagalba
- `man KOMANDA` → manual: pagalba (išeiti `q`)
