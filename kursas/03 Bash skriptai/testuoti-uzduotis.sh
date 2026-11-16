#!/usr/bin/env bash
# Dėstytojui: paruošia bandomąjį git-bandymas tokioje būsenoje, kokia yra po 02 pamokos,
# kad galėtumėte išbandyti 03 pamokos užduotis. Paleidus iš naujo viskas atstatoma.
#
# Naudojimas:
#   bash testuoti-uzduotis.sh                       -> ~/Desktop/devops/git-bandymas-test
#   bash testuoti-uzduotis.sh /kelias/iki/aplanko   -> kitas aplankas
#
# Užduotyse parašyta `cd ~/Desktop/devops/git-bandymas`: išbandant rašykite git-bandymas-test.
# Tikrasis git-bandymas neliečiamas: trinamas tik aplankas su žyma .git/test-sandbox.
# `origin` yra vietinė repozitorija (be GitHub), todėl `gh pr create` neveiks:
# 4 užduotyje PR pakeiskite į `git switch main && git merge pamoka-03`.
set -euo pipefail

TARGET="${1:-$HOME/Desktop/devops/git-bandymas-test}"
ORIGIN="$TARGET.origin.git"
PARENT="$(dirname "$TARGET")"

if [ -e "$TARGET" ] && [ ! -f "$TARGET/.git/test-sandbox" ]; then
  echo "Atsisakau: $TARGET nėra bandomasis (nėra žymos .git/test-sandbox). Pasirinkite kitą aplanką." >&2
  exit 1
fi

rm -rf "$TARGET" "$ORIGIN"
mkdir -p "$PARENT"

# slaptas.txt (02 pamokos 2 užduotis): ataskaita.sh ieško šio žodžio. Esamo nekeičiame.
[ -f "$PARENT/slaptas.txt" ] || echo "db1" > "$PARENT/slaptas.txt"

git init -q --bare -b main "$ORIGIN"
git init -q -b main "$TARGET"
cd "$TARGET"
git config user.name "Testas"
git config user.email "testas@example.com"
git config commit.gpgsign false
git remote add origin "$ORIGIN"
touch .git/test-sandbox

# 01 pamoka
echo "Pastabos" > pastabos.txt
echo "Idėjos" > idejos.txt
git add pastabos.txt idejos.txt
git commit -qm "Pradiniai failai"
git push -q -u origin main

# 02 pamoka: šaka pamoka-02, sulieta į main
git switch -q -c pamoka-02
mkdir -p uzrasai scripts
cat > uzrasai/serveriai.txt <<'EOS'
web1 192.168.1.10
db1 192.168.1.20
app1 192.168.1.30
backup 192.168.1.40
EOS
git add uzrasai/serveriai.txt
git commit -qm "Sutvarkyti serveriai.txt"
cat > scripts/ataskaita.sh <<'EOS'
#!/usr/bin/env bash
echo "Aplankas: $(basename "$(pwd)")"
echo "Eilutės:"
grep -n -f ../slaptas.txt uzrasai/serveriai.txt
EOS
chmod +x scripts/ataskaita.sh
git add scripts/ataskaita.sh
git commit -qm "Pridėtas ataskaita.sh"
git push -q -u origin pamoka-02
git switch -q main
git merge -q --no-ff pamoka-02 -m "Merge pull request #1 from pamoka-02"
git push -q origin main
git branch -q -d pamoka-02
git push -q origin --delete pamoka-02

echo "Paruošta: $TARGET"
git status -sb
git log --oneline
echo "---"
echo "Pradėkite nuo lapo bash komandos.md 11 skyriaus (paruošimas, šaka pamoka-03): cd $TARGET"
