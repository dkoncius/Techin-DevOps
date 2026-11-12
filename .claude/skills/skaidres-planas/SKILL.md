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

**Užduotys:** pamokos pabaigoje (prieš „Kita pamoka“) dėk vieną skaidrę `=== uzduotys | Užduotys` su eilute `@uzduotys: auto`: generatorius pats paima užduotis iš `pamoka.md` (apžvalga + po skaidrę kiekvienai). Užduočių ranka nerašyk ir nekeisk, kad tekstas sutaptų su Teams. `Pastaba:` apačioje yra dėstytojui (kaip skelbti po vieną).

Nekelk į skaidres: sprendimų, užduočių komandų, sprendimų, pilnų failų pavyzdžių iš „Sprendimas“, slaptų reikšmių, realių IP ir domenų.

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

1. **10–13 skaidrių** pamokai; daugiau nei 14 negalima (generatorius įspėja).
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
