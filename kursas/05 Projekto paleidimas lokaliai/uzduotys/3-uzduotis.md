# 3 užduotis: .env

1. **Tikslas:** pakeisti elgesį be kodo keitimo ir nepalikti `.env` Git'e.
2. `cp .env.example .env`. `nano .env`: pakeiskite `APP_COLOR` į `green` ir `APP_VERSION` į `1.2`.
3. Vėl `./run.sh`. `curl localhost:5001/status` rodo `1.2`. Naršyklėje puslapio juosta žalia. Sustabdykite `Ctrl+C`.
4. `git status` `.env` nerodo. `git check-ignore -v .env` rodo `.gitignore` eilutę.
5. `.env` nekeliamas į Git, nes jame gali būti slaptažodžių, o Git istorija lieka visiems.
6. Į `docs/paleidimas.md` skyrių „.env“ įrašykite tą patį sakinį.
7. **Pateikimas:** `/status` nuotrauka su versija `1.2` ir `git status`, kur `.env` nematyti.

Jei užstrigote, pasižiūrėkite `paleidimas komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
