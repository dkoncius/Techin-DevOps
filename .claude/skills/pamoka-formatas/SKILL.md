---
name: pamoka-formatas
description: "Naudok, kai kuri, perrašai ar tikrini DevOps kurso pamoką (paskaitos 01–80) aplankuose kursas/NN .../: vienas pamoka.md su klasės darbu, užduotimis, komandomis ir sprendimu, kokybės taisyklės."
---

# Pamokos formatas (VH-DO, 80 paskaitų)

Šaltinis tiesos: `medziaga/kurso-planas.md` (kodai, pavadinimai, datos). Plano nekeisk; jei pamoka neatitinka plano, pranešk. Kalba lietuvių, sakiniai trumpi. Paskaita trunka 3 val. (17:30–20:40): ~20–30 min. teorijos, likusi dalis praktika; užduočių suma ~2–2,5 val.

## Kur kas guli
1. Viskas apie pamoką yra viename privačiame aplanke `kursas/<NN Pavadinimas>/` (aplanko pavadinimas lygiai kaip plano 5 skyriaus stulpelyje „Aplankas“; numeracija 01–80, be savaitės kodų; atsiskaitymų aplankai yra tarp jų tame pačiame sąraše pagal numeraciją). Pagrindas yra vienas failas `pamoka.md`: klasės darbas, schemos, užduotys, komandos ir sprendimo eiga. Atskiras failas ar aplankas tik tada, kai kodo daug: `sprendimai/` su po vieną failą kiekvienam sprendimui, o `pamoka.md` į juos nurodo.
2. Studentai užduotis gauna per Teams (dėstytojas įkelia po vieną), sprendimą mato kitos pamokos pradžioje, kai jį parodo dėstytojas. `check.sh` savitikros nėra.
3. Atsiskaitymai (10, 21, 32, 45, 56, 68, 80): tame pačiame `kursas/<NN Atsiskaitymas N>/` aplanke su `testas.md`, `praktika.md`, `vertinimas.md`, `atsakymai.md`. Studentams duodamos tik užduotys be atsakymų.
4. `kursas/README.md` yra studentų aplinkos instrukcija. Senos medžiagos, šaltiniai ir darbiniai failai yra `medziaga/` (tik skaitymui).
5. Duomenų bazė: MySQL. Platforma: GitHub (Pull Request kai mokomasi PR). Mokinio darbo projektas: GitHub template `devops-projektas`. Senuose pavyzdžiuose (`medziaga/saltiniai/`) yra PostgreSQL: konvertuok į MySQL tik tada, kai pamoka tuos pavyzdžius naudoja.

## pamoka.md
0. Skyrių eilė: `# <NN> <tema>`, `## Klasės darbas`, (`## Kur skiriasi (Mac / Ubuntu)`, `## Schemos`), `## Užduotys`, `## Komandos`, `## Sprendimas (dėstytojui)`. Skyrių „Užduotys“ ir „Komandos“ dėstytojas kopijuoja į Teams.
1. Antraštė `# <NN> <tema>`, tada `## Klasės darbas`.
2. Klasės darbas: numeruotas sąrašas, papunkčiai irgi numeruoti (1., 2.), įtraukti 3 tarpais. Temos ir nuorodos, be komandų žingsnių (komandos tik paminėtos kaip temos).
3. Nuorodos: oficiali dokumentacija ir patikimi mokymosi ištekliai. URL rašyti tik tuos, kuriuos tikrai žinai; kitaip „raskite oficialioje X dokumentacijoje skyrių apie Y“.
4. Laikas klasės darbe žymimas skliaustuose prie punkto, pvz. „(~15 min)“.
5. Paskutinis punktas visada „Kita paskaita: <tema>“ (pagal plano lentelę).
6. Schemos: atskiras skyrius `## Schemos` po klasės darbo sąrašo, ne sąrašo viduje. Mermaid: `flowchart TD`, unikalūs mazgų ID, `subgraph … end`, viena rodyklė eilutėje, tuščios eilutės prieš ir po kodo bloko. Sudėtingesnėms schemoms Excalidraw (Mermaid → „Mermaid to Excalidraw“), ne draw.io.
7. Versti iš `medziaga/saltiniai/` galima tik tekstą, su eilute „Šaltinis: <kursas, skyrius>, autorius <vardas>, išversta autoriaus leidimu.“ ir ženklu „[pritaikyta: kodėl]“. Paveikslėlių nenaudoti, nebent peržiūrėti ir patvirtinti. Katalogo `_saltiniai/nuorodos-medziaga/` neskaityti be aiškaus prašymo.
8. Kartojamos temos (Linux, Bash, Git, kuriuos mokė Edgaras) praeinamos greičiau per užduotis, bet nepraleidžiamos.
9. Kur tinka, pamoka prasideda veikiančiu rezultatu (demonstracija), toliau išardyti, sugadinti, perstatyti.
10. Pamokos eiga: klasės darbas (teorija) → dėstytojas gyvai atlieka užduotį su KITU pavyzdžiu nei mokinių (demonstracija) → mokiniai daro tą patį su savo pavyzdžiu. Klasės darbe punktas „Demonstracija: dėstytojas atlieka <užduoties pavadinimas> (~X min)“ prieš „Kita paskaita“, be komandų žingsnių (jie lieka skyriuje „Sprendimas“). Demonstracinis pavyzdys neturi sutapti su užduoties pavyzdžiais.
11. Datos po 2027-01-01 orientacinės: mokinių medžiagoje jų nerašyk kaip patvirtintų.

