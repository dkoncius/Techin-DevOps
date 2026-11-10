=== titulinė | Tinklų pagrindai | 🌐
05 pamoka · 1 etapas
- Paaiškinti IP adresą, portą, DNS ir HTTP kodus
- Naudoti `curl` ir perskaityti atsakymą
- Rasti, kuris procesas klauso porto
Pastaba: ~1 min. Praeitos pamokos (04) sprendimą parodykite prieš šią skaidrę (~10 min). Paleiskite projektą `./run.sh` ir palikite veikti.

=== pagalvokime
Programa veikia jūsų kompiuteryje. Rašote adresą ir gaunate atsakymą.
# Kaip naršyklė ją randa?
> 🤷 Kompiuteryje veikia dešimtys programų. Kaip užklausa pataiko būtent į vieną?
Pastaba: ~3 min. Leiskite spėlioti balsu: vardas, adresas, durys. Tai veda į IP, DNS ir portus.

=== schema | Kelias nuo užklausos iki atsakymo
>>+ 💻 curl | 📖 Vardas → IP | 🚪 Portas | ⚙️ Flask | ✅ Atsakymas 200
> 📬 Kaip laiškas: pirma adresas, tada durys, tada gavėjas, o atgal grįžta atsakymas.
Pastaba: ~3 min. Spauskite po žingsnį ir klauskite klasės, kas čia „adresas“, o kas „durys“.

=== demonstracija | Vienas klauso, kitas klausia
```bash
./run.sh
```
```bash+
curl localhost:5001/health
```
```output+
{"status": "ok"}
```
> 🧑‍🏫 Kairėje serveris, dešinėje `curl`: du terminalai, vienas ryšys.
Pastaba: ~5 min. Rodykite lango dalimis. Mac studentams primename: numatytasis portas yra 5001 (5000 užima AirPlay).

=== schema | Bendras vaizdas: kas su kuo kalba
```excalidraw
file: tinklu-zemelapis
box pc | 💻 Jūsų kompiuteris\n(curl, naršyklė) | 0,1 | blue
box dns | 📖 DNS\nvardas → IP | 1,0 | purple
box srv | 🖥️ Serveris\n(IP adresas) | 2,1 | green
box flask | 🚪 :5001 Flask | 3,0 | teal
box ssh | 🚪 :22 SSH | 3,1 | gray
box db | 🚪 :3306 MySQL | 3,2 | orange
arrow pc -> dns | 1. koks IP?
arrow pc -> srv | 2. užklausa
arrow srv -> flask
arrow srv -> ssh
arrow srv -> db
```
Pastaba: ~4 min. Bendras vaizdas prieš detales: pirma randame adresą (DNS), tada pasiekiame serverį, o portas parenka paslaugą. Šią schemą galima atsidaryti ir redaguoti Excalidraw: `diagramos/tinklu-zemelapis.excalidraw`.

=== tekstas | IP adresas = pastatas, portas = durys
@iliustracija: pastatas
- **IP adresas** nurodo kompiuterį tinkle
- **Portas** nurodo, kuri paslauga jame laukia
- Mūsų projektas: durys **5001**
- Įprasti: 22 SSH, 80 HTTP, 443 HTTPS, 3306 MySQL
> 🏨 Kaip viešbutyje: adresas rodo pastatą, numeris rodo kambarį.
Pastaba: ~4 min. Paklauskite, ar pastate gali dvi paslaugos naudoti tą pačią duris (ne).

=== tekstas | DNS = telefonų knyga
@iliustracija: knyga
- Žmonės mena **vardus**, kompiuteriai naudoja **skaičius**
- DNS paverčia vardą IP adresu
- `localhost` visada reiškia šį kompiuterį (127.0.0.1)
- Failas `/etc/hosts` yra jūsų pačių mažas sąrašas
> 📖 Nereikia mintinai žinoti draugo numerio: užtenka vardo.
Pastaba: ~3 min. Primename, kad `/etc/hosts` jie jau naudojo su Apache.

