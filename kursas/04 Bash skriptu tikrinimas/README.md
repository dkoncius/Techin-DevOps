# Bash – 04 pamoka: skripto tikrinimas

**Lygis:** pradedantiesiems · **Laikas:** ~3 val. · **Reikia:** Linux/macOS terminalo (arba WSL Windows'e)

| Sistema | Ką daryti |
|---|---|
| Visur | dirbkite **bash terminalo rėžime**; skriptus paleidžiate `./kelias/failas.sh` (ne `bash failas.sh`) |
| Mac | jei `echo $0` rodo `zsh`, įeikite: `bash` (išeiti: `exit`) |

## Ko išmoksite
Po šios pamokos mokėsite:
1. Skripto išvestį ir išėjimo kodą įrašyti į kintamuosius.
2. Palyginti, ką skriptas parašė, su tuo, ką turėjo parašyti.
3. Parašyti testą: skriptą, kuris tikrina kitą skriptą.
4. Patikrinti patį testą: ar jis pagauna klaidą.
5. Testą išsaugoti Git'e kartu su skriptu.

Visi pavyzdžiai paleidžiami iš šio aplanko šaknies. 1–7 skyriuose viskas rašoma terminale.

```bash
pwd                              # .../bash-tikrinimas
echo $0                          # bash arba -bash
./scripts/sveikas.sh Ona      # Sveiki, Ona
                                 # Pasveikinta: 1
```

Jei redaguojate failą viename aplanke, o paleidžiate kitame, pakeitimų nematysite. Pirmas klausimas, kai „niekas nesikeičia“: ką rodo `pwd`?

---

## 1. Kas yra patikra

| Žingsnis | Bash | Pavyzdys |
|---|---|---|
| 1. Paleisti | `./skriptas argumentai` | `./scripts/sveikas.sh Ona` |
| 2. Užfiksuoti | `OUT=$(...)`, `KODAS=$?` | ką parašė ir kokiu kodu baigė |
| 3. Palyginti | `if [ ... ]` | ✅ jei sutampa, ❌ jei ne |

Testas yra tiesiog skriptas, kuris kelis kartus paleidžia kitą skriptą ir palygina rezultatus.

## 2. Išvestis į kintamąjį
```bash
OUT=$(./scripts/sveikas.sh Ona)   # ekrane nieko
echo "$OUT"                          # Sveiki, Ona
                                     # Pasveikinta: 1
```
`$(...)` paleidžia komandą ir viską, ką ji parašė, įrašo į kintamąjį. `echo "$OUT"` rašykite su kabutėmis, kitaip eilutės susilieja.

## 3. Išėjimo kodas
```bash
OUT=$(./scripts/sveikas.sh Ona)
KODAS=$?
echo "kodas: $KODAS"                 # kodas: 0
```
`$?` keičiasi po **kiekvienos** komandos, todėl `KODAS=$?` rašykite iškart po tikrinamos komandos:
```bash
OUT=$(./scripts/sveikas.sh)       # kodas 2
echo "paleista"                      # dabar $? jau echo kodas
KODAS=$?
echo "kodas: $KODAS"                 # kodas: 0  (blogai!)
```

| Kodas | Reiškia |
|---|---|
| 0 | pavyko |
| 1 | kažkas nepavyko |
| 2 | blogai paleista: trūksta argumento ir pan. (mūsų susitarimas) |
| 127 | komanda nerasta (`command not found`) |

## 4. Kodėl klaida vis tiek matoma
```bash
OUT=$(./scripts/sveikas.sh)       # ekrane: Naudojimas: ./scripts/sveikas.sh vardas...
KODAS=$?
echo "išvestis: [$OUT]"              # išvestis: []
echo "kodas: $KODAS"                 # kodas: 2
```

| Kanalas | Kas ten rašoma | Kur patenka su `$(...)` |
|---|---|---|
| įprasta išvestis (stdout) | rezultatas: `echo "..."` | į kintamąjį |
| klaidų kanalas (stderr) | klaidos: `echo "..." >&2` | į ekraną |

Todėl `Naudojimas: ...` matote ekrane, o `OUT` tuščias. Jei po `OUT=$(...)` ekrane matote ką nors netikėto (pvz., `command not found`), skripte yra klaida.

## 5. Klaidą paslėpti
```bash
OUT=$(./scripts/sveikas.sh 2>/dev/null)   # ekrane nieko
KODAS=$?
echo "kodas: $KODAS"                         # kodas: 2
```
`2>/dev/null` klaidų kanalą (2) išmeta. Teste taip darome, kad ekrane matytųsi tik ✅ ir ❌. Klaida niekur nedingsta: ją rodo kodas.

## 6. Palyginti išvestį
```bash
OUT=$(./scripts/sveikas.sh Ona)
# tiksliai lygu ($'...\n...' = tekstas iš kelių eilučių)
if [ "$OUT" = $'Sveiki, Ona\nPasveikinta: 1' ]; then echo "✅"; else echo "❌"; fi

# išvestyje yra tekstas
if printf '%s\n' "$OUT" | grep -qF -- "Sveiki, Ona"; then echo "✅"; else echo "❌"; fi

# išvestyje NĖRA teksto (! apverčia rezultatą)
OUT=$(./scripts/sveikas.sh 2>/dev/null)
if ! printf '%s\n' "$OUT" | grep -qF -- "Naudojimas"; then echo "✅"; else echo "❌"; fi
```

| Tikrinate | Rašote |
|---|---|
| išvestis tiksliai lygi | `[ "$OUT" = "tekstas" ]` |
| išvestis tuščia | `[ -z "$OUT" ]` |
| išvestyje yra tekstas | `printf '%s\n' "$OUT" \| grep -qF -- "tekstas"` |
| išvestyje nėra teksto | `! printf '%s\n' "$OUT" \| grep -qF -- "tekstas"` |

`grep -q` nieko nerodo, tik grąžina kodą. `-F`: tekstas ieškomas toks, koks yra.

## 7. Palyginti kodą
```bash
./scripts/sveikas.sh 2>/dev/null
KODAS=$?
if [ "$KODAS" -eq 2 ]; then echo "✅"; else echo "❌"; fi

# dvi sąlygos kartu (&& = ir)
OUT=$(./scripts/sveikas.sh Ona)
KODAS=$?
if [ "$OUT" = $'Sveiki, Ona\nPasveikinta: 1' ] && [ "$KODAS" -eq 0 ]; then echo "✅"; else echo "❌"; fi
```
Skaičiams `-eq`, tekstui `=`.

## 8. Pirmas testas faile
Pavyzdys yra `pavyzdziai/sveikas-testas.sh`. Atsidarykite jį ir paleiskite:
```bash
./pavyzdziai/sveikas-testas.sh; echo "kodas: $?"
```
Turi būti: trys ✅, `Išlaikyta 3 / 3` ir `kodas: 0`.

Kiekviena patikra turi tą pačią formą:
```bash
OUT=$("$S" Ona Jonas 2>/dev/null)                 # 1. paleisti
KODAS=$?                                               # 2. užfiksuoti
if [ "$OUT" = $'...' ] && [ "$KODAS" -eq 0 ]; then     # 3. palyginti
  echo "  ✅ aprašas"
  PASS=$((PASS + 1))
else
  echo "  ❌ aprašas"
  echo "     gauta (kodas $KODAS): $OUT"
  FAIL=$((FAIL + 1))
fi
```
Pabaigoje:
```bash
echo "Išlaikyta $PASS / $((PASS + FAIL))"
if [ "$FAIL" -gt 0 ]; then
  exit 1
fi
```

## 9. Testo pabaiga

Teste nerašykite `set -euo pipefail` — kitaip testas sustoja ties pirmu paleidimu, kuris grąžina ne 0. Jei buvo ❌, pabaigoje būtinai `exit 1`, kitaip išorinis kodas lieka 0.

## 10. Ar testas pagauna klaidą?
Testas, kuris niekada nebūna raudonas, nieko netikrina. Sugadinkite skriptą vienu pakeitimu, paleiskite testą, tada grąžinkite failą su `git restore`.

| Ką pakeisti `scripts/sveikas.sh` | Kas turi būti ❌ |
|---|---|
| ištrinkite `exit 2` | be argumento -> išvestis tuščia, kodas 2 |
| pašalinkite `>&2` | be argumento, Naudojimas nepateko į išvestį |
| `in "$@"` pakeiskite į `in "$1"` | Ona Jonas -> du pasveikinimai |
| `kiekis + 1` pakeiskite į `kiekis + 2` | Ona Jonas -> du pasveikinimai |

```bash
nano scripts/sveikas.sh                  # vienas pakeitimas
./pavyzdziai/sveikas-testas.sh        # bent vienas ❌ ir kodas 1
git restore scripts/sveikas.sh           # grąžina paskutinę commit versiją
./pavyzdziai/sveikas-testas.sh        # vėl 3 / 3
```
Jei testas lieka žalias, o skriptas veikia blogai, testui trūksta patikros.

## 11. Testas saugomas Git'e
Testas saugomas kartu su skriptu: kas parsisiųs repozitoriją, galės iškart patikrinti, ar skriptas veikia. Taisyklė: pirma testas žalias, tada `git add`, `git commit`, `git push`.

---

## Užduotys
Pradiniai failai yra `uzduotys/`. Atsidarykite kiekvieną, perskaitykite komentarą viršuje ir pakeiskite `TODO` eilutes.

| # | Failas | Ką treniruojate | Privaloma |
|---|---|---|---|
| 1 | `01_out_kodas.sh` | `$(...)`, `$?`, `2>/dev/null` | taip |
| 2 | `02_palyginimai.sh` | `=`, `-eq`, `grep -qF`, `!` | taip |
| 3 | `03_patikra_testas.sh` | pirmas testas: `PASS`, `FAIL`, `exit 1` | taip |
| 4 | `04_skaiciuok_testas.sh` | testas nuo nulio | taip |
| 5 | `05_zalias_testas.sh` | testas visada žalias: rask, ko trūksta | jei spėjate |
| 6 ⭐ | `06_raudonas_testas.sh` | testas raudonas, nors skriptas geras | jei spėjate |

1–2 užduotys tikrina `scripts/patikra.sh` (03 pamokos skriptas). Pirma paleiskite jį ranka:
```bash
./scripts/patikra.sh git; echo "kodas: $?"
./scripts/patikra.sh neegzistuoja; echo "kodas: $?"
```

### Patikrinkite atsakymus
```bash
./testai/check.sh            # visos užduotys
./testai/check.sh 3          # tik 3 užduotis
```
Kiekviena patikra rodo ✅ arba ❌ ir ko buvo tikėtasi.

3–6 užduotyse tikrintuvas tikrina jūsų **testą**: paleidžia jį su teisingu skriptu (turi būti žalias) ir su sugadintais (turi būti raudonas).

| Matote | Reiškia |
|---|---|
| `su teisingu ... testas raudonas` | jūsų testas tikisi ne to, ką daro teisingas skriptas. Žiūrėkite eilutes su `\|` |
| `nepagauna klaidos: ...` | testui trūksta patikros. Skaitykite `patarimas:` |
| `trūksta exit 1` | testas rodo ❌, bet baigiasi kodu 0 |

Pavyzdiniai atsakymai yra `sprendimai/`: pirma bandykite patys, žiūrėkite vėliau!

### Kai neišeina

| Matote | Dažniausia priežastis |
|---|---|
| klaida nesikeičia, nors failą taisote | redaguojate kitą aplanką arba seną kopiją. `pwd` ir `cat failas` |
| ❌ visada, nors išvestis teisinga | kintamojo rašybos klaida (`OUDT` ir `OUT`) |
| `kodas 127`, `command not found` | skripte yra žodis, kuris nėra komanda (pvz., komentaras be `#`) |
| kodas visada 0 | tarp komandos ir `KODAS=$?` yra kita komanda |
| testas ❌, bet `kodas: 0` | trūksta `exit 1` pabaigoje |
| testas sustoja per vidurį | teste yra `set -e` |

Tada terminale ranka pakartokite tą patį paleidimą: `OUT=$(...)`, `echo "$OUT"`, `echo $?`. Dirbtinio intelekto prašykite paaiškinti klaidą, ne parašyti visą testą.

---

## Prieš push į Git
Paleiskite patikrą prieš push:
```bash
./testai/prepush_check.sh
```
Ji tikrina, kad:
- yra visi privalomi failai ir aplankai,
- kiekvienas `.sh` turi shebang, yra vykdomas ir be sintaksės klaidų,
- užduotyse neliko `TODO` (tik įspėjimas),
- Git neseka šiukšlių (`.DS_Store`, `*.swp`, `*~`, failai > 1 MB),
- nėra į repozitoriją patekusių slaptažodžių ar raktų,
- aplankas yra Git repozitorija ir turi ką kelti.

Tada:
```bash
git add .
git commit -m "04 pamokos užduotys"
git push
```

### Pirmą kartą su šiuo aplanku?
```bash
git init
git add .
git commit -m "04 pamokos pradžia"
git branch -M main
git remote add origin https://github.com/<jūsų-vartotojas>/bash-tikrinimas.git
git push -u origin main
```
