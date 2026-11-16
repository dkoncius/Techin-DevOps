# 1 užduotis: Bash pasikartojimas

**1.** **Tikslas:** prieš rašant skriptą terminale pasikartoti tai, ką jau mokate: kintamuosius, `command -v`, išėjimo kodą ir failų bei aplankų patikrą.

**2.** Pasiruošimas:

- Eikite į projektą `git-bandymas`, perjunkite į `main` ir atsisiųskite naujausius pakeitimus
- Patikrinkite, kad aplanke `uzrasai` yra `serveriai.txt`, o `scripts` yra `ataskaita.sh`
- Jei jų nėra, 02 pamokos Pull Request dar nesulietas: sulieskite jį GitHub'e ir vėl atsisiųskite pakeitimus
- Sukurkite šaką `pamoka-03`
- Turi būti: matosi `serveriai.txt` ir `ataskaita.sh`, žvaigždutė prie `pamoka-03`

**3.** Kintamieji:

- Kintamajam `irankis` priskirkite `git` ir išveskite `Tikrinu: git`
- Kintamojo reikšmę pakeiskite į `python3` ir vėl išveskite `Tikrinu: python3`
- Turi būti: pirma `Tikrinu: git`, tada `Tikrinu: python3`

**4.** Įrankio patikra ir išėjimo kodas:

- Su `command -v` pažiūrėkite, ar `irankis` (dabar `python3`) yra, ir iškart išveskite paskutinės komandos išėjimo kodą (`kodas: ...`)
- Tą patį pakartokite su `irankis` reikšme `neegzistuoja`
- Turi būti: pirmą kartą kelias iki `python3` ir `kodas: 0`, antrą kartą tik `kodas: 1`
- Kodą rodykite iškart po komandos, ne po kitos

**5.** Failai ir aplankai:

- Su `[ -f ... ]` patikrinkite, ar yra `uzrasai/serveriai.txt`, o su `[ -d ... ]`, ar yra aplankas `scripts`, ir po kiekvieno parodykite išėjimo kodą
- Tą patį pakartokite su failu `nera.txt` ir aplanku `nera`
- Turi būti: esantiems `kodas: 0`, neesantiems `kodas: 1`

**6.** Argumentai:

- Su `set -- ona jonas` nustatykite du argumentus ir išveskite pirmą argumentą bei jų skaičių
- Turi būti: `ona` ir `2`

**7.** **Pateikimas:** terminalo nuotrauka su žingsnių 3–6 rezultatais.

Jei užstrigote, pasižiūrėkite `bash komandos.md` ir `git komandos.md`.
