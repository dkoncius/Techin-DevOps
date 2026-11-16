# 3 užduotis: Portai

**1.** **Tikslas:** rasti, kuris procesas klauso porto, ir pamatyti užimto porto klaidą.

**2.** Pirmame lange paleisti serverį, antrame pažiūrėti, kas klauso porto:

- Pirmame lange: `python3 -m http.server 5001`
- Antrame lange: `lsof -nP -i :5001`
- Turi būti: eilutėje matosi `python` ir PID

**3.** Trečiame lange paleisti tą patį dar kartą:

- `python3 -m http.server 5001`
- Turi būti: paleidimas baigiasi klaida, kad adresas užimtas. Užrašykite tą eilutę į `docs/tinklai.md`

**4.** Antra kopija kitame porte (trečiame lange):

- `python3 -m http.server 5002`
- Ketvirtame lange: `curl -s -o /dev/null -w "%{http_code}\n" localhost:5002/`
- Turi būti: `200`. Pirmas langas ir toliau atsako per 5001

**5.** Sustabdyti abu serverius (`Ctrl+C` kiekviename lange) ir patikrinti:

- `lsof -nP -i :5001`
- `lsof -nP -i :5002`
- Turi būti: abi komandos nieko neišveda, portai laisvi

**6.** Papildyti užrašus:

- `nano docs/tinklai.md`
- Įrašyti sakinį: du procesai negali klausyti to paties porto, nes sistema neturėtų kam perduoti užklausos

**7.** **Pateikimas:** `lsof` nuotrauka su PID ir nuotrauka, kai abu portai laisvi.

Jei užstrigote, pasižiūrėkite `tinklai komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
