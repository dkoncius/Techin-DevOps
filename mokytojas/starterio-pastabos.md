# Pastabos būsimam `devops-projektas` (GitHub template)

Šios pastabos skirtos starterio repo kūrimui. Jos nėra viešos (`mokytojas/` niekada nepublikuojamas).

## Eilučių pabaigos (Windows ir WSL)

Mokiniai dirba WSL2 Ubuntu ir Mac. Kad `.sh` failai neturėtų CRLF (Windows redaktoriai dažnai jį prideda, ir tada skriptas meta `bad interpreter`), `devops-projektas` šaknyje turi būti failas `.gitattributes` su eilute:

```
*.sh text eol=lf
```

Tą pačią taisyklę jau turi `kursas/.gitattributes`.

## Kitos pastabos

1. Aplinka: bash 3.2 (macOS) ir Ubuntu (WSL); skriptuose venkite `sed -i`, `readlink -f`, `grep -P`, `date -d`, `stat -c`.
2. Reikalavimai starteriui: žr. `programa/kurso-planas.md`, 9 skyrių.
