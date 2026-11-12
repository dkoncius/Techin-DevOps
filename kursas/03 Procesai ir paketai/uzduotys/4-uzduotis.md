# 4 užduotis: Kodas ir Pull Request

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`. Atsakymus į „Kodėl“ rašote faile `docs/procesai.md`.

1. **Tikslas:** Pamatyti, kaip tikra programa skaito savo nustatymus iš aplinkos, ir pateikti visą darbą per Pull Request.
2. Projekto šaknyje suraskite visas `app.py` eilutes su `os.environ` ir įrašykite jas į `docs/nustatymai.txt`.
3. Faile `docs/procesai.md` pridėkite skyrių „## Nustatymai“ ir paaiškinkite, kokia bus `APP_COLOR` reikšmė, jei jo nenustatysite, o kokia po `export APP_COLOR=red`.
4. Tame pačiame skyriuje paaiškinkite, ką daro programa, kai `DB_HOST` nenustatytas (žr. `.env.example` ir `app.py` pradžią).
5. Patikrinkite, kad Git ignoruoja failą `.env` (pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas: kuri komanda parodo, ar failas ignoruojamas).
6. **Kodėl:** skyriuje „Nustatymai“ vienu sakiniu užrašykite, kodėl slaptažodis laikomas aplinkos kintamajame, o ne kode.
7. Patikrinkite, kad `docs` ir `scripts` nėra slaptažodžių, raktų, tokenų ar `.env` turinio.
8. Padarykite commit su žinute „Pridėti nustatymai“.
9. Nusiųskite šaką `pamoka-03` į GitHub.
10. GitHub'e atidarykite Pull Request iš `pamoka-03` į `main` pavadinimu „Procesai ir paketai“ su vieno sakinio aprašu.
11. Peržiūrėkite **Files changed**: turi matytis visi penki commit'ai ir jūsų failai.
12. Sulieskite Pull Request, kompiuteryje persijunkite į `main` ir atnaujinkite jį.
13. Ištrinkite šaką `pamoka-03` kompiuteryje ir GitHub'e.
14. **Papildomai:** paaiškinkite skirtumą tarp `kill` ir `kill -9` ir kada naudotumėte antrą.
