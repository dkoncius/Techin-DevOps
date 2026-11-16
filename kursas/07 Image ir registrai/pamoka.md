# 07 Image ir registrai

Data: 2026-11-24 (antradienis)

## Klasės darbas

Anksčiau mokėsi: 06 pamokoje `docker run`, `ps`, `logs`, `exec`, `stop`, `rm`. Image, tag'ų, sluoksnių ir registro dar nemokėsi.

Prisiminsime konteinerių paleidimą, o mokysimės, kas yra image ir tag'as, sluoksniai ir dydis, kaip ištrinti nereikalingą image ir kaip prisijungti prie registro.

1. Tag'as, tada Užduotis 1: [skaidrės](https://raw.githack.com/dkoncius/Techin-DevOps/main/kursas/07%20Image%20ir%20registrai/skaidres.html), skaidrė 2. Demonstracijoje `httpd:2.4`, ne `nginx:1.27`
2. Sluoksniai, tada Užduotis 2: skaidrė 3
3. Pertrauka
4. Dydis ir trynimas, tada Užduotis 3: skaidrė 4. Demonstracijoje trinate `busybox:1.36`, ne `alpine`
5. Registras, tada Užduotis 4: skaidrė 5. Mokiniai nieko neįkelia ir slaptažodžio nerašo. Ekrane rodykite tik `Login Succeeded`, ne tokeną
6. Kita paskaita: pasiruošimas atsiskaitymui. 2026-11-25 paskaitos nėra

## Užduotys

Užduotys yra `uzduotys/1-uzduotis.md` … `4-uzduotis.md`. Lapas: `uzduotys/docker komandos.md`.

## Pamokos eiga (dėstytojui)

Nepatikrinta: `docker pull`, `history` ir `login` šiam perrašymui nepaleisti. Į medžiagą tokeno nerašykite.

### Demonstracijos žingsniai

1. `docker pull httpd:2.4`, `docker images httpd`.
2. `docker history httpd:2.4`.
3. `docker pull busybox:1.36`, palyginkite SIZE, `docker image rm busybox:1.36`.
4. `docker login` su savo tokenu, tada `docker logout`.
