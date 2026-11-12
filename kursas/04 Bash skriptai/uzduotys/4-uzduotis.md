# 4 užduotis: Tikras skriptas, ignoravimas ir Pull Request

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`: 1–3 plečia tą patį skriptą `scripts/patikra.sh`. Atsakymus į „Kodėl“ rašote faile `docs/bash.md`.

**Tikslas:** Perskaityti tikrą Bash skriptą, patikrinti `.gitignore` ir pateikti visą darbą per Pull Request.

**1 dalis: run.sh**

2. Faile `docs/bash.md` pridėkite skyrių „## run.sh“ ir paaiškinkite, ką daro kiekviena `run.sh` eilutė (be pirmos eilutės su `#!`; skriptas yra jūsų projekto šaknyje).
3. **Kodėl:** skyriuje „run.sh“ vienu sakiniu užrašykite, kodėl `.env` neina į Git, o `.env.example` eina.

**2 dalis: `.gitignore`**

4. Nukopijuokite `.env.example` į `.env` ir įsitikinkite, kad `git status` jo nerodo.
5. Viena komanda parodykite, kuri `.gitignore` eilutė ignoruoja `.env`.
6. Pridėkite į `.gitignore` eilutę `*.log`.
7. Sukurkite failą `bandymas.log` ir įsitikinkite, kad Git jo nemato.

**3 dalis: pakeitimų atšaukimas**

8. Sugadinkite `scripts/patikra.sh` (ištrinkite bet kurią eilutę).
9. Atšaukite pakeitimą nenaudodami `git reset --hard`.
10. Pakeiskite `scripts/patikra.sh` dar kartą ir įtraukite į staging.
11. Atšaukite staging ir tada pakeitimą.

**4 dalis: commit'ai ir Pull Request**

12. Pridėkite `.gitignore` ir padarykite commit su žinute „Ignoruojami .log failai“.
13. Pridėkite `docs` aplanką ir padarykite atskirą commit su žinute „Pridėtas bash.md“.
14. Patikrinkite, kad `docs`, `scripts` ir commit'uose nėra `.env` ar slaptažodžių, ir pažiūrėkite istoriją: turi būti penki jūsų commit'ai.
15. Nusiųskite šaką `pamoka-04` į GitHub.
16. GitHub'e atidarykite Pull Request į `main` pavadinimu „Bash skriptai“ su vieno sakinio aprašu.
17. Peržiūrėkite **Files changed**: turi matytis jūsų failai.
18. Sulieskite Pull Request, kompiuteryje persijunkite į `main` ir atnaujinkite jį.
19. Ištrinkite šaką `pamoka-04` kompiuteryje ir GitHub'e.
20. **Papildomai:** parašykite skriptą `scripts/dydis.sh`, kuris priima katalogą ir išveda, kiek jame yra failų ir kiek aplankų.
