# 3 užduotis: Portai

1. **Tikslas:** rasti, kuris procesas klauso porto, ir pamatyti užimto porto klaidą.
2. Viename lange vėl paleiskite `python3 -m http.server 5001`. Kitame: `lsof -nP -i :5001`. Eilutėje matosi `python` ir PID.
3. Trečiame lange vėl `python3 -m http.server 5001`. Paleidimas baigiasi klaida, kad adresas užimtas. Užrašykite tą eilutę į `docs/tinklai.md`.
4. Antra kopija kitame porte, kitame lange: `python3 -m http.server 5002`. `curl -s -o /dev/null -w "%{http_code}\n" localhost:5002/` grąžina `200`. Pirmas langas ir toliau atsako per 5001.
5. Sustabdykite abu (`Ctrl+C` kiekviename lange). `lsof -nP -i :5001` ir `lsof -nP -i :5002` nieko neišveda: portai laisvi.
6. Į `docs/tinklai.md` įrašykite sakinį: du procesai negali klausyti to paties porto, nes sistema neturėtų kam perduoti užklausos.
7. **Pateikimas:** `lsof` nuotrauka su PID ir nuotrauka, kai abu portai laisvi.

Jei užstrigote, pasižiūrėkite `tinklai komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
