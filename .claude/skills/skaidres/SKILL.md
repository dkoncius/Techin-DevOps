---
name: skaidres
description: Naudok, kai reikia sugeneruoti DevOps pamokos skaidres kaip vieną savarankišką HTML failą iš skaidres.md (tamsi tema, atskleidimo žingsniai, mermaid, pastabos dėstytojui). Pirmiau naudok skillą skaidres-planas.
---

# Skaidrės: `skaidres.md` → `skaidres.html`

Skaidrių rinkinys yra **vienas failas pamokai**: `kursas/<NN Pavadinimas>/skaidres.html` (atsidaro dukart spustelėjus, be diegimo). Šaltinis `skaidres.md` rašomas pagal skillą `skaidres-planas`. HTML **neredaguojamas ranka**: keisk `skaidres.md` ir generuok iš naujo.

Pamoka gali turėti kelis rinkinius: tada failai numeruojami pagal rodymo tvarką (`1-apie-mane.md`, `2-apie-kursa.md`, `3-skaidres.md`), o HTML gauna tą patį vardą (`<vardas>.html`; tik `skaidres.md` duoda `skaidres.html`). Paveikslai (jpg, png, gif) laikomi pamokos aplanke `nuotraukos/`, o `@nuotrauka:` kelias rašomas su juo (`nuotraukos/vardas.png`). Atskiro pastabų failo negeneruojame: pastabos yra tik `Pastaba:` eilutėse `skaidres.md`.

## Generavimas

```
python3 -I .claude/skills/skaidres/build_deck.py "kursas/05 Tinklų pagrindai/skaidres.md"
```

Skriptas parašo `skaidres.html` šalia `skaidres.md` ir išveda skaidrių ir žingsnių skaičių bei įspėjimus (pvz. daugiau nei 14 skaidrių, trūksta antraštės). Failai skille: `build_deck.py`, `deck.css`, `deck.js`. Dizainas keičiamas tik `deck.css`, o ne atskirose pamokose; po pakeitimo perkurk visas skaidres.

## Sintaksė

Skaidrės skiriamos eilute `=== tipas | Antraštė` (trečias laukas, jei yra, ignoruojamas). Tipai: `titulinė`, `pagalvokime`, `demonstracija`, `jusu-eile`, `schema`, `komanda`, `tekstas`, `klaida`, `santrauka`, `kita` (reikšmės ir kada naudoti: skillas `skaidres-planas`).

| Rašai | Rezultatas |
|---|---|
| `# Tekstas` | didelis tekstas (hook klausimas) |
| paprastas pastraipos tekstas | pastraipa (hook ir `kita` skaidrėse pilkas „lead“) |
| `- punktas` | sąrašas |
| `+ tekstas` | pastraipa, kuri atsiranda paspaudus |
| ```` ```bash ```` … | kodo blokas kaip terminalo langas |
| ```` ```bash+ ```` … | kodo blokas, kuris atsiranda paspaudus |
| ```` ```mermaid ```` … | diagrama (mermaid, tamsi tema; reikia interneto klasėje) |
| ```` ```excalidraw ```` … | **bendro vaizdo schema ranka nupiešta Excalidraw stiliumi** (langeliai `box`, rodyklės `arrow`, užrašai `note`; sintaksė `excalidraw_lib.py` viršuje ir skille `excalidraw-json`); kartu sukuria redaguojamą `diagramos/<file>.excalidraw` |
| `\| A \| B \|` lentelė | lentelė; ląstelė `?` rodo ženkliuką „?“ (pildote balsu), `?atsakymas` paspaudus tampa žaliu ✓ atsakymu; **visa eilutė su `?` atsiskleidžia vienu žingsniu**; lentelės turi aiškias ribas ir prieš, ir po atskleidimo |
| `:: ženklas \| Antraštė \| tekstas` | kortelė (kelios eilutės iš eilės = kortelių tinklelis); `+::` kortelė atsiranda paspaudus. Ženklas nebūtinas (`:: \| Antraštė \| tekstas`); **jokio papildomo `\|` prieš ženklą**, kitaip pavadinimas ir tekstas pasislenka. Tekste ` // ` yra eilutės lūžis |
| `@plokštelės` prieš kortelių eilutes | plokštelės su oranžine viršutine juosta; ženklo laukas rodomas kaip numeris ar etiketė (`01`, `02`...). Lygiai 3 plokštelės eina trimis stulpeliais su dideliu numeriu, 4 plokštelės yra 2×2 kompaktiškos. Po plokštelių einanti `+ tekstas` eilutė tampa stambia išvada su oranžine linija |
| `@kelias` prieš kortelių eilutes | kortelės kaip vertikalus kelias su numeruotais apskritimais |
| `@nuotrauka: nuotraukos/f.png` | paveikslas po antrašte; papildomi žodžiai po `\|`: `didelė` (visas pločio vaizdas), `apačioje` (po tekstu), `dešinėje` (tekstas kairėje, paveikslas dešinėje, po 50 %). Be žodžių tekstas kairėje, paveikslas dešinėje 1,15 : 0,85 |
| `>> 💻 curl \| 🚪 Portas \| ✅ Atsakymas` | kelio „žetonai“ su rodyklėmis (vietoj mermaid); `>>+` žetonai atsiranda po vieną |
| `> 🏨 tekstas` | kalbos debesėlis su analogija; `+>` atsiranda paspaudus |
| `@iliustracija: pastatas` | SVG iliustracija dešinėje: `pastatas` (IP + portai), `knyga` (DNS), `laiškas` (užklausa/atsakymas), `serveris`, `raktas` (privatus/viešas), `šaka` (Git) |
| ```` ```output ```` … | žalias „pavyzdinė išvestis“ langas (`output+` atsiranda paspaudus) |
| `@uzduotys: auto` (skaidrėje `=== uzduotys \| Užduotys`); `@uzduotys: auto, be sąrašo` praleidžia apžvalgos skaidrę ir palieka tik po vieną skaidrę užduočiai | **užduotys iš `pamoka.md` skyriaus „Užduotys“**: viena apžvalgos skaidrė su kortelėmis (pavadinimas + tikslas) ir po vieną skaidrę kiekvienai užduočiai su sunumeruotais žingsniais. Tekstas imamas tiesiai iš `pamoka.md`, todėl jis visada sutampa su Teams. Komandų nerodo (jos „Komandos“ skyriuje). Šios skaidrės neįskaičiuojamos į 14 skaidrių ribą |
| `Pastaba: ...` | pastaba dėstytojui (rodoma klavišu N), lietuviškai |

Titulinėje skaidrėje pirma pastraipa tampa eyebrow (pvz. „05 pamoka · 1 etapas“), `- punktai` yra tikslai.

### Pavyzdys

```
=== titulinė | Tinklų pagrindai
05 pamoka · 1 etapas
- Paaiškinti IP, portą, DNS ir HTTP
- Naudoti `curl`

