# 09 Atsakymai (tik dėstytojui, studentams nepateikiami)

## Testas

Pamokų numeracija pagal atnaujintą 1 etapą: 01 DevOps ir Git, 02 terminalas, 03 Bash, 04 Bash skripto tikrinimas, 05 Git būsenos tikrinimas, 06 tinklai, 07 projektas, 08 skriptų rašymo praktika.

| Nr. | Pamoka | Atsakymas | Paaiškinimas |
|---|---|---|---|
| 1 | 01 | B | DevOps jungia kūrėjus ir administratorius automatizavimu. |
| 2 | 01 | A | `/health` leidžia įrankiams patikrinti, ar programa gyva. |
| 3 | 01 | B | `-c` sukuria šaką ir persijungia. |
| 4 | 01 | A | Po `git add` failas yra paruoštas commit'ui. |
| 5 | 01 | D | Pirmas šakos siuntimas yra `git push -u origin`. |
| 6 | 02 | C | Pull Request sujungia šaką į `main`. |
| 7 | 02 | A | `git pull` atsisiunčia ir sujungia. |
| 8 | 02 | C | Trūksta `x` teisės: `chmod +x`. |
| 9 | 02 | A | `kill` siunčia SIGTERM, `kill -9` SIGKILL. |
| 10 | 02 | B | `export` galioja tik tam terminalo langui. |
| 11 | 03 | C | `$1` yra pirmas argumentas. |
| 12 | 03 | D | Nulinis kodas = sėkmė, kitas = klaida; matoma per `$?`. |
| 13 | 03 | B | `-e` sustabdo klaidoje, `-u` nenustatytuose kintamuosiuose, `pipefail` vamzdžiuose. |
| 14 | 03 | A | `*.log` paslepia naujus logus nuo Git. |
| 15 | 03 | D | `git restore` grąžina neišsaugotą failą. |
| 16 | 04 | C | `$(...)` paima tik stdout; stderr lieka ekrane. |
| 17 | 04 | D | `$?` keičiasi po kiekvienos komandos, todėl `KODAS=$?` rašomas iškart. |
| 18 | 04 | B | Teste klaida yra tai, ko ieškome: testas turi tęsti ir viską suskaičiuoti. |
| 19 | 04 | C | Testas, kuris nepagauna sugadinto skripto, nieko netikrina. |
| 20 | 05 | A | Tuščias `--porcelain` reiškia švarų darbinį medį. |
| 21 | 05 | B | `.gitignore` neveikia jau sekamiems failams; reikia `git rm --cached`. |
| 22 | 05 | D | Kodas 0 reiškia, kad failas yra Git sekamų failų sąraše. |
| 23 | 06 | B | 404 reiškia, kad resurso nėra. |
| 24 | 06 | C | `-s` tyliai, `-o /dev/null` išmeta kūną, `-w` išveda kodą. |
| 25 | 06 | A | `lsof -i :PORTAS` rodo procesą, naudojantį portą. |
| 26 | 06 | D | `localhost` yra šis kompiuteris (127.0.0.1). |
| 27 | 06 | C | DNS paverčia vardą IP adresu. |
| 28 | 06 | D | `000` reiškia, kad niekas neklauso. |
| 29 | 07 | C | `.env` gali turėti slaptažodžių; `.env.example` keliamas. |
| 30 | 07 | D | `export` galioja tik langui; `.env` įkeliamas skripto (`set -a; . ./.env`). |

Teisingų atsakymų pasiskirstymas: A 7, B 7, C 8, D 8.

Iš ankstesnės testo versijos į banką (`bankas.md`, 46–53) perkelti klausimai apie kodo kelio eilę, commit'ą, `chmod 600`, `brew` ir `apt`, `command -v`, `[ -d ]`, `for` ciklą ir WSL. Vietoj jų atsirado klausimai iš 04 ir 05 pamokų bei klausimas apie `export` ir `.env` (anksčiau rašytinis d).

## Praktika

Starteris sukuriamas skriptu `starteris/sukurti-starteri.sh` (klonuoja `devops-projektas-starter-template`, įdeda klaidų failus iš `starteris/failai/`, grąžina `.env` į Git). Sprendimo failai yra `starteris/sprendimas/`.

Patikrinta macOS (Python 3.9, tikras šablonas): starteris neveikia taip, kaip aprašyta, o su sprendimo failais: `./paleisti.sh` duoda `OK` ir `/status` su `atsiskaitymas-1`, kodas 0; `PORT=5007` veikia; užimtas portas po 20 s duoda kodą 1; serveris po skripto sustabdytas; skriptas veikia iš kito aplanko; `stebesena.sh` rodo `negyvas 000` ir `projektas 200`; `tikrinti-porta.sh` kodai 0 ir 2.

`scripts/tikrinti.sh` patikrintas Linux (Python 3, `lsof`): su teisingu `tikrinti-porta.sh` 6 / 6 ir kodas 0; kai užimtam portui `exit 1` pakeistas į `exit 0`, ❌ ir kodas 1; kai `.env` sekamas, ❌. Užimtas portas tikrinamas trumpam paleidžiant `python3 -m http.server`, todėl taip patikrinamas ir `tikrinti-porta.sh` kodas 1. Nepatikrinta: `tikrinti.sh` macOS ir Ubuntu (WSL), PR sulietas GitHub'e.

