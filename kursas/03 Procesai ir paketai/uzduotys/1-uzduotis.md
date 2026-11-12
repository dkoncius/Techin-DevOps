# 1 užduotis: Procesai

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje ir užsirašykite, kas padėjo. Dirbtinio intelekto šiose užduotyse nenaudojame. Galite remtis ankstesnio dėstytojo pateikta Git komandų santrauka (`git komandos.pdf`, Teams'e). Užduotys eina viena gija ir visos vyksta jūsų `devops-projekte` (`~/devops/devops-projektas`).

**Tikslas:** Pamatyti savo procesą, rasti jo PID ir jį sustabdyti.

**Pirma dalis: nauja šaka**

1. Eikite į savo `devops-projektas`, persijunkite į `main` ir atnaujinkite jį iš GitHub.
2. Sukurkite šaką `pamoka-03` ir persijunkite į ją.

**Antra dalis: procesas fone**

1. Paleiskite komandą `sleep 300` fone.
2. Pažiūrėkite fone veikiančių darbų sąrašą.
3. Suraskite savo `sleep` proceso PID (per procesų sąrašą ir `grep`).
4. Sustabdykite procesą pagal PID.
5. Įsitikinkite, kad proceso nebėra.

**Trečia dalis: užrašai ir commit**

1. Atidarykite iš terminalo redaktoriuje `docs/procesai.md` (aplanką `docs` sukurkite, jei jo nėra) ir parašykite antraštę `# Procesai ir paketai` ir skyrių `## Procesas` su savo komandomis ir PID.
2. Pridėkite `docs` ir padarykite commit su žinute „Pradėtas procesai.md“.
3. **Papildomai:** paleiskite `sleep 300` dar kartą, sustabdykite jį ne per `kill`, o klaviatūros sparčiuoju klavišu, ir paaiškinkite skirtumą tarp `Ctrl+C` ir `Ctrl+Z`.
