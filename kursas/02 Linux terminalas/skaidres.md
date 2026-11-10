=== titulinė | Linux terminalas
02 pamoka · 1 etapas
- Susikurti savo `devops-projektas` iš šablono ir nusiklonuoti
- Naršyti, kurti ir kopijuoti failus terminale
- Paaiškinti teises `rwx` ir `chmod`
Pastaba: ~5 min pasitikrinimas po 01: kam kas liko neaišku su `git-bandymas`, šaka ir `merge`. Parodykite 01 sprendimą gyvai.

=== pagalvokime
Serveris debesyje neturi pelės ir lango.
# Kaip jį valdyti tik tekstu?
> Kaip pokalbis telefonu: nėra paveikslėlio, tik žodžiai, bet tiksliai ir greitai.
Pastaba: ~3 min. Jie jau moka terminalą, todėl klauskite, ką jau darė VirtualBox Ubuntu.

=== schema | Kaip gaunate savo projektą
```excalidraw
file: sablonas-ir-kopija
box sablonas | Šablonas devops-projektas-starter-template | 0,0 | gray | 1.3,1
box kopija | Jūsų repozitorija devops-projektas | 1.7,0 | blue | 1.3,1
box kompiuteris | ~/devops/devops-projektas | 1.7,1 | green | 1.3,1
arrow sablonas -> kopija | Use this template
arrow kopija -> kompiuteris | git clone
```
Pastaba: ~5 min. Dažna klaida: klonuojamas pats šablonas arba `devops-kursas`; klonuojama į `/mnt/c`. Žingsniai: `README.md`, skyrius „1. Susikurkite savo projektą“.

=== demonstracija | Savo projekto klonavimas
```bash
cd ~/devops
git clone git@github.com:<vartotojas>/devops-projektas.git
cd devops-projektas
```
```bash+
git remote -v
ls
```
Pastaba: ~5 min. Kitas pavyzdys nei užduotyje: savo demo repozitorija. HTTPS arba SSH adresas pagal tai, ką naudoja grupė.

=== tekstas | Komanda, parametrai, argumentai
- **Komanda:** ką daryti (`ls`)
- **Parametras:** kaip daryti (`-l`)
- **Argumentas:** su kuo daryti (`docs`)
- Pagalba: `--help`, `man`
```bash
ls -l docs
```
Pastaba: ~5 min. Jie jau moka: tik prisiminti. Kodėl DevOps darbas vyksta terminale (automatizuojama).

=== komanda | Kur esu ir kas čia
```bash
pwd
ls -la
cd docs
cd ..
```
+ `pwd` kur esu, `ls -la` ką matau (įskaitant paslėptus), `cd` judėti
+ Tab užbaigia vardą, rodyklė aukštyn grąžina ankstesnę komandą
Pastaba: ~5 min.

=== tekstas | Keliai: absoliutus ir santykinis
| Žymėjimas | Reiškia |
|---|---|
| `/` | ?Šakninis aplankas |
| `~` | ?Jūsų namų aplankas |
| `.` | ?Šiuo metu esamas aplankas |
| `..` | ?Aplankas viršuje |
Pastaba: ~4 min. Pildykite kartu, tada paspauskite.

=== komanda | Failai ir aplankai
```bash
mkdir -p docs/pastabos
touch docs/pastabos/a.txt
cp docs/pastabos/a.txt docs/pastabos/b.txt
mv docs/pastabos/b.txt docs/c.txt
cat docs/c.txt
```
+ `cp` kopijuoja, `mv` perkelia arba pervadina
+ Šiame kurse nenaudojame `rm -rf`: pirma kopijuokite, o ne trinkite
Pastaba: ~6 min. Parodykite `head`, `tail` ir `less` kitame faile.

=== tekstas | Srautai: vamzdis ir nukreipimas
- `|` perduoda vienos komandos išvestį kitai
- `>` įrašo į failą (perrašo), `>>` prideda gale
- `grep` ieško, `find` randa failus
```bash
ls -l | grep docs
echo "pastaba" >> docs/pastabos.txt
```
Pastaba: ~5 min.

=== demonstracija | Teisės: kas gali ką
| Sakinys | Reiškia |
|---|---|
| `-rw-r--r--` (644) | ?Savininkas skaito ir rašo, kiti tik skaito |
| `-rwxr-xr-x` (755) | ?Visi gali vykdyti, savininkas ir keisti |
| `-rw-------` (600) | ?Tik savininkas: tinka raktams ir `.env` |
Pastaba: ~8 min. Parodykite `ls -l`, `chmod +x`, `Permission denied` prieš ir po. Mac ir WSL elgiasi vienodai, bet `/mnt/c` teisės neveikia.

=== tekstas | Pirmas skriptas
- Pirma eilutė: `#!/usr/bin/env bash`
- `chmod +x scripts/terminalas.sh`
- Paleidimas: `./scripts/terminalas.sh`
- Be `x` teisės: „Permission denied“
> Kaip raktas nuo kabineto: failas yra, bet be teisės jo nepaleisite.
Pastaba: ~7 min. Jie jau moka skriptus; svarbi tik teisių dalis ir PR.

=== klaida | Dažnos klaidos
:: | Permission denied | Trūksta `x` teisės: `chmod +x`
:: | Klonuota į `/mnt/c` | Perkelkite į `~/devops` (lėta, sugedusios teisės)
:: | Klonuotas šablonas | Reikia savo kopijos: **Use this template**
:: | `cd` nesiranda | Patikrinkite `pwd` ir `ls`, naudokite Tab
Pastaba: ~3 min.

=== uzduotys | Užduotys
@uzduotys: auto
Pastaba: Skelbkite po vieną. Pamoka ilga, todėl 4 užduotį galima trumpinti arba perkelti į 03.

=== kita | Kita pamoka
Procesai, aplinkos kintamieji, paketų tvarkyklė
Pastaba: Primename `git pull` iš `devops-kursas`.
