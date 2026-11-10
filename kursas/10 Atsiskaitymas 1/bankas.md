# 10 Papildomi klausimai (bankas, tik dėstytojui)

15 klausimų, kurie neįtraukti į 30 klausimų testą (`testas.md`). Naudoti kitiems testo variantams (perlaikymui, kartojimui, 79 pamokai). Studentams neduoti. Pamoka nurodyta skliaustuose.

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

33. (03) Ką daro `export DB_HOST=duombaze`?
    - A. Sukuria duomenų bazę
    - B. Įrašo kintamąjį į Git
    - C. Paleidžia duomenų bazės serverį
    - D. Nustato aplinkos kintamąjį, kurį mato iš šio terminalo paleistos programos

34. (03) Ką reiškia `&` komandos gale, pvz. `sleep 300 &`?
    - A. Paleidžia komandą fone, terminalas lieka laisvas
    - B. Paleidžia komandą kaip administratorių
    - C. Paleidžia komandą du kartus
    - D. Sustabdo komandą po 300 sekundžių

35. (03) Kodėl slaptažodį geriau perduoti aplinkos kintamuoju, o ne rašyti į kodą?
    - A. Nes kodas lėčiau veikia
    - B. Nes kintamųjų Git neprimeta
    - C. Nes kodas keliamas į Git ir jį gali pamatyti kiti, o kintamasis lieka už repozitorijos
    - D. Nes Python kintamųjų nemato

36. (04) Ką rodo `echo $?`?
    - A. Paskutinio argumento reikšmę
    - B. Paskutinės komandos išėjimo kodą (0 = sėkmė)
    - C. Proceso numerį
    - D. Skripto pavadinimą

37. (04) Ką daro `[ -d .venv ] || python3 -m venv .venv`?
    - A. Sukuria `.venv` tik jei jo dar nėra
    - B. Visada ištrina `.venv` ir sukuria iš naujo
    - C. Paleidžia Python programą
    - D. Patikrina, ar `.venv` yra failas

38. (04) Ką daro `git restore failas.txt`?
    - A. Sukuria naują commit'ą
    - B. Ištrina failą iš GitHub
    - C. Sujungia šakas
    - D. Atmeta neįrašytus failo pakeitimus ir grąžina paskutinio commit'o versiją

39. (05) Ką reiškia HTTP kodas 500?
    - A. Resursas nerastas
    - B. Serverio vidinė klaida
    - C. Užklausa pavyko
    - D. Nereikia prisijungti

40. (05) Kam skirtas tinklo portas?
    - A. Šifruoti ryšį
    - B. Saugoti failus
    - C. Atskirti kelias paslaugas tame pačiame kompiuteryje (pvz., 5001 programai)
    - D. Rodyti IP adresą

41. (06) Kuris iš raktų failų yra viešas ir keliamas į GitHub?
    - A. `id_ed25519_kursas.pub`
    - B. `id_ed25519_kursas`
    - C. Abu failai
    - D. Nė vienas

42. (06) Ką daro `ssh -T git@github.com`?
    - A. Sukuria raktų porą
    - B. Įkelia failus į GitHub
    - C. Ištrina raktą
    - D. Patikrina, ar SSH prisijungimas prie GitHub veikia

43. (07) Ką daro `git stash`?
    - A. Ištrina visus pakeitimus negrįžtamai
    - B. Laikinai pašalina neįkomituotus pakeitimus, kad vėliau juos būtų galima grąžinti per `git stash pop`
    - C. Sujungia šaką į `main`
    - D. Nusiunčia pakeitimus į GitHub

44. (08) Kas yra Pull Request?
    - A. Komanda failams atsisiųsti
    - B. Šakos ištrynimas
    - C. Prašymas sujungti šaką į kitą, kurį galima peržiūrėti ir aptarti prieš sujungimą
    - D. Nuotolinės repozitorijos kopija

45. (09) Ką daro `trap 'kill "$pid"' EXIT` skripte?
    - A. Paslepia klaidas
    - B. Paleidžia procesą iš naujo
    - C. Neleidžia skriptui baigtis
    - D. Sustabdo foninį procesą, kai skriptas baigiasi

## Atsakymai

| Nr. | Pamoka | Atsakymas | Paaiškinimas |
|---|---|---|---|
| 31 | 02 | C | `>` perrašo, `>>` prideda. |
| 32 | 02 | B | `644`: savininkas `rw`, kiti `r`, nėra `x`. |
| 33 | 03 | D | `export` padaro kintamąjį matomą vėliau paleistoms programoms. |
| 34 | 03 | A | `&` paleidžia komandą fone. |
| 35 | 03 | C | Kodas keliamas į Git; slaptažodis lieka už repozitorijos. |
| 36 | 04 | B | `$?` yra paskutinės komandos išėjimo kodas. |
| 37 | 04 | A | `[ -d ... ] \|\| ...` vykdo antrą dalį tik jei katalogo nėra. |
| 38 | 04 | D | `restore` grąžina paskutinio commit'o versiją. |
| 39 | 05 | B | 5xx = serverio klaida. |
| 40 | 05 | C | Portas atskiria paslaugas viename kompiuteryje. |
| 41 | 06 | A | `.pub` viešas, be `.pub` privatus. |
| 42 | 06 | D | `ssh -T` išbando SSH prisijungimą. |
| 43 | 07 | B | `stash` atideda pakeitimus, `stash pop` grąžina. |
| 44 | 08 | C | PR yra prašymas sujungti su peržiūra. |
| 45 | 09 | D | `trap ... EXIT` vykdoma skriptui baigiantis. |

Teisingų atsakymų pasiskirstymas: A 3, B 4, C 4, D 4.
