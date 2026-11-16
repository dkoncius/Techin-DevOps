# 09 Praktika

Laikas: ~2 val.

Tikslas: gavote projektą su klaidomis. Reikia jį nusiklonuoti, priversti veikti, papildyti ir pateikti Pull Request. Komandų čia nėra: sprendžiate patys pagal 01–05 pamokas. Docker nevertinamas.

Projektas: `atsiskaitymas-1-starteris` (nuoroda duodama atsiskaitymo metu).

**Reikalavimai (darykite eilės tvarka):**

**1. etapas. Paruošimas**

- Savo kopija sukurta iš šablono, `origin` rodo jūsų repozitoriją
- Projektas nusiklonuotas į `~/devops`
- Darbas vyksta šakoje `atsiskaitymas-1`, ne `main`

**2. etapas. `.env` ir slaptos reikšmės**

- `.env` nebesekamas Git'o, `.gitignore` jį ignoruoja
- `.env` nustatyta `APP_VERSION=atsiskaitymas-1` ir kita `APP_COLOR` nei buvo
- Repozitorijoje nelieka `APP_SECRET` ir kitų slaptų reikšmių (`.env.example` leidžiamas)

**3. etapas. `paleisti.sh` (jau yra, bet neveikia)**

- Paleidžiamas kaip `./paleisti.sh`
- Tikrina Python 3.9 ar naujesnį, sukuria `.venv` ir įdiegia priklausomybes, jei jų nėra
- Nuskaito `.env`, naudoja `PORT` (numatytasis 5001)
- Laukia iki 20 s, kol `/health` atsakys 200
- Sėkmės atveju parašo `OK` ir parodo `/status` atsakymą, kodas 0
- Nesėkmės atveju klaidos žinutė klaidų kanale, kodas 1
- Visada sustabdo savo paleistą serverį

**4. etapas. `scripts/tikrinti-porta.sh` (jo nėra)**

- Vienas argumentas, TCP portas
- Išveda „Portas N laisvas“ arba „Portas N užimtas“
- Kodas 0 laisvas, 1 užimtas, 2 jei argumento nėra, jis ne skaičius arba ne 1–65535 (žinutė klaidų kanale)

**5. etapas. `scripts/stebesena.sh` (jau yra, bet neveikia)**

- Pagal `uzrasai/adresai.txt` kiekvienai eilutei išveda `vardas kodas`
- Kai kuris nors serveris neatsako (kodas `000`), likusios eilutės vis tiek išvedamos

**6. etapas. Dokumentai**

- `README.md` turi skyrių „Paleidimas“ su viena komanda
- `docs/atsiskaitymas.md` turi `/status` atsakymą po paleidimo su jūsų `.env`
- `docs/atsiskaitymas.md` turi 1–2 sakinius kiekvienam klausimui: a) 404 ir 500; b) `set -e`; c) kodėl `.env` nekeliamas į Git; d) `export` ir `.env`

**7. etapas. Pull Request**

- Pull Request iš `atsiskaitymas-1` į `main` su aiškia antrašte ir aprašu, sulietas
- `main` atnaujintas jūsų kompiuteryje

**Rezultatas, kurio tikimės:**

- `paleisti.sh` su veikiančiu projektu: `OK`, `/status` rodo jūsų versiją ir spalvą, kodas 0
- `paleisti.sh` su užimtu portu: klaida po ~20 s ir kodas 1
- `stebesena.sh` su veikiančiu projektu: `negyvas 000` ir `projektas 200`
- `tikrinti-porta.sh`: kodai 0, 1 ir 2 pagal aprašą
- `git status` švarus, `.env` nesekamas
- Pull Request sulietas

**Papildomai** (neprivaloma, nevertinama taškais):

- `paleisti.sh` prieš paleidimą pats iškviečia `tikrinti-porta.sh` ir sustoja su aiškia žinute, jei portas užimtas
- `stebesena.sh` grąžina kodą 1, jei bent vienas adresas ne 200

**Pateikimas:** nuoroda į jūsų repozitoriją ir sulietą Pull Request.
