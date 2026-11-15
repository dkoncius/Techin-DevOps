# 07 Git pagrindai

Data: 2026-11-23 (pirmadienis)

## Klasės darbas

3 val. Skaidrėse **N** rodo pastabas. Kiekviena tema: skaidrės → jūsų demonstracija kitu pavyzdžiu → užduotis Teams'e → mokiniai daro savo. Užduotys eina viena gija: `diff` ir du commit'ai → `stash` ir `revert` → konfliktas po `pull` → grafikas ir Pull Request.

1. Pasitikrinimas po 06 (~10 min): parodykite 06 užduotis (komandos yra pačiose užduotyse); kam neveikė SSH ar konfliktas, kartu randame priežastį
2. Ką jau mokate ir geri commit'ai (~25 min): [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/07%20Git%20pagrindai/skaidres.html), 1–4 skaidrės; `git diff`, `git diff --staged`, `git show`
3. Laikinas darbas ir atšaukimas (~25 min): skaidrė 5; `git stash`, `git revert`
4. Pertrauka (~15 min)
5. `fetch`, `pull` ir konfliktas (~30 min), tada užduotys: skaidrės 6–8; antra kopija, žymekliai, grafikas
6. Kita paskaita: GitHub Pull Request, peržiūra ir `main` apsauga

Nuoroda: [Pro Git: Recording Changes](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository)

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `4-uzduotis.md`. Skelbiate Teams'e po vieną: pirma demonstracija, tada darbas. Komandos yra pačiose užduotyse. Atskiro sprendimo failo nėra. Jei užstringa: [Git cheat sheet](https://git-scm.com/cheat-sheet).

## Pamokos eiga (dėstytojui)

Patikrinta anksčiau: `git stash` / `stash pop`, `git revert --no-edit HEAD` ir `git pull` konfliktas tarp dviejų kopijų macOS su lokalia nuotoline repozitorija. Nepatikrinta: tas pats su GitHub ir WSL, `git clone` per SSH ir HTTPS. Šiame perrašyme iš naujo nepaleista. `git config` paleiskite tik mokinių kompiuteriuose, ne savo.

### Demonstracijos žingsniai

Rodykite kitu pavyzdžiu: failai `a.txt` ir `b.txt`, šaka `bugFix`, antra kopija `demo-kopija`. `git revert` atidaro redaktorių be `--no-edit`. `git reset --hard` kaip būdo atšaukti nerodote. Kasdienių darbų netikrinate.
