=== titulinė | GitHub Pull Request
08 pamoka · 1 etapas
- Atidaryti PR su aiškiu aprašu ir susieti jį su Issue
- Peržiūrėti kito žmogaus PR ir atsakyti į komentarą
- Apsaugoti `main` branch apsauga
Pastaba: ~10 min pasitikrinimas po 07. Poroms: pasirinkite porą per šią pamoką.

=== pagalvokime
Kolega pakeičia kodą, kuris veikia visiems vartotojams. Niekas to nepamatė.
# Ar tai gerai?
> Kaip knygos redagavimas: autorius rašo, bet prieš spausdinant kas nors perskaito.
Pastaba: ~3 min. Jie jau atidarė PR 02–07 pamokose; šiandien mokomės daryti jį gerai.

=== schema | Pull Request ciklas
>>+ Issue | Šaka | Pull Request | Review | Sulietas
Pastaba: ~5 min. Paspauskite po žingsnį. `Closes #1` aprašo gale po sujungimo uždaro Issue.

=== tekstas | Geras Pull Request
| Blogas aprašas | Geras aprašas |
|---|---|
| „pakeitimai“ | ?Kas pakeista ir kodėl |
| Nieko apie patikrą | ?Kaip patikrinti (komanda ar žingsniai) |
| Didelis PR | ?Mažas, viena tema |
| Be nuorodos į Issue | ?`Closes #N` |
Pastaba: ~10 min. Pildykite kartu.

=== komanda | `gh` komandos
```bash
gh pr create --title "..." --body "Closes #1"
gh pr list
gh pr view
```
+ `gh pr merge` sujungia, bet porose geriau per GitHub puslapį
Pastaba: ~5 min. Dažna klaida: PR atidarytas į ne tą repozitoriją (į šabloną).

=== tekstas | Code review
:: | Ar daro tai, ką sako aprašas | Palyginkite aprašą ir pakeitimus
:: | Ar nėra slaptų duomenų | Raktai, slaptažodžiai, `.env`
:: | Ar aiškūs pavadinimai | Failai, kintamieji, commit žinutės
:: | Ar pagarbiai parašyta | Klauskite, o ne įsakinėkite
Pastaba: ~15 min. Eilutės komentaras, Request changes, pataisa, Approve. Dažna klaida: kvietimas bendradarbiauti nepriimtas.

=== schema | Kodėl `main` apsaugome
```excalidraw
file: branch-apsauga
box kurejas | Kūrėjas | 0,0.5 | blue
box saka | Šaka + Pull Request | 1.3,0.5 | yellow
box main | main (apsaugota) | 2.6,0.5 | green
arrow kurejas -> saka | commit
arrow saka -> main | po review
note Tiesioginis push į main atmetamas | 1.3,1.6
```
Pastaba: ~5 min. Taisyklė: **Require a pull request before merging**. Parodykite atmestą `git push` į `main`. Branch apsauga veikia nemokamai tik Public repozitorijoms.

=== klaida | Dažnos klaidos
:: | Taisyklė ne `main` šakai | Patikrinkite pavadinimą taisyklėje
:: | Repozitorija privati | Nemokamame plane apsauga gali neveikti
:: | Kvietimas nepriimtas | Laiškas el. paštu arba GitHub pranešimai
:: | Komentaras tik bendras | Rašykite prie konkrečios eilutės
Pastaba: ~3 min.

=== uzduotys | Užduotys
@uzduotys: auto
Pastaba: Skelbkite po vieną. 2 ir 3 užduotys daromos poroje.

=== kita | Kita pamoka
Projekto paleidimas lokaliai: README, `.gitignore`, `./run.sh`
