# Bash komandos

Čia yra Bash komandos, kurių reikia 03 užduotyse. Git komandos yra lape `git komandos.md`. Pavyzdžiuose naudojami kiti vardai nei užduotyse, todėl komandą reikia pritaikyti.

## Pasiruošimas ir nano
- `cd ~/Desktop/devops/git-bandymas` → eiti į projektą
- `ls uzrasai scripts` → parodo dviejų aplankų turinį
- `nano kelias/failas.sh` → atidaro (ar sukuria) failą nano; išsaugoti: `Ctrl+O`, `Enter`, `Ctrl+X`
- `Ctrl+K` iškerpa eilutę, `Ctrl+W` ieško, `Ctrl+X` išeina (paklaus, ar saugoti: `Y`, `Enter`)
- `mkdir -p scripts` → sukuria aplanką, jei jo nėra

## Skriptas
- `#!/usr/bin/env bash` → pirma eilutė: kuo paleisti
- `set -euo pipefail` → sustoti pirmoje klaidoje, nepažintas kintamasis yra klaida
- `chmod +x FAILAS` → leidžia vykdyti
- `./SKRIPTAS.sh` → paleidžia
- `./SKRIPTAS.sh git curl` → paleidžia su argumentais `git` ir `curl`
- `./SKRIPTAS.sh; echo "kodas: $?"` → paleidžia ir iškart parodo išėjimo kodą (`$?` rodo paskutinės komandos kodą, todėl rašomas iškart po jos)
- `./SKRIPTAS.sh > FAILAS.txt` → išvestį įrašo į failą (klaidos vis tiek rodomos ekrane)
- `(cd docs && ../scripts/patikra.sh)` → paleidžia iš kito aplanko, bet nekeičia jūsų vietos

## Kintamieji ir argumentai
- `vardas=Ona` → kintamasis (be tarpų aplink `=`)
- `echo "Sveiki, $vardas"` → rodo kintamąjį (rašyti kabutėse)
- `pirmas="$1"` → pirmas argumentas iš komandos eilutės
- `$#` → kiek argumentų
- `"$@"` → visi argumentai
- `set -- ona jonas` → terminale nustato argumentus `$1`, `$2` (bandymui be skripto)
- `kiekis=$((kiekis + 1))` → skaičiaus didinimas

## Sąlyga
```
if [ "$#" -lt 1 ]; then
  echo "Naudojimas: ./SKRIPTAS.sh vardas" >&2
  exit 2
fi
```
- `[ "$#" -lt 1 ]` → argumentų mažiau nei vienas (tarpai aplink `[` ir `]` privalomi)
- `[ "$#" -gt 0 ]` → argumentų daugiau nei nulis
- `[ "$x" -gt 0 ]` → skaičius didesnis už 0 (`-eq` lygu, `-lt` mažiau)
- `command -v VARDAS` → parodo kelią, jei įrankis yra; jei nėra, išėjimo kodas 1
- `command -v VARDAS >/dev/null 2>&1` → tas pats, bet nieko neišveda
```
if command -v node >/dev/null 2>&1; then
  echo "OK      node"
else
  echo "TRŪKSTA node"
  exit 1
fi
```
- `echo "žinutė" >&2` → rašo į klaidų kanalą
- `exit 0` → sėkmė, `exit 1` → klaida, `exit 2` → bloga įvestis

## Masyvas ir ciklas
```
vardai=(ona jonas rasa)
for vardas in "${vardai[@]}"; do
  echo "$vardas"
done
```
- `sarasas=("$@")` → masyvas iš visų argumentų
- `[ -f FAILAS ]` → ar tai failas
- `[ -d APLANKAS ]` → ar tai aplankas
- `[ -f FAILAS ]; echo $?` → bandymas terminale: 0 yra, 1 nėra
