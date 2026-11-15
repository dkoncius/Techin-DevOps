# 5 užduotis: Pull Request

1. **Tikslas:** pateikti šakos `pamoka-02` darbą per Pull Request ir sujungti į `main`.
2. Patikrinkite, kad užrašuose nėra slaptų reikšmių: `cd ~/Desktop/devops/git-bandymas`, `grep -rniE "password|token|secret|key" uzrasai scripts`. Neturi rasti slaptažodžio, rakto ar tokeno.
3. Istorijoje turi būti keturi commit'ai: „Pradėtas terminalas.md“, „Pridėtos pastabos ir paieškos rezultatai“, „Pridėtas ataskaita.sh“, „Pridėta ataskaita“. Kaip pažiūrėti: Git cheat sheet.
4. Nusiųskite šaką `pamoka-02` (01 pamokoje darėte `git push -u origin`). Būsena seka `origin/pamoka-02`.
5. GitHub'e atidarykite Pull Request iš `pamoka-02` į `main`. Pavadinimas „Terminalas“. Description: vienas sakinys, ką pakeitėte. **Files changed** rodo `uzrasai` ir `scripts`. Tada **Merge pull request**. Terminale tą patį daro `gh pr create --title "Terminalas" --body "Pridėti užrašai, paieška ir ataskaita.sh."`, tada `gh pr merge --merge`.
6. Grįžkite į `main` ir atsisiųskite sulietą darbą. Komandos yra Git cheat sheet (`switch`, `pull`). `ls` rodo `scripts/ataskaita.sh`, `ataskaita.txt` ir `uzrasai.md`.
7. Ištrinkite šaką kompiuteryje (Git cheat sheet, „delete a branch“) ir GitHub'e: `git push origin --delete pamoka-02`. Šakos sąraše liko tik `main`.
8. **Pateikimas:** sulieto Pull Request nuotrauka ir GitHub nuotrauka, kur liko tik `main`.

Jei užstrigote, pasižiūrėkite `linux komandos.pdf`. Git komandoms: [Git cheat sheet](https://git-scm.com/cheat-sheet).
