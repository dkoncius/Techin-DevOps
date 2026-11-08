# Kas yra DevOps

DevOps yra būdas, kaip kūrėjai ir sistemų administratoriai dirba kartu, kad programa greitai ir saugiai pasiektų vartotoją. Pagrindinė idėja: kuo daugiau žingsnių automatizuoti ir kuo dažniau išleisti mažus pakeitimus. Tai ne vienas įrankis, o darbo kultūra ir procesas.

## Nuo kodo iki vartotojo

1. Kūrėjas parašo kodą savo kompiuteryje.
2. Kodas išsaugomas Git šakoje ir nusiunčiamas į GitHub.
3. Atidaromas Pull Request, kitas žmogus peržiūri pakeitimus.
4. Automatiniai testai patikrina, ar nieko nesulaužyta.
5. Programa supakuojama ir įdiegiama į serverį.
6. Vartotojas ją naudoja, o stebėsena rodo, ar viskas gerai.

Kur gali lūžti:

1. Testai: jei jų nėra, klaida pasiekia vartotoją.
2. Diegimas: ranka diegiant, galima pamiršti žingsnį ir serveris veiks kitaip nei kompiuteryje.

## /health

Maršrutas `/health` grąžina JSON `{"status": "ok"}` ir HTTP kodą 200. Jis skirtas patikrinti, ar programa gyva: pvz. monitoringas ar Kubernetes gali kreiptis į jį ir žinoti, ar programą reikia perkrauti.
