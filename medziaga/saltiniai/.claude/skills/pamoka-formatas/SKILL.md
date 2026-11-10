---
name: pamoka-formatas
description: "Naudok, kai kuri, perrašai ar tikrini DevOps kurso pamoką (kodai 10.1–36.4) aplanke mano temos/: failų struktūra, pamoka.md, uzduotys.md, sprendimai/ ir kokybės taisyklės; etalonas 10.1."
---

# Pamokos formatas (etalonas: 10.1)

Etalonas: `mano temos/10.1 Įvadas ir GitHub/`. Antras pavyzdys: `10.2 IS platformos ir serveriai/`. Kalba lietuvių, sakiniai trumpi.

## Aplankas
1. Vienas aplankas vienai pamokai: `10.2 Trumpas pavadinimas` (kodas su tašku, tarpas, 2–5 žodžiai).
2. Viduje: `pamoka.md`, `uzduotys.md`, `sprendimai/` (sprendimai/ kuriami vėliau, po vieną).

## pamoka.md
1. Antraštė `# <kodas> <tema>`, tada `## Klasės darbas`.
2. Klasės darbas: numeruotas sąrašas, papunkčiai irgi numeruoti (1., 2.), įtraukti 3 tarpais. Temos ir nuorodos, be komandų žingsnių (komandos tik paminėtos kaip temos).
3. Nuorodos: oficiali dokumentacija ir patikimi mokymosi ištekliai. URL rašyti tik tuos, kuriuos tikrai žinai; kitaip „raskite oficialioje X dokumentacijoje skyrių apie Y“.
4. Laikas klasės darbe žymimas skliaustuose prie punkto, pvz. „(~15 min)“.
5. Paskutinis punktas visada „Kita paskaita: <tema>“.
6. Schemos: atskiras skyrius `## Schemos` po klasės darbo sąrašo, ne sąrašo viduje. Mermaid: `flowchart TD`, unikalūs mazgų ID, `subgraph … end`, viena rodyklė eilutėje, tuščios eilutės prieš ir po kodo bloko.
7. Schemoms Excalidraw, ne draw.io. DI kelias: Mermaid → „Mermaid to Excalidraw“.
8. Versti iš `šaltiniai/` ir `nuorodos-medziaga/` galima tik tekstą, su eilute „Šaltinis: <kursas, skyrius>, autorius <vardas>, išversta autoriaus leidimu.“ ir ženklu „[pritaikyta: kodėl]“. Paveikslėlių nenaudoti, nebent peržiūrėti ir patvirtinti kalbą, logotipus ir klaidas.
9. Kartojamos temos (Linux, SSH, vartotojai, systemd, Apache, Git ciklas) praeinamos greičiau per užduotis, bet nepraleidžiamos.
10. Kur tinka, pamoka prasideda veikiančiu rezultatu (demonstracija), toliau išardyti, sugadinti, perstatyti.
11. Mokinio medžiaga (starteriai, sugadintos bylos) guli šalia pamoka.md, atsakymai į sprendimai/.
12. Pamokos eiga: klasės darbas (teorija) → dėstytojas gyvai atlieka užduotį su KITU pavyzdžiu nei mokinių (demonstracija) → mokiniai daro tą patį su savo pavyzdžiu. Klasės darbe pridedamas punktas „Demonstracija: dėstytojas atlieka <užduoties pavadinimas> (~X min)“ prieš „Kita paskaita“, be komandų žingsnių (jie lieka sprendimai/README.md). Demonstracinis pavyzdys neturi sutapti su užduoties pavyzdžiais ar sąrašu, iš kurio mokiniai renkasi.

## uzduotys.md
1. Antraštė `# <kodas> Užduotys`, tada viena eilutė (eilutės „Pamokos medžiaga: pamoka.md“ nerašyti): `Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje arba klauskite LLM, ir užsirašykite, kas padėjo. Nuorodos yra pamoka.md.` Ši eilutė nebekartojama po kiekvienos užduoties, atskirų „Pagalba“ blokų nėra.
2. Viena užduotis: `## Užduotis`; dvi: `## Užduotis 1`, `## Užduotis 2`.
3. Po antraštės `Laikas: ~X` (pvz. `~1,5 val.`).
4. Vienas tikslo sakinys, tada `Darbai:` ir numeruotas sąrašas; vienas punktas yra vienas patikrinamas darbas.
5. Paskutinis punktas yra `Pateikimas: <konkretus rezultatas>` (pvz. PR nuoroda į `docs/serveriai.md`); prieš jį `Jei naudotas DI: parašyta, ką paklausėte ir kaip patikrinote atsakymą`. Atskiro „Pateikimas“ bloko nėra.
6. Paprastai 1–2 užduotys (tilptų į 3 val.). Jei plane daugiau, sujunk panašias arba perkelk į „Papildomos užduotys“, nieko nenumesdamas.
7. `**Pavyzdys:**` (paryškinta žyma) rašomas tik jei tikrai padeda ir yra trumpas: vienas kodo blokas su etikete, kur komandos vykdomos (pvz. „Terminale, jūsų kompiuteryje“, „VM terminale, ne jūsų kompiuteryje“). Komandoms pilna realistiška išvestis; tikra be žymos, netikra pažymėta „pavyzdinė išvestis“. Ilgi pavyzdžiai ir Mermaid eina į `pamoka.md` skyrių `## Schemos` arba į `sprendimai/`.
8. `## Papildomos užduotys` ir `## Iki kito susitikimo` rašyti tik jei tikrai reikia: ne daugiau kaip 2 numeruoti punktai kiekviename, be dubliavimo su kita pamoka.
9. Kiekvienoje pamokoje bent viena užduotis pagal oficialią dokumentaciją; jos darbe pažymėta „(pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas)“.

