---
name: skaidres-planas
description: Naudok, kai reikia sukurti DevOps pamokos (kursas/NN .../pamoka.md) skaidrių šaltinį skaidres.md: skaidrė po skaidrės, lietuviškai, su žingsnių atskleidimu ir pastabomis dėstytojui. Po jo naudok skill „skaidres“ HTML sugeneruoti.
---

# Pamoka → skaidrių planas (`skaidres.md`)

Dvi dalys: (1) **šis skillas** parašo `kursas/<NN Pavadinimas>/skaidres.md`; (2) skillas `skaidres` jį paverčia į `skaidres.html`. Kai pamoka turi kelis rinkinius, juos numeruok pagal rodymo tvarką (`1-apie-mane.md`, `2-apie-kursa.md`, `3-skaidres.md`), o paveikslus laikyk `nuotraukos/`; pamokos `pamoka.md` tik nurodo skaidrių numerius ir nuorodas, o dėstytojo tekstas rašomas skaidrių `Pastaba:` eilutėse, ne `pamoka.md`. Skaidrės skirtos **teorijai ir dėstytojo demonstracijai** padengti. Užduotys studentams skelbiamos Teams'e po vieną; skaidrėse jos rodomos tik kaip priminimas (`@uzduotys: auto`), kad klasė matytų žingsnius dirbdama.

Šaltinis tiesos yra `pamoka.md` (klasės darbas, schemos, „Demonstracijos žingsniai“, „Dažna klaida“). Skaidrės jo nekeičia ir neprieštarauja.

## 1. Ką išgauti iš `pamoka.md`

| Iš kur | Kur skaidrėse |
|---|---|
| `# NN tema` ir „Po pamokos“ / klasės darbo sąrašas | titulinė: eyebrow „NN pamoka · N etapas“, 2–3 tikslai |
| Pasitikrinimas po praeitos pamokos | atskiros skaidrės nereikia; tik pastaba titulinėje |
| Demonstracija pradžioje (jei yra) | `pagalvokime` arba pirma `demonstracija` |
| Kiekviena teorijos tema iš klasės darbo | 1 skaidrė (`tekstas`, `demonstracija` arba `komanda`) |
| `## Schemos` (mermaid) | `schema` skaidrė; mermaid kodą kopijuok tiksliai |
| `## Kur skiriasi (Mac / Ubuntu)` | `demonstracija` su lentele (kur skiriasi) |
| „Dažna klaida“ iš sprendimo | viena `klaida` skaidrė (3–4 punktai) |
| „Kita paskaita: …“ | paskutinė `kita` skaidrė |

**Užduotys:** pamokos pabaigoje (prieš „Kita pamoka“) dėk vieną skaidrę `=== uzduotys | Užduotys` su `@uzduotys: auto`. Kai žingsniai ilgi ir pilnas tekstas eina per Teams, naudok `@uzduotys: auto, tik sąrašas` (taip yra 01 pamokoje). Užduočių ranka nerašyk. `Pastaba:` pasako, po kurios demonstracijos skelbti kitą užduotį.

Nekelk į skaidres mokinių užduoties teksto, sprendimo failo ir slaptų reikšmių. Demonstracijos komandos skaidrėje yra, bet su kitais vardais nei užduotyje, ta pačia veiksmų eile.

## Git demonstracija (pagal patikrintą 01)
Nauja Git pamoka kartoja šią eilę, ne seną `git remote add` prieš `git init` ir ne `gh repo create VARDAS --public`:

1. Aplankas ir failai (`echo`), `git init`, `git branch -m main`, `git add .`, commit. GitHub šioje skaidrėje dar nėra.
2. Šaka ir sujungimas vietoje, prieš siuntimą.
3. `gh auth status`, tada `gh repo create` be argumento. Pasirinkimus rodyk `output` bloke (Push an existing local repository, kelias `.`, Public, remote `origin`, push Yes). Po to `git remote -v` ir `git status`. Čia baigiasi 1 užduotis; 2 užduotį skelbti, kai `main` jau GitHub'e.
4. Tame pačiame aplanke naujas failas, `git add .`, commit, `git push`. Tada šaka, `git push -u origin ŠAKA`, `merge`, `git push`, `git branch -d`, `git push origin --delete`. Pastaboje parašyk, kad trynimo GitHub'e komandos cheat sheet nėra.
5. Clone: `cd ..`, nuoroda iš GitHub (Code, Local, HTTPS), ne ZIP ir ne `gh repo view`. `origin` ateina su clone, `git init` ir `git remote add` nekartojami. Kopija šalia, ne vietoje jau esančio aplanko.
6. Po clone naujas failas, ne esamo taisymas: `git add`, ne `git commit -am`.
7. `nano` galima parodyti, bet 01 užduotyse jo nėra. Dažnų klaidų skaidrėje palik ir „Add a remote buvo No“ (`git remote add` tik tada) bei „kas pirmiau“: aplankas su commit jau yra, tada `gh repo create`; istorija jau GitHub'e, aplanko nėra, tada `git clone`.

## 2. Skaidrių tipai (eyebrow)

