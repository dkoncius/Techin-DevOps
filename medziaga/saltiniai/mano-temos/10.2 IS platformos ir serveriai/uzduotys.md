# 10.2 Užduotys

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje arba klauskite LLM, ir užsirašykite, kas padėjo. Nuorodos yra pamoka.md.

## Užduotis 1

Laikas: ~1 val.

Nubraižyti pasirinktos įstaigos IS platformos schemą ir priskirti gyvavimo ciklo etapus.

Darbai:

1. Pasirinkti įstaigą (mokykla, poliklinika, biblioteka, parduotuvė), be realių vidinių duomenų, IP ar domenų
2. Schemoje nurodyti bent 4 komponentus (aplikacija, duomenų bazė, proxy, monitoringas) ir rodykles, kas su kuo kalbasi (Mermaid pradžia DI prompt'ui: pamoka.md, skyrius „Schemos“)
3. Prie kiekvieno komponento nurodyti serverio tipą (fizinis, virtualus, debesijos) ir kodėl
4. Pažymėti 4 gyvavimo ciklo etapus (analizė, projektavimas, diegimas, priežiūra) ir prie kiekvieno parašyti vieną sakinį, ką jame daro DevOps
5. Parašyti 2 sakinius apie silpniausią schemos vietą
6. Failus `.excalidraw` ir `.png` įkelti į `devops-lab/docs/` per šaką ir PR (kaip 10.1)
7. Jei naudotas DI: parašyta, ką paklausėte ir kaip patikrinote atsakymą (ar yra visi komponentai ir rodyklės)
8. Pateikimas: sulieto PR nuoroda ir schemos print-screen

**Pavyzdys:** terminale, jūsų kompiuteryje, `devops-lab` aplanke:

```
$ ls docs/
is-schema.excalidraw  is-schema.png
```

## Užduotis 2

Laikas: ~45 min. Gali būti baigta namie.

Pagal oficialią dokumentaciją išsiaiškinti, ką leidžia nuotolinis serverio valdymas.

Darbai:

1. Faile `docs/serveriai.md` palyginti fizinį, virtualų ir debesijos serverį (kaina, lankstumas, kas prižiūri)
2. Po vieną sakinį parašyti, kuo skiriasi rack, tower ir blade serveris
3. Pasirinkti vieną: iLO, iDRAC arba IPMI; išvardyti bent 3 nuotolinio valdymo galimybes su nuoroda į skyrių (pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas)
4. Parašyti 3–4 sakinius, kodėl administratorius negali visada ateiti prie serverio
5. Failą įkelti per šaką ir PR
6. Jei naudotas DI: parašyta, ką paklausėte ir kaip patikrinote atsakymą (kuo patvirtinote dokumentacijoje)
7. Pateikimas: PR nuoroda į `docs/serveriai.md`

## Papildomos užduotys

1. Paprašykite DI parašyti Python skriptą, kuris sugeneruoja `.excalidraw` failą pagal jūsų komponentų sąrašą; paaiškinkite, ką skriptas daro, ir patikrinkite, ar failas atsidaro Excalidraw
2. Antra schema: kaip platforma atrodytų po metų, kai vartotojų padaugėja 10 kartų
3. Du sakiniai, kodėl valdymo sąsaja (iLO, iDRAC, IPMI) neturi būti prieinama iš interneto

## Iki kito susitikimo

1. Užbaikite schemą ir įkelkite į GitHub per PR
2. Užbaikite `docs/serveriai.md`, jei nespėjote klasėje
3. Pasižiūrėkite, kokio dydžio (CPU, RAM, diskas) yra jūsų lab VM: tai pravers 11.1
