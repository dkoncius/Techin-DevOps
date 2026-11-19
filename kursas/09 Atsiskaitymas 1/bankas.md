# 09 Papildomi klausimai (bankas, tik dėstytojui)

26 klausimai, kurie neįtraukti į 30 klausimų testą (`testas.md`). Naudoti kitiems testo variantams (perlaikymui, kartojimui, 78 pamokai). Studentams neduoti. Pamoka nurodyta skliaustuose (numeracija pagal atnaujintą 1 etapą, žr. `atsakymai.md`).

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

35. (07) Kodėl slaptažodį geriau perduoti aplinkos kintamuoju, o ne rašyti į kodą?
    - A. Nes kodas lėčiau veikia
    - B. Nes kintamųjų Git neprimeta
    - C. Nes kodas keliamas į Git ir jį gali pamatyti kiti, o kintamasis lieka už repozitorijos
    - D. Nes Python kintamųjų nemato

36. (04) Ką rodo `echo $?`?
    - A. Paskutinio argumento reikšmę
    - B. Paskutinės komandos išėjimo kodą (0 = sėkmė)
    - C. Proceso numerį
    - D. Skripto pavadinimą

37. (07) Ką daro `[ -d .venv ] || python3 -m venv .venv`?
    - A. Sukuria `.venv` tik jei jo dar nėra
    - B. Visada ištrina `.venv` ir sukuria iš naujo
    - C. Paleidžia Python programą
    - D. Patikrina, ar `.venv` yra failas

38. (03) Ką daro `git restore failas.txt`?
    - A. Sukuria naują commit'ą
    - B. Ištrina failą iš GitHub
    - C. Sujungia šakas
    - D. Atmeta neįrašytus failo pakeitimus ir grąžina paskutinio commit'o versiją

39. (06) Ką reiškia HTTP kodas 500?
    - A. Resursas nerastas
    - B. Serverio vidinė klaida
    - C. Užklausa pavyko
    - D. Nereikia prisijungti

40. (06) Kam skirtas tinklo portas?
    - A. Šifruoti ryšį
    - B. Saugoti failus
    - C. Atskirti kelias paslaugas tame pačiame kompiuteryje (pvz., 5001 programai)
    - D. Rodyti IP adresą

41. (07) Ką daro GitHub **Use this template**?
    - A. Sukuria naują jūsų repozitoriją iš šablono
    - B. Klonuoja dėstytojo kurso repozitoriją
    - C. Ištrina `main`
    - D. Įkelia `.env`

42. (07) Kur klonuoti `devops-projektas`?
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

45. (07) Ką daro `trap 'kill "$pid"' EXIT` skripte?
    - A. Paslepia klaidas
    - B. Paleidžia procesą iš naujo
    - C. Neleidžia skriptui baigtis
    - D. Sustabdo foninį procesą, kai skriptas baigiasi

46. (01) Kuri kodo kelio eilė teisinga?
    - A. testai → kodas → diegimas → stebėsena
    - B. kodas → diegimas → testai → versijų kontrolė
    - C. paketavimas → kodas → testai → stebėsena
    - D. kodas → versijų kontrolė → testai → paketavimas → diegimas → stebėsena

47. (01) Kas yra Git commit'as?
    - A. Šaka, kurią galima ištrinti
    - B. Nuotolinė repozitorija GitHub'e
    - C. Išsaugotas pakeitimų taškas istorijoje
    - D. Failų archyvas

48. (07) Ką reiškia `chmod 600 failas`?
    - A. Visi gali skaityti ir vykdyti
    - B. Tik grupė gali rašyti
    - C. Failas tampa vykdomas
    - D. Tik savininkas gali skaityti ir rašyti

49. (02) Kuo skiriasi paketo diegimas Mac ir Ubuntu?
    - A. Mac naudoja `apt`, Ubuntu `brew`
    - B. Mac naudoja `brew install` be `sudo`, Ubuntu `sudo apt install`
    - C. Abiejose reikia `sudo brew`
    - D. Paketų diegti negalima

50. (03) Kam naudojama `command -v git`?
    - A. Patikrinti, ar komanda `git` yra
    - B. Įdiegti `git`
    - C. Ištrinti `git`
    - D. Rodyti Git istoriją