## Turinio taisyklės
1. Darbas per šaką ir pull request į mokinio repozitoriją devops-lab. Git clone, šaka, PR mokomi 10.1.
2. Jokių slaptažodžių, raktų, tokenų, realių IP ir domenų.
3. Kodai, pavadinimai ir datos iš programa/ nekeičiami; jei pamoka neatitinka plano, pranešk, plano nekeisk.
4. Nuorodos: oficiali dokumentacija ir patikimi mokymosi ištekliai; Wikipedia tik apibrėžimams.
5. Nedaryk git commit, push ar trynimo, jei aiškiai neprašoma.
6. Pamokas ir jų sprendimus kurk pagal datų eilę: pirmiausia artimiausioms pamokoms (10.1, 10.2, 11.1, 11.2, 12.x), likusioms artėjant jų datoms.

## sprendimai/
1. Tik tikri rezultatai: veikiantis kodas, .excalidraw ir .png schemos, compose failai, konfigūracijos, pavyzdiniai mokinio failai (docs/*.md). DRAUDŽIAMA „atsakymų“ markdown vietoj rezultatų ir nepatikrinti skriptai. Sprendimus paleisk ir patikrink.
2. sprendimai/README.md dėstytojui, struktūra: (a) „Patikrinta/Nepatikrinta“ eilutė tuoj po antraštės; (b) „Kas čia“ (1–2 sakiniai); (c) „Kaip rodyti klasėje“: numeruotas planas su minutėmis, o prie kiekvieno žingsnio, kur reikia, ką tuo metu daro mokiniai ir „Dažna klaida: …“; (d) „Sprendimas pagal darbus“: lentelė su 2 stulpeliais „Darbas“ | „Kur sprendime“, darbai trumpais pavadinimais, be „Užd. N.M“ numerių. DI, PR ir pateikimo darbams atskirų eilučių nėra: vienas sakinys po lentele. Po lentele dar vienas sakinys, kad dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose (vertinimas.md). Skyriaus „Dažniausios problemos“ nėra: dažnos klaidos rašomos prie demonstracijos žingsnių.
3. README turi atitikti dabartinį uzduotys.md.
4. „Patikrinta/Nepatikrinta“ eilutė (tuoj po antraštės, ne prieš ją), viena eilutė: „Patikrinta: <kur paleista, pvz. Mac Docker> arba Nepatikrinta: reikia išbandyti <aplinka, pvz. Ubuntu VM> prieš pamoką“.
5. Ne kiekvienai pamokai reikia sprendimų. Teorinėms pamokoms (pvz. dalis 17.1 Agile), kuriose nėra kodo ar failų rezultatų, pakanka sprendimai/README.md su lentele „Sprendimas pagal darbus“.
6. TODO: kaip techninės pamokos etalonas pridėti 11.3, kai ji bus patvirtinta.

## Atsiskaitymo pamoka (pvz. 12.4)
1. Aplankas `<kodas> Atsiskaitymas N` (pvz. `12.4 Atsiskaitymas 1`): `praktika.md`, `vertinimas.md`, `testas.md`, `sprendimai/`.
2. `praktika.md`: antraštė `# <kodas> Praktika`, eilutė `Laikas: ~2 val.`, vienas tikslo sakinys, `Darbai:` ir numeruotas sąrašas (vienas punktas yra vienas patikrinamas darbas), `**Pateikimas:**`. Tik tai, kas mokyta to etapo pamokose.
3. `vertinimas.md`: antraštė `# <kodas> Vertinimas`; lentelė: kriterijus | taškai | kaip tikrinama; bendra suma ir praėjimo riba (≥ 50 %). Praktika ~60 %, testas ~40 %. Failas matomas mokiniams.
4. `testas.md`: antraštė `# <kodas> Testas`; 30 klausimų, numeruoti, po 4 variantus A–D, vienas teisingas. Temos pasiskirsto pagal etapo pamokas. Teisingi atsakymai A–D subalansuoti (po ~7–8 kiekvienos raidės).
5. `sprendimai/atsakymai.md`: testo atsakymų raktas (numeris → raidė + 1 sakinio paaiškinimas). Tai išimtis iš taisyklės „jokių atsakymų markdown“. Praktikos sprendimai kaip kitose pamokose: veikiantis kodas ir `sprendimai/README.md` tuoj po README antraštės „Patikrinta/Nepatikrinta“.
6. Vertinimo balai ir datos turi atitikti `programa/` ir Excel (7 etapai, atsiskaitymai 1–7).
