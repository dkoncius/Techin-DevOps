=== titulinė | Linux terminalas
02 pamoka · 1 etapas
- Tęsti `git-bandymas` iš 01 pamokos
- Pakartoti terminalą ir tą patį darbą padaryti skriptu
- Pateikti pirmą Pull Request
Pastaba: ~5 min pasitikrinimas po 01. Parodykite 01 užduotis: 1 ir 2 komandos yra pačioje užduotyje, 3 užduoties sprendimas `3-uzduotis-sprendimas.md`. Šablono `devops-projektas` šioje pamokoje nėra: dirbame `~/Desktop/devops/git-bandymas`. Linux komandas jie jau mokėjo pas Edgarą. Nauja: skriptas, kuris pakartoja ranka darytą paiešką, teisės `600` ir pirmas Pull Request.

=== pagalvokime
Serveris debesyje neturi nei pelės, nei lango.
# Kaip jį valdyti tik tekstu?
@iliustracija: serveris
> Kaip pokalbis telefonu: nėra paveikslėlio, tik žodžiai, bet tiksliai ir greitai.
Pastaba: ~3 min. Paklauskite, ką jie darė su Ubuntu. Mintis: tą pačią komandą galima įrašyti į skriptą. Šiandien jie pirma padarys paiešką ranka, paskui tą patį paleis skriptu.

