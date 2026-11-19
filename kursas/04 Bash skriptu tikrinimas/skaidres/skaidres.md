=== titulinė | Bash skripto tikrinimas
04 pamoka · 1 etapas
- Užfiksuoti skripto išvestį ir išėjimo kodą kintamuosiuose
- Palyginti rezultatą ir parašyti testą su ✅ ir ❌
- Patikrinti, ar testas pagauna sugadintą skriptą
Pilnas žingsnis po žingsnio gidas pamokos aplanke: README.md (skaidrėse — tik kelias ir demonstracija).

=== pagalvokime
Pakeitėte vieną eilutę skripte. Kaip greitai sužinoti, ar viskas dar veikia?
# Ar tikėtumėte akimirksniu, be patikros?
> Kaip kontrolinis darbas: paleidžiate, užsirašote atsakymą, palyginate su raktu.

=== schema | Patikros kelias
```excalidraw
file: patikros-kelias
box run | 1. Paleisti\n./skriptas | 0,0 | blue
box cap | 2. Užfiksuoti\nOUT ir KODAS | 1,0 | purple
box cmp | 3. Palyginti\nif [ ... ] | 2,0 | orange
arrow run -> cap
arrow cap -> cmp
```
+ Testas yra tas pats kelias, pakartotas kelis kartus. Santrauka ir lentelės — README skyriai 1–7.

=== tekstas | Kas yra testas
@iliustracija: raktas
>> skriptas | OUT ir KODAS | if palyginimas | PASS / FAIL
+ Testas yra skriptas, kuris paleidžia kitą skriptą ir nusprendžia, ar rezultatas teisingas.
+> Kaip rakto dublikatas: originalą paliekate, o kopiją lyginate su padarytu.

=== demonstracija | OUT, KODAS ir stderr
Skriptus paleidžiame `./kelias/failas.sh` (bash terminale). Detales — README 2–5 skyriai.
```bash
cd ~/Desktop/"Techin DevOps"/"kursas/04 Bash skriptu tikrinimas"
OUT=$(./scripts/sveikas.sh Ona)
KODAS=$?
echo "$OUT"
echo "kodas: $KODAS"
```
```output+
Sveiki, Ona
Pasveikinta: 1
kodas: 0
```
+ `$(...)` įrašo stdout; `KODAS=$?` rašykite iškart po komandos.
```bash+
OUT=$(./scripts/sveikas.sh)
echo "paleista"
KODAS=$?
echo "kodas: $KODAS"
```
```output+
Naudojimas: ./scripts/sveikas.sh vardas...
paleista
kodas: 0
```
+ Klaidų žinutė eina į stderr — matote ekrane, bet ne `OUT`. Teste: `2>/dev/null` (README 4–5).

=== demonstracija | Pavyzdinis testas
```bash
./pavyzdziai/sveikas-testas.sh
echo "kodas: $?"
```
```output+
Testas: scripts/sveikas.sh
  ✅ Ona Jonas -> du pasveikinimai, kodas 0
  ✅ be argumento -> išvestis tuščia, kodas 2
  ✅ Naudojimas nepateko į išvestį

Išlaikyta 3 / 3
kodas: 0
```
+ Vienos patikros šabloną ir palyginimų lentelę žiūrėkite README 6–8. Jei buvo ❌ — pabaigoje `exit 1` (kad CI matytų raudoną testą).

=== demonstracija | Ar testas pagauna klaidą?
README 10 skyrius: sugadinkite `scripts/sveikas.sh`, paleiskite testą, `git restore`.
```bash
nano scripts/sveikas.sh
./pavyzdziai/sveikas-testas.sh
echo "kodas: $?"
```
```output+
  ❌ ...
Išlaikyta 2 / 3
kodas: 1
```
+ Užduotys: `./scripts/patikra.sh git`, tikrintuvas `./testai/check.sh`.

=== klaida | Dažnos klaidos
:: | OUDT vietoj OUT | Rašybos klaida kintamajame |
:: | Kodas visada 0 | Tarp komandos ir KODAS=$? yra kita komanda |
:: | ❌ bet kodas 0 | Teste trūksta exit 1 pabaigoje |
:: | Testas sustoja viduryje | Teste yra set -e |
:: | Pakeitimų nematau | Kitas aplankas: patikrinkite pwd ir cat failas |
+ Daugiau — README skyrius „Kai neišeina“.

=== uzduotys | Užduotys
@uzduotys: auto, tik sąrašas

=== kita | Kita pamoka
Git būsenos tikrinimas: init, add, commit, push eiliškumas ir patikros prieš push