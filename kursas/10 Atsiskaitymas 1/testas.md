# 10 Testas

Laikas: 35 min. 30 klausimų, vienas teisingas atsakymas kiekvienam. Be interneto ir DI.

1. Kokia pagrindinė DevOps idėja?
   - A. Kad kūrėjai rašo kodą, o administratoriai jį paleidžia atskirai
   - B. Kad kūrėjai ir administratoriai dirba kartu ir automatizuoja kelią iki vartotojo
   - C. Kad naudojamas tik vienas įrankis visam darbui
   - D. Kad programos išleidžiamos kartą per metus

2. Kuri kodo kelio eilė teisinga?
   - A. testai → kodas → diegimas → stebėsena
   - B. kodas → diegimas → testai → versijų kontrolė
   - C. paketavimas → kodas → testai → stebėsena
   - D. kodas → versijų kontrolė → testai → paketavimas → diegimas → stebėsena

3. Kam reikalingas maršrutas `/health`?
   - A. Kad įrankiai galėtų patikrinti, ar programa gyva
   - B. Kad parodytų visus duomenų bazės įrašus
   - C. Kad paleistų programą iš naujo
   - D. Kad išsaugotų slaptažodžius

4. Kas yra Git commit'as?
   - A. Šaka, kurią galima ištrinti
   - B. Nuotolinė repozitorija GitHub'e
   - C. Išsaugotas pakeitimų taškas istorijoje
   - D. Failų archyvas

5. Ką daro `git switch -c papildymas`?
   - A. Ištrina šaką `papildymas`
   - B. Sukuria šaką `papildymas` ir persijungia į ją
   - C. Sujungia `papildymas` į `main`
   - D. Parodo šakų sąrašą

6. Ką rodo `git status` po `git add`, bet prieš `git commit`?
   - A. Failas paruoštas commit'ui
   - B. Failas ištrintas
   - C. Failas jau yra GitHub'e
   - D. Failas ignoruojamas

7. Kada naudojate `git restore failas`?
   - A. Norite ištrinti repozitoriją
   - B. Norite nusiųsti į GitHub
   - C. Norite sukurti šaką
   - D. Norite grąžinti neišsaugotą pakeitimą į paskutinį commit

8. Kam reikalingas Pull Request?
   - A. Ištrinti `main`
   - B. Įdiegti Python
   - C. Aptarti ir sulieti šakos pakeitimą į `main`
   - D. Sustabdyti procesą

9. Kaip pirmą kartą nusiųsti naują šaką į GitHub?
   - A. `git init`
   - B. `git push -u origin ŠAKA`
   - C. `git merge`
   - D. Ištrinti `.git`

10. Ką daro `git pull`, kai esate `main`?
    - A. Atsisiunčia ir sujungia GitHub pakeitimus
    - B. Ištrina šakas
    - C. Sukuria `.env`
    - D. Paleidžia Docker

11. Ką reiškia `chmod 600 failas`?
    - A. Visi gali skaityti ir vykdyti
    - B. Tik grupė gali rašyti
    - C. Failas tampa vykdomas
    - D. Tik savininkas gali skaityti ir rašyti

12. `./skriptas.sh` rodo „Permission denied“. Kas greičiausiai negerai?
    - A. Neįdiegtas Python
    - B. Per mažai vietos diske
    - C. Failas neturi vykdymo teisės (`chmod +x`)
    - D. Skriptas neturi pavadinimo

13. Kuo `kill` skiriasi nuo `kill -9`?
    - A. `kill` prašo procesą baigti švelniai, `kill -9` jį sustabdo priverstinai
    - B. `kill -9` tik pristabdo procesą
    - C. `kill` visada ištrina failą
    - D. Skirtumo nėra

14. Kuo skiriasi paketo diegimas Mac ir Ubuntu?
    - A. Mac naudoja `apt`, Ubuntu `brew`
    - B. Mac naudoja `brew install` be `sudo`, Ubuntu `sudo apt install`
    - C. Abiejose reikia `sudo brew`
    - D. Paketų diegti negalima

