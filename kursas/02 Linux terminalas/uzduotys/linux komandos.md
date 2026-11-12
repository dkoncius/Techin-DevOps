# Linux komandos pradedantiesiems

## Judėjimas
- `pwd` → kur esu
- `ls` → parodo failus (`ls -l` su detalėmis, `ls -a` su paslėptais, `ls -R` su pogrupiais)
- `cd APLANKAS` → pereina į aplanką (`cd ..` aukštyn, `cd ~` į namus)

## Failai ir aplankai
- `mkdir -p KELIAS` → sukuria aplanką (ir tarpinius)
- `touch FAILAS` → sukuria tuščią failą
- `cp ŠALTINIS TIKSLAS` → nukopijuoja
- `mv ŠALTINIS TIKSLAS` → perkelia arba pervadina
- `cat FAILAS` → parodo failo turinį

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
- `chmod +x FAILAS` → leidžia vykdyti
- `chmod 600 FAILAS` → tik savininkas skaito ir rašo
- `./SKRIPTAS.sh` → paleidžia skriptą

## Pagalba
- `man KOMANDA` → pagalba (išeiti `q`)
