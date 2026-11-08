---
name: pamoka-formatas
description: "Naudok, kai kuri, perrašai ar tikrini DevOps kurso pamoką (paskaitos 01–80) aplankuose kursas/pamokos/ ir mokytojas/sprendimai/: failų struktūra, pamoka.md, uzduotys.md, check.sh, sprendimai ir kokybės taisyklės."
---

# Pamokos formatas (VH-DO, 80 paskaitų)

Šaltinis tiesos: `programa/kurso-planas.md` (kodai, pavadinimai, datos). Plano nekeisk; jei pamoka neatitinka plano, pranešk. Kalba lietuvių, sakiniai trumpi. Paskaita trunka 3 val. (17:30–20:40): ~20–30 min. teorijos, likusi dalis praktika; užduočių suma ~2–2,5 val.

## Kur kas guli
1. Viešas turinys: `kursas/pamokos/<NN Pavadinimas>/` su `pamoka.md`, `uzduotys.md`, `check.sh`. Aplanko pavadinimas lygiai kaip plano 5 skyriaus stulpelyje „Aplankas“. Numeracija 01–80, be savaitės kodų.
2. Privatu: `mokytojas/sprendimai/<NN>/` su `README.md` ir (tik kai pamoka keičia projektą) `projektas/`.
3. Atsiskaitymai (10, 21, 32, 45, 56, 68, 80): privatu `mokytojas/atsiskaitymai/<NN>/` su `testas.md`, `praktika.md`, `vertinimas.md`, `atsakymai.md`. Viešai tik užduotys be atsakymų.
4. `kursas/pamokos/` NIEKADA neturi `sprendimai/`: jį į viešą repo įkelia tik `mokytojas/publikuoti.sh NN --sprendimai`.
5. Duomenų bazė: MySQL. Platforma: GitHub (užduotys per Pull Request). Mokinio darbo projektas: GitHub template `devops-projektas`. Senuose pavyzdžiuose (`_saltiniai/`) yra PostgreSQL: konvertuok į MySQL tik tada, kai pamoka tuos pavyzdžius naudoja.

## pamoka.md
1. Antraštė `# <NN> <tema>`, tada `## Klasės darbas`.
2. Klasės darbas: numeruotas sąrašas, papunkčiai irgi numeruoti (1., 2.), įtraukti 3 tarpais. Temos ir nuorodos, be komandų žingsnių (komandos tik paminėtos kaip temos).
3. Nuorodos: oficiali dokumentacija ir patikimi mokymosi ištekliai. URL rašyti tik tuos, kuriuos tikrai žinai; kitaip „raskite oficialioje X dokumentacijoje skyrių apie Y“.
4. Laikas klasės darbe žymimas skliaustuose prie punkto, pvz. „(~15 min)“.
5. Paskutinis punktas visada „Kita paskaita: <tema>“ (pagal plano lentelę).
6. Schemos: atskiras skyrius `## Schemos` po klasės darbo sąrašo, ne sąrašo viduje. Mermaid: `flowchart TD`, unikalūs mazgų ID, `subgraph … end`, viena rodyklė eilutėje, tuščios eilutės prieš ir po kodo bloko. Sudėtingesnėms schemoms Excalidraw (Mermaid → „Mermaid to Excalidraw“), ne draw.io.
7. Versti iš `_saltiniai/` galima tik tekstą, su eilute „Šaltinis: <kursas, skyrius>, autorius <vardas>, išversta autoriaus leidimu.“ ir ženklu „[pritaikyta: kodėl]“. Paveikslėlių nenaudoti, nebent peržiūrėti ir patvirtinti. Katalogo `_saltiniai/nuorodos-medziaga/` neskaityti be aiškaus prašymo.
8. Kartojamos temos (Linux, Bash, Git, kuriuos mokė Edgaras) praeinamos greičiau per užduotis, bet nepraleidžiamos.
9. Kur tinka, pamoka prasideda veikiančiu rezultatu (demonstracija), toliau išardyti, sugadinti, perstatyti.
10. Pamokos eiga: klasės darbas (teorija) → dėstytojas gyvai atlieka užduotį su KITU pavyzdžiu nei mokinių (demonstracija) → mokiniai daro tą patį su savo pavyzdžiu. Klasės darbe punktas „Demonstracija: dėstytojas atlieka <užduoties pavadinimas> (~X min)“ prieš „Kita paskaita“, be komandų žingsnių (jie lieka `mokytojas/sprendimai/<NN>/README.md`). Demonstracinis pavyzdys neturi sutapti su užduoties pavyzdžiais.
11. Datos po 2027-01-01 orientacinės: mokinių medžiagoje jų nerašyk kaip patvirtintų.

