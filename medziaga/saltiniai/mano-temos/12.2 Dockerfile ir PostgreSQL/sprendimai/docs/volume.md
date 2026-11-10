# Volume ir persistence (pavyzdinis mokinio failas)

Pavyzdys su demonstracine knygų aplikacija; mokinys rašo apie savo starterį.

## Prieš ir po `docker rm -f db`

Prieš ištrynimą: `SELECT * FROM test;` rodo eilutę `liks`. Po `docker rm -f db` ir naujo konteinerio su tuo pačiu `-v pgdata:/var/lib/postgresql/data` ta pati eilutė matoma.

## Be volume

Duomenys būtų konteinerio rašomame sluoksnyje. Ištrynus konteinerį, dingtų ir jie, nes tas sluoksnis ištrinamas kartu.

## Volume ir bind mount

1. Volume: Docker valdoma saugykla (`docker volume create`), nepriklauso nuo šeimininko aplankų struktūros; tinka DB duomenims.
2. Bind mount: konkretus šeimininko aplankas, prijungtas į konteinerį; tinka kodui ar konfigūracijai, bet priklauso nuo kelio ir teisių.

## /health

`{"db":"up","status":"ok"}` (programa pasiekia DB per vardą `db`, ne `localhost`).
