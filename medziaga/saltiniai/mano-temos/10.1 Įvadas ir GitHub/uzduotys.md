# 10.1 Užduotys

Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje arba klauskite LLM, ir užsirašykite, kas padėjo. Nuorodos yra pamoka.md.

## Užduotis

Laikas: ~1,5 val.

Sukurti repozitoriją devops-lab ir per šaką bei pull request įkelti į ją savo Bash scenarijų su README.

Darbai:

1. Prieš pirmą commit nustatyti `user.name` ir `user.email`
2. GitHub'e sukurti repozitoriją `devops-lab` su `README.md`
3. Prisijungimas prie GitHub iš terminalo veikia (pagal oficialią dokumentaciją; žingsnių čia nėra, tik tikslas): `gh auth status` arba `ssh -T git@github.com` rodo jūsų vartotojo vardą
4. `scripts/` aplanke įkelti Bash scenarijų; `README.md` aprašo, ką daro ir kaip paleisti (2–3 sakiniai). Jei OS kurso Bash scenarijaus neturite, DI pagalba parašykite trumpą naują (pvz. patikrina laisvą disko vietą) ir paaiškinkite, ką jis daro
5. README gale parašyti numeruotą sąrašą „nuo kodo iki serverio“ (5–7 žingsniai) ir 2 lūžimo vietas su vienu sakiniu kodėl; piešti schemos nereikia (to mokysimės 10.2)
6. Bent 2 commit'us įkelti per **šaką ir pull request** (ne tiesiai į `main`) ir pull request sulieti (**Merged**)
7. Patikrinti, kad scenarijuje ir repozitorijoje nėra slaptažodžių, raktų ar realių IP
8. Jei naudotas DI: parašyta, ką paklausėte ir kaip patikrinote atsakymą
9. Pateikimas: repozitorijos nuoroda ir sulieto pull request nuoroda (arba print-screen su žyma **Merged**)

**Pavyzdys:**

1. Failai GitHub repozitorijoje:

   ```
   devops-lab/
   ├── README.md
   └── scripts/
       └── mano-skriptas.sh
   ```

2. Terminale, jūsų kompiuteryje, `git log --oneline` po sulieto PR:

   ```
   a1b2c3d Merge pull request #1 from vardas/pirma-saka
   f7e8d9c Papildytas README
   e4f5a6b Pridėtas Bash scenarijus ir README
   9c8d7e6 Initial commit
   ```

## Papildomos užduotys

1. Antra šaka ir antras pull request (pakeiskite scenarijų)
2. `.gitignore` su eilute `*.log`: paaiškinkite, kam jis skirtas
3. README paviešinti per [GitHub Pages](https://docs.github.com/en/pages)

## Iki kito susitikimo

1. Patikrinkite, kad `git push` veikia iš jūsų kompiuterio
2. Patikrinkite, ar BIOS/UEFI įjungta virtualizacija (Intel VT-x arba AMD-V), ir užsirašykite rezultatą (reikės 11.3)
