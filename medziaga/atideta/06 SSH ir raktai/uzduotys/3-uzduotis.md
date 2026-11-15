# 3 užduotis: Sulaužyk ir pataisyk

1. **Tikslas:** pamatyti, kodėl SSH atsisako per atvirų teisių, ir jas grąžinti.
2. Atverkite raktą: `chmod 644 ~/.ssh/id_ed25519_kursas`. `ls -l ~/.ssh/id_ed25519_kursas` rodo `-rw-r--r--`.
3. `ssh -T git@github.com`. SSH atsisako ir rašo, kad teisės per atviros (`UNPROTECTED PRIVATE KEY FILE` arba `bad permissions`).
4. Grąžinkite: `chmod 600 ~/.ssh/id_ed25519_kursas`. `ssh -T git@github.com` vėl prasideda `Hi`.
5. Į `docs/ssh.md` skyrių „Teisės“ įrašykite klaidos eilutę ir sakinį: SSH atsisako, nes raktą galėtų perskaityti kitas to kompiuterio vartotojas.
6. **Pateikimas:** nuotrauka su klaida dėl `644` ir nuotrauka po `chmod 600`, kai `ssh -T` vėl veikia.

Jei užstrigote, pasižiūrėkite `ssh komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
