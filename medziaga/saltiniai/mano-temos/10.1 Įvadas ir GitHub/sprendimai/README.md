# 10.1 Sprendimai (dėstytojui)

Patikrinta: scenarijus paleistas Mac'e (bash, df). Nepatikrinta: GitHub dalis (PR, Merged, gh auth, SSH) daroma ranka prieš pamoką.

1. Kas čia: pavyzdinis mokinio `devops-lab` repozitorijos turinys (`devops-lab/`): README, `scripts/mano-skriptas.sh`, `.gitignore`.
2. Kaip rodyti klasėje (~15 min). Scenarijų paleisti: `cd devops-lab`, tada `bash scripts/mano-skriptas.sh` arba su keliu, pvz. `bash scripts/mano-skriptas.sh /tmp`.
   1. (~3 min) Parodyti failų medį: `README.md`, `scripts/mano-skriptas.sh`, `.gitignore`.
   2. (~4 min) Paleisti scenarijų.
   3. (~3 min) Parodyti README peržiūrą.
   4. (~5 min) Parodyti, kaip sulietas PR atrodo GitHub'e (**Pull requests → Closed**, žyma **Merged**).
3. Sprendimas pagal darbus:

   | Darbas | Kur sprendime |
   |--------|---------------|
   | git vardas ir el. paštas | `git config user.name`, `git config user.email`; pirmas commit su tuo pačiu autoriumi |
   | repozitorija | `devops-lab` su `README.md` GitHub'e |
   | prisijungimas | `gh auth status` arba `ssh -T git@github.com` rodo vartotojo vardą (privataus rakto ir kodų nerodyti) |
   | scenarijus ir README | `scripts/mano-skriptas.sh` ir README (2–3 sakiniai, kaip paleisti) |
   | „nuo kodo iki serverio“ | README gale numeruotas sąrašas (5–7 žingsniai) ir 2 lūžimo vietos |
   | slaptų duomenų nėra | scenarijus ir README be slaptažodžių, raktų, tokenų, realių IP |

   PR, DI ir pateikimas: `git log --oneline` rodo `Merge pull request`, GitHub'e **Pull requests → Closed** su žyma **Merged**, DI aprašyta (ką paklausė ir kaip patikrino), pateikta repozitorijos ir PR nuoroda.

   Dėstytojas kasdienių užduočių netikrina, tik rodo sprendimą; tikrinimas yra tik atsiskaitymuose (vertinimas.md).
