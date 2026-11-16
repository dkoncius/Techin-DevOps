# 09 Atsakymai (tik dėstytojui, studentams nepateikiami)

## Testas

| Nr. | Pamoka | Atsakymas | Paaiškinimas |
|---|---|---|---|
| 1 | 01 | B | DevOps jungia kūrėjus ir administratorius automatizavimu. |
| 2 | 01 | D | Kodas, versijų kontrolė, testai, paketavimas, diegimas, stebėsena. |
| 3 | 01 | A | `/health` leidžia įrankiams patikrinti, ar programa gyva. |
| 4 | 01 | C | Commit yra išsaugotas pakeitimų taškas. |
| 5 | 01 | B | `-c` sukuria šaką ir persijungia. |
| 6 | 01 | A | Po `git add` failas yra paruoštas commit'ui. |
| 7 | 03 | D | `git restore` grąžina neišsaugotą failą. |
| 8 | 02 | C | Pull Request sujungia šaką į `main`. |
| 9 | 01 | B | Pirmas šakos siuntimas yra `git push -u origin`. |
| 10 | 02 | A | `git pull` atsisiunčia ir sujungia. |
| 11 | 05 | D | `600`: savininkas skaito ir rašo, kiti nieko. |
| 12 | 02 | C | Trūksta `x` teisės: `chmod +x`. |
| 13 | 02 | A | `kill` siunčia SIGTERM, `kill -9` SIGKILL. |
| 14 | 02 | B | Mac `brew` be `sudo`, Ubuntu `sudo apt`. |
| 15 | 03 | C | `$1` yra pirmas argumentas. |
| 16 | 03 | D | Nulinis kodas = sėkmė, kitas = klaida; matoma per `$?`. |
| 17 | 03 | B | `-e` sustabdo klaidoje, `-u` nenustatytuose kintamuosiuose, `pipefail` vamzdžiuose. |
| 18 | 03 | A | Ar komanda yra. |
| 19 | 03 | C | `-d` tikrina, ar tai katalogas. |
| 20 | 03 | D | Ciklas per `.md` failus ir `echo` kiekvieno kelio. |
| 21 | 04 | B | 404 reiškia, kad resurso nėra. |
| 22 | 04 | C | `-s` tyliai, `-o /dev/null` išmeta kūną, `-w` išveda kodą. |
| 23 | 04 | A | `lsof -i :PORTAS` rodo procesą, naudojantį portą. |
| 24 | 04 | D | `localhost` yra šis kompiuteris (127.0.0.1). |
| 25 | 04 | B | DNS paverčia vardą IP adresu. |
| 26 | 02 | B | `export` galioja tik tam terminalo langui. |
| 27 | 04 | D | `000` reiškia, kad niekas neklauso. |
| 28 | 05 | C | Projektas klonuojamas į `~/devops`. |
| 29 | 03 | A | `*.log` paslepia naujus logus nuo Git. |
| 30 | 08 | C | `.env` gali turėti slaptažodžių; `.env.example` keliamas. |

Teisingų atsakymų pasiskirstymas: A 7, B 8, C 8, D 7.

## Praktika

Starteris sukuriamas skriptu `starteris/sukurti-starteri.sh` (klonuoja `devops-projektas-starter-template`, įdeda klaidų failus iš `starteris/failai/`, grąžina `.env` į Git). Sprendimo failai yra `starteris/sprendimas/`.

Patikrinta macOS (Python 3.9, tikras šablonas): starteris neveikia taip, kaip aprašyta, o su sprendimo failais: `./paleisti.sh` duoda `OK` ir `/status` su `atsiskaitymas-1`, kodas 0; `PORT=5007` veikia; užimtas portas po 20 s duoda kodą 1; serveris po skripto sustabdytas; skriptas veikia iš kito aplanko; `stebesena.sh` rodo `negyvas 000` ir `projektas 200`; `tikrinti-porta.sh` kodai 0 ir 2. Nepatikrinta: Ubuntu (WSL), `tikrinti-porta.sh` su užimtu portu per starterį, PR sulietas GitHub'e.

### Starterio klaidos

| Vieta | Klaida | Taisymas |
|---|---|---|
| `paleisti.sh` | nevykdomas (`Permission denied`) | `chmod +x paleisti.sh` |
| `paleisti.sh` | nėra `set -euo pipefail`, `.env`, `PORT`, Python patikros, `.venv` kūrimo | pridėti, kaip 05 pamokoje |
| `paleisti.sh` | serveris lieka veikti, nėra `trap` | `trap 'kill "$pid" ...' EXIT` |
| `paleisti.sh` | nesėkmės atveju `exit 0`, nėra `/status` | `exit 1` į klaidų kanalą, `curl /status` |
| `scripts/http-kodas.sh` | nėra `\|\| true`, todėl `000` atveju skriptas nukrenta | `\|\| true` prie `curl` |
| `scripts/tikrinti-porta.sh` | nėra | parašyti patiems |
| `.env` | yra Git'e su `APP_SECRET` | `git rm --cached .env`, `.env` į `.gitignore` |
| `README.md` | nėra „Paleidimas“ | pridėti skyrių |

`stebesena.sh` pats nesugedęs: jis sustoja dėl `http-kodas.sh`. Jei mokinys pataiso `stebesena.sh` su `|| true`, tai taip pat priimtina.

### Sprendimo failai

`starteris/sprendimas/paleisti.sh`, `scripts/http-kodas.sh`, `scripts/tikrinti-porta.sh`.

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
nano README.md
nano docs/atsiskaitymas.md
git add -A
git status
git commit -m "Pataisytas paleidimas ir pridėta patikra"
git push -u origin atsiskaitymas-1
gh pr create --title "Atsiskaitymas 1" --body "Pataisytas paleisti.sh, .env ir stebėsena."
gh pr merge --merge
````

Slaptažodis `APP_SECRET` liks Git istorijoje (starterio commit'e), todėl vertinama, kad `.env` nebesekamas, o ne kad istorija išvalyta.

### `docs/atsiskaitymas.md`

````markdown
# Atsiskaitymas 1

## /status

```
{"color":"green","db":"up","db_type":"sqlite","env":"local","hostname":"...","version":"atsiskaitymas-1"}
```

## Atsakymai

a) 404 reiškia, kad resurso nėra (kliento klaida), o 500 reiškia serverio klaidą.
b) `set -e` sustabdo skriptą pirmoje klaidoje, kad jis neveiktų toliau su sugedusia būsena.
c) `.env` gali turėti slaptažodžių, o Git istorija lieka. Į Git keliamas `.env.example`.
d) `export` nustato kintamąjį tik tam terminalo langui ir dingsta uždarius; `.env` yra failas, kuriame tie patys kintamieji saugomi ir įkeliami skripto (`set -a; . ./.env`).
````
