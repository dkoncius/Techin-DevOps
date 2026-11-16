# 5 užduotis: Visa grandinė savarankiškai

**1.** **Tikslas:** be žingsnių sudėlioti visą grandinę: projektas iš šablono, paleidimas, nustatymai, skriptas ir Pull Request. Komandų sąrašo čia nėra, naudokite tai, ką padarėte 1–4 užduotyse.

**2.** Reikalavimai:

- Naujas projektas iš to paties šablono, kitu pavadinimu: `serveris-2`, klonas į `~/devops`
- Šaka `grandine`
- `.env` su kitomis reikšmėmis nei 3 užduotyje: `APP_COLOR=blue`, `APP_VERSION=2.0`; `.env` neturi patekti į Git
- Skriptas `paleisti.sh`, parašytas pačių, nekopijuojant iš 4 užduoties: paleidžia serverį fone, laukia iki 20 s `/health` 200, parašo `OK` arba klaidą, grąžina kodą 0 arba 1 ir pabaigoje sustabdo serverį
- Skriptas veikia su `PORT=5005` ir iš kito aplanko (`cd /tmp && ~/devops/serveris-2/paleisti.sh`)
- `README.md` turi skyrių „Paleidimas“ su viena komanda
- Pull Request pavadinimu „Visa grandinė“, sulietas į `main`

**3.** Patikros sąrašas (patys pažymite, ar pavyko):

- `curl -s localhost:5001/status` rodo `blue` ir `2.0`, kai serveris paleistas ranka
- `./paleisti.sh; echo "kodas: $?"` rodo `OK: /health atsakė 200` ir `kodas: 0`
- `PORT=5005 ./paleisti.sh; echo "kodas: $?"` rodo `OK` ir `kodas: 0`
- `lsof -nP -i :5001` po skripto nieko neišveda
- `git status` nerodo `.env`
- Pull Request yra sulietas, `main` turi `paleisti.sh`

**4.** **Pateikimas:** `./paleisti.sh; echo "kodas: $?"` nuotrauka ir sulieto Pull Request nuoroda.

Jei užstringate, galite žiūrėti `paleidimas komandos.md` ir savo 1–4 užduotis.
