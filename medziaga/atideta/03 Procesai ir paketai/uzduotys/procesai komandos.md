# Procesai ir paketai: komandos

## Procesai
- `KOMANDA &` → paleidžia procesą fone (pvz. `sleep 300 &`)
- `jobs` → procesai, paleisti šiame lange
- `ps aux` → process status: visi veikiantys procesai (PID yra antras stulpelis)
- `ps aux | grep VARDAS` → randa procesą pagal vardą
- `kill PID` → prašo procesą baigti
- `kill -9 PID` → priverstinai nutraukia
- `Ctrl+C` → nutraukia procesą šiame lange
- `Ctrl+Z` → pristabdo procesą

## Aplinkos kintamieji
- `export VARDAS=reikšmė` → nustato kintamąjį šiam langui
- `echo $VARDAS` → parodo kintamojo reikšmę
- `env` → environment: visi aplinkos kintamieji
- `VARDAS=reikšmė ./SKRIPTAS.sh` → kintamasis tik vienai komandai
- `echo $PATH` → aplankai, kuriuose ieškoma komandų
- `which KOMANDA` → kur komanda yra

## Paketai
- `sudo apt update` → atnaujina paketų sąrašą (Ubuntu / WSL)
- `sudo apt install PAKETAS` → įdiegia paketą (Ubuntu / WSL)
- `dpkg -s PAKETAS` → ar paketas įdiegtas (Ubuntu / WSL)
- `brew update` → atnaujina paketų sąrašą (Mac)
- `brew install PAKETAS` → įdiegia paketą (Mac)
- `brew list PAKETAS` → ar paketas įdiegtas (Mac)
- `PROGRAMA --version` → programos versija
