# 5 užduotis, sprendimas (dėstytojui): Pull Request

Numeriai: dalis ir žingsnis kaip užduotyje (`5-uzduotis.md`). Rodoma su `docs/pastabos` ir `devops-projektas`; demonstracijoje naudokite kitą pavyzdį.

Pirma dalis, 1–3. Patikra ir siuntimas:

```bash
cd ~/devops/devops-projektas
grep -rniE "password|token|secret|key" docs scripts
git log --oneline
git push -u origin pamoka-02
```

`grep` neturi rasti slaptų reikšmių (žodis gali pasitaikyti tik tekste, ne kaip reikšmė).

Antra dalis, 1–4. GitHub'e (naršyklėje): **Compare & pull request** → pavadinimas „Terminalas“ → aprašymas → **Files changed** → **Merge pull request**. Alternatyva terminale: `gh pr create --title "Terminalas" --body "Pridėtos pastabos, paieškos rezultatai ir ataskaita.sh."`, tada `gh pr merge --merge`.

Trečia dalis, 1–2. Atnaujinimas ir patikra:

```bash
git switch main
git pull
ls docs scripts
git log --oneline
```

Trečia dalis, 3–4. Šakos trynimas:

```bash
git branch -d pamoka-02
git push origin --delete pamoka-02
```

(GitHub'e galima ir mygtuku **Delete branch** po sujungimo.)

Dažna klaida: PR sulietas GitHub'e, bet `main` kompiuteryje neatnaujintas (`git pull`); `git branch -d` atsisako, jei `main` neatnaujintas.
