# 3 užduotis: Dydis ir trynimas

**1.** **Tikslas:** palyginti dydžius ir ištrinti nenaudojamą image.

**2.** Atsisiųsti mažą image:

- `docker pull alpine:3.20`

**3.** Palyginti dydžius:

- `docker images`
- Turi būti: `alpine` SIZE mažesnis už `nginx`

**4.** Ištrinti `alpine`:

- `docker image rm alpine:3.20`
- `docker images alpine`
- Turi būti: `alpine` nebėra, `nginx:1.27` lieka

**5.** **Pateikimas:** `docker images` nuotrauka po trynimo, kur `alpine` nėra, o `nginx` yra.

Jei užstrigote, pasižiūrėkite `docker komandos.md`.
