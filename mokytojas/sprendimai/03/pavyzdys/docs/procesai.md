# Procesai ir paketai

## Procesas

`sleep 300 &` paleido procesą fone. `ps | grep sleep` parodė jo PID. `kill <PID>` jį sustabdė, `ps` daugiau jo nerodo.

## Skripto išvestis

Be kintamojo:

```
PROJEKTO_VARDAS: nenustatyta
Proceso eilučių ps išvestyje: 543
```

Su `PROJEKTO_VARDAS=mano`:

```
PROJEKTO_VARDAS: mano
Proceso eilučių ps išvestyje: 543
```

(Skaičius priklauso nuo kompiuterio, pavyzdinė išvestis.)

## Paketas

| Veiksmas | Mac | Ubuntu (WSL) |
|---|---|---|
| Įdiegti | `brew install tree` | `sudo apt update` ir `sudo apt install tree` |
| Versija | `tree --version` | `tree --version` |
| Ar įdiegtas | `brew list tree` | `dpkg -s tree` |

## DB_HOST

Kodas paima kintamąjį `DB_HOST` iš aplinkos; jei jo nėra, naudoja `"localhost"`. Nieko nenustačius `DB_HOST` yra `localhost`, po `export DB_HOST=duombaze` yra `duombaze`.

## Kodėl slaptažodis kintamajame

Kode jis patektų į Git ir į visų žmonių kopijas; kintamasis lieka tik toje aplinkoje, kur programa paleista.
