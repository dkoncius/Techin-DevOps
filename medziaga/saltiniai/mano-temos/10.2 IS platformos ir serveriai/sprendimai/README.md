# 10.2 Sprendimai (dėstytojui)

Patikrinta: schemos `.excalidraw` JSON validus (28 elementai, ryšiai tikrinti) ir `.png` peržiūrėtas, sugeneruoti Mac sistemoje iš to paties modelio; Excalidraw naršyklėje neatidaryta, prieš pamoką atidarykite ir patikrinkite.

1. Kas čia: pavyzdinis mokinio `devops-lab/docs/` turinys: `is-schema.excalidraw`, `is-schema.png` (Užd. 1) ir `serveriai.md` (Užd. 2).
2. Kaip rodyti klasėje: demonstracijos planas (~25 min). Demonstracinė įstaiga: kino teatras (jos nėra užduoties sąraše ir ji nesutampa su pavyzdžiu `docs/is-schema.png`, kuris yra mokykla). Po demonstracijos mokiniai daro tą patį su savo įstaiga.
   1. (~2 min) Pasirinkti kino teatrą ir pasakyti kodėl (aiški apkrova: bilietų pardavimas vakarais). Mokiniai tuo metu renkasi savo įstaigą iš sąrašo (mokykla, poliklinika, biblioteka, parduotuvė). Dažna klaida: renkasi per didelę įstaigą ir braižo per daug.
   2. (~3 min) Išvardyti komponentus: bilietų aplikacija, DB, Nginx, monitoringas. Mokiniai užsirašo savo 4 komponentus. Dažna klaida: pamiršta proxy arba monitoringą.
   3. (~6 min) Nubraižyti Excalidraw (arba per DI: Mermaid → Excalidraw) su rodyklėmis. Mokiniai braižo savo schemą. Dažna klaida: rodyklės be krypties arba trūksta rodyklės iki monitoringo; DI sugeneruotoje schemoje trūksta komponento ar rodyklės.
   4. (~3 min) Prie komponentų parašyti serverio tipus ir kodėl (pvz. DB: fizinis dėl disko greičio). Mokiniai tą patį daro savo schemoje. Dažna klaida: tipas parašytas be priežasties.
   5. (~3 min) Pažymėti 4 gyvavimo ciklo etapus ir prie kiekvieno vieną sakinį, ką daro DevOps. Mokiniai tą patį daro savo schemoje. Dažna klaida: etapai išvardyti be DevOps vaidmens.
   6. (~1 min) Užsirašyti silpniausią vietą (pvz. viena DB be kopijos). Mokiniai užsirašo savo. Dažna klaida: parašo bendrai („viskas gali sugesti“), o ne konkrečią vietą.
   7. (~2 min) Eksportuoti `.png` ir trumpai parodyti, kaip įkelti per šaką ir PR (kaip 10.1). Mokiniai tuo metu baigia schemas. Dažna klaida: `.png` nesutampa su `.excalidraw` arba failas įkeltas tiesiai į `main`.
   8. (~5 min) Užd. 2: parodyti, kaip rasti skyrių oficialioje dokumentacijoje (ne atlikti už mokinius). Mokiniai tuo metu pradeda `serveriai.md`. Dažna klaida: kopijuoja DI atsakymą be nuorodos į dokumentacijos skyrių; valdymo sąsaja (iLO, iDRAC, IPMI) nupiešta pasiekiama iš interneto.
3. Sprendimas pagal darbus:

   | Darbas | Kur sprendime |
   |--------|---------------|
   | įstaiga | `docs/is-schema.png`: mokykla, be IP ir domenų |
   | komponentai ir rodyklės | schema: Vartotojas → Nginx → Aplikacija → DB, Monitoringas |
   | serverio tipai | eilutė „Serveris: …“ prie kiekvieno komponento |
   | gyvavimo ciklas | schemos apačia: 4 etapai su DevOps sakiniu |
   | silpniausia vieta | raudona žyma „viena DB be kopijos“ |
   | tipų palyginimas | `docs/serveriai.md`, 1 skyrius |
   | rack, tower, blade | `docs/serveriai.md`, 2 skyrius |
   | iLO, iDRAC, IPMI | `docs/serveriai.md`, 3 skyrius: 3 galimybės |
   | administratorius ir serveris | `docs/serveriai.md`, 4 skyrius |

   PR, DI ir pateikimas: `.excalidraw` ir `.png` sutampa, PR sulietas per šaką (ne `main`), DI aprašyta (ką paklausė ir kaip patikrino), pateikta PR nuoroda.

   Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose (vertinimas.md).
