# 09 Praktika

Laikas: ~2 val.

Tikslas: `devops-projektas` parodyti paleidimą, o `git-bandymas` parodyti Git. Docker nevertinamas.

Darbai:

1. `~/Desktop/devops/git-bandymas`: `gh pr list --state merged` rodo bent 3 sulietus Pull Request (pamokos 02–04).
2. `~/devops/devops-projektas`: atnaujinkite `main` ir sukurkite šaką `atsiskaitymas-1`.
3. Sukurkite `scripts/tikrinti-porta.sh`: priima vieną argumentą (TCP portą), išveda „Portas N laisvas“ arba „Portas N užimtas“. Kodai: 0 laisvas, 1 užimtas, 2 jei argumento nėra, jis ne skaičius arba ne 1–65535 (žinutė klaidų kanale).
4. `paleisti.sh` (darytas 05 pamokoje) turi tikrinti Python versiją, naudoti `PORT` (numatytasis 5001), laukti `/health` 200, po sėkmės papildomai išvesti `/status` atsakymą, visada sustabdyti paleistą projektą ir grąžinti 0 arba 1. Pridėkite trūkstamą `/status` eilutę.
5. Per `.env` nustatykite `APP_VERSION=atsiskaitymas-1` ir `APP_COLOR` kitą nei numatytoji. Paleiskite ir `/status` atsakymą įrašykite `docs/atsiskaitymas.md`. `.env` į Git nekelkite.
6. Tame pačiame faile trumpai (po 1–2 sakinius) atsakykite: a) kuo skiriasi HTTP kodai 404 ir 500; b) ką daro `set -e`; c) kodėl `.env` nekeliamas į Git.
7. Pull Request iš `atsiskaitymas-1` į `main`, aiški antraštė ir aprašas, tada Merge. Kompiuteryje atnaujinkite `main`.
8. Patikrinkite, kad repozitorijoje nėra `.env` turinio ir slaptažodžių.

**Pateikimas:** nuoroda į `devops-projektas` ir į sulietą PR, bei `git-bandymas` sulietų PR sąrašas.

Reikalavimai: `devops-projektas` sukurtas iš šablono, README turi skyrių „Paleidimas“, `.gitignore` ignoruoja `.env`. Trys sulieti PR yra `git-bandymas`, ne vien šiame projekte.