## uzduotys.md
1. Antraštė `# <NN> Užduotys`, tada viena eilutė: `Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje arba klauskite LLM, ir užsirašykite, kas padėjo. Nuorodos yra pamoka.md.` Nekartoti po kiekvienos užduoties, atskirų „Pagalba“ blokų nėra.
2. Viena užduotis: `## Užduotis`; dvi: `## Užduotis 1`, `## Užduotis 2`.
3. Po antraštės `Laikas: ~X` (pvz. `~1,5 val.`).
4. Vienas tikslo sakinys, tada `Darbai:` ir numeruotas sąrašas; vienas punktas yra vienas patikrinamas darbas.
5. Sunkesniems žingsniams: `Jei nežinai, kaip:` ir užuomina (kur ieškoti, kokia komanda ar dokumentacijos skyrius), BE pilno atsakymo.
6. Paskutinis punktas yra `Pateikimas: <konkretus rezultatas>` (pvz. PR nuoroda); prieš jį `Jei naudotas DI: parašyta, ką paklausėte ir kaip patikrinote atsakymą`.
7. Kasdienės užduotys parodo, ar mokiniai moka tai, ką dėstė Edgaras: Git (clone, branch, commit), Bash (paprastas skriptas), Python kodo skaitymas (pvz. ką daro `/health`), vėliau ir MySQL kodo skaitymas.
8. Užduotys pateikiamos per Pull Request į mokinio `devops-projektas` kopiją.
9. Paprastai 1–2 užduotys (tilptų į ~2–2,5 val.). Perteklių sujunk arba perkelk į `## Papildomos užduotys` (ne daugiau kaip 2 punktai). `## Iki kito susitikimo` tik jei tikrai reikia.
10. Kiekvienoje pamokoje bent viena užduotis pagal oficialią dokumentaciją; darbe pažymėta „(pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas)“.
11. `**Pavyzdys:**` tik jei tikrai padeda: vienas kodo blokas su etikete, kur komandos vykdomos. Netikra išvestis pažymėta „pavyzdinė išvestis“.
12. Pabaigoje eilutė: `Savitikra: paleiskite ./check.sh iš šios pamokos aplanko (arba ./kursas.sh patikrinti NN).`

## check.sh
1. Šalia `uzduotys.md`, `#!/usr/bin/env bash`, `set -euo pipefail`, komentarai lietuviškai.
2. Kelias į mokinio projektą: argumentas arba `PROJEKTO_KELIAS`, kitaip dabartinis katalogas.
3. Veikia macOS (bash 3.2) ir Ubuntu (WSL2): be GNU-only parametrų, be bash 4 galimybių (asociatyvių masyvų, `${var,,}`, `mapfile`) (`grep -P`, `sed -i`, `readlink -f`, `date -d`, `find -printf`, `stat -c`).
4. Kiekvienas tikrinimas spausdina `OK: <ką>` arba `nepavyko, nes <priežastis>` (+ užuomina, ką daryti). Pabaigoje bendra išvada; išėjimo kodas 0 tik jei viskas OK.
5. Nieko nekeičia (tik skaito), neskaito `.env` turinio, nenaudoja `rm`, `git push`, jokių komandų, keičiančių debesį ar klasterį.
6. Tikrina tik tai, ką pamoka dėstė; ne daugiau nei reikia.

## Turinio taisyklės
1. Jokių slaptažodžių, raktų, tokenų, realių IP ir domenų. Rodyk tik `.pub` raktus.
2. Nuorodos: oficiali dokumentacija ir patikimi mokymosi ištekliai; Wikipedia tik apibrėžimams.
3. Nedaryk `git commit`, `git push` ar trynimo, jei aiškiai neprašoma. Pavojingų komandų (apply, destroy, delete, prune, kubectl apply, terraform) nevykdyk, tik aprašyk tekste.
4. Kurk pagal datų eilę: pirmiausia artimiausioms pamokoms.
5. Projekto būsenos: kiekvienos pamokos pabaigos būsena = kitos pamokos pradžia. Jei pamoka projekto nekeičia, `sprendimai/<NN>/projektas/` nekuriamas, o `kursas.sh atstatyti` naudoja paskutinę ankstesnę būseną.
6. Studentų projekto (Flask + MySQL starterio) pamokų kūrimo metu nekurk: jį pateikia dėstytojas kaip template `devops-projektas`. Kol jo nėra, kodo skaitymo užduotims naudok trumpą bendrą Flask ištrauką su žyma „suderinti su starteriu, kai jis bus“.

