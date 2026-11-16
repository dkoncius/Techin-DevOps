# 4 užduotis: DNS ir Pull Request

**1.** **Tikslas:** pamatyti, kur veda `localhost`, ir pateikti darbą per Pull Request.

**2.** Pažiūrėti, kur veda `localhost`:

- `nslookup localhost`
- Turi būti: atsakymas `127.0.0.1`. Tai šis kompiuteris, ne viešas adresas

**3.** Papildyti užrašus:

- `nano docs/tinklai.md`
- Įrašyti sakinį: `/etc/hosts` yra failas, kuriame vardą ir adresą galima nurodyti ranka. Sistema jį tikrina anksčiau nei klausia DNS serverio

**4.** Tame pačiame faile gale pridėti lentelę (įklijuoti tekstą žemiau, **Mac: Cmd+V**; Ubuntu / WSL: `Ctrl+Shift+V`), tada `Ctrl+O`, `Enter`, `Ctrl+X`:

```markdown
| Portas | Paslauga |
|---|---|
| 22 | SSH |
| 80 | HTTP |
| 443 | HTTPS |
| 3306 | MySQL |
| 5001 | paprastas HTTP serveris |
```

**5.** Patikrinti, ar nėra slaptų duomenų:

- `grep -rniE "password|token|secret" docs scripts`
- Turi būti: slaptažodžio neranda

**6.** Išsaugoti ir nusiųsti:

- `git add docs`
- `git commit -m "DNS ir portų lentelė"`
- `git push -u origin pamoka-04`

**7.** Pull Request iš `pamoka-04` į `main`. Terminale:

- `gh pr create --title "Tinklų pagrindai" --body "curl, HTTP kodai, portai ir DNS."`
- `gh pr merge --merge`
- Arba naršyklėje: pavadinimas „Tinklų pagrindai“, tada **Merge pull request**

**8.** Atnaujinti `main` ir ištrinti šaką:

- `git switch main`
- `git pull`
- `git branch -d pamoka-04`
- `git push origin --delete pamoka-04`

**9.** **Papildomai:** `curl -L` seka nukreipimą (kodai 3xx) pagal antraštę `Location`. Be `-L` `curl` sustoja ties pirmu atsakymu.

**10.** **Pateikimas:** sulieto Pull Request nuotrauka ir `nslookup localhost` su `127.0.0.1`.

Jei užstrigote, pasižiūrėkite `tinklai komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
