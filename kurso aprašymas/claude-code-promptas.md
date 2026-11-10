# Promptai Claude Code (Techin DevOps)

Du promptai. **1 promptas** kuria kurso struktūrą ir 01–03 paskaitas (aplanke `Techin DevOps`). **2 promptas** kuria studentų starterį `devops-projektas` (atskirame aplanke). Pirmą paleiskite šiandien, antrą lygiagrečiai arba iškart po jo. Šablonas `devops-projektas` turi būti GitHub'e iki 2026-11-11.

## 1 promptas: kurso struktūra ir paskaitos 01–03

### Prieš paleidžiant (jūs, ne Claude Code)

Padaryta:
- aplankas `Techin DevOps` (`~/Desktop/Techin DevOps`), `git init`, `.gitignore` (`_saltiniai/`, `.env`, `*.tfstate*`, `*.tfvars`, `.terraform/`, `kubeconfig*`, `.DS_Store`);
- `programa/kurso-planas.md` (naujas metinis planas);
- `_saltiniai/`: `docker/`, `finalinis projektas/`, `mano-temos/` (10.1, 10.2, 12.2, 12.3, 12.4), `nuorodos-medziaga/` (trečiųjų šalių repo), `.claude/skills/pamoka-formatas/SKILL.md`.

Patikrinkite prieš paleidžiant:
1. Paslapčių paieška `_saltiniai/` nieko tikro neradė (pavyzdiniai slaptažodžiai tinka). Be `node_modules` ir `nuorodos-medziaga`:
   ```bash
   grep -rIniE '(password|passwd|secret|token|api[_-]?key|access[_-]?key|client[_-]?secret|connection[_-]?string)[A-Za-z_]*["'\'']?[ ]*[:=][ ]*["'\'']?[A-Za-z0-9+/=_.-]{12,}' _saltiniai --exclude-dir=node_modules --exclude-dir=.git --exclude-dir=nuorodos-medziaga | grep -viE 'changeme|example|placeholder|secretKeyRef|\.Values|\$\{|your[-_]|xxx|<|os\.environ|dev-slaptazodis' | head -40
   ```
2. Neliko slaptų failų kopijoje:
   ```bash
   find _saltiniai \( -name 'vault-pass*' -o -name '*.pem' -o -name '*.key' -o -name 'id_rsa*' -o -name '*.pfx' -o -name '*.p12' -o -name '*.tfstate*' -o -name '*.tfvars' -o -name '.env*' -o -name 'kubeconfig*' \) -not -path '*/node_modules/*' -not -path '*/nuorodos-medziaga/*' | head
   ```
3. Repo **nedarykite viešo** ir nieko nepush'inkite, kol jis nėra privatus.

### Promptas (įklijuokite į Claude Code, aplanke `Techin DevOps`)

