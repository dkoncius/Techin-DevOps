# 10 Atsakymai (tik dėstytojui, studentams nepateikiami)

## Testas

| Nr. | Pamoka | Atsakymas | Paaiškinimas |
|---|---|---|---|
| 1 | 01 | B | DevOps jungia kūrėjus ir administratorius automatizavimu. |
| 2 | 01 | D | Kodas, versijų kontrolė, testai, paketavimas, diegimas, stebėsena. |
| 3 | 01 | A | `/health` leidžia įrankiams patikrinti, ar programa gyva. |
| 4 | 01 | C | Commit yra išsaugotas pakeitimų taškas. |
| 5 | 01 | B | `-c` sukuria šaką ir persijungia. |
| 6 | 07 | A | `--staged` rodo jau pridėtus pakeitimus. |
| 7 | 07 | D | `revert` sukuria naują commit'ą, istorija lieka. |
| 8 | 06 | C | Konfliktas atsiranda, kai ta pati vieta pakeista skirtingai. |
| 9 | 06 | B | Žymekliai pašalinami, tada `git add` ir `git commit`. |
| 10 | 07 | A | `fetch` tik atsisiunčia, `pull` = `fetch` + `merge`. |
| 11 | 06 | D | `600`: savininkas skaito ir rašo, kiti nieko. |
| 12 | 02 | C | Trūksta `x` teisės: `chmod +x`. |
| 13 | 03 | A | `kill` siunčia SIGTERM, `kill -9` SIGKILL. |
| 14 | 03 | B | Mac `brew` be `sudo`, Ubuntu `sudo apt`. |
| 15 | 04 | C | `$1` yra pirmas argumentas. |
| 16 | 04 | D | Nulinis kodas = sėkmė, kitas = klaida; matoma per `$?`. |
| 17 | 04 | B | `-e` sustabdo klaidoje, `-u` nenustatytuose kintamuosiuose, `pipefail` vamzdžiuose. |
| 18 | 04 | A | Ar komanda yra. |
| 19 | 04 | C | `-d` tikrina, ar tai katalogas. |
| 20 | 04 | D | Ciklas per `.md` failus ir `echo` kiekvieno kelio. |
| 21 | 05 | B | 404 reiškia, kad resurso nėra. |
| 22 | 05 | C | `-s` tyliai, `-o /dev/null` išmeta kūną, `-w` išveda kodą. |
| 23 | 05 | A | `lsof -i :PORTAS` rodo procesą, naudojantį portą. |
| 24 | 05 | D | `localhost` yra šis kompiuteris (127.0.0.1). |
| 25 | 05 | B | DNS paverčia vardą IP adresu. |
| 26 | 06 | C | Privatus raktas lieka pas jus. |
| 27 | 06 | A | SSH atsisako rakto, kurį gali skaityti kiti. |
| 28 | 06 | D | Raktas laikomas nutekėjusiu: pašalinti iš GitHub, sukurti naują porą. |
| 29 | 08 | B | Branch apsauga reikalauja PR prieš sujungimą. |
| 30 | 09 | C | `.env` gali turėti slaptažodžių; `.env.example` keliamas. |

Teisingų atsakymų pasiskirstymas: A 7, B 8, C 8, D 7.

## Praktika

Patikrinta: `tikrinti-porta.sh` (laisvas 0, užimtas 1, be argumento, `abc` ir `70000` → 2) ir `paleisti.sh` su tikru starteriu (sėkmė, kitas portas, užimtas portas) paleisti macOS. Nepatikrinta: Ubuntu (WSL), `/status` išvedimo pridėjimas `paleisti.sh` (kitas nei 09 pamokos pavyzdys), PR ir sulietų PR skaičiavimas GitHub'e.

### `scripts/tikrinti-porta.sh`

````bash
#!/usr/bin/env bash
# tikrinti-porta.sh – ar TCP portas užimtas. 0 = laisvas, 1 = užimtas, 2 = bloga įvestis.
# Naudojimas: ./scripts/tikrinti-porta.sh 5001
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Naudojimas: $0 <portas>" >&2
  exit 2
fi
if ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$1" -lt 1 ] || [ "$1" -gt 65535 ]; then
  echo "Portas turi būti skaičius 1–65535: $1" >&2
  exit 2
fi

if lsof -nP -iTCP:"$1" -sTCP:LISTEN >/dev/null 2>&1; then
  echo "Portas $1 užimtas"
  exit 1
fi
echo "Portas $1 laisvas"
````

### `paleisti.sh`

Pagrindas yra 09 pamokos `paleisti.sh`. Atsiskaitymui pakeičiama sėkmės dalis, kad būtų išvedamas ir `/status`:

````bash
  if [ "$kodas" = "200" ]; then
    echo "OK: /health atsakė 200"
    curl -s "http://localhost:$PORT/status"
    echo
    exit 0
  fi
````

### `docs/atsiskaitymas.md`

````markdown
# Atsiskaitymas 1

## /status

```
{"color":"green","db":"up","db_type":"sqlite","env":"local","hostname":"...","version":"atsiskaitymas-1"}
```

(pavyzdinė išvestis; kompiuterio vardas skirsis)

## Konfliktas

Išspręsta: abi mintys sujungtos viena eilute, žymeklių nėra.

## Klausimai

a) 404 reiškia, kad resurso nėra (kliento klaida), o 500 reiškia serverio klaidą.
b) `set -e` sustabdo skriptą pirmoje klaidoje, kad jis neveiktų toliau su sugedusia būsena.
c) Privatus raktas yra slaptas: jei jis pateko į Git, istorija lieka visiems. Raktą reikia pašalinti iš GitHub paskyros, sukurti naują porą ir pridėti naują viešą raktą.
````
