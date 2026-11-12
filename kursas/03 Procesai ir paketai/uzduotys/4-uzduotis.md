# 4 užduotis: Kodas ir Pull Request

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte` (`~/devops/devops-projektas`). Atsakymus į „Kodėl“ rašote faile `docs/procesai.md`.

**Tikslas:** Pamatyti, kaip tikra programa skaito savo nustatymus iš aplinkos, ir pateikti visą darbą per Pull Request.

**1 dalis: kodo skaitymas**

2. Projekto šaknyje suraskite visas `app.py` eilutes su `os.environ` ir įrašykite jas į `docs/nustatymai.txt`.
3. Faile `docs/procesai.md` pridėkite skyrių „## Nustatymai“ ir paaiškinkite, kokia bus `APP_COLOR` reikšmė, jei jo nenustatysite, o kokia po `export APP_COLOR=red`.
4. Tame pačiame skyriuje paaiškinkite, ką daro programa, kai `DB_HOST` nenustatytas (žr. `.env.example` ir `app.py` pradžią).
5. Patikrinkite, kad Git ignoruoja failą `.env` (pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas: kuri komanda parodo, ar failas ignoruojamas).
6. **Kodėl:** skyriuje „Nustatymai“ vienu sakiniu užrašykite, kodėl slaptažodis laikomas aplinkos kintamajame, o ne kode.

**2 dalis: patikra, commit ir siuntimas**

7. Patikrinkite, kad `docs` ir `scripts` nėra slaptažodžių, raktų, tokenų ar `.env` turinio.
8. Pridėkite `docs` ir padarykite commit su žinute „Pridėti nustatymai“.
9. Pažiūrėkite commit istoriją: turi būti penki jūsų commit'ai.
10. Nusiųskite šaką `pamoka-03` į GitHub.

**3 dalis: Pull Request**

11. GitHub'e atidarykite Pull Request iš `pamoka-03` į `main` pavadinimu „Procesai ir paketai“ su vieno sakinio aprašu.
12. Peržiūrėkite **Files changed**: turi matytis jūsų failai.
13. Sulieskite Pull Request.
14. Kompiuteryje persijunkite į `main` ir atnaujinkite jį.
15. Ištrinkite šaką `pamoka-03` kompiuteryje ir GitHub'e.
16. **Papildomai:** paaiškinkite skirtumą tarp `kill` ir `kill -9` ir kada naudotumėte antrą.
