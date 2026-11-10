# DevOps kursas (VH-DO)

Kursas: 80 paskaitų, kiekviena po 3 val. Kiekvienos pamokos aplanke yra vienas `pamoka.md` su klasės darbu, užduotimis, komandomis ir sprendimu. Užduotis dėstytojas skelbia Teams'e po vieną: pirma parodo gyvai, tada darote jūs. Praeitos pamokos sprendimą parodo kitos pamokos pradžioje. Kasdienių užduočių dėstytojas netikrina, vertinama atsiskaitymuose.

## Aplinka

Visas kursas vyksta **Linux terminale**. Windows ir Mac pasiekiate jį skirtingai, bet komandos pamokose veikia abiejose.

**Windows: WSL2 su Ubuntu.** PowerShell ir cmd kurse nenaudojami.

1. Atidarykite PowerShell kaip administratorius ir įvykdykite `wsl --install`. Perkraukite kompiuterį ir sukurkite Ubuntu vartotoją pagal pasirodžiusius klausimus.
2. Toliau dirbkite tik Ubuntu terminale (Start meniu: „Ubuntu“).
3. Visus kurso failus ir užduotis laikykite vienu aplanku `~/devops`. Susikurkite jį vieną kartą: `mkdir -p ~/devops`. Užduotims kurkite poaplankius (pvz. `~/devops/git-bandymas`, `~/devops/devops-projektas`). Aplanką atidaryti Windows Explorer'yje: `cd ~/devops && explorer.exe .`. Klonuokite **ne** į `/mnt/c/...`: ten failai lėti ir gali sugesti eilučių pabaigos bei teisės.
4. Git Ubuntu paprastai jau yra (`git --version`). Jei ne: `sudo apt update && sudo apt install git`.

**Mac: Terminalas.**

1. Atidarykite programą „Terminal“.
2. Git: `git --version`. Jei jo nėra, sistema pasiūlys įdiegti; arba įvykdykite `xcode-select --install`.
3. Aplankas kurso failams: `mkdir -p ~/devops`. Jį atidaryti Finder'yje: `open ~/devops`.

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
4. Projektą klonuokite Git Bash'e į aplanką `~/devops` (`mkdir -p ~/devops && cd ~/devops`, tada `git clone ...`).

01 pamokai to pakanka: ji naudoja tik `git`, `gh`, šabloną, šaką ir Pull Request.

**3. Ką daryti prieš 02 pamoką**

Nuo 02 pamokos komandos išbandytos Ubuntu (WSL) ir Mac. Git Bash dalį jų paleidžia, bet ne visas (pvz. 03 pamokoje nėra `apt`), todėl tai tik laikinas sprendimas. Iki 02 pamokos išspręskite WSL vienu iš būdų:

1. Įjunkite virtualizaciją BIOS/UEFI (jei ji buvo išjungta) ir paleiskite `wsl --install` iš naujo kaip administratorius.
2. Jei trūksta administratoriaus teisių: paprašykite kompiuterio administratoriaus įdiegti WSL su Ubuntu arba naudokite savo asmeninį kompiuterį.
3. Jei nė vienas būdas nepavyksta, pasakykite apie tai pamokoje: pasirinksime kitą variantą, kol sprendimas bus rastas.

Patikrinkite, kad veikia: Start meniu atidarote „Ubuntu“, įvedate `git --version` ir gaunate versiją.

## Kai kas neveikia

Perskaitykite klaidos tekstą, ieškokite dokumentacijoje arba klauskite LLM ir užsirašykite, kas padėjo. Jei neišsprendžiate, klauskite pamokoje.
