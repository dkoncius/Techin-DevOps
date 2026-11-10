# 10.1 Kurso pradžia, DevOps samprata ir GitHub

## Klasės darbas

1. Kurso eiga ir vertinimas:
   1. 7 etapai, po kiekvieno atsiskaitymas (testas + praktika)
   2. Pirmas atsiskaitymas: 2026-11-26
   3. Taisyklės: pakeitimai per šaką ir pull request, DI leidžiamas, bet reikia mokėti paaiškinti
2. Kas yra DevOps ir ką daro junioras:
   1. [roadmap.sh/devops](https://roadmap.sh/devops) - kelias ir temos vienoje diagramoje
   2. Ką matysime per metus: kodas → testai → konteineris → Kubernetes → serveris
3. Demonstracija: tas pats puslapis veikia lokaliai ir debesyje
   1. Du naršyklės langai: LOCAL ir AZURE
   2. Kas įvyko tarp `git push` ir veikiančio puslapio (šią grandinę išardysime per kursą)
4. Git ir GitHub: nauja šiandien yra `clone`, šaka ir pull request
   1. [GitHub Hello World](https://docs.github.com/en/get-started/start-your-journey/hello-world) - pirmas repozitorijos, šakos ir PR ciklas
   2. [Learn Git Branching](https://learngitbranching.js.org/) - šakų žaidimas naršyklėje
   3. [Pro Git knyga](https://git-scm.com/book/en/v2) - išsami dokumentacija (lietuviškai nėra)
   4. Jau žinote: `init`, `add`, `commit`, `push`, `pull`, `status`, `log`
   5. Trys nauji žodžiai:
      1. **clone**: visos GitHub repozitorijos kopija jūsų kompiuteryje
      2. **šaka (branch)**: atskira darbo linija, `main` lieka nepaliesta, kol pakeitimas nepatikrintas
      3. **pull request (PR)**: prašymas sulieti šaką į `main`, kur kiti mato ir komentuoja pakeitimus
   6. Vardo ir el. pašto nustatymas Git'ui (`user.name`, `user.email`): kodėl to reikia
   7. Dėstytojas parodo visą ciklą terminale: clone → šaka → pakeitimas → commit → push → PR → sulieti → pull (~15 min)
5. Prisijungimas prie GitHub iš terminalo:
   1. `gh auth login` arba SSH raktas: [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh); raskite skyrių apie SSH rakto sukūrimą ir pridėjimą; tikslas: `ssh -T git@github.com` atsako jūsų vartotojo vardu
   2. GitHub paprasto slaptažodžio nebepriima; raktų ir kodų niekam nesiųskite
6. DI taisyklės (~15 min):
   1. Ką galima: paaiškinti klaidą, pasiūlyti komandą
   2. Kaip tikrinti: paleisti, perskaityti, patikrinti dokumentacijoje
   3. Ko niekada nekelti į DI ar į Git: slaptažodžių, raktų, tokenų
7. Kita paskaita: IS platformos ir jų gyvavimo ciklas (Excalidraw schema), [Excalidraw](https://excalidraw.com/)
