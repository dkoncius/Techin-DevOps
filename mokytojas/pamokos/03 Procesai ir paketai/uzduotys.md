# 03 Užduotys

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje arba klauskite LLM, ir užsirašykite, kas padėjo. Nuorodos yra pamoka.md.

## Užduotis 1

Laikas: ~1,5 val.

Pamatyti procesus, naudoti aplinkos kintamąjį Bash skripte ir įdiegti vieną paketą.

Darbai:

1. Atnaujinti `main` (`git pull`) ir sukurti šaką `pamoka-03`.
2. Paleisti terminale ilgai veikiančią komandą (pvz. `sleep 300`) fone ir kitame terminalo lange rasti jos procesą bei jo PID. Jei nežinai, kaip: `&` komandos gale; `ps` su filtru per `grep`.
3. Sustabdyti tą procesą jo PID ir patvirtinti, kad jo nebėra. Jei nežinai, kaip: `kill <PID>`, tada vėl `ps`.
4. Parašyti skriptą `scripts/aplinka.sh`, kuris:
   1. išveda kintamojo `PROJEKTO_VARDAS` reikšmę, o jei jis nenustatytas, išveda „nenustatyta“
   2. išveda, kiek proceso eilučių yra `ps` išvestyje
   
   Jei nežinai, kaip: numatytoji reikšmė rašoma `${KINTAMASIS:-tekstas}`; eilutėms skaičiuoti `wc -l`.
5. Paleisti skriptą du kartus: be kintamojo ir su `PROJEKTO_VARDAS=mano ./scripts/aplinka.sh` (kintamasis tik šiai komandai). Abiejų išvestis įkelti į `docs/procesai.md`.
6. Įdiegti vieną nedidelį paketą (pvz. `tree`) su savo paketų tvarkykle ir `docs/procesai.md` užrašyti abi komandų versijas lentelėje: tą, kurią naudojote jūs, ir atitinkamą kitos sistemos komandą (Mac: `brew`, Ubuntu/WSL: `apt`). Taip pat užrašyti komandą, kuri rodo įdiegto paketo versiją. Jei nežinai, kaip: Mac `brew install`, Ubuntu `sudo apt update` ir `sudo apt install`; versija: `tree --version`.
7. Surasti, kaip savo paketų tvarkyklėje pasitikrinti, ar paketas jau įdiegtas (pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas), ir užrašyti komandą `docs/procesai.md`.

## Užduotis 2

Laikas: ~45 min

Perskaityti Python kodą ir pateikti darbą per Pull Request.

Darbai:

1. Paaiškinti `docs/procesai.md` faile, ką daro šis kodas ir kokia reikšmė bus `DB_HOST` kintamajame, jei nieko nenustatyta, o kokia po `export DB_HOST=duombaze` (suderinti su starteriu, kai jis bus):

   ```python
   import os

   DB_HOST = os.environ.get("DB_HOST", "localhost")
   DB_NAME = os.environ.get("DB_NAME", "app")
   ```

2. Paaiškinti vienu sakiniu, kodėl DB slaptažodis laikomas aplinkos kintamajame, o ne kode.
3. Padaryti bent 2 commit'us šakoje `pamoka-03`, nusiųsti ją į GitHub, atidaryti Pull Request į `main` ir jį sulieti. Kompiuteryje `git pull`.
4. Patikrinti, kad nėra slaptažodžių, raktų, tokenų ar `.env` turinio.
5. Paleisti `check.sh` ir pataisyti, kas `nepavyko`.
6. Jei naudotas DI: parašyta, ką paklausėte ir kaip patikrinote atsakymą.
7. Pateikimas: sulieto Pull Request nuoroda (matomi `scripts/aplinka.sh` ir `docs/procesai.md`).

Savitikra: paleiskite ./check.sh iš šios pamokos aplanko (arba ./kursas.sh patikrinti 03).

## Papildomos užduotys

1. Pažiūrėkite, kokie yra jūsų `PATH` aplankai, ir raskite, kuriame yra `git`.
2. Paaiškinkite skirtumą tarp `kill` ir `kill -9` ir kada naudotumėte antrą.