## Skyrius „Užduotys“ (pamoka.md)
1. Antraštė `## Užduotys`, tada eilutė: `Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo (1 etape dirbtinio intelekto užduotyse nenaudojame; DI leidžiamas nuo Docker etapo, žr. di-kurse). Nuorodos yra pamoka.md. Komandos yra skyriuje „Komandos“: žiūrėkite tik įstrigę.` Nekartoti po kiekvienos užduoties, atskirų „Pagalba“ blokų nėra. Dėstytojas užduotis skelbia Teams'e po vieną: po įvado eilutė, kad užduotis skelbiamos po vieną (pirma demonstracija, tada darbas).
2. Kiekviena užduotis: `### 1️⃣ <Pavadinimas>` (2️⃣, 3️⃣ ...), po antraštės vienas numeruotas sąrašas. Laiko užduotyje nerašyti (laikas yra `pamoka.md` ir sprendimų README).
3. Pirmas punktas: `**Tikslas:** <vienas sakinys>`. Toliau vienas punktas yra vienas patikrinamas darbas, be komandų (komandos tik skyriuje „Komandos“), trumpais sakiniais; kur tinka, pavadinti įrankį ar temą.
4. Papildomi darbai tame pačiame sąraše: `**Papildomai:** ...` (ne daugiau kaip 1 punktas užduotyje).
5. Pateikimo ir DI punktų nėra: mokiniai tiesiog atlieka užduotis, tikrinama atsiskaityme (jame aiškiai ir trumpai surašoma, ką reikia padaryti). Stilius pagal Edgaro užduotis (`praeitos temos/`): smulkūs imperatyvūs veiksmai su konkrečiais pavadinimais (`bandymas`, `f1.txt`), vienas veiksmas vienam žingsniui.
6. Užduotys parodo, ar mokiniai moka tai, ką dėstė Edgaras: Git (clone, branch, commit), Bash (paprastas skriptas), Python kodo skaitymas (pvz. ką daro `/health`), vėliau ir MySQL kodo skaitymas.
7. Kai pamoka moko PR, pateikimas yra PR nuoroda į mokinio `devops-projektas` kopiją; kitu atveju galima ekrano nuotrauka ar repozitorijos nuoroda.
8. Paprastai 3–5 trumpos užduotys, kurių suma telpa į pamokos užduočių laiką (~1,25–2,5 val.).
9. Kiekvienoje pamokoje bent viena užduotis pagal oficialią dokumentaciją; darbe pažymėta „(pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas)“.
10. Žingsniai yra atominiai ir sunumeruoti pagal eilę: vienas veiksmas, nurodyti visi pavadinimai (aplankai, failai, šakos, commit žinutės), bet be komandų ir atsakymų. Pirmas punktas `**Tikslas:**` (jį skaito skaidrių generatorius). Užduotys studentams kartu kopijuojamos į `uzduotys/N-uzduotis.md` (Teams) su papildomais failais (pvz. komandų PDF).
11. `**Pavyzdys:**` tik jei tikrai padeda: vienas kodo blokas ar nuoroda. Netikra išvestis pažymėta „pavyzdinė išvestis“.

