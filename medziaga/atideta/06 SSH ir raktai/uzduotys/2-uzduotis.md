# 2 užduotis: Raktas GitHub'e

1. **Tikslas:** pridėti viešą raktą prie GitHub ir juo prisijungti.
2. Pridėkite tik `.pub`: `gh ssh-key add ~/.ssh/id_ed25519_kursas.pub --title kursas`. Naršyklėje: Settings → SSH and GPG keys → New SSH key, įklijuokite `id_ed25519_kursas.pub` turinį.
3. Atidarykite `nano ~/.ssh/config` ir įrašykite (jei failo nėra, `nano` jį sukuria):

```
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_kursas
  IdentitiesOnly yes
```

4. Pirmas prisijungimas: `ssh -T git@github.com`. Jei klausia pirštų antspaudo, palyginkite jį su [GitHub sąrašu](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints) ir tik tada rašykite `yes`. Sėkmė prasideda `Hi <vartotojas>!`.
5. Pakeiskite adresą (vietoj `<vartotojas>` rašykite savo GitHub vardą): `git remote set-url origin git@github.com:<vartotojas>/devops-projektas.git`. `git remote -v` rodo `git@github.com:`. `git fetch` baigiasi be klaidos.
6. Į `docs/ssh.md` skyrių „GitHub“ įrašykite: jei privatus raktas patektų į viešą repozitoriją, jį laikykite nutekėjusiu. Ištrinkite iš GitHub paskyros, sukurkite naują porą ir pridėkite naują `.pub`. Vien ištrynus failą iš Git istorijos, kiti jau galėjo jį nukopijuoti.
7. **Pateikimas:** `ssh -T` nuotrauka su `Hi` ir `git remote -v` su `git@github.com`.

Jei užstrigote, pasižiūrėkite `ssh komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
