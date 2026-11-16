---
name: pamoka-formatas
description: "Naudok, kai kuri, perrašai ar tikrini DevOps kurso pamoką (paskaitos 01–79) aplankuose kursas/NN .../: pamoka.md (klasės darbas, pamokos eiga) ir aplankas uzduotys/ su užduotimis ir jų sprendimais, kokybės taisyklės."
---

# Pamokos formatas (VH-DO, 79 paskaitos)

Šaltinis tiesos: `medziaga/kurso-planas.md` (kodai, pavadinimai, datos). Plano nekeisk; jei pamoka neatitinka plano, pranešk. Kalba lietuvių, sakiniai trumpi. Paskaita trunka 3 val. (17:30–20:40): ~20–30 min. teorijos, likusi dalis praktika; užduočių suma ~2–2,5 val.

## Kur kas guli
1. Viskas apie pamoką yra viename privačiame aplanke `kursas/<NN Pavadinimas>/` (aplanko pavadinimas lygiai kaip plano 5 skyriaus stulpelyje „Aplankas“; numeracija 01–79, be savaitės kodų; atsiskaitymų aplankai yra tarp jų tame pačiame sąraše pagal numeraciją). `pamoka.md` turi klasės darbą, schemas ir dėstytojo pamokos eigą (demonstracijas). Užduotys ir jų sprendimai NEkartojami `pamoka.md`: kiekviena užduotis yra `uzduotys/N-uzduotis.md` (studentams, Teams), jos sprendimas su komandomis `uzduotys/N-uzduotis-sprendimas.md` (dėstytojui); `pamoka.md` į juos tik nurodo.
2. Studentai užduotis gauna per Teams (dėstytojas įkelia po vieną), sprendimą mato kitos pamokos pradžioje, kai jį parodo dėstytojas. `check.sh` savitikros nėra.
3. Atsiskaitymai (09, 20, 29, 42, 53, 67, 79): tame pačiame `kursas/<NN Atsiskaitymas N>/` aplanke su `testas.md`, `praktika.md`, `vertinimas.md`, `atsakymai.md`. Studentams duodamos tik užduotys be atsakymų.
4. `kursas/README.md` yra studentų aplinkos instrukcija. Senos medžiagos, šaltiniai ir darbiniai failai yra `medziaga/` (tik skaitymui).
5. Duomenų bazė: MySQL. Platforma: GitHub (Pull Request kai mokomasi PR). Mokinio darbo projektas: GitHub template `devops-projektas`. Senuose pavyzdžiuose (`medziaga/saltiniai/`) yra PostgreSQL: konvertuok į MySQL tik tada, kai pamoka tuos pavyzdžius naudoja.

## pamoka.md
0. Skyrių eilė (kaip `01 Kas yra DevOps/pamoka.md`): `# <NN> <tema>`, `Data: ...`, `## Klasės darbas`, `## Užduotys` (tik nuoroda į `uzduotys/`), `## Pamokos eiga (dėstytojui)`. Skyrių „Komandos“, „Kur skiriasi (Mac / Ubuntu)“ ir „Schemos“ `pamoka.md` NEBETURI: schemos ir komandos yra skaidrėse, o Mac / Ubuntu skirtumai pastabose prie skaidrės.
1. Antraštė `# <NN> <tema>`, tada `## Klasės darbas`.
2. Klasės darbas: plokščias numeruotas sąrašas (1., 2.), VIENA eilutė per punktą be papunkčių: pavadinimas (~X min), „tada Užduotis K (~Y min)“, nuoroda į skaidres ir jų numeriai, trumpas temų sąrašas (pvz. `cp`, `mv`, commit). Trumpa įvadinė pastraipa (3 val., **N** rodo pastabas, ritmas, užduočių gija). Be komandų žingsnių.
3. Nuorodos: oficiali dokumentacija ir patikimi mokymosi ištekliai. URL rašyti tik tuos, kuriuos tikrai žinai; kitaip „raskite oficialioje X dokumentacijoje skyrių apie Y“.
4. Laikas klasės darbe žymimas skliaustuose prie punkto, pvz. „(~15 min)“.
5. Paskutinis punktas visada „Kita paskaita: <tema>“ (pagal plano lentelę).
6. Schemos ir diagramos tik skaidrėse (Excalidraw skaidrės `diagramos/`), `pamoka.md` jų neturi.
7. Versti iš `medziaga/saltiniai/` galima tik tekstą, su eilute „Šaltinis: <kursas, skyrius>, autorius <vardas>, išversta autoriaus leidimu.“ ir ženklu „[pritaikyta: kodėl]“. Paveikslėlių nenaudoti, nebent peržiūrėti ir patvirtinti. Katalogo `_saltiniai/nuorodos-medziaga/` neskaityti be aiškaus prašymo.
8. Kartojamos temos (Linux, Bash, Git, kuriuos mokė Edgaras) praeinamos greičiau per užduotis, bet nepraleidžiamos.
9. Kur tinka, pamoka prasideda veikiančiu rezultatu (demonstracija), toliau išardyti, sugadinti, perstatyti.
10. Eiga: teorija skaidrėse, tada dėstytojas gyvai atlieka užduotį kitu pavyzdžiu, tada mokiniai tą patį su savo pavyzdžiu. Klasės darbo punkte yra skaidrių numeriai, ką mokinys padaro, ir kada užduotis skelbiama (po kurios demonstracijos). Atskiro punkto „Demonstracija:“ nereikia, jei tos skaidrės jau nurodytos. Demonstraciniai vardai nesutampa su mokinių. Komandų žingsnių klasės darbe nėra.
11. Datos po 2027-01-01 orientacinės: mokinių medžiagoje jų nerašyk kaip patvirtintų.