| Tipas | Eyebrow | Kada |
|---|---|---|
| `titulinė` | (kodas ir etapas) | 1 skaidrė |
| `pagalvokime` | Pagalvokime | atviras klausimas prieš teoriją; pavyzdys iš kasdienybės ar iš projekto (`/health`, `curl`); **vienas trumpas klausimas** |
| `demonstracija` | Demonstracija | dėstytojas rodo gyvai **kitą pavyzdį nei užduotyse**; arba **lentelė, kurią pildote kartu** (tuščios ląstelės `?`) |
| `jusu-eile` | Jūsų eilė | po paaiškinimo klasė taiko pati: klausimas ir atsakymas atsiranda tos pačios skaidrės žingsniu |
| `schema` | Schema | mermaid diagrama be teksto sienos; skaidrėms rašyk `flowchart LR` (plati, telpa), o ne `TD` iš `pamoka.md`; ≤ 6 mazgai |
| `komanda` | Komandos | 1–3 komandos su paaiškinta išvestimi |
| `tekstas` | – | trumpa teorija: ≤ 4 punktai |
| `klaida` | Dažna klaida | tipinės klaidos ir ką daryti |
| `santrauka` | Santrauka | neprivaloma, kai pamoka ilga |
| `kita` | Kita pamoka | paskutinė |

**Co-fill lentelė** (kaip IB „Demonstration“): ląstelės `?` lieka tuščios, pildote balsu, o dėstytojas pagal pastabą patikrina. Atsakymo ląstelė `?atsakymas` atsiskleidžia paspaudus (eilutė po eilutės). Niekada nerodyk visų atsakymų iš karto, jei pamoka tuos atsakymus kuria kartu.

## 3. Struktūra ir ritmas

1. **10–13 skaidrių** pamokai; daugiau nei 14 generatorius įspėja. 01 pamokos `3-skaidres` ilgesnis, nes jame teorija ir trijų užduočių demonstracijos: tai Git eigos pavyzdys, ne skaidrių skaičiaus pavyzdys. Naujai pamokai laikykitės 10–14.
2. Ritmas: hook → teorija → demonstracija → dažna klaida → kita pamoka. Nedėk daugiau nei dviejų `tekstas` skaidrių iš eilės.
3. **Viena mintis skaidrei.** Ekrane ≤ ~40 žodžių; gilumas eina į `Pastaba:`.
4. Komandos kodo bloke: tikros, veikiančios Mac ir Ubuntu (kaip `pamoka.md`). Išvestį žymėk „pavyzdinė išvestis“ ir nerašyk išgalvotų realių adresų ar PID kaip faktų.
5. Atskleidimas: eilutės `+ tekstas` ir kodo blokai ```` ```bash+ ```` atsiranda paspaudus. Naudok, kai klausi ir atsakai toje pačioje skaidrėje.
6. **Pastabos dėstytojui** (`Pastaba:`, klavišas N): nuo 02 pamokos JOS NENAUDOJAMOS, viskas, ką mato studentas ir dėstytojas, yra pačioje skaidrėje. Išimtis: demonstracijos atstatymas (žr. `pamoka-formatas`, „Demonstracijos atstatymas“). Jei tekstas netelpa, skaidrę skaidyk, o ne kelk į pastabą. Skyriaus „Pastabos“ senose pamokose (01) neperrašyk be prašymo.
7. **Kalba:** skaidrių tekstas lietuviškai; komandos, failų vardai ir terminai (commit, branch, curl, PID) lieka originalūs.

## 3a. Vaizdingumas (privaloma)

Skaidrės turi būti vaizdingos, bet **santūrios** (šviesi tema, vienas akcentas, be emoji: žr. skillą `skaidres`). Kiekvienoje pamokoje:

1. **Bent 3 skaidrės su iliustracija** (`@iliustracija:`), žetonais (`>>+`) arba Excalidraw schema. Jei reikiamos iliustracijos nėra, pasiūlyk ją pridėti į `illustrations.py`, o ne rašyk tekstu.
2. **Kasdienė analogija** kiekvienai naujai sąvokai (`> tekstas`): pastatas ir durys, telefonų knyga, laiškas, raktas ir spyna.
3. **Kortelės** (`::`) sąrašams, kurie yra „keli panašūs dalykai“ (kodų šeimos, dažnos klaidos, būdai); paprastas `- ` sąrašas tik trumpiems punktams.
4. **Žetonai** (`>>+`) procesams ir keliams (užklausos kelias, Git eiga, CI/CD).
5. **Terminalas**: komandą rodyk `bash` bloke, rezultatą `output+` bloke po paspaudimo.
6. **Bendras vaizdas Excalidraw stiliumi** (```` ```excalidraw ````) bent vienoje skaidrėje, kai pamoka jungia kelias dalis (kas su kuo kalba, kelias, architektūra); ne daugiau nei ~8 langelių.
7. Titulinės skaidrės eyebrow pradėk numeriu (`05 pamoka · 1 etapas`).

