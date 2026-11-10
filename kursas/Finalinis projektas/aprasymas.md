# Finalinis projektas: užduotys pagal lygius

Projektas individualus (galima daryti poroje, gynimas individualus). Kiekvienas lygis apima ankstesnio lygio užduotis. Numeracija ištisinė.

## Minimalus lygis (išlaikyta)

1. Programa su duomenų baze, veikia `GET /health`.
2. Programa ir DB paleidžiamos viena komanda per Docker Compose.
3. Kodas GitHub repozitorijoje; pakeitimai per šaką ir pull request.
4. README: kaip paleisti ir patikrinti.
5. Bent 3 automatiniai testai.
6. GitHub Actions kiekvienam PR paleidžia testus ir surenka atvaizdą.
7. Atvaizdas keliamas į GHCR su žyme `sha-<commit>`.
8. Helm chart; programa veikia lokaliame Kubernetes.

## Pažengęs lygis (+ minimalus)

9. Argo CD diegia programą iš Git (commit → CI → Argo CD → Kubernetes).
10. CI po build'o pats atnaujina `image.tag` Git'e (`[skip ci]`).
11. CI: Trivy skanavimas.
12. CI: Gitleaks; Git'e nėra paslapčių.
13. Paslaptys laikomos Kubernetes Secret, ne values faile.
14. Grafana skydelis bent su 4 metrikomis.
15. DB atsarginė kopija ir atstatymo patikra (eilučių skaičius prieš ir po).
16. Programa veikia bendrame k3s serveryje.

## Profesionalus lygis (+ pažengęs)

17. Azure infrastruktūra (VM, tinklas, NSG) sukurta per Terraform.
18. k3s įdiegtas automatiškai (cloud-init arba Ansible).
19. Ingress + TLS; adresas atsidaro per `https`.
20. Argo CD `automated` + `selfHeal`; drift demonstracija.
21. Bent 2 perspėjimai (alerts) su patikra, kad suveikia.
22. Rollback į ankstesnę versiją per Git.
23. Runbook (1 puslapis): paleidimas, gedimas, atstatymas.
24. Kaštų kontrolė: biudžetas, `deallocate`/`destroy`, kaina įrašyta README.

## Gynimas (visiems lygiams)

1. Pristatyti grandinę nuo commit iki veikiančio serverio (~15 min).
2. Atlikti pakeitimą per PR ir parodyti, kaip jis pasiekia serverį.
3. Rasti ir pataisyti dėstytojo sugadintą komponentą.
4. Paaiškinti bet kurią savo kodo dalį; jei naudotas DI, parodyti prompt'us ir patikros žingsnius.
5. Parodyti oficialios dokumentacijos vietą, pagal kurią išsprendei problemą.