=== pagalvokime
Programa veikia jūsų kompiuteryje, bet naršyklė jos neranda.
# Kaip naršyklė randa programą?
Pastaba: ~3 min. Leiskite spėlioti.

=== demonstracija | Kas klauso porto
| Komanda | Ką rodo |
|---|---|
| `lsof -nP -i :8080` | ?procesą, naudojantį portą |
```

Skaidrėse (išskyrus titulinę) viršuje dešinėje rodomas didelis skaidrės numeris. Tipas `klaida` rodomas ne kaip langeliai, o kaip sąrašas: klaida kairėje, sprendimas dešinėje, eilutės atsiskleidžia paspaudus, jei rašyta `+::`. Žingsnių sąrašai (`1. ...`) turi vienodus tarpus (0,65 rem), pilkus apskritimus ir šviesiai pilką kodo foną be rudos spalvos.

## Valdymas rodant

| Klavišas | Veiksmas |
|---|---|
| → / tarpas / Enter / paspaudimas | kitas žingsnis, o kai žingsnių nebėra, kita skaidrė |
| ← / Backspace | atgal (pirma paslepia žingsnį, paskui grįžta į ankstesnę skaidrę) |
| ↑ ↓ / Home / End | šokti tarp skaidrių |
| N | pastabos dėstytojui |
| F | visas ekranas |
| perbraukimas pirštu (telefone) | kairėn kitas žingsnis, dešinėn atgal |

Siauruose ekranuose (iki 800 px) skaidrės pritaikytos telefonui: plokštelės vienu stulpeliu, mažesni šriftai, paveikslai ir lentelės telpa, per ilgą skaidrę galima slinkti.

Spausdinimas (PDF per naršyklę) rodo visus žingsnius. Adresas `skaidres.html?all` atidaro skaidres su visais atsakymais jau atskleistais (peržiūrai ir testavimui).

## Dizaino taisyklės (šviesi „popieriaus“ tema, be dirbtinio blizgesio)

Tikslas: skaidrės atrodo kaip suprojektuotos žmogaus, ne kaip sugeneruotos DI. Todėl:

1. Fonas šiltas popieriaus `#fbf8f3`, tekstas `#1c1b1a`, **vienas akcentas** `#d9480f`. Jokių gradientų, švytėjimų, šešėlių, neoninių spalvų ir spalvų pagal skaidrės tipą.
2. Antraštės serifinės (Fraunces), tekstas DM Sans, kodas JetBrains Mono, ranka rašytos etiketės schemose Patrick Hand.
3. Eyebrow: mažas didžiosiomis raidėmis tekstas su trumpa linija, be piliulių ir be emoji.
4. **Emoji skaidrėse nerodomi** (generatorius juos ignoruoja kortelėse, žetonuose, debesėliuose ir Excalidraw schemose). Vaizdingumą kuria iliustracijos (linijiniai SVG), Excalidraw schemos, numeruoti žetonai, kortelės su ryškia riba ir kalbos analogijos.
5. Lentelės: juoda antraštė, aiškios ribos; atskleistas atsakymas paryškintas „markeriu“ (geltonas).
6. Kodas rodomas tamsiame terminalo bloke, išvestis šviesiai žaliame.
7. Atskleidžiami elementai išlaiko vietą (`visibility`), todėl paspaudus nieko neslenka.
8. Viena mintis skaidrei, ≤ ~40 žodžių; gilumas pastabose.
9. Titulinėje didelis blyškus pamokos numeris (imamas iš eyebrow, pvz. „05 pamoka“).

## Prieš pasakant, kad baigta

1. Paleisk generatorių ir perskaityk įspėjimus.
2. Atidaryk `skaidres.html` naršyklėje ir pereik visas skaidres (→) bent 1280×720 dydžiu; patikrink, ar mermaid diagrama atsirado ir ar kodas telpa.
3. Telefono vaizdą tikrink su Chrome headless: `<iframe style="width:390px;height:780px">` į `skaidres.html?all#N` ir ekrano nuotrauka; tiesioginis `--window-size=390,...` nepatikimas (Chrome turi minimalų plotį).
4. Jei nepavyko atidaryti naršyklėje, aiškiai pasakyk, kad vaizdas nepatikrintas.
