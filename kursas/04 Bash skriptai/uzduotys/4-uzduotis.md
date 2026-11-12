# 4 užduotis: Tikras skriptas, ignoravimas ir Pull Request

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`: 1–3 plečia tą patį skriptą `scripts/patikra.sh`.

**Tikslas:** Patikrinti `.gitignore`, išbandyti pakeitimų atšaukimą ir pateikti visą darbą per Pull Request.



**Pirma dalis: `.gitignore`**

1. Nukopijuokite `.env.example` į `.env` ir įsitikinkite, kad `git status` jo nerodo.
2. Viena komanda parodykite, kuri `.gitignore` eilutė ignoruoja `.env`.
3. Pridėkite į `.gitignore` eilutę `*.log`.
4. Sukurkite failą `bandymas.log` ir įsitikinkite, kad Git jo nemato.

**Antra dalis: pakeitimų atšaukimas**

1. Sugadinkite `scripts/patikra.sh` (ištrinkite bet kurią eilutę).
2. Atšaukite pakeitimą nenaudodami `git reset --hard`.
3. Pakeiskite `scripts/patikra.sh` dar kartą ir įtraukite į staging.
4. Atšaukite staging ir tada pakeitimą.

**Trečia dalis: commit'ai ir Pull Request**

1. Pridėkite `.gitignore` ir padarykite commit su žinute „Ignoruojami .log failai“.
2. Patikrinkite, kad `docs`, `scripts` ir commit'uose nėra `.env` ar slaptažodžių, ir pažiūrėkite istoriją: turi būti keturi jūsų commit'ai.
3. Nusiųskite šaką `pamoka-04` į GitHub.
4. GitHub'e atidarykite Pull Request į `main` pavadinimu „Bash skriptai“ su vieno sakinio aprašu.
5. Peržiūrėkite **Files changed**: turi matytis jūsų failai.
6. Sulieskite Pull Request, kompiuteryje persijunkite į `main` ir atnaujinkite jį.
7. Ištrinkite šaką `pamoka-04` kompiuteryje ir GitHub'e.
8. **Papildomai:** parašykite skriptą `scripts/dydis.sh`, kuris priima katalogą ir išveda, kiek jame yra failų ir kiek aplankų.
