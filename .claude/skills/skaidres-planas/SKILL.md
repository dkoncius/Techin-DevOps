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
6. **Pastabos dėstytojui** (`Pastaba:` eilutės, rodomos klavišu N): laikas minutėmis, ką sakyti, ko klausti, „Dažna klaida“ iš sprendimo. Visos lietuviškai.
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

## 4. Formatas

Šablonas ir sintaksė aprašyta skille `skaidres` (skyrius „Sintaksė“). Trumpai: skaidrės skiriamos eilute `=== tipas | Antraštė`.

## 5. Ką išvesti

1. Įrašyk `kursas/<NN Pavadinimas>/skaidres.md`.
2. Paleisk skill `skaidres` (generatorių) ir patikrink įspėjimus.
3. Atsakyk lietuviškai trumpai: skaidrių skaičius, kurios skaidrės yra `demonstracija` (co-fill) ir `jusu-eile`, ko trūksta pamokoje (jei skaidrėse radai spragą ar prieštaravimą `pamoka.md`).

## Antraštės be paryškinimo ir komandų
Skaidrių ir kortelių antraštėse (po `=== tipas |` ir kortelės `:: ženklas | Antraštė |`) nenaudok `**paryškinimo**` ir `` `komandų` ``: jos rašomos paprastu tekstu (pvz. „Sąlygos ir testai“, ne „`if` ir testai“). Komandos, failų vardai ir paryškinimas tik apraše (kortelės tekste, pastraipose, sąrašuose). Generatorius `build_deck.py` tokius ženklus antraštėse pašalina pats. Užduočių skaidrės imamos iš `uzduotys/N-uzduotis.md`.
