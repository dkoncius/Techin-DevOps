# DevOps kursas (VH-DO)

Čia yra viešoji kurso medžiaga: 80 paskaitų, kiekviena po 3 val. Kiekvienos pamokos aplanke rasite:

- `pamoka.md`: ką nagrinėsime klasėje ir nuorodos į dokumentaciją;
- `uzduotys.md`: ką padaryti savarankiškai;
- `check.sh`: skriptas, kuriuo pasitikrinate patys;
- `sprendimai/`: atsiranda kitos pamokos pradžioje, kai dėstytojas jį paskelbia.

Dėstytojas kasdienių užduočių netikrina. Pamokos pradžioje jis parodo sprendimą gyvai, jūs darote užduotis ir tikrinatės su `check.sh`. Vertinama atsiskaitymuose.

## Aplinka

Visas kursas vyksta **Linux terminale**. Windows ir Mac pasiekiate jį skirtingai, bet komandos pamokose veikia abiejose.

**Windows: WSL2 su Ubuntu.** PowerShell ir cmd kurse nenaudojami.

1. Atidarykite PowerShell kaip administratorius ir įvykdykite `wsl --install`. Perkraukite kompiuterį ir sukurkite Ubuntu vartotoją pagal pasirodžiusius klausimus.
2. Toliau dirbkite tik Ubuntu terminale (Start meniu: „Ubuntu“).
3. Projektus klonuokite į savo namų aplanką `~/` (pvz. `~/devops-projektas`), **ne** į `/mnt/c/...`: ten failai lėti ir gali sugesti eilučių pabaigos bei teisės.
4. Git Ubuntu paprastai jau yra (`git --version`). Jei ne: `sudo apt update && sudo apt install git`.

**Mac: Terminalas.**

1. Atidarykite programą „Terminal“.
2. Git: `git --version`. Jei jo nėra, sistema pasiūlys įdiegti; arba įvykdykite `xcode-select --install`.

