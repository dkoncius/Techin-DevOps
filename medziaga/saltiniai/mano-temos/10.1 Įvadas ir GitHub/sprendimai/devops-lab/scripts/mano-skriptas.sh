#!/usr/bin/env bash
# Patikrina laisvą disko vietą nurodytame kelyje ir ją išveda.
# Naudojimas: bash scripts/mano-skriptas.sh [kelias]   (numatytasis kelias: /)

# Sustoti, jei kuri nors komanda nepavyksta arba naudojamas nenustatytas kintamasis
set -eu

# Kelias iš pirmo argumento; jei argumento nėra, tikriname šakninę sistemą
KELIAS="${1:-/}"

# Kelias turi egzistuoti
if [ ! -e "$KELIAS" ]; then
  echo "Klaida: kelias '$KELIAS' neegzistuoja" >&2
  exit 1
fi

# df -Pk: pastovus (POSIX) formatas, dydžiai kilobaitais. Antra eilutė turi duomenis
# Naudojami stulpeliai: 2 = iš viso, 4 = laisva, 5 = užimta procentais (stulpelio 3 nenaudojame)
DUOMENYS=$(df -Pk "$KELIAS" | awk 'NR==2 {print $2, $4, $5}')
VISO_KB=$(echo "$DUOMENYS" | awk '{print $1}')
LAISVA_KB=$(echo "$DUOMENYS" | awk '{print $2}')
UZIMTA_PROC=$(echo "$DUOMENYS" | awk '{print $3}')

# Kilobaitus verčiame į gigabaitus su vienu skaičiumi po kablelio
VISO_GB=$(awk -v kb="$VISO_KB" 'BEGIN {printf "%.1f", kb/1024/1024}')
LAISVA_GB=$(awk -v kb="$LAISVA_KB" 'BEGIN {printf "%.1f", kb/1024/1024}')

echo "Kelias:       $KELIAS"
echo "Iš viso:      ${VISO_GB} GB"
echo "Laisva vieta: ${LAISVA_GB} GB"
echo "Užimta:       ${UZIMTA_PROC}"
