# 01 Kas yra DevOps: sprendimai (dėstytojui)

Nepatikrinta: GitHub dalis (template, PR, Merged, `gh auth`) ir WSL2 Ubuntu; daroma ranka prieš pamoką. `check.sh` išbandytas macOS (bash 3.2) su laikinu Git repo.

## Kas čia

Pavyzdinis mokinio pirmo PR turinys: `pavyzdys/docs/devops.md` (DevOps paaiškinimas, „nuo kodo iki vartotojo“, `/health`). `projektas/` kol kas tik su pastaba „bus papildyta“, nes starterio `devops-projektas` dar nėra.

## Apklausa

Atsakymus surinkite formoje (anoniminė) arba rankų pakėlimu; rezultatą užsirašykite, jis reikalingas 02 pamokai. Klausimai ir ką daryti pagal atsakymus:

1. Windows ar Mac? Jei Windows daugiau nei pusė, 02 ir 03 demonstruokite WSL terminale ir primename `~/` ir CRLF klaidas; jei Mac dauguma, rodykite Terminale, o WSL klaidas minėkite trumpai.
2. Ar veikia Ubuntu (WSL) / Terminalas? Kas atsakė „ne“ ar „nežinau“, tam skirkite diegimo laiką aplinkos patikros metu (~10 min) ir pertrauką; jei „ne“ daugiau nei ~5 žmonės, apsvarstykite 5 min. bendrą WSL diegimo parodymą visai grupei, o ne po vieną.
3. Ar turite GitHub paskyrą? Kas neturi, tas susikuria ją aplinkos patikros metu (~5 min.), kol kiti tvarkosi; jei neturinčių daug, paprašykite jų tai padaryti dar prieš GitHub dalį ir iš karto parodykite kelis žingsnius visiems.
4. Patirtis 1–5 (Git, Linux, Python, Docker):
   1. Git daug 1–2: GitHub gyvai dalį eikite lėčiau, daugiau laiko šakai ir PR, porose „stipresnis su silpnesniu“.
   2. Linux daug 1–2: 02 pamokoje daugiau demonstracijos laiko, užduotis galima palikti pradėti klasėje.
   3. Python daug 1–2: `/health` aiškinti eilutė po eilutės (dekoratorius, žodynas, kodas 200).
   4. Docker nepažįsta, tai tikėtina: nieko keisti nereikia, Docker prasideda 11 pamokoje.
5. Kas labiausiai neramina? Surinkite 3–4 dažniausias temas ir atsakykite į jas 02 pamokos pradžioje arba kitoje pertraukoje.

Pastabos 02 pamokai pagal apklausos rezultatus (tik užrašyti, pamokos nekeisti). Jei kas liko su Git Bash be WSL, tai išspręsti prieš 02: jei Windows daug, pridėti rodymą WSL terminale; jei Linux patirtis žema, skirti daugiau laiko failų ir teisių demonstracijai; jei daug neturi `gh` ar GitHub, pradėti 02 trumpu prisijungimo pasitikrinimu.

## Kaip rodyti klasėje

Šios pamokos pradžioje praeitos pamokos sprendimo nėra. Studentams niekas iš anksto nesiunčiama: visa aplinka ruošiama pamokoje. Pamoka telpa į 3 val.: ~95 min. gyvai, užduotys ~1 val.

Pavyzdinė laiko juosta (pradžia 17:30):

| Laikas | Trukmė | Kas |
|---|---|---|
| 17:30 | 5 min | Prisistatymas |
| 17:35 | 5 min | Apklausa |
| 17:40 | 10 min | Kurso eiga, DI taisyklės; **Windows paleidžia `wsl --install`, Mac `xcode-select --install`** |
| 17:50 | 20 min | Kas yra DevOps (diegimas vyksta fone) |
| ~18:10 | ~15 min | Pertrauka: Windows perkrauna kompiuterį ir vieną kartą paleidžia Ubuntu; Mac patikrina, ar baigėsi diegimas |
| ~18:25 | 10 min | Aplinkos patikra |
| ~18:35 | 35 min | GitHub gyvai |
| ~19:10 | 10 min | `/health` |
| ~19:20 | ~1 val. | Užduotys, `check.sh` (iki ~20:20; rezervas iki 20:40) |

