=== titulinė | Linux terminalas
02 pamoka · 1 etapas
- Susikurti savo `devops-projektas` iš šablono ir nusiklonuoti
- Judėti po failus ir sujungti komandas per srautus
- Paaiškinti teises `rwx` ir paleisti pirmą skriptą
Pastaba: ~5 min pasitikrinimas po 01: kam kas liko neaišku su šaka ir `merge`; parodykite 01 sprendimą gyvai (01 pamoka.md, skyrius „Pamokos eiga“). Šioje pamokoje kiekviena tema eina taip: skaidrės → jūsų demonstracija → užduotis Teams'e → jie daro patys. Užduotys eina viena gija: pastabos → srautai → skriptas → PR. Terminalą jie jau mokėjo (Edgaras), todėl einame greitai.

=== pagalvokime
Serveris debesyje neturi nei pelės, nei lango.
# Kaip jį valdyti tik tekstu?
@iliustracija: serveris
> Kaip pokalbis telefonu: nėra paveikslėlio, tik žodžiai, bet tiksliai ir greitai.
Pastaba: ~3 min. Paklauskite, ką jie darė su Ubuntu VirtualBox'e. Mintis: terminale parašytą komandą galima įrašyti į skriptą ir paleisti šimtą kartų vienodai, o spaudant pelę to padaryti negalima. Todėl DevOps dirba terminale.

=== schema | Kaip gaunate savo projektą
```excalidraw
file: sablonas-ir-kopija
box sablonas | Šablonas\nstarter-template | 0,0 | gray | 1.3,1
box kopija | Jūsų kopija\ndevops-projektas | 1.7,0 | blue | 1.3,1
box kompiuteris | ~/devops/devops-projektas | 1.7,1 | green | 1.3,1
arrow sablonas -> kopija | Use this template
arrow kopija -> kompiuteris | git clone
```
+ Kodėl kopija? Šablonas priklauso kitam: jo keisti negalite, o savo kopijoje galite daryti ką norite
Pastaba: ~3 min. Šablonas ir fork skiriasi: Use this template sukuria naują repozitoriją be senos istorijos. Kaip patiems susikurti šabloną: 09 pamoka. Dažna klaida: klonuojamas pats šablonas (`starter-template`) vietoje savo kopijos; klonuojama į `/mnt/c` (WSL).

=== demonstracija | Savo projekto klonavimas
```bash
cd ~/devops                                           # į darbo aplanką
git clone https://github.com/<vartotojas>/demo-a.git  # nusiklonuoja
cd demo-a                                             # į klonuotą aplanką
```
```bash+
git remote -v   # kur eis push
ls              # failai
```
```bash+
git switch -c pamoka-02   # sukuria šaką ir persijungia
git branch                # šakos, * yra esama
```
Pastaba: ~5 min. Kitas pavyzdys nei užduotyje: sava demo kopija `demo-a`. Pirma naršyklėje parodykite **Use this template** ir **Public**. Klonavimo adresas: HTTPS, kaip `gh auth login`. Po klonavimo `git remote -v` turi rodyti jūsų vardą (`origin`, `fetch`/`push`); paaiškinkite, kad `clone` pats nustato `origin`, o `remote -v` tik parodo, kur eis `push`. Paskelbkite 1 užduotį.

=== tekstas | Komanda, parametrai, argumentai
@plokštelės
:: 01 | Komanda | Ką daryti: `ls`
:: 02 | Parametras | Kaip daryti: `-l`
:: 03 | Argumentas | Su kuo daryti: `a.txt`
```bash
ls
```
```bash+
ls -l
```
```bash+
ls -l a.txt
```
+ Kai neprisimenate: `man ls` (išeiti: `q`) arba `ls --help` (tik Ubuntu / WSL)
Pastaba: ~3 min. Jie tai jau moka, tik prisiminti. Principas: įrankiai keičiasi, bet komandos struktūra visur ta pati: kas + kaip + su kuo. `man`: išeiti `q`. Mac `ls --help` nepalaiko (rodo „unrecognized option“ ir trumpą naudojimą): ten naudokite `man ls`.

