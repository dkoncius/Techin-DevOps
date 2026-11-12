# 1 užduotis: Procesai

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte`. Atsakymus į „Kodėl“ rašote faile `docs/procesai.md`.

1. **Tikslas:** Pamatyti savo procesą, rasti jo PID ir jį sustabdyti.
2. Eikite į savo `devops-projektas` ir persijunkite į `main`, atnaujinkite jį iš GitHub.
3. Sukurkite šaką `pamoka-03` ir persijunkite į ją.
4. Paleiskite komandą `sleep 300` fone.
5. Pažiūrėkite fone veikiančių darbų sąrašą.
6. Suraskite savo `sleep` proceso PID (per procesų sąrašą ir `grep`).
7. Sustabdykite procesą pagal PID.
8. Įsitikinkite, kad proceso nebėra.
9. Faile `docs/procesai.md` (aplanką `docs` sukurkite, jei jo nėra) parašykite antraštę „# Procesai ir paketai“ ir skyrių „## Procesas“ su savo komandomis ir PID.
10. **Kodėl:** skyriuje „Procesas“ vienu sakiniu užrašykite, kodėl PID imame iš `sleep` eilutės, o ne iš `grep` eilutės.
11. Padarykite commit su žinute „Pradėtas procesai.md“.
12. **Papildomai:** paleiskite `sleep 300` dar kartą, sustabdykite jį ne per `kill`, o klaviatūros sparčiuoju klavišu, ir paaiškinkite skirtumą tarp `Ctrl+C` ir `Ctrl+Z`.
