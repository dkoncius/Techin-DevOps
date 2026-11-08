# Terminalas

## Teisės

`-rwxr-xr-x` reiškia: pirmas simbolis `-` yra paprastas failas; `rwx` savininkas gali skaityti, rašyti ir vykdyti; `r-x` grupė gali skaityti ir vykdyti; `r-x` kiti taip pat. Be `x` skriptas nebūtų paleidžiamas kaip `./scripts/terminalas.sh` (rašytų „Permission denied“).

## Failų sąrašas

Komanda: `find . -name "*.md" -not -path "./.git/*" > docs/failai.txt`

## /items

Kodas atsako į `GET` užklausą adresu `/items` ir grąžina JSON su sąrašu `ITEMS` (pvz. `{"items": [{"id": 1, "name": "pirmas"}]}`), o HTTP kodas bus 200, nes nenurodytas kitas.
