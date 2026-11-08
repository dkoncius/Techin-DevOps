# Azure paruošimo sąrašas mokiniams (28–30 savaitė, prieš Azure paskaitas)

**Tikslas:** iki 31 savaitės (2027-04-19) kiekvienas mokinys turi veikiančią Azure prieigą, kad paskaitų metu dirbtume, o ne ieškotume paskyrų.
**Laikas:** apie 45–60 min. Užduotį atlikti namie ir parodyti rezultatą (ekrano nuotrauką ar komandų išvestį).

> Juodraštis, parašytas pagal dėstytojo etalono Azure testą (2026-11-07). Bus patikslintas, kai mokykla pasirinks prenumeratos variantą (mokyklos prenumerata arba Azure for Students).

---

## 1. Ko reikia turėti

| Dalykas | Pastaba |
|---|---|
| Mokyklinis el. paštas (techin.lt) | Prisijungimui prie Azure |
| GitHub paskyra | Kaip ir ankstesnėse temose |
| Kompiuteris su terminalu | **Linux terminalas** (kurso Linux VM arba WSL2 Windows kompiuteryje) arba macOS. Windows PowerShell netinka (žr. skyrių „Windows“) |
| Azure CLI (`az`) | Diegimas pagal jūsų sistemą (Microsoft diegimo instrukcija) |
| Terraform | Versija 1.9 ar naujesnė (prireiks 32.3 temoje) |

## 2. Žingsniai

1. **Prisijunkite prie portalo** `portal.azure.com` mokykline paskyra. Atidarykite paieškoje „Subscriptions“ ir patikrinkite, ar matote prenumeratą su būsena **Active**.
   - Jei nematote nė vienos: pasakykite dėstytojui prieš tęsdami, tai dar nėra jūsų kaltė.
2. **Prisijunkite per terminalą:**
   ```
   az login --use-device-code
   az account show
   ```
   Kodą įveskite naršyklėje su ta pačia paskyra. Kai pamatysite „Are you trying to sign in to Microsoft Azure CLI?“, spauskite **Continue**, ne Cancel.
3. **Paleiskite patikros skriptą PRIEŠ bet ką kurdami** (`azure-preflight.sh`, gausite iš dėstytojo). Jis nieko mokamo nekuria ir parodo, ar jūsų prenumerata paruošta:
   ```
   ./azure-preflight.sh
   ```
   Rezultatą (žalia / raudona) parodykite dėstytojui. Jei rodo [PROBLEMA], toliau nekurkite, kol nepasitarsite.
   - **Be `az` (tik portalas):** patikrinkite ranka. *Subscriptions → Resource providers*: `Microsoft.Compute`, `Network`, `DevTestLab` turi būti „Registered“. *Subscriptions → Usage + quotas*: vCPU riba jūsų regione. *Virtual machines → Create*: dydžių ir regionų sąraše matysite, kas prieinama.
4. **Sugeneruokite SSH raktą RSA tipo** (Azure nepriima `ed25519`):
   ```
   ssh-keygen -t rsa -b 4096 -f ~/.ssh/azure_kursas -C "azure-kursas"
   ```
   Privataus rakto (`azure_kursas`) niekada nesiųskite ir nekelkite į GitHub. Dalytis galima tik `.pub` failu.
5. **Susikurkite savo resursų grupę** (vardas: `rg-<jusu-vardas>`), jei neturite, nes dirbsite tik joje, tik kai patikra žalia:
   ```
   az group create -n rg-<jusu-vardas> -l <regionas, kurį nurodys dėstytojas> --tags owner=<vardas> course=devops
   ```
6. **„Hello“ užduotis:** sukurkite nemokamą virtualų tinklą savo resursų grupėje ir ištrinkite:
   ```
   az network vnet create -g rg-<jusu-vardas> -n vnet-hello --address-prefixes 10.10.0.0/16
   az network vnet delete -g rg-<jusu-vardas> -n vnet-hello
   ```
7. **Patikrinkite kaštų taisykles:** peržiūrėkite portale `Cost Management → Cost analysis` savo resursų grupę ir perskaitykite 3 taisykles žemiau.

## Windows naudotojams

**Taisyklė:** visas komandas (`az`, `terraform`, `ssh-keygen`, `azure-preflight.sh`) vykdykite iš **Linux terminalo**: kurso Linux VM arba **WSL2** (`wsl --install` administratoriaus PowerShell, po to perkrauti kompiuterį). Windows naudokite tik naršyklei (Azure portalas, GitHub). Tada visos šio sąrašo komandos veikia taip pat, kaip pas kitus.

| Dalykas | Windows PowerShell | Linux VM / WSL2 |
|---|---|---|
| `azure-preflight.sh` | neveikia (Bash skriptas) | veikia |
| Komandų tęsinys per `\` ir kabutės `--query` | kitaip (`` ` ``), nukopijuotos komandos lūžta | veikia kaip parašyta |
| SSH raktas | kelias `$env:USERPROFILE\.ssh`, `chmod 600` nėra, SSH skundžiasi dėl teisių | `~/.ssh`, `chmod 600 ~/.ssh/azure_kursas` |
| `az login --use-device-code` | veikia | veikia |

