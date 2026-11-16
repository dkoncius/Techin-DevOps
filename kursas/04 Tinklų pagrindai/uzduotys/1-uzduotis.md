# 1 užduotis: Pirmas curl

**1.** **Tikslas:** paleisti paprastą HTTP serverį ir pasiekti jį per `curl`. Flask projekto dar nėra.

**2.** Atnaujinti ir sukurti šaką:

- `cd ~/Desktop/devops/git-bandymas`
- `git switch main`
- `git pull`
- `git switch -c pamoka-04`

**3.** Viename terminalo lange paleisti serverį:

- `python3 -m http.server 5001`
- Turi būti: naršyklėje `http://localhost:5001` rodo aplanko failus
- Šį langą palikite atvirą

**4.** Pasikartoti, ką jau mokėtės pas Edgarą (serveris yra procesas, kuris klauso porto). Kitame lange:

- `ps aux | grep http.server`
- Turi būti: eilutėje yra `python3 -m http.server 5001`

**5.** Kitame lange paprašyti puslapio:

- `curl -s localhost:5001`
- Turi būti: atsakyme yra failų sąrašas. Kompiuterio vardo į užrašus nerašykite

**6.** Pažiūrėti antraštes:

- `curl -i localhost:5001`
- Turi būti: pirmoje eilutėje `HTTP/1.0 200` arba `HTTP/1.1 200`

**7.** Užrašyti rezultatą:

- `mkdir -p docs`
- `nano docs/tinklai.md`
- Įklijuoti tekstą žemiau (**Mac: Cmd+V**; Ubuntu / WSL: `Ctrl+Shift+V`), tada `Ctrl+O`, `Enter`, `Ctrl+X`

```markdown
# Tinklų pagrindai

## Atsakymai

`python3 -m http.server 5001` atsako kodu 200. Tai dar ne Flask programa.
```

**8.** **Pateikimas:** terminalo nuotrauka su `curl -i` ir eilute, kurioje yra `200`.

Jei užstrigote, pasižiūrėkite `tinklai komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
