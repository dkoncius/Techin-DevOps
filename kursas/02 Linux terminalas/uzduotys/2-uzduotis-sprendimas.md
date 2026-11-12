# 2 užduotis, sprendimas (dėstytojui): Navigacija ir failai

Numeriai: dalis ir žingsnis kaip užduotyje (`2-uzduotis.md`). Rodoma su `docs/pastabos` ir `devops-projektas`; demonstracijoje naudokite kitą pavyzdį.

Pirma dalis, 1–6. Judėjimas:

```bash
cd ~/devops/devops-projektas
pwd
ls -la
cd static
cd ..
cd ~/devops
cd ~/devops/devops-projektas
```

Antra dalis, 1–3. Aplankai ir failai:

```bash
mkdir -p docs/pastabos/archyvas
cd docs/pastabos
touch terminalas.txt git.txt komandos.txt
ls
```

Trečia dalis, 1–4. Kopijavimas, pervadinimas, perkėlimas:

```bash
cp terminalas.txt git.txt archyvas
ls archyvas
mv archyvas/git.txt archyvas/git-senas.txt
mv archyvas/git-senas.txt .
ls -R ..
```

Trečia dalis, 5. Papildomai: `man ls` (išeiti `q`); `ls -lS static`.

Dažna klaida: tarpas aplanko varde be kabučių; `cp` / `mv` be paskirties aplanko; `cd` ne iš to aplanko (patikrinti `pwd`, `ls`, naudoti Tab).
