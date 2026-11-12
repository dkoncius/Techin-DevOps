# 4 užduotis: Kodas ir Pull Request

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte` (`~/devops/devops-projektas`).

**Tikslas:** Pamatyti, kaip tikra programa skaito savo nustatymus iš aplinkos, ir pateikti visą darbą per Pull Request.

**1 dalis: kodo skaitymas**

2. Projekto šaknyje suraskite visas `app.py` eilutes su `os.environ` ir įrašykite jas į `docs/nustatymai.txt`.
3. Patikrinkite, kad Git ignoruoja failą `.env` (pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas: kuri komanda parodo, ar failas ignoruojamas).

**2 dalis: patikra, commit ir siuntimas**

4. Patikrinkite, kad `docs` ir `scripts` nėra slaptažodžių, raktų, tokenų ar `.env` turinio.
5. Pridėkite `docs` ir padarykite commit su žinute „Pridėti nustatymai“.
6. Pažiūrėkite commit istoriją: turi būti penki jūsų commit'ai.
7. Nusiųskite šaką `pamoka-03` į GitHub.

**3 dalis: Pull Request**

8. GitHub'e atidarykite Pull Request iš `pamoka-03` į `main` pavadinimu „Procesai ir paketai“ su vieno sakinio aprašu.
9. Peržiūrėkite **Files changed**: turi matytis jūsų failai.
10. Sulieskite Pull Request.
11. Kompiuteryje persijunkite į `main` ir atnaujinkite jį.
12. Ištrinkite šaką `pamoka-03` kompiuteryje ir GitHub'e.
13. **Papildomai:** paaiškinkite skirtumą tarp `kill` ir `kill -9` ir kada naudotumėte antrą.
