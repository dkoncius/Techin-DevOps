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

6. Ką rodo `git diff --staged`?
   - A. Pakeitimus, kurie pridėti į staging, bet dar nesukommit'inti
   - B. Pakeitimus, kurie dar nepridėti
   - C. Visą commit istoriją
   - D. Nuotolinės šakos pakeitimus

7. Kuri komanda atšaukia commit'ą, bet palieka istoriją ir jį mato kiti?
   - A. `git reset --hard`
   - B. `git restore`
   - C. `git stash`
   - D. `git revert`

8. Kada atsiranda merge konfliktas?
   - A. Kai šaka per ilga
   - B. Kai nėra interneto
   - C. Kai dvi šakos pakeitė tą pačią failo vietą skirtingai
   - D. Kai commit'o žinutė per trumpa

9. Ką reikia padaryti išsprendus konfliktą faile?
   - A. Ištrinti `.git` aplanką
   - B. Pašalinti žymeklius, `git add` ir `git commit`
   - C. Paleisti `git init`
   - D. Tik uždaryti redaktorių

10. Kuo `git fetch` skiriasi nuo `git pull`?
    - A. `fetch` tik atsisiunčia pakeitimus, `pull` dar ir sujungia
    - B. `fetch` išsiunčia pakeitimus į GitHub
    - C. `pull` ištrina vietinius failus
    - D. Skirtumo nėra

11. Ką reiškia `chmod 600 raktas`?
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

26. Kaip elgtis su privačiu SSH raktu?
    - A. Siųsti kolegai el. paštu
    - B. Įkelti į GitHub repozitoriją
    - C. Niekada neperduoti ir nekelti į Git
    - D. Įklijuoti į DI pokalbį

27. Kodėl SSH atsisako rakto su teisėmis `644`?
    - A. Teisės per atviros: kiti vartotojai galėtų jį skaityti
    - B. Raktas per ilgas
    - C. Raktas pasenęs
    - D. Reikia perkrauti kompiuterį

28. Ką daryti, jei privatų raktą įkėlėte į viešą repozitoriją?
    - A. Nieko, jei failą ištrynėte
    - B. Pervadinti failą
    - C. Padaryti repozitoriją privačią ir tęsti
    - D. Laikyti raktą nutekėjusiu, pašalinti iš GitHub ir sukurti naują porą

29. Ką daro branch apsauga `main` šakai?
    - A. Pagreitina `git push`
    - B. Neleidžia keisti `main` be Pull Request
    - C. Ištrina senas šakas
    - D. Šifruoja failus

30. Kodėl `.env` nekeliamas į Git?
    - A. Nes jis per didelis
    - B. Nes Git nepalaiko tekstinių failų
    - C. Nes jame gali būti slaptažodžių; į Git keliamas tik `.env.example`
    - D. Nes jis vykdomas