15. Ką reiškia `$1` Bash skripte?
    - A. Skripto pavadinimą
    - B. Išėjimo kodą
    - C. Pirmą argumentą
    - D. Kintamųjų skaičių

16. Ką reiškia `exit 1` skripto gale?
    - A. Skriptas pavyko ir niekas nereikalinga
    - B. Skriptas sustabdė kompiuterį
    - C. Skriptas paleistas pirmą kartą
    - D. Skriptas baigėsi klaida; kitos komandos tai mato per `$?`

17. Ką daro `set -euo pipefail` skripto pradžioje?
    - A. Paslepia visus pranešimus
    - B. Sustabdo skriptą pirmoje klaidoje ar nenustatytame kintamajame
    - C. Paleidžia skriptą kaip administratorių
    - D. Išspausdina visą skriptą

18. Kam naudojama `command -v git`?
    - A. Patikrinti, ar komanda `git` yra
    - B. Įdiegti `git`
    - C. Ištrinti `git`
    - D. Rodyti Git istoriją

19. Ką tikrina `[ -d "$1" ]`?
    - A. Ar `$1` yra tuščias
    - B. Ar `$1` yra skaičius
    - C. Ar `$1` yra katalogas
    - D. Ar `$1` yra vykdomas failas

20. Ką daro `for f in docs/*.md; do echo "$f"; done`?
    - A. Ištrina `.md` failus
    - B. Sukuria `docs` aplanką
    - C. Skaičiuoja eilutes
    - D. Išveda kiekvieno `.md` failo kelią

21. Ką reiškia HTTP kodas 404?
    - A. Serverio klaida
    - B. Resursas nerastas
    - C. Užklausa pavyko
    - D. Nukreipimas

22. Ką daro `curl -s -o /dev/null -w "%{http_code}" URL`?
    - A. Atsisiunčia visą puslapį
    - B. Ištrina failą
    - C. Išveda tik HTTP kodą
    - D. Paleidžia serverį

23. Ką rodo `lsof -nP -i :5001`?
    - A. Procesą, kuris naudoja portą 5001
    - B. Visus failus aplanke
    - C. Interneto greitį
    - D. DNS įrašus

24. Ką reiškia `localhost`?
    - A. Kitą serverį jūsų tinkle
    - B. GitHub serverį
    - C. Viešą adresą internete
    - D. Tą patį kompiuterį (127.0.0.1)

25. Kam skirtas DNS?
    - A. Šifruoti ryšį
    - B. Paversti vardą IP adresu
    - C. Saugoti slaptažodžius
    - D. Paleisti programas

26. Ką mato naujas terminalo langas po `export PROJEKTO_VARDAS=visas` senajame?
    - A. Tą pačią reikšmę
    - B. Tuščią kintamąjį: `export` galioja tik tam langui
    - C. Reikšmę, įrašytą į Git
    - D. Sustabdytus procesus

27. Ką reiškia `curl` išvestas kodas `000`?
    - A. Serveris atsakė 200
    - B. Puslapis nerastas
    - C. Reikia slaptažodžio
    - D. Niekas neklauso to adreso

28. Kur WSL klonuoti projektą?
    - A. Į `/mnt/c`
    - B. Į Desktop
    - C. Į `~/devops`
    - D. Į `/tmp`

29. Ką daro `.gitignore` eilutė `*.log`?
    - A. Git nemato naujų `.log` failų
    - B. Ištrina visus logus iš disko
    - C. Paleidžia testus
    - D. Sukuria šaką

30. Kodėl `.env` nekeliamas į Git?
    - A. Nes jis per didelis
    - B. Nes Git nepalaiko tekstinių failų
    - C. Nes jame gali būti slaptažodžių; į Git keliamas tik `.env.example`
    - D. Nes jis vykdomas