### Starterio klaidos

| Vieta | Klaida | Taisymas |
|---|---|---|
| `paleisti.sh` | nevykdomas (`Permission denied`) | `chmod +x paleisti.sh` |
| `paleisti.sh` | nėra `set -euo pipefail`, `.env`, `PORT`, Python patikros, `.venv` kūrimo | pridėti, kaip 07 pamokoje |
| `paleisti.sh` | serveris lieka veikti, nėra `trap` | `trap 'kill "$pid" ...' EXIT` |
| `paleisti.sh` | nesėkmės atveju `exit 0`, nėra `/status` | `exit 1` į klaidų kanalą, `curl /status` |
| `scripts/http-kodas.sh` | nėra `\|\| true`, todėl `000` atveju skriptas nukrenta | `\|\| true` prie `curl` |
| `scripts/tikrinti-porta.sh` | nėra | parašyti patiems |
| `scripts/tikrinti.sh` | nėra | parašyti patiems, kaip 04–05 pamokose |
| `.env` | yra Git'e su `APP_SECRET` | `git rm --cached .env`, `.env` į `.gitignore` |
| `README.md` | nėra „Paleidimas“ | pridėti skyrių |

`stebesena.sh` pats nesugedęs: jis sustoja dėl `http-kodas.sh`. Jei mokinys pataiso `stebesena.sh` su `|| true`, tai taip pat priimtina.

### Ką žiūrėti `tikrinti.sh`

| Matote | Vertinimas |
|---|---|
| teste yra `set -e` | testas sustoja ties pirma ❌: patikros nepilnos, 3 eilutės taškų nėra |
| nėra `exit 1` pabaigoje | rodo ❌, bet kodas 0: 3 ir 4 eilučių taškų nėra |
| `KODAS=$?` ne iškart po komandos | kodas visada 0: patikros nepagauna klaidos |
| užimtas portas netikrinamas | 3 iš 4 taškų už `tikrinti-porta.sh` patikras |
| Git patikra „švarus medis“ ❌ vertinant | studentas pamiršo commit'ą; patikra pati veikia teisingai |

Kaip sugadinti vertinant: `scripts/tikrinti-porta.sh` eilutę `exit 1` (užimtas portas) pakeisti į `exit 0`, paleisti `./scripts/tikrinti.sh; echo $?`, tada `git restore scripts/tikrinti-porta.sh`. Taip pat galima pašalinti `>&2` arba `exit 2` patikroje be argumento.

### Sprendimo failai

`starteris/sprendimas/paleisti.sh`, `scripts/http-kodas.sh`, `scripts/tikrinti-porta.sh`, `scripts/tikrinti.sh`.

Komandų eiga:

````bash
git switch -c atsiskaitymas-1
chmod +x paleisti.sh
git rm --cached .env
nano .gitignore
nano .env
nano paleisti.sh
nano scripts/http-kodas.sh
nano scripts/tikrinti-porta.sh
chmod +x scripts/tikrinti-porta.sh
./paleisti.sh; echo "kodas: $?"
./scripts/stebesena.sh
nano scripts/tikrinti.sh
chmod +x scripts/tikrinti.sh
./scripts/tikrinti.sh; echo "kodas: $?"          # Git patikra dar ❌: yra neįrašytų pakeitimų
nano scripts/tikrinti-porta.sh                    # užimtam portui exit 0
./scripts/tikrinti.sh; echo "kodas: $?"          # ❌ užimtas portas, kodas 1
git restore scripts/tikrinti-porta.sh
nano README.md
nano docs/atsiskaitymas.md
git add -A
git status
git commit -m "Pataisytas paleidimas, pridėta patikra"
./scripts/tikrinti.sh; echo "kodas: $?"          # visi ✅, kodas 0
git push -u origin atsiskaitymas-1
gh pr create --title "Atsiskaitymas 1" --body "Pataisytas paleisti.sh, .env ir stebėsena, pridėta patikra."
gh pr merge --merge
git switch main
git pull
````

Pastaba: `git restore` po sugadinimo veikia tik tada, kai `tikrinti-porta.sh` jau commit'intas. Jei dar ne, studentas grąžina pakeitimą ranka. Abu būdai priimtini.

Slaptažodis `APP_SECRET` liks Git istorijoje (starterio commit'e), todėl vertinama, kad `.env` nebesekamas, o ne kad istorija išvalyta.

### `docs/atsiskaitymas.md`

````markdown
# Atsiskaitymas 1

## /status

```
{"color":"green","db":"up","db_type":"sqlite","env":"local","hostname":"...","version":"atsiskaitymas-1"}
```

## Patikra

`scripts/tikrinti-porta.sh` užimtam portui pakeičiau `exit 1` į `exit 0`. `./scripts/tikrinti.sh` parodė ❌ „užimtas portas -> kodas 1“ ir baigėsi kodu 1. Grąžinau su `git restore`.

## Atsakymai

a) 404 reiškia, kad resurso nėra (kliento klaida), o 500 reiškia serverio klaidą.
b) `set -e` sustabdo skriptą pirmoje klaidoje, kad jis neveiktų toliau su sugedusia būsena.
c) `.env` gali turėti slaptažodžių, o Git istorija lieka. Į Git keliamas `.env.example`.
````
