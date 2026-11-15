# 1 užduotis: Procesai

1. **Tikslas:** pamatyti savo procesą, rasti jo PID ir jį sustabdyti.
2. Eikite į projektą, atnaujinkite `main` ir sukurkite šaką: `cd ~/Desktop/devops/git-bandymas`, `git switch main`, `git pull`, `git switch -c pamoka-03`. `git branch` rodo žvaigždutę prie `pamoka-03`.
3. Paleiskite procesą fone: `sleep 300 &`. `jobs` rodo `sleep`.
4. Raskite PID: `ps aux | grep sleep`. PID yra antras stulpelis eilutėje `sleep 300`. Eilutė su `grep sleep` yra pats `grep`, ne jūsų procesas.
5. Sustabdykite: `kill <PID>`. Dar kartą `ps aux | grep sleep`: `sleep 300` nebėra.
6. Užrašykite: `mkdir -p docs`, `nano docs/procesai.md`. Įrašykite:

```markdown
# Procesai ir paketai

## Procesas

`sleep 300 &` paleido procesą fone. `ps aux | grep sleep` parodė PID. `kill` tą PID sustabdė.
```

Išsaugokite `Ctrl+O`, `Enter`, išeikite `Ctrl+X`.
7. Išsaugokite Git: `git add docs`, `git commit -m "Pradėtas procesai.md"`. `git log --oneline` viršuje ta žinutė.
8. **Papildomai:** `sleep 300`, tada `Ctrl+C` (procesas baigiasi). Dar kartą `sleep 300`, tada `Ctrl+Z` (pristabdo), `jobs`, `kill %1`.
9. **Pateikimas:** terminalo nuotrauka, kur `ps` rodo `sleep` PID, ir nuotrauka po `kill`, kai to proceso nebėra.

Jei užstrigote, pasižiūrėkite `procesai komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
