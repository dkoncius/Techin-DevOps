# 09 Testas

Laikas: 35 min. 30 klausimų, vienas teisingas atsakymas kiekvienam. Be interneto ir DI.

1. Kokia pagrindinė DevOps idėja?
   - A. Kad kūrėjai rašo kodą, o administratoriai jį paleidžia atskirai
   - B. Kad kūrėjai ir administratoriai dirba kartu ir automatizuoja kelią iki vartotojo
   - C. Kad naudojamas tik vienas įrankis visam darbui
   - D. Kad programos išleidžiamos kartą per metus

2. Kam reikalingas maršrutas `/health`?
   - A. Kad įrankiai galėtų patikrinti, ar programa gyva
   - B. Kad parodytų visus duomenų bazės įrašus
   - C. Kad paleistų programą iš naujo
   - D. Kad išsaugotų slaptažodžius

3. Ką daro `git switch -c papildymas`?
   - A. Ištrina šaką `papildymas`
   - B. Sukuria šaką `papildymas` ir persijungia į ją
   - C. Sujungia `papildymas` į `main`
   - D. Parodo šakų sąrašą

4. Ką rodo `git status` po `git add`, bet prieš `git commit`?
   - A. Failas paruoštas commit'ui
   - B. Failas ištrintas
   - C. Failas jau yra GitHub'e
   - D. Failas ignoruojamas

5. Kaip pirmą kartą nusiųsti naują šaką į GitHub?
   - A. `git init`
   - B. `git merge`
   - C. Ištrinti `.git`
   - D. `git push -u origin ŠAKA`

6. Kam reikalingas Pull Request?
   - A. Ištrinti `main`
   - B. Įdiegti Python
   - C. Aptarti ir sulieti šakos pakeitimą į `main`
   - D. Sustabdyti procesą

7. Ką daro `git pull`, kai esate `main`?
   - A. Atsisiunčia ir sujungia GitHub pakeitimus
   - B. Ištrina šakas
   - C. Sukuria `.env`
   - D. Paleidžia Docker

8. `./skriptas.sh` rodo „Permission denied“. Kas greičiausiai negerai?
   - A. Neįdiegtas Python
   - B. Per mažai vietos diske
   - C. Failas neturi vykdymo teisės (`chmod +x`)
   - D. Skriptas neturi pavadinimo

9. Kuo `kill` skiriasi nuo `kill -9`?
   - A. `kill` prašo procesą baigti švelniai, `kill -9` jį sustabdo priverstinai
   - B. `kill -9` tik pristabdo procesą
   - C. `kill` visada ištrina failą
   - D. Skirtumo nėra

10. Ką mato naujas terminalo langas po `export PROJEKTO_VARDAS=visas` senajame?
    - A. Tą pačią reikšmę
    - B. Tuščią kintamąjį: `export` galioja tik tam langui
    - C. Reikšmę, įrašytą į Git
    - D. Sustabdytus procesus

11. Ką reiškia `$1` Bash skripte?
    - A. Skripto pavadinimą
    - B. Išėjimo kodą
    - C. Pirmą argumentą
    - D. Kintamųjų skaičių

12. Ką reiškia `exit 1` skripto gale?
    - A. Skriptas pavyko ir niekas nereikalinga
    - B. Skriptas sustabdė kompiuterį
    - C. Skriptas paleistas pirmą kartą
    - D. Skriptas baigėsi klaida; kitos komandos tai mato per `$?`

13. Ką daro `set -euo pipefail` skripto pradžioje?
    - A. Paslepia visus pranešimus
    - B. Sustabdo skriptą pirmoje klaidoje ar nenustatytame kintamajame
    - C. Paleidžia skriptą kaip administratorių
    - D. Išspausdina visą skriptą

14. Ką daro `.gitignore` eilutė `*.log`?
    - A. Git nemato naujų `.log` failų
    - B. Ištrina visus logus iš disko
    - C. Paleidžia testus
    - D. Sukuria šaką

15. Kada naudojate `git restore failas`?
    - A. Norite ištrinti repozitoriją
    - B. Norite nusiųsti į GitHub
    - C. Norite sukurti šaką
    - D. Norite grąžinti neišsaugotą pakeitimą į paskutinį commit

