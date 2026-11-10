# DI kurse: taisyklės ir užduotys

Tikslas: studentai moka **naudoti** DI darbe ir moka jo **nepasitikėti aklai**. Abu vienodai svarbu. Kasdienių užduočių dėstytojas netikrina, o atsiskaitymuose DI nenaudojamas, todėl pirmiausia reikia pačiam suprasti.

## Taisyklės (iš 01 pamokos)

| | |
|---|---|
| Galima | Paaiškinti klaidą, pasiūlyti komandą, paaiškinti dokumentaciją |
| Būtina | Paleisti, perskaityti rezultatą, patikrinti dokumentacijoje |
| Niekada | Į DI ar į Git nekelti slaptažodžių, raktų, tokenų, `.env` |
| Atsiskaityme | DI nenaudojamas |

## Principas: pirma pats, paskui su DI

1. Naują temą kiekvienas padaro pats ir supranta rezultatą.
2. Tik tada parodoma, kaip DI pagreitina tą patį darbą.
3. Kuo toliau kursas, tuo daugiau DI naudojama, nes studentai jau gali patikrinti rezultatą.

## DI užduoties forma (kartojama kiekviename etape)

1. **Naudok.** Paprašyk DI padaryti etapo užduotį.
2. **Patikrink.** Paleisk rezultatą ir parašyk 2–3 pastebėjimus: kas veikia, kas ne, ko DI nepadarė.
3. **Pataisyk.** Pataisyk bent vieną dalyką pats ir paaiškink, kodėl.

Rezultatas rašomas į `docs/di.md` savo repozitorijoje (kad dėstytojas matytų pastebėjimus).

## Pasiskirstymas per kursą

| Etapas | Ką daro DI | Ką tikrinti |
|---|---|---|
| 1 Linux, Git | tik klaidų paaiškinimas | ar komanda saugi (`rm -rf`, `chmod 777`, `git reset --hard`) |
| 2 Docker | Dockerfile ir Compose šablonas | root vartotojas, `latest`, per didelis image |
| 3 GitHub Actions | workflow šablonas | slaptų reikšmių vieta, trūkstamos teisės, veiksmų versijos |
| 4–5 Kubernetes | YAML ir Helm šablonai | probe'ai, requests/limits, ar `kubectl apply` pavyko |
| 6 Azure | Bicep, `az` komandos | kaštai, per plačios teisės, ar resursai ištrinami |
| 7 Pipeline, projektas | visas pipeline | ar studentas gali paaiškinti kiekvieną žingsnį |

## Dėstytojui

- Kiekviename etape parodyk bent vieną tikrą DI klaidą (iš lentelės) ir kaip ją pastebėti. Prieš demonstraciją išbandyk pats: nerodyk išgalvotos klaidos.
- „Sulaužyk ir pataisyk“ pamokos (20, 31, 44): studentas įklijuoja klaidą DI ir pasako, ar siūlymas teisingas.
- Pirmose pamokose (Linux, Bash, Git) DI nenaudoti sprendimui: ten formuojasi pagrindai.
- Egzaminas: DI nebus, todėl užduotyse DI dalis neturi pakeisti paties darbo.

## Atvira

- Kuriose konkrečiose pamokose įdėti pirmas DI užduotis (siūlymas: 14 Dockerfile).
- Ar `docs/di.md` reikalauti kiekviename etape, ar tik tose pamokose, kur yra DI užduotis.
