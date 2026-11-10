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
@nuotrauka: nuotraukos/devops-kilpa.png
Pastaba: ~4 min. Dev: kūrėjai, rašo kodą ir nori keisti greitai. Ops: administratoriai, paleidžia ir prižiūri, nori stabilumo. DevOps = abi pusės dirba kaip viena komanda. Iliustracija: begalybės kilpa (Plan, Code, Build, Test, Release, Deploy, Operate, Monitor), šaltinis Dynatrace. Parodykite, kad Dev ir Ops yra viena kilpa, o stebėsena grįžta į planavimą. Paklauskite, ką kiekviena pusė nori ir kodėl tie norai prieštarauja: Dev nori kuo daugiau pakeitimų, Ops nori kuo mažiau netikėtumų, nes kiekvienas pakeitimas gali sugadinti veikiančią sistemą.

=== kita | Pažiūrėkime: DevOps per 5 minutes
@video: https://youtu.be/Xrgk023l4lI
Pastaba: ~7 min. Simplilearn „DevOps In 5 Minutes“, angliškai (įjunkite subtitrus, jei reikia). Žiūrėkite kartu, paskui 2 klausimai: ką video vadina Dev, o ką Ops pusėmis? Kuo „bendra atsakomybė“ skiriasi nuo senos sienos tarp komandų? Jei nėra interneto, atidarykite https://youtu.be/Xrgk023l4lI. Spustelėjus grotuvą rodyklės klavišai gali nebeperjungti skaidrių: paspauskite už grotuvo ribų.

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
@plokštelės
+:: Kodas | Automatizuoja | Testai, paketavimas ir diegimas vyksta be rankinio darbo
+:: Stebėsena | Stebi | Mato, ar programa gyva ir greita
+:: Gedimai | Taiso | Randa, kas sugedo, ir kaip to išvengti
+:: Komanda | Bendradarbiauja | Šaltinio kodas, peržiūros ir aiškūs procesai
Pastaba: ~5 min. Parodykite roadmap.sh/devops ir pažymėkite, kurią dalį apims kursas.

=== tekstas | DevOps kelias
@kelias
+:: 1 | Nėra vieno kelio | Skirtingos įmonės naudoja skirtingus įrankius, o žmonės į DevOps ateina iš skirtingų vietų
+:: 2 | Dažna klaida | Per daug koncentruotis į konkrečius įrankius ir vieną „teisingą“ kelią
+:: 3 | Kas lieka | Įrankiai keičiasi kas keletą metų, o principai (automatizavimas, bendra atsakomybė, grįžtamasis ryšys) išlieka
Pastaba: ~5 min. Atidarykite roadmap.sh/devops ir parodykite visą diagramą: tai ir yra „DevOps kelias“. Pažymėkite kurso dalis (Linux ir Git, Docker, CI/CD, Kubernetes, Azure) ir pasakykite, kad visko išmokti iš karto nereikia, o diagrama yra žemėlapis, ne sąrašas. Paklauskite: kiek čia įrankių, kurių dar nėra girdėję? Tada paspauskite, kad pamatytų, jog net kelias nėra vienas: kiekvienoje srityje yra keli įrankiai tam pačiam darbui.

=== schema | DevOps specialybė skyla
```excalidraw
file: specialybes-skyla
box web | Webmaster\n~2000 m. | 0,0 | gray
box fe | Frontend | 1.3,-0.5 | blue
box be | Backend | 2.6,-0.5 | green
box ux | UX / UI | 3.9,-0.5 | pink
box devops | DevOps\ntoday | 0,1.5 | orange
box cloud | Debesų\ninžinierius | 1.3,1 | teal
box platform | Platformų\ninžinierius | 2.6,1 | purple
box sre | SRE | 3.9,1 | yellow
box sec | DevSecOps | 1.3,2 | gray
box mlops | MLOps | 2.6,2 | blue
arrow web -> fe
arrow web -> be
arrow web -> ux
arrow devops -> cloud
arrow devops -> platform
arrow devops -> sre
arrow devops -> sec
arrow devops -> mlops
```
DevOps yra labai plati sritis. Kaip prieš 25 metų „webmaster“ darė viską apie svetainę, o vėliau jis suskilo, taip dabar iš DevOps atsiranda atskiros specialybės.
Pastaba: ~4 min. 2000-ųjų webmaster'is vienas darė dizainą, HTML, serverį ir duomenų bazę; vėliau atsirado frontend, backend, UX/UI. Dabar tas pats vyksta su DevOps: debesų inžinierius (Azure, AWS), platformų inžinierius (kuria vidinę platformą kitiems programuotojams), SRE (patikimumas ir incidentai), DevSecOps (saugumas procese), MLOps (DI modelių paleidimas). Yra ir kitų, pvz. release ar build inžinierius, FinOps (debesų kaštai). Šiame kurse gausite bendrą pagrindą, o specializuotis galėsite vėliau.

