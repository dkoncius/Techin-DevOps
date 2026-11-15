# 4 užduotis: Teisės ir pirmas skriptas

1. **Tikslas:** automatizuoti ranka darytus žingsnius skriptu, padaryti jį vykdomą ir nustatyti teises.
2. Grįžkite į šaknį: `cd ~/Desktop/devops/git-bandymas`. Sukurkite aplanką `scripts`. Komandą rasite `linux komandos.pdf`.
3. Atidarykite `nano scripts/ataskaita.sh` (redaktorius kaip 1 užduotyje) ir įrašykite skriptą žemiau.

```bash
#!/usr/bin/env bash
echo "Aplankas: $(pwd)"
echo "Failų ir aplankų uzrasai: $(ls uzrasai | wc -l | tr -d ' ')"
echo "Markdown failai:"
find . -name "*.md" -not -path "./.git/*"
echo "Eilutės su Terminalas:"
grep -n "Terminalas" uzrasai.md
```

4. Paleiskite iš projekto šaknies: `./scripts/ataskaita.sh`. Laukiama: `Permission denied` (zsh rašo `permission denied`), nes dar nėra teisės vykdyti.
5. Suteikite teisę ir paleiskite: `chmod +x scripts/ataskaita.sh`, tada `./scripts/ataskaita.sh`. Išvestyje yra aplankas, skaičius, `.md` sąrašas ir eilutė su `Terminalas`.
6. Išvestį įrašykite į `ataskaita.txt`. Nukreipimas `>` kaip 3 užduotyje. `cat ataskaita.txt` rodo tą pačią išvestį.
7. Pažiūrėkite teises: `ls -l scripts/ataskaita.sh`. Savininko grupėje yra `x`.
8. Aplanke `~/devops`, ne projekte, sukurkite tuščią `slaptas.txt` (komanda yra `linux komandos.pdf`) ir uždarykite kitiems: `chmod 600 ~/devops/slaptas.txt`. `ls -l ~/devops/slaptas.txt` rodo `-rw-------`.
9. Du commit'ai ta pačia eiga kaip 1 užduotyje. Pirma tik `scripts/ataskaita.sh`, žinutė „Pridėtas ataskaita.sh“. Antra `ataskaita.txt`, žinutė „Pridėta ataskaita“. Istorijos viršuje šios dvi žinutės. Komandas rasite Git cheat sheet.
10. **Papildomai:** `chmod -x scripts/ataskaita.sh`, tada `bash scripts/ataskaita.sh` (veikia, nes `bash` skaito failą), tada `chmod +x scripts/ataskaita.sh`. `./scripts/ataskaita.sh` vėl veikia.
11. **Pateikimas:** terminalo nuotrauka po `ls -l scripts/ataskaita.sh` ir `cat ataskaita.txt`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