```
Kontekstas: kuriu naują DevOps kurso medžiagą studentams (30 studentų, grupė VH-DO, lietuvių kalba). Šaltinis tiesos: programa/kurso-planas.md (80 paskaitų, 14 skyrių). Seno projekto kopija yra _saltiniai/ – tik skaitymui.

Taisyklės:
- Nieko netrink ir nekeisk _saltiniai/ bei programa/kurso-planas.md. Jokio git commit ir git push. Git repo jau sukurtas (git init padarytas).
- Jokių slaptažodžių, raktų, tokenų, .env, tfstate, tfvars ar kubeconfig. Rasi – nekopijuok, pranešk failo pavadinimą, bet ne turinį.
- Jokių komandų, kurios keičia debesį ar klasterį (apply, destroy, delete, prune, kubectl apply, sync).
- Skriptuose jokio `rm` ir jokio `git push`.
- Neskaityk _saltiniai/nuorodos-medziaga/ (trečiųjų šalių repo su node_modules), nebent paprašysiu.
- Pamokos formatą imk iš _saltiniai/.claude/skills/pamoka-formatas/SKILL.md, perkelk į .claude/skills/pamoka-formatas/SKILL.md ir atnaujink: paskaitos 01–80, 3 val., DB MySQL, platforma GitHub, sprendimų vieta (žemiau).
- Senuose pavyzdžiuose (12.2, 12.3, etalonas) yra PostgreSQL. Naujoje medžiagoje naudok MySQL; kol pamoka jos neliečia, nieko nekonvertuok.

Struktūra (plano 13 skyrius):
- kursas/README.md, kursas/kursas.sh, kursas/pamokos/NN Pavadinimas/{pamoka.md, uzduotys.md, check.sh} – tai viešas turinys. Aplanko pavadinimai iš plano 5 skyriaus lentelės. NEKURK sprendimai/ čia.
- mokytojas/sprendimai/NN/{README.md, projektas/} – sprendimai ir pamokos pabaigos projekto būsena (projektas/ tik kai pamoka keičia projektą). Privatu.
- mokytojas/atsiskaitymai/NN/ – testas.md, praktika.md, vertinimas.md, atsakymai.md (privatu; šiame etape tik aplankai su .gitkeep).
- mokytojas/publikuoti.sh – `publikuoti.sh NN` nukopijuoja kursas/pamokos/NN …/{pamoka.md, uzduotys.md, check.sh} į aplanką, kurį nurodo aplinkos kintamasis DEVOPS_KURSAS_DIR (viešo repo klonas šalia). `publikuoti.sh NN --sprendimai` nukopijuoja mokytojas/sprendimai/NN/ į <DEVOPS_KURSAS_DIR>/pamokos/NN …/sprendimai/. Neperrašo esamo be patvirtinimo.
- Studentų projekto (Flask + MySQL starterio) NEKURK. Jį pateiksiu aš kaip GitHub template repo „devops-projektas“. Jei jo dar nėra, sprendimai/projektas/ lieka tik su README „bus papildyta“.

Taisyklės projekto būsenoms: kiekvienos pamokos pabaigos būsena = kitos pamokos pradžia. Jei pamoka projekto nekeičia, sprendimai/projektas/ nekuriamas, o kursas.sh atstatyti naudoja paskutinę ankstesnę būseną.
Sprendimai viešai atsiranda tik kai aš paleidžiu publikuoti.sh ir pats padarau push.

Darbai:
1. Perskaityk programa/kurso-planas.md (ypač 0, 5, 9, 12, 13 skyrius) ir SKILL.md. Pasakyk 3–5 sakiniais, ką supratai, ir ką laikai neaiškiu.
2. Sukurk kursas/pamokos/ aplankus 01–80 su .gitkeep ir mokytojas/ aplankus pagal struktūrą aukščiau.
3. Parašyk kursas/README.md studentams: kas kursas, kaip susikurti savo projektą iš template „devops-projektas“, kaip klonuoti „devops-kursas“ ir kas savaitę daryti git pull, kaip atlikti užduotis ir paleisti check.sh, kaip atstatyti per ./kursas.sh atstatyti NN, alternatyva rankiniu kopijavimu, jei nėra Bash (Windows be Git Bash/WSL). Nieko, kas priklauso nuo mano kompiuterio.
4. Parašyk kursas/kursas.sh: komandos `atstatyti NN` ir `patikrinti NN`. `atstatyti` prieš keisdamas perkelia dabartinį projektą į projektas.atsarginis-<laikas> (jokio rm), prašo patvirtinimo, kelią į projektą gauna argumentu arba iš aplinkos kintamojo, o jei sprendimas dar nepaskelbtas, parašo „sprendimas bus įkeltas kitos pamokos pradžioje“. `patikrinti` paleidžia pamokos check.sh. Parašyk paprastai (set -euo pipefail), komentarai lietuviškai.
5. Parašyk mokytojas/publikuoti.sh pagal aprašymą. Tos pačios taisyklės dėl komentarų.
6. Parašyk paskaitas 01 (Kas yra DevOps), 02 (Linux terminalas), 03 (Procesai ir paketai) pagal skill'ą. Datos: 2026-11-11, 2026-11-12, 2026-11-16. Paskaita 01: kas yra DevOps, ~20 min. GitHub įvadas (medžiagą imk iš senų 10.1/10.2, jei tinka), projekto susikūrimas iš template, klonavimas, struktūros apžiūra, pirmas Pull Request. 02: terminalas projekto kataloge. 03: procesai ir paketai.
7. Prie kiekvienos pamokos check.sh su išvestimi „OK“ arba „nepavyko, nes…“. Užduotyse pratimai, kurie parodo, ar studentas moka tai, ką dėstė mokytojas Edgaras: Git (clone, branch, commit), Bash (paprastas skriptas), Python kodo skaitymas (pvz. ką daro /health). Sunkesniems žingsniams duok užuominą „jei nežinai, kaip“, ne pilną atsakymą.
8. Sprendimus rašyk į mokytojas/sprendimai/NN/ pagal SKILL.md (Kas čia, Kaip rodyti klasėje su minutėmis ir kitu pavyzdžiu, Dažna klaida, lentelė „Sprendimas pagal darbus“). „Kaip rodyti klasėje“ turi sakyti, kaip pamokos pradžioje parodyti sprendimą gyvai.
9. Pabaigoje: failų medis, ką sukūrei, ką pakeitei lyginant su senu formatu, ką turiu patikrinti rankomis. Be commit.

Pirmiausia parodyk planą (5–12 eilučių) ir laukk mano „taip“, tik tada kurk.
```

### Po to

- Peržiūrėkite sugeneruotus failus, tada patys darykite `git commit` privačiame repo.
- Sukurkite tuščią viešą repo `devops-kursas` ir klonuokite jį šalia; nustatykite `DEVOPS_KURSAS_DIR`.
- Skelbkite per `publikuoti.sh`, prieš kiekvieną push paleisdami slaptų duomenų paiešką.