=== schema | Įrankiai keičiasi, principai ne
@nuotrauka: nuotraukos/devops-irankiai.jpeg | didelė
Pastaba: ~4 min. Įrankiai keičiasi ir programuotojams, ir DevOps, o filosofija ir principai, pagal kuriuos veikia sistemos ir verslai, nesikeičia: kodėl svarbiau už kaip. Iliustracija rodo, kiek įrankių yra tik vienoje kilpoje; šaltinis nenurodytas. Paklauskite, kiek jų pažįsta, ir kad nė vieno iš jų mokytis iš anksto nereikia. Pavyzdys: prieš 10 metų Jenkins, šiandien GitHub Actions, rytoj kažkas kito, bet idėja ta pati: automatiškai patikrinti ir paleisti kodą. Panašiai su programuotojais: karkasai keičiasi, o duomenų, tinklo ir saugumo principai ne. Verslui visada reikia to paties: greito, patikimo ir saugaus pristatymo vartotojui. Kas supranta kodėl, tas per savaitę perpranta naują įrankį; kas išmoko tik komandas, pasimeta pasikeitus įrankiui.

=== pagalvokime
DI jau moka rašyti kodą ir komandas.
# Kam mokytis DevOps, jei DI gali padaryti darbą?
@nuotrauka: nuotraukos/kodel-devops.gif | dešinėje
Pastaba: ~3 min. Diskusija: leiskite studentams atsakyti patiems, paprašykite 2–3 nuomonių prieš rodydami kitą skaidrę. Nekomentuokite, kol neišgirsite skirtingų požiūrių.

=== tekstas | Kam mokytis DevOps?
@plokštelės
+:: 01 | Prieiga | Kas turi teisę paleisti į serverį ir keisti produkciją
+:: 02 | Taisyklės | Kur laikomi slaptažodžiai, kas tvirtina pakeitimus, kokių saugumo reikalavimų laikomasi
+:: 03 | Atsakomybė | Kas atsako, kai sugenda, ir kas supranta, ką DI parašė
+ DI gali parašyti komandą, bet jūs turite suprasti, ką ji daro, ir pasakyti, ar ją saugu paleisti
Pastaba: ~3 min. Formuluotė dar tikslinama. Darbas yra ne tik jį atlikti, bet ir prieiga bei taisyklės. Susiekite su skaidre „DI taisyklės“: naudok, patikrink, pataisyk.

=== tekstas | Neapsaugotas raktas kainuoja tūkstančius
@plokštelės
+:: Japonija | ~60 000 $ per 13 val. | **Kas įvyko:** „Firebase“ ir „Gemini“ programos API raktas liko naršyklės kode be apribojimų; užpuolikas jį pasiėmė ir naudojo „Gemini“. // **Kaina:** ~60 000 $ (~9 mln. jenų). // **DevOps:** raktas apribotas pagal API ir svetainę, užklausos per backend, biudžeto įspėjimas ir limitas.
+:: Projektas po „Gemini“ įjungimo | ~54 000 € per 13 val. | **Kas įvyko:** įjungus „Gemini“ senas „Firebase“ naršyklės raktas be apribojimų gavo prieigą ir prie jo. // **Kaina:** ~54 000 €, „Google“ pagal pranešimus korekcijos neatliko. // **DevOps:** raktų auditas prieš įjungiant naują paslaugą, apribojimai kiekvienam raktui, išlaidų įspėjimai.
+:: Seni „Google“ raktai | ~67 000 $ per kelias valandas | **Kas įvyko:** prieš kelerius metus „Firebase“ automatiškai sukurtas raktas liko viešas ir neapribotas. // **Kaina:** ~67 000 $. // **DevOps:** reguliarus raktų sąrašo peržiūrėjimas, nenaudojamų raktų šalinimas, slaptų duomenų paieška kode.
+:: Startuolis | ~82 000 $ per ~48 val. | **Kas įvyko:** pranešama apie kompromituotą debesies prieigą (antrinis šaltinis, detalių nėra). // **Kaina:** ~82 000 $. // **DevOps:** išlaidų riba ir įspėjimai, minimalios teisės, raktų rotacija, greitas incidento atsakas.
+ Slaptas raktas, apribojimai ir išlaidų riba yra DevOps darbas, o DI to už jus nepadarys
Pastaba: ~3 min. Visi atvejai yra pranešti internete (DEV Community, „Cybernews“, „Google“ kūrėjų forumas), ne patikrinti pirminiais šaltiniais, todėl sakykite „pranešama“. Sumos apytikslės. Bendra priežastis: „Google“ API raktai pagal numatytuosius nustatymus neribojami, o „Firebase“ naršyklės raktai viešai matomi. 40 000 $ tikslaus atvejo nerasta. Klauskite studentų, kaip to išvengti: riboti raktą pagal API ir svetainę, kviesti per backend, biudžeto įspėjimai ir limitai, rotuoti raktus. Susiekite su „DI taisyklės“: DI gali įdėti raktą tiesiai į kodą, jei nepatikrinsite.

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