1. (~5 min) Prisistatymas: užpildykite `[ĮRAŠYTI: …]` vietas `pamoka.md` prieš pamoką arba sakykite žodžiu.
2. (~5 min) Apklausa (žr. skyrių „Apklausa“ aukščiau). Dažna klaida: klausimai skaitomi per ilgai; rodykite visus penkis lentoje.
3. (~10 min) Kurso eiga: 80 paskaitų, 7 etapai, atsiskaitymai 2026-11-30 ir 2026-12-17, `git pull` iš `devops-kursas`, `check.sh`, sprendimas kitos pamokos pradžioje, DI taisyklės. Vertinimo procentų nesakykite: jie nepatvirtinti. Šio žingsnio pabaigoje paprašykite Windows studentų PowerShell kaip administratoriui paleisti `wsl --install`, o Mac studentų `xcode-select --install`. Dažna klaida (Windows): PowerShell paleista ne kaip administratorius; arba virtualizacija išjungta BIOS (tada `wsl --install` nepasileis).
4. (~20 min) Kas yra DevOps: schema „kodas → vartotojas“ iš `pamoka.md`; kitas pavyzdys nei mokinių (mokiniai rašo apie `/health`; rodykite, kur lūžta mobilios programos atnaujinimas). Diegimas tuo metu vyksta fone.
5. (~15 min) Pertrauka: Windows studentai perkrauna ir vieną kartą paleidžia Ubuntu (sukuria vartotoją ir slaptažodį; slaptažodžio niekam nerodyti). Mac patikrina `xcode-select` diegimą.
6. (~10 min) Aplinkos patikra: visi paleidžia `git --version` ir `gh auth status`; kas neturi GitHub paskyros, susikuria; kam trūksta `gh`, įdiegia pagal `README.md` (oficiali GitHub CLI dokumentacija); kiti tęsia. Dažna klaida: Windows studentas dirba PowerShell arba klonuoja į `/mnt/c`; arba WSL po `wsl --install` dar neperkrautas.
   1. Atsarginis variantas, jei WSL negalima (pvz. kompiuteris be administratoriaus teisių ar be virtualizacijos): 01 pamokai pakanka Git for Windows (Git Bash). Jis tinka `git`, `gh`, šablonui, klonavimui, šakai ir PR. Dažna klaida: studentas lieka Git Bash be sprendimo; **WSL klausimas turi būti išspręstas prieš 02 pamoką**, nes 02–03 komandos tikrinamos Ubuntu/Mac (paskambinkite arba parašykite tiems studentams tą pačią dieną; vienas iš variantų: kompiuteris su administratoriaus teisėmis, mokyklos kompiuteris).
7. (~35 min) GitHub gyvai kartu: `git config`, šablonas (**Use this template → Create a new repository**), klonavimas, šaka, pakeitimas, commit, push, PR, Merge, `git pull`. Pavyzdys ne mokinių: jūsų bandomasis `demo-projektas` ir failas `docs/kodas-i-serveri.md`. Prisijungimo žingsnių detaliai nerodykite, tik tiems, kam `gh auth status` nepavyko. Dažna klaida: mokinys klonuoja `devops-kursas` vietoj savo repo; `check.sh` tai pagauna. Dažna klaida: darbas tiesiai `main`. Tuo metu mokiniai kartoja tuos pačius žingsnius savo projekte.
8. (~10 min) `/health` skaitymas: Flask ištrauka, ką grąžina.
9. Mokiniai daro užduotis (~1 val.); pabaigoje `./kursas.sh patikrinti 01`. Dažna klaida: PR sulietas GitHub'e, bet `git pull` kompiuteryje nepadarytas, todėl `check.sh` skundžiasi dėl `docs/devops.md` ant `main`.

## Sprendimas pagal darbus

| Darbas | Kur sprendime |
|---|---|
| DevOps paaiškinimas, grandinė, 2 lūžimo vietos | `pavyzdys/docs/devops.md` |
| `/health` skaitymas | `pavyzdys/docs/devops.md`, skyrius `/health` |
| Šaka `pamoka-01` ir ≥ 2 commit'ai | `git log --oneline` rodo ≥ 2 commit'us šakoje |
| PR su aprašu, sulietas | GitHub **Pull requests → Closed** su žyma **Merged** |
| Slaptų duomenų nėra | `docs/devops.md` ir repo be slaptažodžių, raktų, tokenų, realių IP |

Vardas ir el. paštas, prisijungimas, šablonas ir klonavimas daromi pamokoje (`git config --global --list`, `gh auth status`, origin rodo į mokinio `devops-projektas`) ir į `uzduotys.md` nebeįeina. DI, PR ir pateikimas: DI aprašytas (ką paklausė ir kaip patikrino), pateikta sulieto PR nuoroda. Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose (vertinimas.md).