---

## 2 promptas: studentų starteris `devops-projektas`

Šiam promptui reikia **atskiro aplanko**, nes tai bus atskiras GitHub template repo. Seno projekto nekeičiame.

### Prieš paleidžiant (jūs, ne Claude Code)

1. Sukurkite aplanką `devops-projektas` (pvz. šalia `Techin DevOps`) ir jame `git init`.
2. Į `devops-projektas/_baze/` nukopijuokite tik senos aplikacijos kodą: aplanką `knygynas` iš `Techin DevOps/_saltiniai/mano-temos/12.2 Dockerfile ir PostgreSQL/sprendimai/`. Be `.env` ir paslapčių.
3. Sukurkite `devops-projektas/.gitignore` su eilutėmis: `_baze/`, `_lokalus-testas/`, `.env`, `*.db`, `__pycache__/`, `.venv/`, `.DS_Store`.
4. Atidarykite Claude Code šiame aplanke.

### Promptas (įklijuokite į Claude Code, aplanke `devops-projektas`)

```
Kontekstas: kuriu GitHub template repo „devops-projektas“ – studentų darbo projektą DevOps kursui (Python Flask + MySQL, pagrindas senas projektas su PostgreSQL). Senos aplikacijos kopija yra _baze/ (tik skaitymui; ji ignoruojama per .gitignore).

Taisyklės:
- Nekeisk _baze/. Jokio git commit ir git push. Jokių paslapčių, .env, raktų. Į repo tik .env.example be tikrų reikšmių.
- Docker leidžiama tik lokaliai, mano kompiuteryje: docker compose up -d/ps/logs/build ir down BE -v. Jokio prune, rm, volume trynimo, jokių komandų, kurios keičia debesį ar klasterį.
- Starteryje NETURI būti Dockerfile, docker-compose ir GitHub Actions workflow – studentai juos kuria patys 14, 18 ir 22–27 paskaitose. MySQL išbandymui naudok laikiną compose failą aplanke _lokalus-testas/, kurį įrašyk į .gitignore.

Darbai:
1. Perskaityk _baze/. Be jokių pakeitimų parodyk: ar ten yra aplikacija (kokia kalba, framework), kaip jungiasi prie DB, kur PostgreSQL, ką pritaikysi. Pasiūlyk planą (8–15 eilučių) ir laukk mano „taip“.
2. Sukurk Flask aplikaciją:
   - /health (JSON), /items (GET sąrašas, POST pridėjimas), ir puslapis / su paprastu HTML/CSS ir keliomis JS eilutėmis: rodo APP_VERSION (iš aplinkos kintamojo, numatyta „dev“), konteinerio/kompiuterio vardą (hostname), spalvos juostą iš APP_COLOR (numatyta „blue“), DB būseną (prisijungta ar ne) ir /items sąrašą su pridėjimo forma.
   - DB per aplinkos kintamuosius DB_HOST, DB_USER, DB_PASSWORD, DB_NAME; jei jų nėra – SQLite faile.
   - schema.sql ir seed.sql (veikia ir SQLite, ir MySQL; jei sintaksė skiriasi, parašyk dvi versijas ir paaiškink README).
   - requirements.txt, .env.example, .gitignore (.env, _baze/, _lokalus-testas/, *.db), README su paleidimu viena komanda ir su žingsniais, kaip prisijungti prie MySQL (nuo 18 paskaitos).
   - Vienas paprastas pytest testas (/health ir /items su SQLite).
3. Išbandyk lokaliai: (a) SQLite režimas: paleisk, curl /health, /items, atidaryk /, paleisk pytest; (b) MySQL režimas: laikinas compose _lokalus-testas/ (mysql:8, healthcheck, schema+seed), aplikacija su DB_* kintamaisiais, patikrink tuos pačius dalykus, tada compose down BE -v.
4. Pabaigoje parodyk: failų medį, komandų išvestis (kas praėjo, kas ne), ką pakeitei iš senos aplikacijos, ir ką man reikia patikrinti rankomis. Be commit.
```

### Po to

- Peržiūrėkite rezultatą, patikrinkite, kad `_baze/`, `.env` ir `_lokalus-testas/` nepateko į Git (`git status`).
- Sukurkite GitHub repo `devops-projektas` ir pažymėkite „Template repository“ (tik kai jame nėra paslapčių).
- Atsiųskite ataskaitą, ir sulyginsime plano 9 skyrių su tuo, kas pavyko.

---

## Vėliau (ne dabar)

- `etalonas` ir 12.3 Docker Compose konvertuoti į MySQL, kai rašysite 18 paskaitą (~gruodžio 7 d.) ir 7 etapo pamokas.
- Atsiskaitymo 1 pamokos (10 Atsiskaitymas 1) testas, praktika ir vertinimas: iki 2026-11-30.
