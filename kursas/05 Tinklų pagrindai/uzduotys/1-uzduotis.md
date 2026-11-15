# 1 užduotis: Pirmas curl

1. **Tikslas:** paleisti paprastą HTTP serverį ir pasiekti jį per `curl`. Flask projekto dar nėra.
2. Atnaujinkite ir sukurkite šaką: `cd ~/Desktop/devops/git-bandymas`, `git switch main`, `git pull`, `git switch -c pamoka-05`.
3. Viename lange paleiskite: `python3 -m http.server 5001`. Naršyklėje `http://localhost:5001` rodo aplanko failus. Šį langą palikite.
4. Kitame lange: `curl -s localhost:5001`. Atsakyme yra failų sąrašas. Kompiuterio vardo į užrašus nerašykite.
5. Antraštės: `curl -i localhost:5001`. Pirmoje eilutėje yra `HTTP/1.0 200` arba `HTTP/1.1 200`.
6. Užrašykite `nano docs/tinklai.md`:

```markdown
# Tinklų pagrindai

## Atsakymai

`python3 -m http.server 5001` atsako kodu 200. Tai dar ne Flask programa.
```

7. **Pateikimas:** terminalo nuotrauka su `curl -i` ir eilute, kurioje yra `200`.

Jei užstrigote, pasižiūrėkite `tinklai komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
