# 1 užduotis: Raktų pora

1. **Tikslas:** sukurti raktų porą atskirame faile ir patikrinti jos teises.
2. Atnaujinkite ir sukurkite šaką: `cd ~/devops/devops-projektas`, `git switch main`, `git pull`, `git switch -c pamoka-06`.
3. Sukurkite porą: `ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_kursas -C "kursas"`. Kai paklaus frazės, įveskite ją ir pakartokite. Jei klausia, ar perrašyti jau esamą failą, atsakykite `n` ir naudokite kitą `-f` vardą.
4. Teisės: `ls -l ~/.ssh`. Privatus failas `id_ed25519_kursas` yra `-rw-------` (600). Viešas `id_ed25519_kursas.pub` yra `-rw-r--r--` (644). Aplankas `~/.ssh` turi būti `drwx------` (700). Jei ne: `chmod 700 ~/.ssh`.
5. Parodykite tik viešo rakto pradžią: `cut -c1-40 ~/.ssh/id_ed25519_kursas.pub`. Privataus failo (be `.pub`) niekada neatidarykite ir nesiųskite.
6. Užrašykite `nano docs/ssh.md`:

```markdown
# SSH ir raktai

## Raktai

Privatus failas `id_ed25519_kursas` turi teises 600. Aplankas `~/.ssh` turi teises 700. Viešas yra tik failas su `.pub`. Privatus raktas lieka tik mano kompiuteryje.
```

7. **Pateikimas:** `ls -l ~/.ssh` nuotrauka, kur matosi `600` ir `.pub`, be privataus rakto turinio.

Jei užstrigote, pasižiūrėkite `ssh komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
