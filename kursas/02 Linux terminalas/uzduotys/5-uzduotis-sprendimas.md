# 5 užduotis, sprendimas (dėstytojui): Pull Request

Numeriai atitinka užduoties žingsnius (`5-uzduotis.md`). Rodoma su `docs/pastabos` ir `devops-projektas`; demonstracijoje naudokite kitą pavyzdį.

2–4. Patikra ir siuntimas:

```bash
cd ~/devops/devops-projektas
grep -rniE "password|token|secret|key" docs scripts
git log --oneline
git push -u origin pamoka-02
```

`grep` neturi rasti slaptų reikšmių (žodis gali pasitaikyti tik tekste, ne kaip reikšmė).

5–8. GitHub'e (naršyklėje): **Compare & pull request** → pavadinimas „Terminalas“ → aprašymas → **Files changed** → **Merge pull request**. Alternatyva terminale: `gh pr create --title "Terminalas" --body "Pridėtos pastabos, paieškos rezultatai ir ataskaita.sh."`, tada `gh pr merge --merge`.

9–10. Atnaujinimas ir patikra:

```bash
git switch main
git pull
ls docs scripts
git log --oneline
```

11–12. Šakos trynimas:

```bash
git branch -d pamoka-02
git push origin --delete pamoka-02
```

(GitHub'e galima ir mygtuku **Delete branch** po sujungimo.)

Dažna klaida: PR sulietas GitHub'e, bet `main` kompiuteryje neatnaujintas (`git pull`); `git branch -d` atsisako, jei `main` neatnaujintas.
