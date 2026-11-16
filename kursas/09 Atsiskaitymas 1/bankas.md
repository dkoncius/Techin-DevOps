# 09 Papildomi klausimai (bankas, tik dėstytojui)

15 klausimų, kurie neįtraukti į 30 klausimų testą (`testas.md`). Naudoti kitiems testo variantams (perlaikymui, kartojimui, 78 pamokai). Studentams neduoti. Pamoka nurodyta skliaustuose.

31. (02) Kuo `>` skiriasi nuo `>>`?
    - A. `>` prideda į failo pabaigą, `>>` perrašo
    - B. Skirtumo nėra
    - C. `>` perrašo failą, `>>` prideda į pabaigą
    - D. `>` ištrina failą

32. (02) Ką daro `chmod 644 skriptas.sh`?
    - A. Padaro skriptą vykdomą visiems
    - B. Savininkas gali skaityti ir rašyti, kiti tik skaityti; skriptas nebevykdomas
    - C. Tik savininkas gali skaityti
    - D. Ištrina skriptą

33. (02) Ką daro `export DB_HOST=duombaze`?
    - A. Sukuria duomenų bazę
    - B. Įrašo kintamąjį į Git
    - C. Paleidžia duomenų bazės serverį
    - D. Nustato aplinkos kintamąjį, kurį mato iš šio terminalo paleistos programos

34. (02) Ką reiškia `&` komandos gale, pvz. `sleep 300 &`?
    - A. Paleidžia komandą fone, terminalas lieka laisvas
    - B. Paleidžia komandą kaip administratorių
    - C. Paleidžia komandą du kartus
    - D. Sustabdo komandą po 300 sekundžių

35. (02) Kodėl slaptažodį geriau perduoti aplinkos kintamuoju, o ne rašyti į kodą?
    - A. Nes kodas lėčiau veikia
    - B. Nes kintamųjų Git neprimeta
    - C. Nes kodas keliamas į Git ir jį gali pamatyti kiti, o kintamasis lieka už repozitorijos
    - D. Nes Python kintamųjų nemato

36. (02) Ką rodo `echo $?`?
    - A. Paskutinio argumento reikšmę
    - B. Paskutinės komandos išėjimo kodą (0 = sėkmė)
    - C. Proceso numerį
    - D. Skripto pavadinimą

37. (02) Ką daro `[ -d .venv ] || python3 -m venv .venv`?
    - A. Sukuria `.venv` tik jei jo dar nėra
    - B. Visada ištrina `.venv` ir sukuria iš naujo
    - C. Paleidžia Python programą
    - D. Patikrina, ar `.venv` yra failas

38. (02) Ką daro `git restore failas.txt`?
    - A. Sukuria naują commit'ą
    - B. Ištrina failą iš GitHub
    - C. Sujungia šakas
    - D. Atmeta neįrašytus failo pakeitimus ir grąžina paskutinio commit'o versiją

39. (03) Ką reiškia HTTP kodas 500?
    - A. Resursas nerastas
    - B. Serverio vidinė klaida
    - C. Užklausa pavyko
    - D. Nereikia prisijungti

40. (03) Kam skirtas tinklo portas?
    - A. Šifruoti ryšį
    - B. Saugoti failus
    - C. Atskirti kelias paslaugas tame pačiame kompiuteryje (pvz., 5001 programai)
    - D. Rodyti IP adresą

41. (04) Ką daro GitHub **Use this template**?
    - A. Sukuria naują jūsų repozitoriją iš šablono
    - B. Klonuoja dėstytojo kurso repozitoriją
    - C. Ištrina `main`
    - D. Įkelia `.env`

42. (04) Kur klonuoti `devops-projektas`?
    - A. Į Desktop
    - B. Į `/mnt/c`
    - C. Į iCloud
    - D. Į `~/devops`

43. (02) Ką daro `kill` be `-9`?
    - A. Iškart nutraukia procesą
    - B. Prašo procesą baigti
    - C. Ištrina failą
    - D. Sukuria šaką

44. (02) Kas yra Pull Request?
    - A. Komanda failams atsisiųsti
    - B. Šakos ištrynimas
    - C. Prašymas sujungti šaką į kitą, kurį galima peržiūrėti ir aptarti prieš sujungimą
    - D. Nuotolinės repozitorijos kopija

45. (02) Ką daro `trap 'kill "$pid"' EXIT` skripte?
    - A. Paslepia klaidas
    - B. Paleidžia procesą iš naujo
    - C. Neleidžia skriptui baigtis
    - D. Sustabdo foninį procesą, kai skriptas baigiasi

## Atsakymai

| Nr. | Pamoka | Atsakymas | Paaiškinimas |
|---|---|---|---|
| 31 | 02 | C | `>` perrašo, `>>` prideda. |
| 32 | 02 | B | `644`: savininkas `rw`, kiti `r`, nėra `x`. |
| 33 | 02 | D | `export` padaro kintamąjį matomą vėliau paleistoms programoms. |
| 34 | 02 | A | `&` paleidžia komandą fone. |
| 35 | 02 | C | Kodas keliamas į Git; slaptažodis lieka už repozitorijos. |
| 36 | 02 | B | `$?` yra paskutinės komandos išėjimo kodas. |
| 37 | 02 | A | `[ -d ... ] \|\| ...` vykdo antrą dalį tik jei katalogo nėra. |
| 38 | 02 | D | `restore` grąžina paskutinio commit'o versiją. |
| 39 | 03 | B | 5xx = serverio klaida. |
| 40 | 03 | C | Portas atskiria paslaugas viename kompiuteryje. |
| 41 | 04 | A | Use this template sukuria jūsų kopiją. |
| 42 | 04 | D | Klonuojama į `~/devops`. |
| 43 | 02 | B | `kill` prašo baigti. `kill -9` nutraukia iš karto. |
| 44 | 02 | C | PR yra prašymas sujungti su peržiūra. |
| 45 | 02 | D | `trap ... EXIT` vykdoma skriptui baigiantis. |

Teisingų atsakymų pasiskirstymas: A 3, B 4, C 4, D 4.
