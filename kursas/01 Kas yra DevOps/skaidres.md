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

=== tekstas | Kodėl atsirado DevOps
- Kūrėjai nori keisti greitai
- Administratoriai nori stabilumo
- DevOps jungia juos **automatizavimu**: tas pats kelias kiekvieną kartą
- Ne vienas įrankis, o darbo būdas ir kultūra
Pastaba: ~5 min. Pabrėžkite: tikslas yra dažni maži pakeitimai, o ne retas didelis.

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