51. (03) Ką tikrina `[ -d "$1" ]`?
    - A. Ar `$1` yra tuščias
    - B. Ar `$1` yra skaičius
    - C. Ar `$1` yra katalogas
    - D. Ar `$1` yra vykdomas failas

52. (03) Ką daro `for f in docs/*.md; do echo "$f"; done`?
    - A. Ištrina `.md` failus
    - B. Sukuria `docs` aplanką
    - C. Skaičiuoja eilutes
    - D. Išveda kiekvieno `.md` failo kelią

53. (07) Kur WSL klonuoti projektą?
    - A. Į `/mnt/c`
    - B. Į Desktop
    - C. Į `~/devops`
    - D. Į `/tmp`

54. (04) Ką daro `2>/dev/null` komandos gale?
    - A. Išmeta klaidų kanalą, kad klaidos nebūtų rodomos ekrane
    - B. Išmeta įprastą išvestį
    - C. Įrašo klaidas į failą `2`
    - D. Sustabdo komandą po 2 sekundžių

55. (04) Ką tikrina `printf '%s\n' "$OUT" | grep -qF -- "OK"`?
    - A. Ar `OUT` lygus tiksliai `OK`
    - B. Ar `OUT` tuščias
    - C. Ar `OUT` yra tekstas `OK`, nieko neišvesdamas į ekraną
    - D. Kiek kartų `OUT` yra `OK`

56. (05) Kurią komandą paleidus, galima sužinoti, ar failas ignoruojamas pagal `.gitignore`?
    - A. `git log failas`
    - B. `git check-ignore -q failas` (kodas 0 = ignoruojamas)
    - C. `git restore failas`
    - D. `git push failas`

## Atsakymai

| Nr. | Pamoka | Atsakymas | Paaiškinimas |
|---|---|---|---|
| 31 | 02 | C | `>` perrašo, `>>` prideda. |
| 32 | 02 | B | `644`: savininkas `rw`, kiti `r`, nėra `x`. |
| 33 | 02 | D | `export` padaro kintamąjį matomą vėliau paleistoms programoms. |
| 34 | 02 | A | `&` paleidžia komandą fone. |
| 35 | 07 | C | Kodas keliamas į Git; slaptažodis lieka už repozitorijos. |
| 36 | 04 | B | `$?` yra paskutinės komandos išėjimo kodas. |
| 37 | 07 | A | `[ -d ... ] \|\| ...` vykdo antrą dalį tik jei katalogo nėra. |
| 38 | 03 | D | `restore` grąžina paskutinio commit'o versiją. |
| 39 | 06 | B | 5xx = serverio klaida. |
| 40 | 06 | C | Portas atskiria paslaugas viename kompiuteryje. |
| 41 | 07 | A | Use this template sukuria jūsų kopiją. |
| 42 | 07 | D | Klonuojama į `~/devops`. |
| 43 | 02 | B | `kill` prašo baigti. `kill -9` nutraukia iš karto. |
| 44 | 02 | C | PR yra prašymas sujungti su peržiūra. |
| 45 | 07 | D | `trap ... EXIT` vykdoma skriptui baigiantis. |
| 46 | 01 | D | Kodas, versijų kontrolė, testai, paketavimas, diegimas, stebėsena. |
| 47 | 01 | C | Commit yra išsaugotas pakeitimų taškas. |
| 48 | 07 | D | `600`: savininkas skaito ir rašo, kiti nieko. |
| 49 | 02 | B | Mac `brew` be `sudo`, Ubuntu `sudo apt`. |
| 50 | 03 | A | Ar komanda yra. |
| 51 | 03 | C | `-d` tikrina, ar tai katalogas. |
| 52 | 03 | D | Ciklas per `.md` failus ir `echo` kiekvieno kelio. |
| 53 | 07 | C | Projektas klonuojamas į `~/devops`. |
| 54 | 04 | A | `2>` nukreipia klaidų kanalą, `/dev/null` jį išmeta. |
| 55 | 04 | C | `-q` nieko nerodo, tik grąžina kodą; `-F` ieško teksto tokio, koks yra. |
| 56 | 05 | B | `check-ignore -q` grąžina 0, jei failas ignoruojamas. |

Teisingų atsakymų pasiskirstymas: A 5, B 6, C 8, D 7.