16. Kas patenka į kintamąjį po `OUT=$(bash skriptas.sh)`?
    - A. Visa išvestis ir klaidų pranešimai
    - B. Tik išėjimo kodas
    - C. Tik įprasta išvestis; klaidų kanalas lieka ekrane
    - D. Skripto tekstas

17. Skripte parašyta: `OUT=$(bash skriptas.sh)`, tada `echo "paleista"`, tada `KODAS=$?`. Ką rodys `KODAS`?
    - A. `skriptas.sh` išėjimo kodą
    - B. Visada 1
    - C. Tuščią reikšmę
    - D. `echo` išėjimo kodą (0)

18. Kodėl teste, kuris tikrina kitą skriptą, nerašome `set -e`?
    - A. Nes testas veiktų lėčiau
    - B. Nes testas sustotų ties pirma patikra, kurioje skriptas grąžina ne 0, ir neparodytų kitų rezultatų
    - C. Nes `set -e` neveikia su `if`
    - D. Nes tada testas nieko nerašytų į ekraną

19. Testas žalias ir su teisingu, ir su sugadintu skriptu. Ką tai reiškia?
    - A. Testas geras
    - B. Skriptas geras
    - C. Testas nieko netikrina: jam trūksta patikrų
    - D. Testą reikia paleisti du kartus

20. `git status --porcelain` nieko neišveda. Ką tai reiškia?
    - A. Darbinis medis švarus: nėra neįrašytų pakeitimų
    - B. Repozitorija tuščia
    - C. Nėra šakų
    - D. Nėra nuotolinės repozitorijos

21. `.env` jau buvo įkeltas į Git. Įrašėte `.env` į `.gitignore`, bet Git vis tiek seka jo pakeitimus. Ką daryti?
    - A. Ištrinti `.gitignore`
    - B. `git rm --cached .env` ir commit'as
    - C. `git restore .env`
    - D. Ištrinti `.git` aplanką

22. `git ls-files --error-unmatch .env` baigiasi kodu 0. Ką tai reiškia?
    - A. `.env` ignoruojamas
    - B. `.env` neegzistuoja
    - C. `.env` tuščias
    - D. Git seka `.env`

23. Ką reiškia HTTP kodas 404?
    - A. Serverio klaida
    - B. Resursas nerastas
    - C. Užklausa pavyko
    - D. Nukreipimas

24. Ką daro `curl -s -o /dev/null -w "%{http_code}" URL`?
    - A. Atsisiunčia visą puslapį
    - B. Ištrina failą
    - C. Išveda tik HTTP kodą
    - D. Paleidžia serverį

25. Ką rodo `lsof -nP -i :5001`?
    - A. Procesą, kuris naudoja portą 5001
    - B. Visus failus aplanke
    - C. Interneto greitį
    - D. DNS įrašus

26. Ką reiškia `localhost`?
    - A. Kitą serverį jūsų tinkle
    - B. GitHub serverį
    - C. Viešą adresą internete
    - D. Tą patį kompiuterį (127.0.0.1)

27. Kam skirtas DNS?
    - A. Šifruoti ryšį
    - B. Saugoti slaptažodžius
    - C. Paversti vardą IP adresu
    - D. Paleisti programas

28. Ką reiškia `curl` išvestas kodas `000`?
    - A. Serveris atsakė 200
    - B. Puslapis nerastas
    - C. Reikia slaptažodžio
    - D. Niekas neklauso to adreso

29. Kodėl `.env` nekeliamas į Git?
    - A. Nes jis per didelis
    - B. Nes Git nepalaiko tekstinių failų
    - C. Nes jame gali būti slaptažodžių; į Git keliamas tik `.env.example`
    - D. Nes jis vykdomas

30. Kuo `export` skiriasi nuo `.env` failo?
    - A. `.env` automatiškai keliamas į Git
    - B. Skirtumo nėra
    - C. `export` įrašo kintamąjį į `.env`
    - D. `export` galioja tik tam terminalo langui, o `.env` yra failas, kurį skriptas įkelia kiekvieną kartą paleidžiamas
