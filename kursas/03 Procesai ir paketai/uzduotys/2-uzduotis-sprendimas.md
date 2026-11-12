# 2 užduotis, sprendimas (dėstytojui): Aplinkos kintamasis skripte

Numeriai atitinka užduoties žingsnius (`2-uzduotis.md`). Demonstracijoje naudokite kitą pavyzdį nei mokinių.

2–3. Skriptas:

```bash
mkdir -p scripts
cat > scripts/aplinka.sh <<'EOS'
#!/usr/bin/env bash
echo "PROJEKTO_VARDAS: ${PROJEKTO_VARDAS:-nenustatyta}"
echo "Proceso eilučių ps išvestyje: $(ps -e | wc -l | tr -d ' ')"
EOS
chmod +x scripts/aplinka.sh
```

4–5. Be kintamojo ir su kintamuoju vienai komandai (`>` perrašo, `>>` prideda):

```bash
./scripts/aplinka.sh > docs/aplinka.txt
PROJEKTO_VARDAS=mano ./scripts/aplinka.sh >> docs/aplinka.txt
cat docs/aplinka.txt
```

6–7. Kintamasis visam langui ir naujas langas:

```bash
export PROJEKTO_VARDAS=visas
./scripts/aplinka.sh
```

Naujame lange: `cd ~/devops/devops-projektas`, `echo $PROJEKTO_VARDAS` (tuščia), `./scripts/aplinka.sh` rodo „nenustatyta“. Greitas pakaitalas klasėje: `env -u PROJEKTO_VARDAS ./scripts/aplinka.sh`.

8–9. `PATH` ir komandos vieta:

```bash
echo $PATH
which ls
```

10–11. Du commit'ai:

```bash
git add scripts/aplinka.sh
git commit -m "Pridėtas aplinka.sh"
git add docs
git commit -m "Pridėta aplinkos išvestis"
```

Dažna klaida: `export` viename lange, skriptas kitame; skriptas be `x` (`Permission denied`, žr. 02).
