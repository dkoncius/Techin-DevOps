=== titulinė | Kas yra DevOps
01 pamoka · 1 etapas
- Paaiškinti, kuo DevOps skiriasi nuo „kūrėjai rašo, administratoriai paleidžia“
- Pakartoti Git kelią: repozitorija, commit, GitHub
- Išmokti naują dalį: šaka ir sujungimas (`merge`)
Pastaba: ~5 min prisistatymas, ~10 min apklausa. Windows studentai per kitą skaidrę paleidžia `wsl --install`, Mac `xcode-select --install`.

=== pagalvokime
Telefone atsiranda programos atnaujinimas. Kūrėjas jį parašė prieš kelias valandas.
# Kaip kodas nukeliauja iki vartotojo?
> Kaip restorane: virtuvė gamina, salė aptarnauja, o gerą vakarą užtikrina abi kartu.
Pastaba: ~3 min. Leiskite spėlioti: kas testuoja, kas paleidžia, kas pastebi klaidą.

=== tekstas | DevOps = Dev + Ops
:: | Dev (Development) | Kūrėjai: rašo kodą, kuria naujas funkcijas. Nori keisti greitai
:: | Ops (Operations) | Administratoriai: paleidžia ir prižiūri serverius. Nori, kad viskas veiktų stabiliai
- **DevOps** = abi pusės dirba kaip viena komanda
Pastaba: ~3 min. Paklauskite, ką kiekviena pusė nori ir kodėl tie norai prieštarauja: Dev nori kuo daugiau pakeitimų, Ops nori kuo mažiau netikėtumų, nes kiekvienas pakeitimas gali sugadinti veikiančią sistemą.

=== schema | Taip buvo anksčiau: siena tarp Dev ir Ops
```excalidraw
file: dev-ops-siena
box dev | Dev\nparašė kodą | 0,0 | blue
box siena | SIENA\n„perduodam“ | 1,0 | gray
box ops | Ops\npaleidžia | 2,0 | orange
box klaida | Klaida\n„pas mane veikė“ | 2,1 | pink
arrow dev -> siena | kodas
arrow siena -> ops | rankiniu
arrow ops -> klaida
arrow klaida -> dev | kaltinimai
```
Pastaba: ~3 min. Pasakykite situaciją: kūrėjas perduoda kodą, kuris jo kompiuteryje veikė; serveryje neveikia; Dev sako „pas mane veikia“, Ops sako „jūsų kodas blogas“. Niekas nežino, kas kaltas, o vartotojai laukia.

=== tekstas | Kodėl atsirado DevOps
:: | Retas leidimas | Dideli pakeitimai kartą per kelis mėnesius: sunku surasti, kas sugedo
:: | Rankinis darbas | Kiekvienas diegimas kitoks, klaidos kartojasi
:: | Skirtingi tikslai | Dev nori greičio, Ops nori stabilumo: abi pusės traukia į skirtingas puses
:: | Pas mane veikia | Skiriasi aplinkos, niekas nebūna atsakingas
- Sprendimas: bendra atsakomybė ir **automatizavimas**, tas pats kelias kiekvieną kartą
- Tikslas: dažni maži pakeitimai, o ne retas didelis
Pastaba: ~5 min. Pabrėžkite, kad DevOps nėra įrankis ar pareigos, o darbo būdas ir kultūra. Įrankius (Docker, Actions, Kubernetes) matysime per kursą, o jie reikalingi tam, kad tas pats kelias kiekvieną kartą būtų vienodas.

=== schema | Kodo kelias nuo kūrėjo iki vartotojo
```excalidraw
file: kodo-kelias
box kodas | Kodas | 0,0 | blue
box git | Versijų kontrolė (Git) | 1,0 | purple
box testai | Testai | 2,0 | green
box paketas | Paketavimas | 3,0 | yellow
box diegimas | Diegimas į serverį | 3,1 | orange
box vartotojas | Vartotojas | 2,1 | teal
box stebesena | Stebėsena | 1,1 | gray
arrow kodas -> git
arrow git -> testai
arrow testai -> paketas
arrow paketas -> diegimas
arrow diegimas -> vartotojas
arrow vartotojas -> stebesena
arrow stebesena -> kodas | grįžtamasis ryšys
```
Pastaba: ~5 min. Kitas pavyzdys nei mokinių: mobilios programos atnaujinimas. Kurso pabaigoje visa grandinė veiks automatiškai.

