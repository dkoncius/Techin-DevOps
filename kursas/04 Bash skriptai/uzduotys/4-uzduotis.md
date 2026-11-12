# 4 užduotis: `run.sh`, `.gitignore` ir Pull Request

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`: 1–3 plečia tą patį skriptą `scripts/patikra.sh`. Atsakymus į „Kodėl“ rašote faile `docs/bash.md`.

1. **Tikslas:** Perskaityti tikrą Bash skriptą, patikrinti `.gitignore` ir pateikti visą darbą per Pull Request.
2. Faile `docs/bash.md` pridėkite skyrių „## run.sh“ ir paaiškinkite, ką daro kiekviena `run.sh` eilutė (be pirmos eilutės su `#!`; skriptas yra jūsų projekto šaknyje).
3. Nukopijuokite `.env.example` į `.env` ir įsitikinkite, kad `git status` jo nerodo; viena komanda parodykite, kuri `.gitignore` eilutė jį ignoruoja.
4. Pridėkite į `.gitignore` eilutę `*.log`, sukurkite failą `bandymas.log` ir įsitikinkite, kad Git jo nemato.
5. Sugadinkite `scripts/patikra.sh` (ištrinkite bet kurią eilutę) ir atšaukite pakeitimą nenaudodami `git reset --hard`.
6. Pakeiskite jį dar kartą, įtraukite į staging ir atšaukite staging.
7. **Kodėl:** skyriuje „run.sh“ vienu sakiniu užrašykite, kodėl `.env` neina į Git, o `.env.example` eina.
8. Padarykite commit'ą su `.gitignore` (žinutė „Ignoruojami .log failai“) ir atskirą commit'ą su `docs` aplanku (žinutė „Pridėtas bash.md“).
9. Patikrinkite, kad `docs`, `scripts` ir commit'uose nėra `.env` ar slaptažodžių.
10. Nusiųskite šaką `pamoka-04` į GitHub ir atidarykite Pull Request į `main` pavadinimu „Bash skriptai“ su vieno sakinio aprašu.
11. Peržiūrėkite **Files changed**: turi matytis visi penki commit'ai ir jūsų failai.
12. Sulieskite Pull Request, kompiuteryje persijunkite į `main` ir atnaujinkite jį.
13. Ištrinkite šaką `pamoka-04` kompiuteryje ir GitHub'e.
14. **Papildomai:** parašykite skriptą `scripts/dydis.sh`, kuris priima katalogą ir išveda, kiek jame yra failų ir kiek aplankų.