**Abiem sistemoms: GitHub CLI (`gh`).** Diekite pagal oficialią dokumentaciją: [GitHub CLI installation](https://github.com/cli/cli#installation) (raskite savo sistemos skyrių: Ubuntu/Debian arba macOS Homebrew). Tikrinimas: `gh --version`.

Taip pat reikia GitHub paskyros. Prisijungimas iš terminalo: `gh auth login` (HTTPS); SSH raktas yra tik papildomas kelias.

## Jei WSL nepavyko

Priežastys paprastai dvi: kompiuteryje nėra administratoriaus teisių arba išjungta virtualizacija.

**1. Išsiaiškinkite priežastį (Windows)**

1. Virtualizacija: atidarykite Task Manager → Performance → CPU ir pažiūrėkite eilutę „Virtualization“. Jei „Disabled“, ją reikia įjungti kompiuterio BIOS/UEFI nustatymuose (pavadinimas priklauso nuo gamintojo, pvz. „Intel VT-x“, „AMD-V“ ar „SVM Mode“; raskite savo modelio gamintojo instrukciją).
2. Administratoriaus teisės: `wsl --install` reikia paleisti PowerShell **kaip administratoriui** (dešinys pelės klavišas → Run as administrator). Jei tokios teisės nėra (pvz. mokyklos ar darbo kompiuteris), diegimą gali padaryti tik to kompiuterio administratorius.
3. Po sėkmingo `wsl --install` kompiuterį reikia perkrauti ir vieną kartą paleisti „Ubuntu“.

**2. Laikinas variantas 01 pamokai: Git for Windows (Git Bash)**

1. Įdiekite Git for Windows iš oficialios svetainės [git-scm.com](https://git-scm.com/) (administratoriaus teisių paprastai nereikia, jei nesirenkate diegimo visiems vartotojams).
2. Atidarykite programą „Git Bash“ (ne PowerShell, ne cmd). Patikrinkite: `git --version`.
3. `gh` diekite pagal [GitHub CLI installation](https://github.com/cli/cli#installation) (Windows skyrius), tada `gh auth status`.
4. Projektą klonuokite į savo namų aplanką Git Bash'e (`cd ~`, tada `git clone ...`).

01 pamokai to pakanka: ji naudoja tik `git`, `gh`, šabloną, šaką ir Pull Request.

**3. Ką daryti prieš 02 pamoką**

Nuo 02 pamokos komandos ir `check.sh` išbandyti Ubuntu (WSL) ir Mac. Git Bash dalį jų paleidžia, bet ne visas (pvz. 03 pamokoje nėra `apt`), todėl tai tik laikinas sprendimas. Iki 02 pamokos išspręskite WSL vienu iš būdų:

1. Įjunkite virtualizaciją BIOS/UEFI (jei ji buvo išjungta) ir paleiskite `wsl --install` iš naujo kaip administratorius.
2. Jei trūksta administratoriaus teisių: paprašykite kompiuterio administratoriaus įdiegti WSL su Ubuntu arba naudokite savo asmeninį kompiuterį.
3. Jei nė vienas būdas nepavyksta, pasakykite apie tai pamokoje: pasirinksime kitą variantą, kol sprendimas bus rastas.

Patikrinkite, kad veikia: Start meniu atidarote „Ubuntu“, įvedate `git --version` ir gaunate versiją.

## 1. Susikurkite savo projektą (vieną kartą)

Visą kursą dirbsite su vienu projektu, kurį dėstytojas paskelbia kaip GitHub šabloną `devops-projektas`.

1. Atidarykite šablono repozitorijos puslapį GitHub'e (nuorodą duos dėstytojas pirmoje paskaitoje).
2. Spauskite **Use this template → Create a new repository**.
3. Pavadinimą palikite `devops-projektas`, savininkas yra jūsų paskyra. Pasirinkite **Private** arba **Public**, kaip nurodys dėstytojas.
4. Nusiklonuokite savo naują repozitoriją:

   ```bash
   git clone https://github.com/<JŪSŲ-VARDAS>/devops-projektas.git
   ```

Užduotis pateiksite per **Pull Request** į savo `devops-projektas`: kuriate šaką, darote commit, siunčiate ir atidarote PR. Kaip, išmoksite 01 paskaitoje.

## 2. Nusiklonuokite kurso medžiagą (vieną kartą)

```bash
git clone https://github.com/<DĖSTYTOJO-ORGANIZACIJA-AR-VARDAS>/devops-kursas.git
```

(Tikslią nuorodą duos dėstytojas.) Šios repozitorijos **nekeiskite** ir į ją nieko nesiųskite: tai tik medžiaga skaitymui. Savo darbus darykite `devops-projektas`.

Kas savaitę (arba prieš kiekvieną pamoką) atsinaujinkite:

```bash
cd devops-kursas
git pull
```

## 3. Kaip atlikti pamoką

1. Perskaitykite `pamokos/NN Pavadinimas/pamoka.md` savo `devops-kursas` aplanke.
2. Klasėje dėstytojas parodo pavyzdį gyvai.
3. Atlikite `uzduotys.md`. Jei užstrigote, žiūrėkite „Jei nežinai, kaip“ užuominą, dokumentaciją arba klauskite LLM. Slaptažodžių, raktų, tokenų ir `.env` turinio DI niekada nesiųskite.
4. Pasitikrinkite su `check.sh`.
5. Darbą pateikite per Pull Request į savo `devops-projektas`.

## 4. Savitikra: check.sh

Du būdai, abu daro tą patį. Iš `devops-kursas` aplanko (Ubuntu/WSL ar Mac terminale):

```bash
./kursas.sh patikrinti 01 ~/kelias/iki/devops-projektas
```

Arba nustatykite kelią vieną kartą (terminalo sesijai) ir nebereikės jo rašyti:

```bash
export PROJEKTO_KELIAS=~/kelias/iki/devops-projektas
./kursas.sh patikrinti 01
```

Išvestis: prie kiekvieno tikrinimo `OK` arba `nepavyko, nes …` su užuomina, ką daryti. Jei `nepavyko`, pataisykite ir paleiskite iš naujo.

Jei skriptas nepaleidžiamas (`Permission denied`), paleiskite per `bash`: `bash kursas.sh patikrinti 01 <kelias>`.

## 5. Kai kažkas nepavyko: atstatymas

Praeitos pamokos sprendimas atsiranda kitos pamokos pradžioje (po `git pull`). Jei jūsų projektas „nuklydo“ ir norite grįžti prie paskelbtos būsenos po pamokos NN:

```bash
cd devops-kursas
git pull
./kursas.sh atstatyti 07 ~/kelias/iki/devops-projektas
```

Ką skriptas daro:

1. Padaro jūsų projekto **atsarginę kopiją** šalia jo: `projektas.atsarginis-<data-laikas>` (be `.git` ir `.env`).
2. Paprašo patvirtinimo: reikia įrašyti `taip`.
3. Uždeda paskelbto sprendimo failus ant jūsų projekto. Vienodų vardų failai perrašomi, kiti jūsų failai lieka.
4. Niekada neliečia `.git` ir `.env`: nuoroda į GitHub ir jūsų slaptos reikšmės lieka vietoje.

Jei sprendimas dar neįkeltas, skriptas parašys „sprendimas bus įkeltas kitos pamokos pradžioje“, ir nieko nekeis. Jei pamoka projekto nekeitė, naudojama paskutinė ankstesnė paskelbta būsena. Po atstatymo pažiūrėkite `git status` savo projekte ir, jei viskas gerai, padarykite commit.

## 6. Jei skriptas neveikia

Jei `./kursas.sh` dėl kokios nors priežasties nepaleidžiamas, visa tai galima padaryti rankomis (jūs vis tiek dirbate Ubuntu/WSL ar Mac terminale).

**Atstatymas:**

1. Nukopijuokite visą savo projekto aplanką, **išskyrus** `.git` ir `.env`, į kitą vietą (tai atsarginė kopija).
2. Atidarykite `pamokos/NN Pavadinimas/sprendimai/projektas/` (jei jo nėra, imkite artimiausios ankstesnės pamokos `sprendimai/projektas/`).
3. Jo turinį nukopijuokite į savo projektą (vienodi failai bus perrašyti). **Nekopijuokite ir nekeiskite** `.git` ir `.env`.

**Patikrinimas:** paleiskite `bash "pamokos/NN Pavadinimas/check.sh" <kelias_i_projekta>`.

## Kai kas neveikia

Perskaitykite klaidos tekstą, ieškokite dokumentacijoje arba klauskite LLM ir užsirašykite, kas padėjo. Jei neišsprendžiate, klauskite pamokoje.