=== komanda | Kur esu ir kas čia
```bash
pwd   # kur esu
```
```bash+
ls -la   # failai, įskaitant paslėptus
```
```bash+
cd ..   # viena pakopa aukštyn
```
```bash+
cd demo-a   # į aplanką
```
+ Tab užbaigia vardą, rodyklė aukštyn grąžina ankstesnę komandą
Pastaba: ~4 min. Parodykite Tab ir `Ctrl+R` (ieškoti istorijoje). Mac ir WSL elgiasi vienodai.

=== demonstracija | Keliai: absoliutus ir santykinis
| Žymėjimas | Reiškia |
|---|---|
| `/` | ?Šakninis aplankas |
| `~` | ?Jūsų namų aplankas |
| `.` | ?Šiuo metu esamas aplankas |
| `..` | ?Aplankas viršuje |
```bash+
cd ~                  # į namų aplanką
cd ~/devops/demo-a    # absoliutus kelias
cd ..                 # viena pakopa aukštyn
cd demo-a             # santykinis kelias
```
Pastaba: ~3 min. Pildykite kartu: klauskite, ką reiškia `~`, paskui paspauskite. Santykinis kelias priklauso nuo to, kur esate, absoliutus (nuo `/` arba `~`) visada tas pats. Dažna klaida: tarpas aplanko varde be kabučių (`cd Mano aplankas`).

=== demonstracija | Failai ir aplankai
| Komanda | Ką daro |
|---|---|
| `mkdir -p KELIAS` | ?Sukuria aplanką (ir tarpinius) |
| `touch FAILAS` | ?Sukuria tuščią failą |
| `cp ŠALTINIS TIKSLAS` | ?Nukopijuoja failą |
| `mv ŠALTINIS TIKSLAS` | ?Perkelia arba pervadina |
| `ls -R APLANKAS` | ?Parodo aplankų medį |
```bash+
mkdir -p demo/vaisiai
touch demo/vaisiai/obuolys.txt
cp demo/vaisiai/obuolys.txt demo/vaisiai/kriause.txt
mv demo/vaisiai/kriause.txt demo/slyva.txt
ls -R demo
```
Pastaba: ~8 min su demonstracija aplanke `demo` (kiti failų vardai nei užduotyje: ten `docs/pastabos`, `komandos.txt`). Pasakykite: šiame kurse nenaudojame `rm -rf`, pirma kopijuokite, o ne trinkite. Kodėl nekeliame `rm -rf`: ištrintas failas nepatenka į šiukšlinę. Paskelbkite 2 užduotį.

=== tekstas | Srautai: vamzdis ir nukreipimas
>>+ vaisiai.txt | sort | rusiuota.txt
```bash
# sukuria failą su keturiomis eilutėmis
printf 'obuolys\nanasas\nslyva\nbanana\n' > vaisiai.txt
cat vaisiai.txt                   # parodo turinį
sort vaisiai.txt > rusiuota.txt   # surikiuotą įrašo į naują failą
echo "slyva" >> vaisiai.txt       # prideda eilutę gale
cat vaisiai.txt | grep an         # palieka eilutes su „an“
```
> Kaip vamzdis: viena komanda daro vieną darbą, o `|` perduoda rezultatą kitai.
+ `grep` ieško tekste, `find . -name` randa failą pagal vardą
Pastaba: ~8 min su demonstracija. Failas `vaisiai.txt` (kitas nei mokinių `komandos.txt`). Parodykite `head`, `tail`, `wc -l`. Principas: maži įrankiai, jungiami į grandinę (Unix filosofija); tuo remiasi skriptai ir CI/CD.

=== jusu-eile | Ką parodys failas?
```bash
echo "a" > lapas.txt
echo "b" >> lapas.txt
echo "c" > lapas.txt
cat lapas.txt
```
+ Tik `c`: `>` perrašo visą failą, o `>>` prideda gale
Pastaba: ~3 min. Leiskite spėlioti: `a b c`, `a b` ar `c`. Dažna klaida: mokiniai praranda turinį pasirinkę `>`. Paskelbkite 3 užduotį.

