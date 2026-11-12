# 4 užduotis, sprendimas (dėstytojui): Teisės ir pirmas skriptas

Numeriai atitinka užduoties žingsnius (`4-uzduotis.md`). Rodoma su `docs/pastabos` ir `devops-projektas`; demonstracijoje naudokite kitą pavyzdį.

2–3. Skriptas (redaktoriumi arba taip):

```bash
cd ~/devops/devops-projektas
mkdir scripts
cat > scripts/ataskaita.sh <<'EOS'
#!/usr/bin/env bash
echo "Aplankas: $(pwd)"
echo "Failų ir aplankų docs/pastabos: $(ls docs/pastabos | wc -l | tr -d ' ')"
echo "Markdown failai:"
find . -name "*.md" -not -path "./.git/*"
echo "Eilutės su health:"
grep -n "health" app.py
EOS
```

4–5. Pirmas paleidimas (`Permission denied`) ir užrašas:

```bash
./scripts/ataskaita.sh
printf '\n## Teisės\n\nPirmas paleidimas `./scripts/ataskaita.sh` parašė „Permission denied“, nes failas dar neturėjo vykdymo teisės `x`.\n' >> docs/terminalas.md
```

6–9. Vykdymo teisė, išvestis, `ls -l`:

```bash
chmod +x scripts/ataskaita.sh
./scripts/ataskaita.sh
./scripts/ataskaita.sh > docs/ataskaita.txt
ls -l scripts/ataskaita.sh
printf '\n`-rwxr-xr-x`: pirmas `-` yra paprastas failas; `rwx` savininkas gali skaityti, rašyti ir vykdyti; `r-x` grupė gali skaityti ir vykdyti; `r-x` kiti taip pat.\n' >> docs/terminalas.md
```

10–13. Slaptas failas ir Kodėl:

```bash
touch ~/devops/slaptas.txt
chmod 600 ~/devops/slaptas.txt
ls -l ~/devops/slaptas.txt
printf '\n`.env` ir privatūs raktai turi turėti `600`, nes juose slaptos reikšmės, kurių kiti vartotojai neturi matyti.\n' >> docs/terminalas.md
```

Laukiama: `-rw-------`.

14–15. Du commit'ai:

```bash
git add scripts/ataskaita.sh
git commit -m "Pridėtas ataskaita.sh"
git add docs
git commit -m "Pridėta ataskaita"
git log --oneline
```

16. Papildomai:

```bash
chmod -x scripts/ataskaita.sh
bash scripts/ataskaita.sh
chmod +x scripts/ataskaita.sh
```

`bash failas` skaito failą kaip argumentą, todėl `x` nereikia; `./failas` prašo sistemos jį vykdyti, tam reikia `x`.

Dažna klaida: skriptas paleistas ne projekto šaknyje, `app.py` nerandamas. Windows: CRLF (`bad interpreter`): kurti WSL redaktoriumi (`.gitattributes` su `*.sh text eol=lf`).

Pavyzdinis baigtas `docs/terminalas.md` (po 1–4 užduočių):

````markdown
# Terminalas

## Projektas

Dirbame savo kopijoje, nes šablonas priklauso kitam ir mes negalime (ir neturime) jo keisti; kopija yra mūsų darbo vieta.

## Failai

Pirma kopijuojame, nes kopija nieko nesugadina, o ištrintą ar perrašytą failą atgauti sunku.

## Srautai

Komanda: `find . -name "*.md" -not -path "./.git/*" > docs/failai.txt`

`>` perrašo failą, o `>>` prideda gale; per klaidą pasirinkus `>` prarastume visą ankstesnį turinį.

## Teisės

Pirmas paleidimas `./scripts/ataskaita.sh` parašė „Permission denied“, nes failas dar neturėjo vykdymo teisės `x`; po `chmod +x` veikia.

`-rwxr-xr-x` reiškia: pirmas `-` yra paprastas failas; `rwx` savininkas gali skaityti, rašyti ir vykdyti; `r-x` grupė gali skaityti ir vykdyti; `r-x` kiti taip pat.

`.env` ir privatūs raktai turi turėti `600`, nes juose slaptos reikšmės, kurių kiti vartotojai kompiuteryje neturi matyti.
````
