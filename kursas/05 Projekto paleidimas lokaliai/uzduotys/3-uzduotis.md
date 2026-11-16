# 3 užduotis: .env

**1.** **Tikslas:** pakeisti elgesį be kodo keitimo ir nepalikti `.env` Git'e.

**2.** Prisiminti 02 pamoką: `export` nustatė kintamąjį tik tam langui, o `.env` yra tie patys kintamieji, surašyti faile. Sukurti `.env` iš pavyzdžio:

- `cp .env.example .env`
- `nano .env`
- Pakeisti `APP_COLOR` į `green` ir `APP_VERSION` į `1.2`, tada išsaugoti: `Ctrl+O`, `Enter`, `Ctrl+X`

**3.** Paleisti iš naujo:

- `./run.sh`
- Kitame lange: `curl localhost:5001/status`
- Turi būti: `/status` rodo `1.2`, naršyklėje puslapio juosta žalia
- Sustabdyti: `Ctrl+C`

**4.** Patikrinti, kad `.env` nekeliamas į Git:

- `git status`
- `git check-ignore -v .env`
- Turi būti: `git status` `.env` nerodo, `git check-ignore -v` rodo `.gitignore` eilutę

**5.** `.env` nekeliamas į Git, nes jame gali būti slaptažodžių, o Git istorija lieka visiems.

**6.** Papildyti užrašus:

- `nano docs/paleidimas.md`
- Pridėti skyrių „.env“ ir įrašyti tą patį sakinį iš 5 žingsnio

**7.** **Pateikimas:** `/status` nuotrauka su versija `1.2` ir `git status`, kur `.env` nematyti.

Jei užstrigote, pasižiūrėkite `paleidimas komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
