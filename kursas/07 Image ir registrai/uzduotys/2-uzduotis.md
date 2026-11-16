# 2 užduotis: Sluoksniai

**1.** **Tikslas:** pamatyti, iš kokių sluoksnių sudarytas image.

**2.** Pažiūrėti `nginx` sluoksnius:

- `docker history nginx:1.27`
- Turi būti: kiekviena eilutė yra sluoksnis, viršuje naujausias

**3.** Palyginti su mažesniu image:

- `docker history hello-world`
- Turi būti: eilučių mažiau nei `nginx`

**4.** Užrašyti sau vieną sakinį: tag'as `1.27` fiksuoja versiją, `latest` gali pasikeisti be jūsų žinios. Į `git-bandymas` to daryti nereikia.

**5.** **Pateikimas:** `docker history nginx:1.27` nuotrauka.

Jei užstrigote, pasižiūrėkite `docker komandos.md`.