=== tekstas | Ką daro DevOps inžinierius
:: | Automatizuoja | Testai, paketavimas ir diegimas vyksta be rankinio darbo
:: | Stebi | Mato, ar programa gyva ir greita
:: | Taiso | Randa, kas sugedo, ir kaip to išvengti
:: | Bendradarbiauja | Šaltinio kodas, peržiūros ir aiškūs procesai
Pastaba: ~5 min. Parodykite roadmap.sh/devops ir pažymėkite, kurią dalį apims kursas.

=== schema | Kur eisime per metus
```excalidraw
file: kurso-zemelapis
box linux | Linux ir Git | 0,0 | blue
box docker | Docker | 1,0 | purple
box actions | GitHub Actions | 2,0 | green
box k8s | Kubernetes | 3,0 | yellow
box azure | Azure | 3,1 | orange
box iac | Terraform / Bicep\ninfrastruktūra kaip kodas | 2,1 | pink | 1.1,1
arrow linux -> docker
arrow docker -> actions
arrow actions -> k8s
arrow k8s -> azure
arrow iac -> azure
note Vienas projektas visą kursą | 0.3,1.3
```
Pastaba: ~3 min. Kurso projektas: Flask + MySQL; 02 pamokoje susikursite savo kopiją. Atsiskaitymai: 2026-11-30 ir 2026-12-17.

=== tekstas | DI taisyklės
:: | Galima | Paaiškinti klaidą, pasiūlyti komandą
:: | Būtina | Paleisti, perskaityti rezultatą, patikrinti dokumentacijoje
:: | Niekada | Į DI ar į Git nekelti slaptažodžių, raktų, tokenų, `.env`
Pastaba: ~3 min. Primename, kad atsiskaityme DI nenaudojama.

=== tekstas | Git: keturi žodžiai
:: | Repozitorija | Aplankas, kurio istoriją saugo Git
:: | Commit | Išsaugotas pakeitimų taškas
:: | Šaka (branch) | Atskira darbo linija, `main` lieka nepaliesta
:: | GitHub | Nuotolinė repozitorijos kopija, kurią mato kiti
Pastaba: ~2 min. Tik prisiminti: Git jau mokėjote. Repozitorijos Public: jokių slaptažodžių, raktų, `.env`.

=== demonstracija | Nuo aplanko iki GitHub
```bash
mkdir -p ~/devops/demo-a && cd ~/devops/demo-a
echo "a" > a.txt && echo "b" > b.txt
git init
git add .
git commit -m "Du failai"
```
```bash+
gh repo create demo-a --public --source . --push
```
Pastaba: ~8 min. Kitas pavyzdys nei užduotyje (`a.txt`, `b.txt`). Priminkite: Public repozitorija, jokių slaptų duomenų.

=== tekstas | Naujiena: šaka ir sujungimas
@iliustracija: šaka
- `git switch -c bugFix` sukuria šaką ir persijungia
- `main` lieka nepaliestas, kol nesujungsite
- `git merge bugFix` sujungia šaką į `main`
- `git branch -d bugFix` ištrina sujungtą šaką
> Kaip juodraštis: rašote atskirai, o į galutinį tekstą įkeliate, kai patenkinti.
Pastaba: ~20 min su demonstracija: `bugFix`, pakeitimas `main`, `merge`, `git log --oneline --graph --all`.

=== klaida | Dažnos klaidos
:: | Šaka `master` | Neįrašytas `init.defaultBranch`: `git branch -m main`
:: | Commit be `add` | „nothing added to commit“: pirma `git add`
:: | Push atmestas (`GH007`) | `user.email` pakeiskite į GitHub „noreply“ ir padarykite naują commit
:: | `gh` neprisijungęs | `gh auth login`, HTTPS
Pastaba: ~3 min.

=== uzduotys | Užduotys
@uzduotys: auto
Pastaba: Skelbkite po vieną Teams'e: 1 ir 2 užduotis po demonstracijos, 3 užduotį po `/health` skaitymo.

=== kita | Kita pamoka
Linux terminalas: navigacija, failai, teisės
Pastaba: Primename: pradėsime nuo savo `devops-projektas` susikūrimo iš šablono.