=== demonstracija | Užpildykime kartu
| Sąvoka | Ką reiškia | Pavyzdys |
|---|---|---|
| IP adresas | ?Kompiuterio adresas tinkle | `127.0.0.1` |
| Portas | ?Durys paslaugai tame kompiuteryje | 22, 80, 443, 3306 |
| DNS | ?Vardą paverčia IP adresu | `localhost` → IP |
Pastaba: ~6 min. Ląstelės rodo „?“: pirma pildykite balsu kartu, tada paspauskite ir patikrinkite atsakymą. Kiekvienas paspaudimas atskleidžia vieną eilutę.

=== komanda | Kas klauso porto?
@iliustracija: serveris
```bash
lsof -nP -i :5001
```
```output+
COMMAND  PID  USER   NAME
python   4242 jus    *:5001 (LISTEN)
```
+ PID yra antras stulpelis: jį naudosite `kill`
Pastaba: ~5 min. Išvestis pavyzdinė. Kitas pavyzdys nei užduotyje: `python3 -m http.server 8080` ir `lsof -nP -i :8080`. Ubuntu be `lsof`: `sudo apt install lsof`.

=== tekstas | HTTP = užklausa ir atsakymas
@iliustracija: laiškas
- **Užklausa:** metodas (`GET`, `POST`), kelias
- **Atsakymas:** kodas ir turinys
- `curl -i` parodo ir kodą, ir antraštes
- `/health` atsako 200: taip kiti įrankiai žino, kad programa gyva
Pastaba: ~5 min. Parodykite `curl -i localhost:5001/health` ir raskite eilutę su kodu.

=== tekstas | HTTP kodai: keturios šeimos
:: ✅ | 2xx | Pavyko
:: ↪️ | 3xx | Nukreipimas kitur
:: 🙅 | 4xx | Klaida jūsų pusėje (pvz. 404)
:: 💥 | 5xx | Klaida serverio pusėje (pvz. 500)
Pastaba: ~3 min. Paprašykite pateikti po vieną pavyzdį iš kasdienybės (puslapis nerastas, svetainė „nukrito“).

=== jusu-eile | Kas čia nutiko?
| Kodas | Kas nutiko? |
|---|---|
| 200 | ?Pavyko |
| 404 | ?Resurso nėra (jūsų klaida) |
| 500 | ?Serverio klaida |
| 000 | ?Niekas neklauso porto |
Pastaba: ~4 min. Kiekvienai eilutei pirma paklauskite klasės, tada paspauskite. Pabaigoje: `curl -s -o /dev/null -w "%{http_code}\n" localhost:5001/nera`.

=== klaida | Dažnos klaidos
:: 🔁 | Portas užimtas | Antras `./run.sh` tame pačiame porte. Naudokite `PORT=5002`
:: 📮 | `POST` be antraštės | Trūksta `Content-Type: application/json`
:: ⏸️ | `Ctrl+Z` | Serveris lieka fone. Naudokite `Ctrl+C` arba `kill`
:: 🕳️ | Kodas `000` | Niekas neklauso porto: serveris išjungtas
Pastaba: ~3 min. Tai dažniausios klaidos iš pamokos sprendimo skyriaus.

=== uzduotys | Užduotys
@uzduotys: auto
Pastaba: Dabar paskelbkite pirmą užduotį Teams'e. Kiekvieną skelbkite po vieną: pirma demonstracija gyvai su kitu pavyzdžiu, tada mokiniai daro savo. Skaidrės su žingsniais skirtos rodyti, kol jie dirba.

=== kita | Kita pamoka | 🔑
SSH ir raktai: darbas nuotoliniame serveryje
Pastaba: Dabar studentams skelbiate pirmą užduotį Teams'e (pirma demonstracija gyvai su kitu pavyzdžiu).
