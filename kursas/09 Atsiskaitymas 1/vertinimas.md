# 09 Vertinimas

Viso 100 taškų: praktika 60, testas 40. Docker nevertinamas (2 etapas, atsiskaitymas 2026-12-17). Praėjimo riba: ≥ 50 taškų.

| Kriterijus | Taškai | Kaip tikrinama |
|---|---|---|
| Savo kopija iš šablono, `origin`, darbas šakoje `atsiskaitymas-1`, README „Paleidimas“ | 6 | dėstytojas peržiūri GitHub |
| Šio atsiskaitymo PR: antraštė ir aprašas, sulietas | 4 | PR GitHub'e |
| `scripts/tikrinti-porta.sh`: kodai 0, 1, 2 ir pranešimai | 10 | skriptas paleidžiamas su laisvu, užimtu portu, be argumento, su `abc` |
| `paleisti.sh`: vykdomas, Python patikra, `.venv`, `.env`, `PORT`, `/health` laukimas, `/status`, sustabdymas, kodai | 16 | skriptas paleidžiamas sėkmingai ir su užimtu portu, `lsof` po paleidimo |
| `stebesena.sh`: rodo visus adresus, net kai vienas neatsako | 8 | paleidžiamas su veikiančiu projektu: `negyvas 000`, `projektas 200` |
| `.env`: nesekamas, `.gitignore`, `APP_VERSION` ir `APP_COLOR` pakeitė `/status` | 6 | `git ls-files`, `git status`, `docs/atsiskaitymas.md` |
| Keturi rašytiniai atsakymai | 8 | `docs/atsiskaitymas.md` (po 2 taškus) |
| Nėra slaptų duomenų | 2 | `APP_SECRET` nerandamas repozitorijoje |
| **Praktika viso** | **60** | |
| Testas | 40 | teisingi atsakymai × 4 ÷ 3, suapvalinus iki sveikojo |

Testo taškai: 30 → 40, 27 → 36, 24 → 32, 21 → 28, 18 → 24, 15 → 20.

Jei trūksta sulieto Pull Request, negalima gauti pilnų taškų už Git dalį, bet likusi praktika vertinama.
