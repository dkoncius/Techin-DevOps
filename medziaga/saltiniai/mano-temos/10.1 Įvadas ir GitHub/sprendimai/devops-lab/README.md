# devops-lab

Mano DevOps laboratorinis projektas.

## scripts/mano-skriptas.sh

Ką daro: patikrina laisvą disko vietą nurodytame kelyje (jei kelio nenurodoma, tikrina `/`) ir išveda iš viso, laisvą ir užimtą vietą.
Kaip paleisti: `bash scripts/mano-skriptas.sh` arba su keliu: `bash scripts/mano-skriptas.sh /tmp`

## Kelias nuo kodo iki serverio

1. Parašau kodą.
2. `git push` į GitHub.
3. Testai.
4. Sukuriamas paketas ar atvaizdas.
5. Įkeliamas į saugyklą.
6. Diegiamas į serverį.
7. Vartotojas atidaro puslapį.

Dažniausiai lūžta:

* **3. Testai**: pakeitimas sugadina senesnę funkciją ir testas parausta.
* **6. Diegimas į serverį**: serveryje kitokia aplinka ar nustatymai nei kompiuteryje, todėl programa neprasideda.
