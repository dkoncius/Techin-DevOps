# 09 Vertinimas

Viso 100 taškų: praktika 60, testas 40. Docker nevertinamas (2 etapas, atsiskaitymas 2026-12-17). Praėjimo riba: ≥ 50 taškų.

| Kriterijus | Taškai | Kaip tikrinama |
|---|---|---|
| Savo kopija iš šablono, `origin`, darbas šakoje `atsiskaitymas-1`, README „Paleidimas“ | 6 | dėstytojas peržiūri GitHub |
| Šio atsiskaitymo PR: antraštė ir aprašas, sulietas | 4 | PR GitHub'e |
| `scripts/tikrinti-porta.sh`: kodai 0, 1, 2 ir pranešimai | 8 | skriptas paleidžiamas su laisvu, užimtu portu, be argumento, su `abc` |
| `paleisti.sh`: vykdomas, Python patikra, `.venv`, `.env`, `PORT`, `/health` laukimas, `/status`, sustabdymas, kodai | 12 | skriptas paleidžiamas sėkmingai ir su užimtu portu, `lsof` po paleidimo |
| `stebesena.sh`: rodo visus adresus, net kai vienas neatsako | 6 | paleidžiamas su veikiančiu projektu: `negyvas 000`, `projektas 200` |
| `scripts/tikrinti.sh`: patikra veikia ir pagauna klaidą | 10 | žr. žemiau |
| `.env`: nesekamas, `.gitignore`, `APP_VERSION` ir `APP_COLOR` pakeitė `/status` | 6 | `git ls-files`, `git status`, `docs/atsiskaitymas.md` |
| Trys rašytiniai atsakymai | 6 | `docs/atsiskaitymas.md` (po 2 taškus) |
| Nėra slaptų duomenų | 2 | `APP_SECRET` nerandamas repozitorijoje |
| **Praktika viso** | **60** | |
| Testas | 40 | teisingi atsakymai × 4 ÷ 3, suapvalinus iki sveikojo |

## `tikrinti.sh` (10 taškų)

| Dalis | Taškai | Kaip tikrinama |
|---|---|---|
| Keturios `tikrinti-porta.sh` patikros (laisvas 0, užimtas 1, be argumento 2, `abc` 2) | 4 | po 1 taškui už kiekvieną patikrą, kuri yra ir veikia |
| Dvi Git patikros (`.env` nesekamas, darbinis medis švarus) | 2 | po 1 taškui |
| ✅ / ❌ kiekvienai patikrai, kodas 0 kai viskas gerai, 1 kai ne, nėra `set -e` | 2 | paleidžiamas po paskutinio commit'o: visi ✅ ir kodas 0 |
| Pagauna klaidą ir tai aprašyta `docs/atsiskaitymas.md` | 2 | dėstytojas sugadina `tikrinti-porta.sh` (pvz., užimtam portui `exit 0`): turi būti ❌ ir kodas 1 |

Jei `tikrinti.sh` su teisingu `tikrinti-porta.sh` raudonas, už 3 eilutę taškų nėra, bet kitos dalys vertinamos.

Testo taškai: 30 → 40, 27 → 36, 24 → 32, 21 → 28, 18 → 24, 15 → 20.

Jei trūksta sulieto Pull Request, negalima gauti pilnų taškų už Git dalį, bet likusi praktika vertinama.