## Užduotys (`uzduotys/N-uzduotis.md`)
1. `pamoka.md` skyrius `## Užduotys` yra viena pastraipa: kur yra failai ir kad dėstytojas skelbia Teams'e po vieną (pirma demonstracija, tada darbas). Užduočių teksto nekartoti. Sprendimo failą minėk tik tada, kai `uzduotys/N-uzduotis-sprendimas.md` tikrai yra.
2. Vienas plokščias numeruotas sąrašas. Dalių „Pirma dalis“ ir emoji antraščių (`1️⃣`) nėra. Failas: `# N užduotis: <Pavadinimas>`, tada iškart `1. **Tikslas:** <vienas sakinys>` (pusjuodis; jį skaito skaidrių generatorius iš `uzduotys/`, ne iš `pamoka.md`). „Kodėl“ žingsnių ir laiko užduotyje nėra. Įžangos („Jei kas neveikia“, DI draudimas, `q`) nėra.
3. Git užduoties paskutinė eilutė po sąrašo: `Jei užstrigote, pasižiūrėkite [Git cheat sheet](https://git-scm.com/cheat-sheet).` Lapas yra komandai rasti, ne klaidai taisyti: į jį nesiųsk ieškoti `reset --hard`, `rebase` ar Discard. `git komandos.pdf` į užduotį negrąžink. 1 etape DI draudžiamas (tai skaidrėse ir pamokoje, ne kiekvienoje užduotyje); nuo Docker etapo leidžiamas.
4. Žingsnis yra vienas veiksmas. Pavadinimai konkretūs: aplankas, failas, šaka, commit žinutė. Kai žingsnis keičia failą ir siunčia į GitHub, jame yra pakeitimas, `git add`, commit ir tik tada push. Vien „nusiųskite“ neužtenka. Failo keitimo būdas įvardintas (`echo` 01 pamokoje, vėliau `nano`).
5. Pirmą kartą einamą kelią mokinys atkartoja: komanda ir laukiamas rezultatas yra tame pačiame žingsnyje. Tą patį kelią kartojant toje pačioje užduotyje, komandos lieka įdėtuose punktuose. Vėlesnė užduotis jau nueitą kelią gali sutrumpinti, bet komandą, kurios cheat sheet nėra, vis tiek įrašo: `gh`, `git branch -m main`, `git push origin --delete ŠAKA`.
6. Mokiniai nerašo paaiškinimų atskirame dokumente. Kai žingsnis kuria failą, jame yra tikras turinys commit'ui. `**Papildomai:**` ne daugiau kaip vienas punktas. Paskutinis numeruotas punktas yra `**Pateikimas:**`. Kai pamoka moko PR, pateikimas yra PR į mokinio `devops-projektas` kopiją.
7. Paprastai 3–5 užduotys, suma telpa į ~1,25–2,5 val. Git pamokoje oficiali nuoroda yra cheat sheet, ne atskira užduotis „tik tikslas, be žingsnių“.
8. Užduotys parodo, ar mokiniai moka Git (clone, branch, commit), Bash, Python kodo skaitymą, vėliau MySQL.

## 01 Git užduotys (neperrašyk atgal)
Šaltinis, su kuriuo turi sutapti: `kursas/01 Kas yra DevOps/uzduotys/`. Demonstracijos vardai kiti: `demo-a`, `a.txt`, `b.txt`, `c.txt`, `bugFix`, `demo-c`, `extra`, `d.txt`.

