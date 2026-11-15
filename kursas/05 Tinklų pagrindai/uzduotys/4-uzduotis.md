# 4 užduotis: DNS ir Pull Request

1. **Tikslas:** pamatyti, kur veda `localhost`, ir pateikti darbą per Pull Request.
2. `nslookup localhost`. Atsakymas `127.0.0.1`. Tai šis kompiuteris, ne viešas adresas.
3. Į `docs/tinklai.md` įrašykite: `/etc/hosts` yra failas, kuriame vardą ir adresą galima nurodyti ranka. Sistema jį tikrina anksčiau nei klausia DNS serverio.
4. Tame pačiame faile pridėkite lentelę:

```markdown
| Portas | Paslauga |
|---|---|
| 22 | SSH |
| 80 | HTTP |
| 443 | HTTPS |
| 3306 | MySQL |
| 5001 | paprastas HTTP serveris |
```

5. Patikra: `grep -rniE "password|token|secret" docs scripts`. Neturi rasti slaptažodžio.
6. Commit ir siuntimas: `git add docs`, `git commit -m "DNS ir portų lentelė"`, `git push -u origin pamoka-05`.
7. Pull Request iš `pamoka-05` į `main`, pavadinimas „Tinklų pagrindai“. **Merge pull request**. Terminale: `gh pr create --title "Tinklų pagrindai" --body "curl, HTTP kodai, portai ir DNS."`, `gh pr merge --merge`.
8. Atnaujinkite ir ištrinkite šaką: `git switch main`, `git pull`, `git branch -d pamoka-05`, `git push origin --delete pamoka-05`.
9. **Papildomai:** `curl -L` seka nukreipimą (kodai 3xx) pagal antraštę `Location`. Be `-L` `curl` sustoja ties pirmu atsakymu.
10. **Pateikimas:** sulieto Pull Request nuotrauka ir `nslookup localhost` su `127.0.0.1`.

Jei užstrigote, pasižiūrėkite `tinklai komandos.md`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
