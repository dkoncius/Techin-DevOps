# 02 Užduotys

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje arba klauskite LLM, ir užsirašykite, kas padėjo. Nuorodos yra pamoka.md.

## Užduotis 1

Laikas: ~1,5 val.

Apžiūrėti savo projektą terminale ir parašyti pirmą Bash skriptą, kuris parodo, kas jame yra.

Darbai:

1. Terminale nueiti į savo `devops-projektas` aplanką ir pasižiūrėti, kur esate ir kas čia yra (įskaitant paslėptus failus). Jei nežinai, kaip: `pwd`, `ls -la`.
2. Sukurti šaką `pamoka-02` (iš atnaujinto `main`). Jei nežinai, kaip: prieš tai `git switch main` ir `git pull`.
3. Sukurti aplanką `scripts/` (jei jo nėra) ir faile `scripts/terminalas.sh` parašyti skriptą, kuris išveda:
   1. aplanką, kuriame jis paleistas
   2. failų ir aplankų skaičių šiame aplanke
   3. kelias paskutines Git commit žinutes
   
   Jei nežinai, kaip: `pwd`, `ls | wc -l` ir `git log --oneline -n 3`; skriptas prasideda eilute `#!/usr/bin/env bash`.
4. Padaryti skriptą vykdomą ir paleisti. Jei nežinai, kaip: `ls -l` rodo, ar yra `x`; `chmod +x` prideda; paleidžiama `./scripts/terminalas.sh`.
5. Faile `docs/terminalas.md` užrašyti: ką reiškia `-rwxr-xr-x` tavo skripto eilutėje `ls -l` išvestyje (savininkas, grupė, kiti) ir kas atsitiktų be `x`.
6. Surasti terminalo komandą, kuri į failą `docs/failai.txt` išrašo visų `.md` failų sąrašą jūsų projekte (pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas): rezultatas turi būti pačiame faile, o komandą užrašyti `docs/terminalas.md`.

## Užduotis 2

Laikas: ~45 min

Perskaityti Python kodą ir padaryti pirmąjį savo PR su skriptu.

Darbai:

1. Paaiškinti `docs/terminalas.md` faile, ką daro šis kodas (kuris adresas, koks HTTP metodas, ką grąžina) (suderinti su starteriu, kai jis bus):

   ```python
   ITEMS = [{"id": 1, "name": "pirmas"}]


   @app.route("/items", methods=["GET"])
   def list_items():
       return {"items": ITEMS}
   ```

2. Padaryti commit'us šakoje `pamoka-02`: skriptas atskirai nuo dokumentų, bent 2 commit'ai su suprantamomis žinutėmis.
3. Nusiųsti šaką į GitHub (`git push -u origin pamoka-02`) ir atidaryti Pull Request į `main`; sulieti ir `git pull` kompiuteryje.
4. Patikrinti, kad nėra slaptažodžių, raktų, tokenų ar `.env` turinio.
5. Paleisti `check.sh` ir pataisyti, kas `nepavyko`.
6. Jei naudotas DI: parašyta, ką paklausėte ir kaip patikrinote atsakymą.
7. Pateikimas: sulieto Pull Request nuoroda (matomas skriptas ir `docs/terminalas.md`).

Savitikra: paleiskite ./check.sh iš šios pamokos aplanko (arba ./kursas.sh patikrinti 02).

## Papildomos užduotys

1. Išbandykite `man ls` ir suraskite, kaip surikiuoti failus pagal dydį.
2. Pabandykite `chmod 644` skriptui ir paaiškinkite, kodėl `./scripts/terminalas.sh` nebeveikia.
