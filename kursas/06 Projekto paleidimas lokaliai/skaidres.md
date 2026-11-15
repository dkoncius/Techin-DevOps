=== titulinė | Projekto paleidimas
06 pamoka · 1 etapas
- Savo kopija iš šablono
- `./run.sh`, `/health`, testai
- `.env` ir `paleisti.sh`
Pastaba: ~8 min. 02–05 dirbo `git-bandymas`. Šiandien pirmą kartą šablonas. `main` neapsaugotas.

=== pagalvokime
Programa jau yra. Kol jos nepaleidžiate, nematote, ar ji gyva.
# Kas turi nutikti viena komanda?
> `./paleisti.sh` pats susikuria aplinką, palaukia `/health` ir išsijungia.
Pastaba: ~3 min. Tikslas dienos pabaigoje, ne dabar.

=== demonstracija | Šablonas ir klonas
```bash
cd ~/devops
git clone https://github.com/<vartotojas>/demo-projektas.git
cd demo-projektas
git remote -v
git switch -c demo-06
```
+ `git remote -v` rodo jūsų vardą
Pastaba: ~12 min. Pirma naršyklėje **Use this template**, vardas `demo-projektas`, ne `devops-projektas`. Ne Desktop, ne `/mnt/c`. Paskelbkite 1 užduotį.

=== demonstracija | Paleidimas
```bash
./run.sh
curl localhost:5001/health
curl localhost:5001/status
```
+ `/health` grąžina `{"status": "ok"}`
Pastaba: ~10 min. Palikite langą. Kitas langas `curl`. Kompiuterio vardo į užrašus nerašykite. Paskelbkite 2 užduotį po pytest.

=== demonstracija | Testai
```bash
.venv/bin/pytest
```
+ Trys testai, pabaigoje `passed`
Pastaba: ~8 min. Jei `.venv` nėra, pirma `./run.sh`.

=== demonstracija | .env
```bash
cp .env.example .env
```
+ Pakeiskite `APP_COLOR=red` ir `APP_VERSION=9`. Paleiskite iš naujo. `git status` `.env` nerodo
Pastaba: ~10 min. Kitos reikšmės nei užduotyje (`green` ir `1.2`). `.env` nekeliamas, nes jame gali būti slaptažodžių. Paskelbkite 3 užduotį.

=== demonstracija | paleisti.sh
```bash
./paleisti.sh
echo "kodas: $?"
```
+ Išvestis `OK: /health atsakė 200`, kodas 0
Pastaba: ~15 min. Skripto tekstas yra 4 užduotyje. Parodykite ir užimtą portą `5003`. Pull Request pavadinimas „Demo paleidimas“. Paskelbkite 4 užduotį.

=== klaida | Kas stringa
+:: | Klonuotas pats šablonas | Reikia **Use this template**, tada klonuoti savo kopiją
+:: | `Address already in use` | `lsof -nP -i :5001`, sustabdykite seną procesą
+:: | `.env` matosi `git status` | Patikrinkite `.gitignore`
Pastaba: ~5 min.

=== uzduotys | Užduotys
@uzduotys: auto, tik sąrašas

=== kita | 07 Docker pradžia
- Kodėl „pas mane veikia“
- `docker run`, `ps`, `logs`, `exec`, `stop`
Pastaba: Projekto šablonui Docker pradžioje nereikia.