=== demonstracija | Tas pats aplankas, nauja šaka
```bash
cd ~/Desktop/devops/demo-a
git switch main
git pull
git switch -c demo-02
nano pradzia.md
git add pradzia.md
git commit -m "Demo: pradžia"
```
+ `demo-a` jau yra iš 01 demonstracijos. Naujo `git clone` nėra
Pastaba: ~8 min. Kiti vardai nei užduotyje: aplankas `demo-a`, šaka `demo-02`, failas `pradzia.md` su `# Demo` (ne `uzrasai.md`). `nano`: `Ctrl+O`, `Enter`, `Ctrl+X` (Mac'e Control, ne Cmd). Šią Git eigą rodote vieną kartą. Paskelbkite 1 užduotį.

=== demonstracija | Kur esu
```bash
pwd
ls -la
cd demo
cd ..
cd ~/devops/demo-a
```
+ `/` šaknis, `~` namai, `.` čia, `..` aukštyn
+ Kai neprisimenate vėliavos: `man ls` (išeiti `q`). Mac `ls --help` neveikia
Pastaba: ~4 min. Jie tai moka. Tab užbaigia vardą, rodyklė aukštyn grąžina komandą. `man` reikės 2 užduoties papildomai (`ls -lS`).

=== demonstracija | Aplankai ir failai
```bash
mkdir -p demo/vaisiai
touch demo/vaisiai/obuolys.txt demo/vaisiai/kriause.txt
cp demo/vaisiai/obuolys.txt demo/vaisiai/kriause.txt
mv demo/vaisiai/kriause.txt demo/slyva.txt
ls -R demo
```
+ `cp` kopijuoja, `mv` perkelia arba pervadina
Pastaba: ~6 min. Vardai kiti nei užduotyje (`uzrasai`, `komandos.txt`, `archyvas`). Kurse nenaudojame `rm -rf`. Paskelbkite 2 užduotį. `mkdir`, `cp` ir `mv` daugiau užduotyse neberašome: yra `linux komandos.pdf`.

=== demonstracija | Srautai
>>+ obuolys | sort | rusiuota.txt
```bash
echo obuolys > vaisiai.txt
echo anasas >> vaisiai.txt
echo banana >> vaisiai.txt
sort vaisiai.txt > rusiuota.txt
wc -l vaisiai.txt
head -n 2 vaisiai.txt
tail -n 2 vaisiai.txt
cat vaisiai.txt | grep an
```
+ `>` perrašo visą failą, `>>` prideda gale
Pastaba: ~8 min. Failas `vaisiai.txt`, ne mokinių `komandos.txt`. Greitas patikrinimas: `echo a > lapas.txt`, `echo b >> lapas.txt`, `echo c > lapas.txt`. `cat` rodo tik `c`. Dažna klaida: `>` vietoje `>>`.

=== demonstracija | Paieška
```bash
grep -rn "obuolys" demo
find demo -name "*.txt"
```
+ Tą pačią paiešką užduotyje jie darys žodžiui `Terminalas`
Pastaba: ~5 min. Neieškokite `Terminalas` ir nerašykite į `uzrasai/`. Commit „Demo: srautai“ ta pačia eiga kaip pirma demonstracija. Paskelbkite 3 užduotį.

=== tekstas | Teisės
@iliustracija: raktas
| Sakinys | Reiškia |
|---|---|
| `-rw-r--r--` (644) | ?Savininkas skaito ir rašo, kiti tik skaito |
| `-rwxr-xr-x` (755) | ?Visi gali vykdyti, savininkas ir keisti |
| `-rw-------` (600) | ?Tik savininkas: tinka raktams ir `.env` |
Pastaba: ~5 min. Pildykite kartu. Pirmas simbolis `-` failas, `d` aplankas. Trys trynukai: savininkas, grupė, kiti. Parodykite `ls -l run.sh` projekte: jis jau vykdomas.

=== demonstracija | Skriptas kartoja rankų darbą
```bash
#!/usr/bin/env bash
echo "Aplankas: $(pwd)"
echo "Vaisiai: $(ls demo/vaisiai | wc -l | tr -d ' ')"
find demo -name "*.txt"
grep -n "an" vaisiai.txt
```
```bash+
nano labas.sh
./labas.sh
chmod +x labas.sh
./labas.sh > demo/saskaita.txt
touch ~/devops/demo-raktas.txt
chmod 600 ~/devops/demo-raktas.txt
```
```output+
Aplankas: /Users/.../demo-a
Vaisiai: 1
```
Pastaba: ~8 min. `labas.sh` daro tą patį, ką ranka: skaičius, `find`, `grep`. Kiti vardai nei `scripts/ataskaita.sh` ir `~/devops/slaptas.txt`. Pirmas `./labas.sh` baigiasi permission denied. Paskelbkite 4 užduotį.

=== demonstracija | Pull Request
```bash
git push -u origin demo-02
```
+ **Compare & pull request** → pavadinimas „Vaisiai“ → **Files changed** → **Merge pull request**
```bash+
git switch main
git pull
git branch -d demo-02
git push origin --delete demo-02
```
Pastaba: ~6 min. Pavadinimas ne „Terminalas“, šaka `demo-02`. `git push origin --delete` cheat sheet nėra, todėl ji lieka ir mokinių 5 užduotyje. `switch`, `pull` ir `branch -d` yra cheat sheet: užduotyje jų neberašome, čia parodote vieną kartą. Dažna klaida: PR sulietas, bet kompiuteryje nepadarytas `git pull`. Paskelbkite 5 užduotį.

=== klaida | Dažnos klaidos
+:: | Permission denied | Trūksta `x`: `chmod +x`. `bash skriptas` veikia ir be jos
+:: | Klonuota į `/mnt/c` | Perkelkite į `~/devops`
+:: | Ne tas aplankas | Tęskite `git-bandymas`, ne naują repozitoriją
+:: | `>` vietoje `>>` | Failas perrašytas
+:: | PR sulietas, `main` senas | `git switch main`, tada `git pull`
Pastaba: ~3 min. Klaidos tekstą perskaitykite pirma. Jei komandos neprisimena, `linux komandos.pdf` ir [Git cheat sheet](https://git-scm.com/cheat-sheet).

=== uzduotys | Užduotys
@uzduotys: auto, tik sąrašas
Pastaba: Pilni žingsniai yra Teams'e. 1 užduotis rašo kelią pirmą kartą. 3–5 užduotys jau nueitos Git ir `nano` eigos nebekartoja: mokinys prisimena arba atsidaro lapą. Naujos komandos (`chmod`, `grep` projekte, `git push origin --delete`) užduotyje vis tiek parašytos.

=== kita | Kita pamoka
Procesai, aplinkos kintamieji, paketų tvarkyklė
Pastaba: Kitą pamoką tęsiame tą patį `git-bandymas`: `uzrasai.md` ir `scripts/ataskaita.sh`.