## 3b. Demonstracijos standartas (etalonas: `kursas/02 Linux terminalas/skaidres/skaidres.md`)
Atnaujindamas ar kurdamas pamoką, atsidaryk 02 skaidres ir kartok jų ritmą. Taisyklės išvestos iš 02 peržiūrų:
1. **Demonstracija = užduoties kelias su kitu turiniu.** Ta pati komandų eilė, kiti vardai. Studentas iš skaidrių ir užduoties turi galėti atlikti darbą pats; kuo greičiau parodyk pagrindinį kelią.
2. **Nekartok to paties.** Tas pats žingsnis (pvz. `git add`, `commit`, failo kūrimas) skaidrėse rodomas vieną kartą; vėliau tą patį failą naudok iš naujo (02: `labas.sh` pereina per kintamąjį, paketą, commit ir PR), o ne kurk naują pavyzdį kiekvienai temai.
3. **Skaidrės vidus** šia tvarka: kodo blokas iškart (be ilgo įvado), po jo `output+` pavyzdinė išvestis po kiekvienos komandos, tada 1–3 trumpos `+` eilutės, ką naujo matome, ir tik pabaigoje analogija `+>`. Komandą rodyk kartu su rezultatu: po `chmod` rodyk `ls -l`, po `export` naują langą, po `brew install` `which`.
4. **Paaiškink tik tai, kas nauja**, ir tik tai, ką studentas mato. Jokių vėliavų ar sintaksės be paaiškinimo (`-p`, `-u`, `${VAR:-x}`), bet ir jokių „kodėl“ pastraipų. Lentelė (pvz. teisių `rw-`) pakeičia aiškinimą. Jei skaidrėje minimi failai, juos įvardink (`du failai: a ir b`), ne „tie patys failai“.
5. **Trumpi sakiniai**: viena mintis eilutei, ~100 simbolių riba, viena atskleidžiama eilutė per mintį. Analogija viena trumpa eilutė. Jei klausiama „kas per ilgi aprašymai“, trumpink, nekeisk struktūros.
6. **Viena skaidrė = vienas žingsnių klasteris**: iki ~3–4 komandų su išvestimis. Jei išvestis netelpa arba yra du dideli blokai, skaidyk į dvi skaidres (pvz. „Kas keliaus į GitHub“ ir „Pull Request“). Antraštės neutralios ir apie veiksmą („Paleidimas ir teisės“), ne „Failas 1“, „Failas 2“. Skaidymas reiškia: perskaičiuoti skaidrių intervalus `pamoka.md`.
7. **Prielaidos komandose.** Kiekviena skaidrė veikia iš ankstesnės būsenos: `mkdir -p scripts` prieš `nano scripts/x.sh`, `cd` kai keičiasi aplankas. Nerodyk sąlygų, kurių studentas nesukūrė (pvz. grep slaptažodžiams, jei jų nebuvo).
8. **Procesams** (kaip kurti `.sh`, kaip veikia PR) pakanka vienos paprastos Excalidraw schemos su 3–4 langeliais ir rodyklėmis, ne animacijos ir ne daugelio skaidrių.
9. **Paketai ir įrankiai**: diegiamas tik tai, kas iškart naudojama (`brew install bat`, `which bat`, `bat failas`); Ubuntu atvejis viena eilute (`apt`, `batcat`). Prieš įrašydamas komandą patikrink Mac ir Ubuntu, ar jos pavadinimas nesutampa su sistemine (macOS turi savo `jq`). Papildomi įrankiai keliami į užduotį.
10. **Demonstracijos būsena.** Demo kartojama kelis kartus, todėl pamoka turi `demo-atstatyti.sh` (žr. `pamoka-formatas`); pakeitus demo, patikrink, kad skriptas ją vis tiek atstato.
11. **Po kiekvieno skaidrių pakeitimo** perkurk HTML, perskaityk generatoriaus įspėjimus, atnaujink skaidrių numerius `pamoka.md` ir pasakyk, kad naršyklėje nepatikrinta, jei taip.

## 4. Formatas

Šablonas ir sintaksė aprašyta skille `skaidres` (skyrius „Sintaksė“). Trumpai: skaidrės skiriamos eilute `=== tipas | Antraštė`.

## 5. Ką išvesti

1. Įrašyk `kursas/<NN Pavadinimas>/skaidres.md`.
2. Paleisk skill `skaidres` (generatorių) ir patikrink įspėjimus.
3. Atsakyk lietuviškai trumpai: skaidrių skaičius, kurios skaidrės yra `demonstracija` (co-fill) ir `jusu-eile`, ko trūksta pamokoje (jei skaidrėse radai spragą ar prieštaravimą `pamoka.md`).

## Antraštės be paryškinimo ir komandų
Skaidrių ir kortelių antraštėse (po `=== tipas |` ir kortelės `:: ženklas | Antraštė |`) nenaudok `**paryškinimo**` ir `` `komandų` ``: jos rašomos paprastu tekstu (pvz. „Sąlygos ir testai“, ne „`if` ir testai“). Komandos, failų vardai ir paryškinimas tik apraše (kortelės tekste, pastraipose, sąrašuose). Generatorius `build_deck.py` tokius ženklus antraštėse pašalina pats. Užduočių skaidrės imamos iš `uzduotys/N-uzduotis.md`.
