# 06 SSH ir raktai

Data: 2026-11-19 (ketvirtadienis)

## Klasės darbas

3 val. Skaidrėse **N** rodo pastabas. Kiekviena tema: skaidrės → jūsų demonstracija kitu pavyzdžiu → užduotis Teams'e → mokiniai daro savo. Užduotys eina viena gija: raktų pora → GitHub → teisės → merge konfliktas ir Pull Request.

1. Pasitikrinimas po 05 (~10 min): parodykite 05 užduotis (komandos yra pačiose užduotyse); kam neveikė `curl`, `lsof` ar PR, kartu randame priežastį
2. SSH pakartojimas ir raktų pora (~35 min): [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/06%20SSH%20ir%20raktai/skaidres.html), 1–6 skaidrės; ed25519, `-f`, teisės 700 ir 600
3. Pertrauka (~15 min)
4. Raktas GitHub'e ir `config` (~25 min): skaidrė 7; `ssh -T`, pirštų antspaudas, `git remote set-url`
5. Merge konfliktas (~20 min), tada užduotys: skaidrės 8–10; žymekliai, `git merge --abort`
6. Kita paskaita: Git pagrindai

Nuorodos: [GitHub SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh), [pirštų antspaudai](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints)

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `4-uzduotis.md`. Skelbiate Teams'e po vieną: pirma demonstracija, tada darbas. Privataus rakto niekada nerodote ir nesiunčiate, tik `.pub`. Komandos yra pačiose užduotyse. Atskiro sprendimo failo nėra. Lapas: `uzduotys/ssh komandos.md`.

## Pamokos eiga (dėstytojui)

Patikrinta anksčiau: `ssh-keygen -t ed25519` (teisės `-rw-------` ir `-rw-r--r--`) ir merge konfliktas (`CONFLICT`, žymekliai) macOS. Nepatikrinta: `ssh -T git@github.com`, klaidos tekstas dėl teisių `644`, `gh ssh-key add`, Ubuntu ir `/mnt/c`. Šiame perrašyme iš naujo nepaleista.

### Demonstracijos žingsniai

Rodykite kitu pavyzdžiu: raktas `~/.ssh/id_ed25519_demo`, konfliktui failas `pastabos.txt`. Raktų nelaikykite `/mnt/c`. `ssh-copy-id` yra tik Ubuntu, kurse jo nenaudojame. Kasdienių darbų netikrinate.
