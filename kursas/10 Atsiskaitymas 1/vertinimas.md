# 10 Vertinimas

Viso 100 taškų: praktika 60, testas 40. Praėjimo riba: ≥ 50 taškų.

| Kriterijus | Taškai | Kaip tikrinama |
|---|---|---|
| Repozitorija: iš šablono, `origin`, README „Paleidimas“, `.gitignore` su `.env` | 6 | dėstytojas peržiūri GitHub |
| `git-bandymas`: bent 3 sulieti PR (pamokos 02–05) | 6 | `gh pr list --state merged` tame aplanke |
| Šio atsiskaitymo PR: antraštė ir aprašas, sulietas | 4 | PR GitHub'e |
| `scripts/tikrinti-porta.sh`: kodai 0, 1, 2 ir pranešimai | 10 | skriptas paleidžiamas su laisvu, užimtu portu, be argumento, su `abc` |
| `paleisti.sh`: Python patikra, `PORT`, `/health` laukimas, `/status`, sustabdymas, kodai | 14 | skriptas paleidžiamas sėkmingai ir su užimtu portu |
| `.env` pakeitė `/status`, `.env` ne Git | 6 | `docs/atsiskaitymas.md`, `git status`, `git log` |
| `devops-projektas` turi 06 pamokos sulietą PR su `paleisti.sh` | 6 | `gh pr list --state merged` |
| Trys rašytiniai atsakymai | 6 | `docs/atsiskaitymas.md` (po 2 taškus) |
| Nėra slaptų duomenų | 2 | peržiūra |
| **Praktika viso** | **60** | |
| Testas | 40 | teisingi atsakymai × 4 ÷ 3, suapvalinus iki sveikojo |

Testo taškai: 30 → 40, 27 → 36, 24 → 32, 21 → 28, 18 → 24, 15 → 20.

Jei trūksta Pull Request ar sulietų PR, negalima gauti pilnų taškų už Git dalį, bet likusi praktika vertinama.