## Skyrius „Komandos“ (pamoka.md)
1. `## Komandos`, pirma eilutė „Žiūrėkite tik įstrigę. Numeriai atitinka užduoties žingsnius.“
2. Skyriai `## 1️⃣ <Pavadinimas>` kaip užduotyse; po jais komandos pagal užduoties žingsnio numerį. Tik komandos ir trumpos pastabos (ne paaiškinimai ir ne sprendimai rašytiniams darbams).
3. Komandos veikia Mac ir Ubuntu (WSL); be GNU-only parametrų (žr. „Windows ir Mac“).

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
4. Jei skirtumo išvengti neįmanoma, `pamoka.md` turi lentelę „Kur skiriasi (Mac / Ubuntu)“ su abiem versijomis.
5. Paketai: `apt` (Ubuntu/WSL) ir `brew` (Mac), ta pati užduotis su abiem komandomis.
6. Prisijungimas prie GitHub: pagrindinis kelias `gh auth login` (HTTPS), SSH tik papildomai. `gh` diegimas pagal oficialią GitHub CLI dokumentaciją.
7. Skyrius „Sprendimas“, „Dažna klaida“ nurodo ir platformai specifines klaidas (WSL `/mnt/c`, CRLF, `sudo brew`).
8. Pirmoji paskaita (01) turi telpti į 3 val.: gyvai ~95 min., užduotys ~75 min.; aplinkos žingsniai, atliekami kartu klasėje (git config, prisijungimas), į užduotis nededami.

## Skyrius „Sprendimas (dėstytojui)“ (pamoka.md)
1. Tik tikri rezultatai: veikiantis kodas, konfigūracijos, schemos, pavyzdiniai mokinio failai. DRAUDŽIAMA „atsakymų“ markdown vietoj rezultatų ir nepatikrinti skriptai. Sprendimus paleisk ir patikrink.
2. Struktūra (`###` skyreliai): (a) „Patikrinta/Nepatikrinta“ viena eilutė tuoj po antraštės: „Patikrinta: <kur paleista>“ arba „Nepatikrinta: reikia išbandyti <aplinka> prieš pamoką“; (b) „Kaip rodyti klasėje“: numeruotas planas su minutėmis, KITAS pavyzdys nei mokinių; pirmas žingsnis: kaip pamokos pradžioje parodyti praeitos pamokos sprendimą (jos `pamoka.md`, skyrius „Sprendimas“); prie žingsnių, kur reikia, ką tuo metu daro mokiniai ir „Dažna klaida: …“; (c) „Sprendimas pagal darbus“: lentelė „Darbas“ | „Kur sprendime“; (d) „Pavyzdiniai failai“: kodas ar tekstas kodo blokuose su failo vardu (`####` antraštė). Daug kodo → `sprendimai/` aplankas su failu kiekvienam sprendimui.
3. Sprendimas turi atitikti skyrių „Užduotys“.
4. Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas tik atsiskaitymuose. Skyriaus „Dažniausios problemos“ nėra.
5. Teorinėms pamokoms be kodo pakanka lentelės.
6. Projekto būsenos atskiro aplanko nėra: jei pamoka keičia studento projektą, tai nurodoma pavyzdinių failų skyriuje (kai starteris bus paskelbtas).

## Atsiskaitymo pamoka (10, 21, 32, 45, 56, 68, 80)
1. Aplanke `kursas/<NN Atsiskaitymas N>/`: `testas.md`, `praktika.md`, `vertinimas.md`, `atsakymai.md`. Viešai tik užduotys be atsakymų.
2. `praktika.md`: `# <NN> Praktika`, `Laikas: ~2 val.`, tikslo sakinys, `Darbai:` (vienas punktas = vienas patikrinamas darbas), `**Pateikimas:**`. Tik tai, kas mokyta to etapo pamokose.
3. `vertinimas.md`: lentelė kriterijus | taškai | kaip tikrinama; suma ir praėjimo riba ≥ 50 %. Praktika ~60 %, testas ~40 %.
4. `testas.md`: 30 klausimų, 35 min., po 4 variantus A–D, vienas teisingas, temos pagal etapo pamokas; atsakymai subalansuoti (~7–8 kiekvienos raidės).
5. `atsakymai.md`: numeris → raidė + 1 sakinio paaiškinimas. Praktikos sprendimai kaip kitose pamokose.
6. Vertinimo balai ir datos atitinka `medziaga/kurso-planas.md` (6 skyrius).