**WSL2 patarimai:** raktus laikykite WSL namų aplanke (`~/.ssh`), ne `/mnt/c/...` (ten neveikia failų teisės). `az` ir `terraform` diegiami WSL viduje pagal Linux instrukciją, ne Windows.

**Jei nėra nei VM, nei WSL2:** pasakykite dėstytojui prieš tęsdami, ieškosime kito būdo (pvz. Codespaces).

---

## Darbo tvarka: pirmiausia lokaliai, tada debesyje

Debesyje mokomės **tai, ką jau išbandėme lokaliai**. Tvarka kiekvienai užduočiai:

1. **Lokaliai:** paleiskite programą ir duomenų bazę savo kompiuteryje, patikrinkite logiką (pvz. `GET /health`, įrašyti ir nuskaityti duomenis).
2. **Debesyje:** paleiskite tą patį Azure ir pakartokite **tuos pačius** testus (skiriasi tik adresas).
3. **Palyginkite:** jei rezultatai skiriasi, klaida yra aplinkoje (tinklas, prieiga, dydis), ne programoje.
4. **Pirmas sinchronizavimas ar diegimas visada be trynimo** (be `prune`), ir tik po to automatizuojame.

Pavyzdys: dėstytojo etalonas davė tuos pačius atsakymus (200, 201, 201, 400, 200) lokaliai ir Azure.

---

## 3. Trys taisyklės (kad nebūtų netikėtų išlaidų)

1. **Po darbo ištrinkite resursus arba bent sustabdykite VM** (`az vm deallocate`) ir **patikrinkite portale, kad būsena „Stopped (deallocated)“**, ne tik „Stopped“. Išjungta, bet ne deallocated VM vis tiek kainuoja skaičiavimą. Sustabdyta (deallocated) VM kainuoja tik diską ir statinį IP.
2. **Statinis viešasis IP ir diskas kainuoja ir išjungus VM**, todėl pabaigoje trinkite visą resursų grupę: `az group delete -n rg-<jusu-vardas> --yes`.
3. **Nekurkite resursų už savo grupės ribų** ir nenaudokite didesnių nei nurodytų dydžių (tik B serija).

## 4. Patikros sąrašas (pažymėkite)

- [ ] Portale matau prenumeratą „Active“
- [ ] `az login` pavyko, `az account show` rodo mano prenumeratą
- [ ] `azure-preflight.sh` (arba ranka portale) rodo „viskas gerai“, o jei ne, žinau, kas ne
- [ ] Turiu RSA 4096 raktų porą
- [ ] Turiu savo resursų grupę `rg-<vardas>`
- [ ] „Hello“ užduotis atlikta, tinklas ištrintas

## 5. Dažnos klaidos ir ką daryti

| Klaida | Priežastis | Sprendimas |
|---|---|---|
| Portalas rodo „Don't have a subscription“ | Prenumerata dar nepriskirta | Pasakykite dėstytojui, nekurkite savo mokamos paskyros |
| „Looks like you already have an Azure account“ | Bandomasis laikotarpis tik vienam klientui | Naudokite jums priskirtą prenumeratą, ne naują bandomąją |
| `AADSTS90135` / `AADSTS700171` | Prisijungimo patvirtinimas atšauktas ar nepatvirtintas | Pakartoti `az login --use-device-code`, spausti Continue |
| `az vm list-usage` tuščias; `NotRegistered` | Resursų teikėjai neužregistruoti | `az provider register -n Microsoft.Compute` (ir Network, DevTestLab), palaukti Registered |
| `NotAvailableForSubscription` | VM dydis apribotas | Pabandyti kitą B serijos dydį (pvz. `Standard_B2s_v2`) arba regioną |
| `RequestDisallowedByAzure … not accepting new customers` | Regionas atmeta naujus klientus | Rinktis kitą regioną (pvz. `swedencentral`), pranešti dėstytojui |
| „The provided ssh-ed25519 SSH key is not supported“ | Azure priima tik RSA raktus | Sugeneruoti RSA 4096 (2 žingsnis 4) |
| `AuthorizationFailed` | Neturite teisių už savo resursų grupės ribų | Dirbti tik savo resursų grupėje |
| Kaina rodo „Forecast unavailable“ | Prenumeratos tipas nepalaiko prognozės | Ne klaida; naudoti Cost analysis |

## 6. Ką atsiųsti dėstytojui

Ekrano nuotrauką arba išvestį: `az account show` (be slaptų duomenų), `azure-preflight.sh` rezultatas, savo resursų grupės pavadinimas.

**Niekada nesiųskite:** privataus SSH rakto, slaptažodžių, kortelės duomenų, prisijungimo kodų.