=== demonstracija | Teisės: kas gali ką
@iliustracija: raktas
| Sakinys | Reiškia |
|---|---|
| `-rw-r--r--` (644) | ?Savininkas skaito ir rašo, kiti tik skaito |
| `-rwxr-xr-x` (755) | ?Visi gali vykdyti, savininkas ir keisti |
| `-rw-------` (600) | ?Tik savininkas: tinka raktams ir `.env` |
Pastaba: ~7 min. Pildykite kartu. Pirmas simbolis `-` failas, `d` aplankas; toliau trys trynukai: savininkas, grupė, kiti. Principas: slapti dalykai (`.env`, privatūs raktai) turi būti skaitomi tik savininkui. Parodykite `ls -l run.sh` projekte: jis jau vykdomas.

=== komanda | Pirmas skriptas
```bash
echo '#!/usr/bin/env bash' > labas.sh     # pirma eilutė: kuo paleisti
echo 'echo "Labas, $(pwd)"' >> labas.sh  # antra eilutė: ką daryti
./labas.sh                                # paleidžia skriptą
```
```output+
-bash: ./labas.sh: Permission denied
```
```bash+
chmod +x labas.sh   # leidžia vykdyti
ls -l labas.sh      # rodo teises (atsirado x)
./labas.sh          # dabar veikia
```
> Kaip raktas nuo kabineto: failas yra, bet be teisės jo nepaleisite.
Pastaba: ~8 min. Pavyzdys `labas.sh` (kitas nei mokinių `ataskaita.sh`, kuris automatizuoja jų ranka darytus žingsnius). Išvestis pavyzdinė (zsh rodo `zsh: permission denied: ./labas.sh`). Pirma eilutė `#!/usr/bin/env bash` pasako, kuo skriptą paleisti. Dažna klaida: `bash labas.sh` veikia ir be `x`, o `./labas.sh` ne. Windows: CRLF (`bad interpreter`): kurti WSL redaktoriumi. Paskelbkite 4 užduotį.

=== demonstracija | Pull Request
```bash
git add .                                # paruošia pakeitimus
git commit -m "Demo: pirmas pakeitimas"  # išsaugo juos
git push -u origin pamoka-02             # išsiunčia šaką į GitHub
```
+ Naršyklėje: **Compare & pull request** → pavadinimas → **Files changed** → **Merge pull request**
```bash+
git switch main            # grįžta į main
git pull                   # atsisiunčia sulietą pakeitimą
git branch -d pamoka-02    # ištrina sulietą šaką
```
Pastaba: ~5 min. Rodykite `demo-a`. Principas: darbas per šaką ir PR, o ne tiesiai į `main`: kitas žmogus gali peržiūrėti, `main` lieka veikiantis. Dažna klaida: PR sulietas GitHub'e, bet `main` kompiuteryje neatnaujintas (`git pull`); `git branch -d` atsisako. Paskelbkite 5 užduotį.

=== klaida | Dažnos klaidos
+:: | Permission denied | Trūksta `x` teisės: `chmod +x`
+:: | Klonuota į `/mnt/c` | Perkelkite į `~/devops` (lėta, sugedusios teisės)
+:: | Klonuotas šablonas | Reikia savo kopijos: **Use this template**
+:: | `>` vietoje `>>` | Failas perrašytas: prieš `>` pagalvokite, ar jo turinio nereikia
+:: | PR sulietas, bet `main` senas | Kompiuteryje `git switch main`, `git pull`
+ Principas: klaidos tekstas dažniausiai pasako, ką daryti, todėl pirma jį perskaitykite
Pastaba: ~3 min. Prieš 5 užduotį (PR): parodykite `demo-a` PR: `git push -u origin pamoka-02`, **Compare & pull request**, **Merge**, `git switch main`, `git pull`. Principas: darbas per šaką ir PR, o ne tiesiai į `main`: kitas žmogus gali peržiūrėti, `main` lieka veikiantis.

=== uzduotys | Užduotys
@uzduotys: auto, tik sąrašas
Pastaba: Skelbkite po vieną Teams'e: kiekvieną užduotį po demonstracijos, kitą tik kai baigia. Pilni žingsniai yra Teams žinutėje ir pamoka.md. Užduotys eina viena gija viename projekte: pastabos (2), jų apdorojimas srautais (3), skriptas, kuris tai automatizuoja (4), PR (5).

=== kita | Kita pamoka
Procesai, aplinkos kintamieji, paketų tvarkyklė
Pastaba: Primename: kitą pamoką pradėsime nuo šios pamokos sprendimo (`docs/terminalas.md`, `terminalas.sh`).