1. **1 užduotis „Įkelkite į main per GitHub“.** `cd ~/Desktop/devops` (jei aplankas kitur, savas kelias), `mkdir git-bandymas`, `cd git-bandymas`. Du failai: `echo "pirma pastaba" > pastabos.txt` ir `echo "pirma idėja" > idejos.txt`. Patikra: `ls` ir `cat`, abu failai, po vieną eilutę. `git init`, tada `git branch -m main`. `git status` (dar neįtraukti), `git add .`, vėl `git status` (paruošti), `git commit -m "Du failai"`, `git log --oneline` (viena eilutė). `gh auth status`; `gh auth login` ir HTTPS tik jei dar neprisijungta. Tada `gh repo create` be vardo ir be vėliavų. `gh repo create git-bandymas` meniu neatidaro. Pasirinkimai tame pačiame žingsnyje: Push an existing local repository to github.com, Path `.`, name `git-bandymas`, owner mokinio paskyra, Description tuščia, Visibility Public, Add a remote Yes, remote `origin`, push Yes. `gh` pats prideda `origin` ir nusiunčia `main`. Atskiro `git remote add` nėra. Pabaiga: `git remote -v` dvi eilutės, `git status` rašo „up to date with 'origin/main'“, GitHub'e abu failai. Šakos nėra. `1-uzduotis-sprendimas.md` nėra ir jo nekurk. **Pateikimas:** sukurtos GitHub repozitorijos nuotrauka.
2. **2 užduotis „Redaguokite main ir šaką“.** Tas pats `git-bandymas`, naujo `cd` nėra. `echo "darbas main" > main.txt`, `ls` ir `cat`. `git add .`, `git status`, `git commit -m "Naujas failas main.txt"`, `git push`, status „up to date with 'origin/main'“, GitHub'e yra `main.txt`. Šaka `atnaujinimas`: `git switch -c atnaujinimas`, `echo "atnaujinimas" >> main.txt`, `cat` rodo dvi eilutes, `git branch` (žvaigždutė prie `atnaujinimas`, sąraše ir `main`). `git add .`, `git commit -m "Atnaujintas main.txt"`, `git push -u origin atnaujinimas`, `git log --oneline origin/atnaujinimas`. Atgal: `git switch main`, `git merge atnaujinimas`, `git push`. Trynimas: `git branch -d atnaujinimas`, `git push origin --delete atnaujinimas`. Tą patį kelią pakartoti su `antras` ir `trecias`, komandos įdėtuose punktuose, žinutės „Šaka antras“ ir „Šaka trecias“. `2-uzduotis-sprendimas.md` nėra. **Pateikimas:** GitHub commit'ų lango ekrano nuotrauka.
3. **3 užduotis „Nusiklonuokite kitur“.** Iš `git-bandymas` einama `cd ..`: kopija `git-bandymas-kopija` atsiranda šalia, tame pačiame `devops`, ne per `cd ~`. Nuoroda iš GitHub svetainės: žalias **Code**, **Local**, **HTTPS**. `gh repo view` šiam žingsniui nenaudojamas. **Download ZIP** draudžiamas, nes tame aplanke nėra Git istorijos. `git clone <nuoroda> git-bandymas-kopija`, tada `cd`, `ls`, `git log --oneline` (yra `pastabos.txt`, `idejos.txt` ir ankstesni commit'ai). `git remote add` nekartojamas: `origin` ateina su clone. Šaka `pridejimas`, naujas failas `echo "klonas" > klonas.txt`, esamų failų nekeisti. Naujam failui `git commit -am` neužtenka, todėl žingsnyje yra `git add klonas.txt`, `git status`, `git commit -m "Naujas failas klonas.txt"`, `git push -u origin pridejimas`. Sujungimas į `main` ir push gali būti vienas trumpesnis žingsnis. Trynimas kompiuteryje ir GitHub'e: `git push origin --delete pridejimas` įrašytas, nes cheat sheet jo nėra; vietinį trynimą rodo kortelė „Delete a branch“. `nano` šiose trijose užduotyse nenaudojamas. Sprendimas yra `3-uzduotis-sprendimas.md`; demonstracijai klonuoti į `demo-c`. **Pateikimas:** terminalo nuotrauka, kai šakos jau ištrintos, ir GitHub nuotrauka, kur liko tik `main`.
4. Į užduotį negrąžink dalių, `git komandos.pdf`, atskiro `git remote add` kaip pagrindinio kelio, `gh repo create VARDAS --public` ir nuorodos nuėmimo (`git remote remove`) prieš pirmą push.

## Komandų PDF (`uzduotys/<tema> komandos.pdf`)
1. Kiekvienai temai: `linux komandos`, `procesai komandos`, `bash komandos` ir pan. Šaltinis `<tema> komandos.md`, PDF generuojamas (Chrome headless iš HTML). Pavyzdys: Edgaro `git komandos.pdf`.
2. Tik komandos, naudojamos pamokoje ir užduotyse (skaidrės + sprendimai); bendra forma su vietos žymekliais (`cp ŠALTINIS TIKSLAS`), ne konkretus sprendimas.
3. Formatas: `komanda → trumpas aprašymas`, **be nuorodų į dokumentaciją**, ~1 puslapis, didelis šriftas, komandos sugrupuotos į kelis trumpus blokus (`##` antraštės). Komandų, kurios jau yra kitame PDF (pvz. `git komandos.pdf`), nekartoti.

## Užduočių sprendimai (`uzduotys/N-uzduotis-sprendimas.md`)
1. Antraštė `# N užduotis, sprendimas (dėstytojui): <Pavadinimas>`, eilutė, kad numeriai atitinka užduoties žingsnius, ir pastaba, kad demonstracijoje naudojamas kitas pavyzdys. Jei užduotyje jau yra visos komandos ir laukiamas rezultatas, atskiro failo nėra. 01 pamokos 1 ir 2 užduotys tokio failo neturi. 3 užduotis turi, nes sujungimo ir trynimo žingsniai sąraše sutrumpinti.
2. Po žingsnio numerio ```bash blokas. Kur reikia, „Laukiama: ...“. 01 Git užduotyse failo eilutę prideda `echo`, ne `nano`. Vėlesnėse pamokose failą, kurį mokinys rašo, atidaro `nano FAILAS` (Linux ir Mac). Turinį dėk atskirame bloke, ne per `cat <<EOS`.
3. Komandos veikia Mac ir Ubuntu (WSL); be GNU-only parametrų (žr. „Windows ir Mac“). Naršyklės žingsniai aprašomi tekstu (kur yra `gh` alternatyva, nurodyti ją).
4. Tik tikri rezultatai: kodo blokus PALEISK iš eilės švarioje aplinkoje (prireikus laikina nuotolinė repozitorija vietoj GitHub) ir tik tada rašyk „Patikrinta“. DRAUDŽIAMA nepatikrinti skriptai.

## Turinio taisyklės
1. Jokių slaptažodžių, raktų, tokenų, realių IP ir domenų. Rodyk tik `.pub` raktus.
2. Nuorodos: oficiali dokumentacija ir patikimi mokymosi ištekliai; Wikipedia tik apibrėžimams.
3. Nedaryk `git commit`, `git push` ar trynimo, jei aiškiai neprašoma. Pavojingų komandų (apply, destroy, delete, prune, kubectl apply, terraform) nevykdyk, tik aprašyk tekste.
4. Kurk pagal datų eilę: pirmiausia artimiausioms pamokoms.
5. Projekto būsenos: kiekvienos pamokos pabaigos būsena = kitos pamokos pradžia; jei pamoka projekto nekeičia, apie tai užsimenama tik tada, kai tai svarbu.
6. Studentų projekto (Flask + MySQL starterio) pamokų kūrimo metu nekurk: jį pateikia dėstytojas kaip template `devops-projektas`. Kol jo nėra, kodo skaitymo užduotims naudok trumpą bendrą Flask ištrauką su žyma „suderinti su starteriu, kai jis bus“.

## Windows ir Mac
1. Studentai dirba Windows per WSL2 Ubuntu ir Mac Terminale. PowerShell ir cmd nenaudojami; Git Bash nėra pagrindinis kelias.
2. Projektai klonuojami į `~/`, ne į `/mnt/c`. Skriptams `.gitattributes` su `*.sh text eol=lf` (`kursas/.gitattributes`, starteriui: `mokytojas/starterio-pastabos.md`).
3. Komandos pamokose turi veikti abiejose sistemose. Venk: `/proc`, `systemctl`, `journalctl`, `free -h`, `ip a`, `sed -i`, `readlink -f`, `stat -c`, `date -d`, `grep -P` ir kitų skirtingų GNU/BSD parametrų.
4. Jei skirtumo išvengti neįmanoma, abi versijos rašomos skaidrės `Pastaba:`. Atskiros `pamoka.md` lentelės „Kur skiriasi“ nėra.
5. Paketai: `apt` (Ubuntu/WSL) ir `brew` (Mac), ta pati užduotis su abiem komandomis.
6. Prisijungimas prie GitHub: pagrindinis kelias `gh auth login` (HTTPS), SSH tik papildomai. `gh` diegimas pagal oficialią GitHub CLI dokumentaciją.
7. Sprendimų failai ir „Dažna klaida“ nurodo ir platformai specifines klaidas (WSL `/mnt/c`, CRLF, `sudo brew`).
8. Pirmoji paskaita (01) turi telpti į 3 val. `git config` ir aplankas `devops` daromi aplinkos patikroje, ne užduotyje. `gh auth status` 1 užduotyje yra patikra: `gh auth login` tik jei dar neprisijungta. Git užduočių eiga: skyrius „01 Git užduotys“.

## Skyrius „Pamokos eiga (dėstytojui)“ (pamoka.md)
1. Formatas kaip `01 Kas yra DevOps/pamoka.md`: demonstracijų komandų `pamoka.md` NEDUBLIUOJA, jos yra tik skaidrėse (`skaidres/*.md` → to paties vardo `.html`). 01 pamokoje trys rinkiniai: `1-apie-mane`, `2-apie-kursa`, `3-skaidres`. Kiekviena komanda su aprašu (komentaras `# ...` arba lentelė „Komanda | Ką daro“; prie trumpinio angliškas žodis: `cp` copy, `mv` move, be lietuviško vertimo skliaustuose). Klasės darbe prie kiekvienos temos nurodomi skaidrių numeriai ir nuoroda į tą `.html`.
2. Struktūra: (a) „Patikrinta/Nepatikrinta“ viena eilutė tuoj po antraštės: „Patikrinta: <kur paleista>“ arba „Nepatikrinta: reikia išbandyti <aplinka> prieš pamoką“; (b) `### Demonstracijos žingsniai`: viena pastraipa: komandos yra skaidrėse, kada skelbti užduotį yra skaidrių `Pastaba:` (**N**). Jei užduotyje jau yra komandos, parašyk, kad atskiro sprendimo nėra. Sprendimo kelią rašyk tik ten, kur failas yra (01 pamokoje tik `uzduotys/3-uzduotis-sprendimas.md`). Laiko juostos ir kodo blokų čia nėra.
3. Demonstracija rodoma KITU pavyzdžiu nei užduotyje (pvz. `demo-a`, `demo/vaisiai`); pastabų, ką paskelbti ir dažnų klaidų vieta: skaidrių `Pastaba:`. Pirma klasės darbo dalis vėlesnėje pamokoje: praeitos pamokos sprendimas (`uzduotys/N-uzduotis-sprendimas.md`, o jei to failo nėra, pati užduotis).
4. Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas tik atsiskaitymuose. Skyriaus „Dažniausios problemos“, lentelės „Sprendimas pagal darbus“ ir „Pavyzdinių failų“ nėra (jie dubliuotų sprendimų failus).
5. Teorinėms pamokoms be kodo pakanka lentelės.
6. Projekto būsenos atskiro aplanko nėra: jei pamoka keičia studento projektą, tai nurodoma sprendimų faile (kai starteris bus paskelbtas).

## Atsiskaitymo pamoka (09, 20, 29, 42, 53, 67, 79)
1. Aplanke `kursas/<NN Atsiskaitymas N>/`: `testas.md`, `praktika.md`, `vertinimas.md`, `atsakymai.md`. Viešai tik užduotys be atsakymų.
2. `praktika.md`: `# <NN> Praktika`, `Laikas: ~2 val.`, tikslo sakinys, `Darbai:` (vienas punktas = vienas patikrinamas darbas), `**Pateikimas:**`. Tik tai, kas mokyta to etapo pamokose.
3. `vertinimas.md`: lentelė kriterijus | taškai | kaip tikrinama; suma ir praėjimo riba ≥ 50 %. Praktika ~60 %, testas ~40 %.
4. `testas.md`: 30 klausimų, 35 min., po 4 variantus A–D, vienas teisingas, temos pagal etapo pamokas; atsakymai subalansuoti (~7–8 kiekvienos raidės).
5. `atsakymai.md`: numeris → raidė + 1 sakinio paaiškinimas. Praktikos sprendimai kaip kitose pamokose.
6. Vertinimo balai ir datos atitinka `medziaga/kurso-planas.md` (6 skyrius).
