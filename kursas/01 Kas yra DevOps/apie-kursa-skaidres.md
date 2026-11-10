# Apie kursą: skaidrių planas

Pristatymas 01 pamokos pradžioje, po „Apie mane“ (~15 min). Tikslas: studentai supranta, ką darysime per kursą, kaip vyks pamokos, kaip vertinama ir kokie egzaminai laukia.

Generuoti: `python3 -I .claude/skills/skaidres/build_deck.py "kursas/01 Kas yra DevOps/apie-kursa-skaidres.md"` → `apie-kursa-skaidres.html`.

=== titulinė | Apie kursą
Pradžia · kurso apžvalga
- Ką darysime per 80 paskaitų
- Kaip mokysimės
- Kaip vertinama ir kokie egzaminai
Pastaba: ~1 min. Trumpai: dabar apie kursą, o DevOps temą pradėsime iškart po to.

=== pagalvokime | Nuo kūrėjo iki vartotojo
Programa veikia jūsų kompiuteryje.
# Kaip ji atsiduria pas tūkstančius vartotojų ir lieka veikti?
Pastaba: ~2 min. Leiskite spėlioti. Pabrėžkite, kad parašyti kodą yra tik pradžia: reikia jį patikrinti, supakuoti, paleisti ir prižiūrėti. Tam skirtas visas kursas.

=== tekstas | Vienas projektas visą kursą
@iliustracija: serveris
- Mažas Python (Flask) web API su MySQL
- Kiekvieną etapą ta pati programa, vis toliau nuo jūsų kompiuterio
- Gaunate kaip GitHub šabloną ir kuriate savo kopiją
- Dockerfile, Compose, workflow ir Helm chart'us parašysite patys
> Kaip vienas namas, kurį visus metus statome: pirma pamatai, paskui stogas, galiausiai apšvietimas ir apsauga.
Pastaba: ~2 min. Projektas paprastas sąmoningai, kad dėmesys būtų į paleidimą, o ne į Python.

=== schema | Kelias per kursą
```excalidraw
file: kurso-kelias
box a | Linux ir Git | 0,0 | blue
box b | Docker | 1,0 | teal
box c | GitHub Actions | 2,0 | green
box d | Kubernetes\npagrindai | 3,0 | purple
box e | Kubernetes\npraktikoje | 3,1 | pink
box f | Azure | 2,1 | orange
box g | Pilnas pipeline\nir projektas | 1,1 | yellow
arrow a -> b
arrow b -> c
arrow c -> d
arrow d -> e
arrow e -> f
arrow f -> g
```
Pastaba: ~3 min. Kiekvienas etapas remiasi ankstesniu: pirma programą paleidžiame lokaliai, tada konteineryje, paskui automatizuojame, perkeliame į Kubernetes ir galiausiai į Azure. Schemą galima redaguoti Excalidraw: `diagramos/kurso-kelias.excalidraw`.

=== demonstracija | Etapai ir atsiskaitymai
| Etapas | Pamokos | Atsiskaitymas |
|---|---|---|
| 1. Linux ir Git | 01–10 | 2026-11-30 |
| 2. Docker | 11–21 | 2026-12-17 |
| 3. GitHub Actions | 22–32 | 2027-01-20 |
| 4. Kubernetes pagrindai | 33–45 | 2027-03-04 |
| 5. Kubernetes praktikoje | 46–56 | 2027-03-25 |
| 6. Azure | 57–68 | 2027-05-06 |
| 7. Pilnas pipeline, baigiamasis projektas | 69–80 | 2027-05-27 |
Pastaba: ~2 min. Pirmų dviejų datos patvirtintos, kitos orientacinės ir gali pasikeisti (atostogos, kitų dėstytojų savaitės, duomenų bazių modulis vasarį). Pasakykite, kad apie pasikeitimus pranešite iš anksto.

=== tekstas | Kaip vyksta pamoka
>>+ 🎤 Paaiškinu | 💻 Parodau gyvai | ✏️ Jūs darote | ✅ Sprendimas kitą kartą
- Dėstytojas trumpai paaiškina ir parodo **kitu pavyzdžiu nei užduotyse**
- Užduotį gaunate Teams'e po vieną; baigę gaunate kitą
- Kitos pamokos pradžioje parodau sprendimą ir aptariame, kas neaišku
- Praeitos pamokos sprendimas įkeliamas į viešą repozitoriją
Pastaba: ~3 min. Užduotis skelbiate po vieną, kad niekas nesijaustų pavėlavęs ir kad greitesni gautų daugiau. Sprendimo iš anksto neduodate.

=== tekstas | Kaip mokysimės
:: | Darome patys | Daugiausia laiko skiriame užduotims, ne klausymui
:: | Klysti galima | Sugedusi komanda yra pamoka; taisysime kartu
:: | Klauskite | Nesuprantate vienai, tikriausiai nesupranta ir kiti
:: | Viskas Git'e | Kiekvienas pakeitimas per šaką ir Pull Request
Pastaba: ~2 min. Pabrėžkite, kad kasdienių užduočių netikrinate, bet kas jų nedaro, atsiskaityme jas pajus.

=== tekstas | Atsiskaitymai
:: | Teorija | 30 klausimų, 35 min.
:: | Praktika | iki 2 val., savo repozitorijoje
:: | Praeinama | nuo 50 %
:: | Kiek jų | 6 atsiskaitymai ir baigiamojo projekto gynimas
- Praktikos įvertinimai **kaupiami** ir sudaro 40 % egzamino praktikos įvertinimo
- Baigiamasis projektas yra atsiskaitymas, ne egzaminas
Pastaba: ~3 min. Pavyzdys: jei už visas praktikas gautumėte 10, į egzaminą atsineštumėte 4 balus, bet egzaminą vis tiek reikia laikyti. Tikslus kaupimo būdas dar tikslinamas su mokykla, todėl jo nežadėkite.

=== tekstas | Egzaminai birželį
:: | Teorija | 80–100 klausimų iš visų modulių, 2 val., kompiuteriu, be jokių pagalbinių priemonių
:: | Praktika | 3–4 val., mokyklos kompiuteriais
:: | Sąlyga | praktiką laikyti galima tik teoriją išlaikius ≥ 50 %
:: | Datos | skelbiamos 2027 sausį, tikėtina birželio 15–25
Pastaba: ~3 min. Teorijos egzaminas apima ir kitus modulius (duomenų bazės, programavimas), ne tik DevOps. Perlaikymas po 1–3 mėn., todėl teorija svarbi. Aš egzamine dalyvauti negaliu; egzaminų klausimus mokykloje sprendžia IT skyriaus vadybininkė. Ar praktikoje leidžiama naudotis savo darbais ir kokia aplinka, dar nežinoma.

=== klaida | Dažnos klaidos mokantis
- Praleisti pamoką ir manyti, kad pasivysite: kiekvienas etapas remiasi ankstesniu
- Kopijuoti komandas nesuprantant, ką jos daro: testuose jų nebus po ranka
- Slaptus duomenis (raktus, slaptažodžius) kelti į Git
- Nepaklausti, kai neaišku
Pastaba: ~2 min. Testuose naudotis internetu ir DI negalima, todėl komandas reikia suprasti.

=== kita | Kita: Kas yra DevOps
Pradedame nuo klausimo, ką iš tiesų reiškia DevOps, ir iškart darome pirmą darbą su Git.
Pastaba: ~1 min. Pereikite prie 01 pamokos skaidrių.