## Windows ir Mac
1. Studentai dirba Windows per WSL2 Ubuntu ir Mac Terminale. PowerShell ir cmd nenaudojami; Git Bash nėra pagrindinis kelias.
2. Projektai klonuojami į `~/`, ne į `/mnt/c`. Skriptams `.gitattributes` su `*.sh text eol=lf` (`kursas/.gitattributes`, starteriui: `mokytojas/starterio-pastabos.md`).
3. Komandos pamokose ir `check.sh` turi veikti abiejose sistemose. Venk: `/proc`, `systemctl`, `journalctl`, `free -h`, `ip a`, `sed -i`, `readlink -f`, `stat -c`, `date -d`, `grep -P` ir kitų skirtingų GNU/BSD parametrų.
4. Jei skirtumo išvengti neįmanoma, `pamoka.md` turi lentelę „Kur skiriasi (Mac / Ubuntu)“ su abiem versijomis.
5. Paketai: `apt` (Ubuntu/WSL) ir `brew` (Mac), ta pati užduotis su abiem komandomis.
6. Prisijungimas prie GitHub: pagrindinis kelias `gh auth login` (HTTPS), SSH tik papildomai. `gh` diegimas pagal oficialią GitHub CLI dokumentaciją.
7. Sprendimų README „Dažna klaida“ nurodo ir platformai specifines klaidas (WSL `/mnt/c`, CRLF, `sudo brew`).
8. Pirmoji paskaita (01) turi telpti į 3 val.: gyvai ~95 min., užduotys ~75 min.; pirmos pamokos žingsniai, atliekami kartu klasėje (git config, prisijungimas, šablonas, klonavimas), į `uzduotys.md` nededami.

## mokytojas/sprendimai/<NN>/
1. Tik tikri rezultatai: veikiantis kodas, konfigūracijos, schemos, pavyzdiniai mokinio failai. DRAUDŽIAMA „atsakymų“ markdown vietoj rezultatų ir nepatikrinti skriptai. Sprendimus paleisk ir patikrink.
2. `README.md` dėstytojui, struktūra: (a) „Patikrinta/Nepatikrinta“ eilutė tuoj po antraštės; (b) „Kas čia“ (1–2 sakiniai); (c) „Kaip rodyti klasėje“: numeruotas planas su minutėmis, KITAS pavyzdys nei mokinių; pirmas žingsnis: kaip pamokos pradžioje parodyti praeitos pamokos sprendimą gyvai; prie žingsnių, kur reikia, ką tuo metu daro mokiniai ir „Dažna klaida: …“; (d) „Sprendimas pagal darbus“: lentelė „Darbas“ | „Kur sprendime“, darbai trumpais pavadinimais, be „Užd. N.M“ numerių. DI, PR ir pateikimo darbams atskirų eilučių nėra: vienas sakinys po lentele. Po lentele dar vienas sakinys, kad dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas tik atsiskaitymuose. Skyriaus „Dažniausios problemos“ nėra.
3. README turi atitikti dabartinį `uzduotys.md`.
4. „Patikrinta/Nepatikrinta“ viena eilutė: „Patikrinta: <kur paleista>“ arba „Nepatikrinta: reikia išbandyti <aplinka> prieš pamoką“.
5. Teorinėms pamokoms be kodo pakanka `README.md` su lentele.
6. `projektas/` tik kai pamoka keičia studento projektą; tai būsena pamokos pabaigoje. Jei starterio dar nėra, `projektas/` nekuriamas, o README rašo „bus papildyta“.

## Atsiskaitymo pamoka (10, 21, 32, 45, 56, 68, 80)
1. Privatu `mokytojas/atsiskaitymai/<NN>/`: `testas.md`, `praktika.md`, `vertinimas.md`, `atsakymai.md`. Viešai tik užduotys be atsakymų.
2. `praktika.md`: `# <NN> Praktika`, `Laikas: ~2 val.`, tikslo sakinys, `Darbai:` (vienas punktas = vienas patikrinamas darbas), `**Pateikimas:**`. Tik tai, kas mokyta to etapo pamokose.
3. `vertinimas.md`: lentelė kriterijus | taškai | kaip tikrinama; suma ir praėjimo riba ≥ 50 %. Praktika ~60 %, testas ~40 %.
4. `testas.md`: 30 klausimų, 35 min., po 4 variantus A–D, vienas teisingas, temos pagal etapo pamokas; atsakymai subalansuoti (~7–8 kiekvienos raidės).
5. `atsakymai.md`: numeris → raidė + 1 sakinio paaiškinimas. Praktikos sprendimai kaip kitose pamokose.
6. Vertinimo balai ir datos atitinka `programa/kurso-planas.md` (6 skyrius).
