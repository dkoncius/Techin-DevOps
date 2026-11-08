# 01 Užduotys

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje arba klauskite LLM, ir užsirašykite, kas padėjo. Nuorodos yra pamoka.md.

Git vardas ir el. paštas, prisijungimas prie GitHub, projekto sukūrimas iš šablono ir klonavimas atliekami pamokoje kartu su dėstytoju, todėl čia jų nėra.

## Užduotis

Laikas: ~1 val.

Per šaką ir Pull Request įkelti į savo `devops-projektas` pirmą dokumentą apie DevOps.

Darbai:

1. Savo `devops-projektas` aplanke naujame faile `docs/devops.md` užrašyti:
   1. 3–4 sakiniai savais žodžiais, kas yra DevOps
   2. numeruotas sąrašas „nuo kodo iki vartotojo“ (5–7 žingsniai) ir 2 vietos, kur grandinė gali lūžti, kiekviena su vienu sakiniu kodėl
2. Python kodo skaitymas: tame pačiame faile paaiškinti, ką daro šis kodas, kai naršyklėje atidaromas adresas `/health` (kokį atsakymą ir kokį kodą grąžina), ir kam toks maršrutas reikalingas (suderinti su starteriu, kai jis bus):

   ```python
   @app.route("/health")
   def health():
       return {"status": "ok"}, 200
   ```

3. Dirbti šakoje `pamoka-01`, o ne `main`, ir joje padaryti bent 2 commit'us (pvz. failas ir jo papildymas). Jei nežinai, kaip: `git switch -c`, `git add`, `git commit -m`, `git push -u origin pamoka-01`.
4. GitHub'e atidaryti Pull Request iš `pamoka-01` į `main`, jo apraše trumpai parašyti, ką pakeitėte (pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas: raskite GitHub dokumentacijoje skyrių apie Pull Request kūrimą), ir jį sulieti (**Merged**). Kompiuteryje atsinaujinti: `git switch main`, `git pull`.
5. Patikrinti, kad faile ir repozitorijoje nėra slaptažodžių, raktų ar realių IP.
6. Paleisti `check.sh` (žr. žemiau) ir pataisyti, kas `nepavyko`.
7. Jei naudotas DI: parašyta, ką paklausėte ir kaip patikrinote atsakymą.
8. Pateikimas: sulieto Pull Request nuoroda (arba ekrano nuotrauka su žyma **Merged**).

Savitikra: paleiskite ./check.sh iš šios pamokos aplanko (arba ./kursas.sh patikrinti 01).

## Papildomos užduotys

1. Pažaiskite [Learn Git Branching](https://learngitbranching.js.org/) pirmą lygių grupę.
2. Pridėkite SSH raktą prie GitHub (pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas): `ssh -T git@github.com` atsako jūsų vartotojo vardu.
