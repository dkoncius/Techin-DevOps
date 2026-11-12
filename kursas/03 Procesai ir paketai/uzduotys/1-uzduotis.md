# 1 užduotis: Procesai

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte` (`~/devops/devops-projektas`).

**Tikslas:** Pamatyti savo procesą, rasti jo PID ir jį sustabdyti.

**1 dalis: nauja šaka**

2. Eikite į savo `devops-projektas`, persijunkite į `main` ir atnaujinkite jį iš GitHub.
3. Sukurkite šaką `pamoka-03` ir persijunkite į ją.

**2 dalis: procesas fone**

4. Paleiskite komandą `sleep 300` fone.
5. Pažiūrėkite fone veikiančių darbų sąrašą.
6. Suraskite savo `sleep` proceso PID (per procesų sąrašą ir `grep`).
7. Sustabdykite procesą pagal PID.
8. Įsitikinkite, kad proceso nebėra.

**3 dalis: užrašai ir commit**

9. Faile `docs/procesai.md` (aplanką `docs` sukurkite, jei jo nėra) parašykite antraštę „# Procesai ir paketai“ ir skyrių „## Procesas“ su savo komandomis ir PID.
10. Pridėkite `docs` ir padarykite commit su žinute „Pradėtas procesai.md“.
11. **Papildomai:** paleiskite `sleep 300` dar kartą, sustabdykite jį ne per `kill`, o klaviatūros sparčiuoju klavišu, ir paaiškinkite skirtumą tarp `Ctrl+C` ir `Ctrl+Z`.
