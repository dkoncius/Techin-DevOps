# 10 Praktika

Laikas: ~2 val.

Tikslas: savo `devops-projektas` repozitorijoje parodyti, ką išmokote 01–09 pamokose: Git per Pull Request, Bash, tinklai ir projekto paleidimas.

Darbai:

1. Atnaujinkite `main` ir sukurkite šaką `atsiskaitymas-1`.
2. Sukurkite `scripts/tikrinti-porta.sh`: priima vieną argumentą (TCP portą), išveda „Portas N laisvas“ arba „Portas N užimtas“. Kodai: 0 laisvas, 1 užimtas, 2 jei argumento nėra, jis ne skaičius arba ne 1–65535 (žinutė klaidų kanale).
3. Patikrinkite `paleisti.sh` projekto šaknyje (daryta 09 pamokoje): turi tikrinti Python versiją, naudoti `PORT` (numatytasis 5001), laukti `/health` 200, **po sėkmės papildomai išvesti `/status` atsakymą**, visada sustabdyti paleistą projektą ir grąžinti 0 (sėkmė) arba 1 (nesėkmė). Pridėkite trūkstamą dalį.
4. Per `.env` nustatykite `APP_VERSION=atsiskaitymas-1` ir `APP_COLOR` kitą nei numatytoji. Paleiskite projektą ir `/status` atsakymą įrašykite `docs/atsiskaitymas.md`.
5. Sukurkite merge konfliktą: tą pačią eilutę `docs/atsiskaitymas.md` skyriuje „Konfliktas“ pakeiskite dviejose šakose skirtingai ir sujunkite. Išspręskite konfliktą (galutinis tekstas apima abi mintis, be žymeklių).
6. Faile `docs/atsiskaitymas.md` trumpai (po 1–2 sakinius) atsakykite: a) kuo skiriasi HTTP kodai 404 ir 500; b) kodėl `set -e` skriptuose ir ką jis daro; c) kodėl privatus SSH raktas nekeliamas į Git ir ką daryti, jei jis ten pateko.
7. Atidarykite Pull Request iš `atsiskaitymas-1` į `main` su aiškia antrašte ir aprašu (ką pakeitėte, kaip patikrinti) ir sulieskite. Kompiuteryje atnaujinkite `main`.
8. Patikrinkite, kad repozitorijoje nėra `.env` turinio, slaptažodžių ar privačių raktų.

**Pateikimas:** nuoroda į savo `devops-projektas` repozitoriją ir į sulietą PR.

Reikalavimai repozitorijai: sukurta iš šablono, `origin` į GitHub, README su skyriumi „Paleidimas“, `.gitignore` ignoruoja `.env`, ir iš viso bent 3 sulieti PR (įskaitant ankstesnių pamokų).
