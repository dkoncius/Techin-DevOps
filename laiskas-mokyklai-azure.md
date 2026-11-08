# Laiškas mokyklai: Azure prieiga DevOps grupei (VH-DO)

**Kam:** [administratoriaus vardas, pareigos]
**Nuo:** Deividas Koncius, DevOps grupės (VH-DO) dėstytojas
**Tema:** Azure prenumerata ir prieigos mokiniams: ko reikia ir kiek tai kainuos

---

Sveiki,

DevOps grupei (~30 mokinių, programa „Jaunesnysis platformų programuotojas“, ISP modulis) pagal planą Azure debesų temas dėstysime **31–33 mokymosi savaitėmis (apie 2027 m. balandį–gegužę)**. Mokiniai Azure aplinkoje per savo pamokas kurs virtualias mašinas, tinklus, konteinerių registrą ir paprastą Kubernetes, o CI darbus paleis iš GitHub. Žemiau surašiau, ko tam reikia iš mokyklos pusės, ir apytikslę kainą.

Šiuo metu mano mokyklos paskyra Azure portale neturi jokios prenumeratos (rodo „Don't have a subscription“). Etalonui (dėstytojo pavyzdinei platformai) laikinai naudoju savo asmeninę Azure prenumeratą su kreditais. Etalonas jau veikia (lokaliai ir Azure VM su k3s), bet tie kreditai baigiasi apie **2026-12-06** ir mokiniams jų nepakaks.

## 0. Kaip planuojame naudoti debesį (laipsniškai)

Kad kaina ir administravimas liktų valdomi, debesį diegiame etapais:

| Kada | Aplinka | Kas valdo |
|---|---|---|
| Iki ~12 sav. (iki 2026-11-26) | lokaliai (VM, Docker) | mokiniai |
| Nuo 13 sav. (nuo 2026-11-30) | **vienas bendras serveris debesyje (k3s), atskira vardų erdvė kiekvienam mokiniui**; baigti projektai gauna viešą adresą | dėstytojas (infrastruktūra) |
| 28–30 sav. | mokiniai pasitikrina Azure prieigą (prisijungimas, resursų grupė) | mokiniai |
| 31–33 sav. | individualus Azure kiekvienam mokiniui | mokiniai |

Taigi **pirmiausia reikia bendro serverio (pozicija A žemiau)** nuo 2026-11-30, o individualios Azure prieigos (pozicijos B) reikalingos tik nuo 28–30 savaitės.

**Kainos kryptis:** bendras serveris ~27–47 USD/mėn., kol veikia pagal grafiką (8 GB VM, išjungiama naktimis), o individualus Azure 31–33 sav. maždaug 120–300 USD visai grupei (2 skyrius).

**Minimalus variantas**, jei biudžeto trūksta: individualaus Azure nėra, mokiniai dirba bendrame serveryje ir lokaliai, o Azure demonstruoja dėstytojas ir mokiniai kuria tik `terraform plan` be paleidimo. Tai kainuotų tik bendro serverio sumą.

## 1. Ko reikia

(A) **Bendram serveriui nuo 2026-11-30:** prenumerata (ar aparatūra) vienai VM su viešu IP; dėstytojas valdo. Mano asmeniniai kreditai baigiasi ~2026-12-06, todėl šio punkto sprendimo reikia anksčiausiai.
(B) **Individualiam Azure 31–33 sav.:** lentelė žemiau.

| # | Kas | Kodėl |
|---|---|---|
| 1 | **Azure prenumerata mokyklos nuomotojoje (techin.lt)** su atsiskaitymu, kurį pasirenka mokykla | mokiniai prisijungs mokykliniais el. paštais |
| 2 | **Prieiga mokiniams:** viena bendra prenumerata, **atskira resursų grupė kiekvienam mokiniui**, rolė **Contributor tik savo grupėje** (ne visoje prenumeratoje). Mokiniai sudėti į vieną Entra grupę | kad mokiniai nematytų ir netrintų vienas kito darbų |
| 3 | **Dėstytojui:** Owner arba Contributor visoje prenumeratoje, Reader mokinių grupėse | pamokų demonstracijos, pagalba, kaštų peržiūra |
| 4 | **Resursų teikėjų (providers) registracija** prenumeratos lygiu (padaro administratorius vieną kartą): `Microsoft.Compute`, `Network`, `Storage`, `ContainerRegistry`, `ContainerService`, `Consumption`, `DevTestLab`, `Insights` | nauja prenumerata be jų neleidžia kurti VM; mums tai šiandien jau buvo rimta kliūtis |
| 5 | **vCPU kvotos padidinimas** regione (pvz. West Europe), B serijai ~60 vCPU | numatytos kvotos naujai prenumeratai dažnai per mažos 30 mokinių vienu metu |
| 6 | **Kaštų kontrolė:** biudžetas su perspėjimais, **Azure Policy**: leidžiamos tik B serijos VM, 1–2 regionai, privalomos žymos; pageidautina privalomas auto-shutdown | apsauga nuo pamirštų paleistų resursų |
| 7 | **Entra leidimai CI integracijai (33.2 tema, Azure OIDC):** arba administratorius iš anksto sukuria programos registraciją su federuotu kredencialu, arba leidžia mokiniams kurti savo | pagal numatytuosius nustatymus mokiniai paprastai negali kurti programų registracijų nuomotojoje; tai reikia išspręsti iš anksto |
| 8 | **MFA ir prisijungimas per Azure CLI** (`az login --use-device-code`) neturi būti užblokuoti | mokiniai dirbs iš terminalo |
| 9 | **Prieinami regionai ir VM dydžiai.** Naujoje prenumeratoje kai kurie regionai ir dydžiai gali būti apriboti (mūsų atveju `westeurope` atmetė naujus klientus, o `Standard_B2ms` buvo neprieinamas; veikė `swedencentral` ir `Standard_B2s_v2`). Prašome iš anksto patikrinti, kuriuose regionuose galima kurti, ir prireikus kreiptis į Microsoft palaikymą | šiuos apribojimus aptinkame tik bandydami kurti, o ne iš dokumentacijos |
| 10 | **Patikros skriptas** (`azure-preflight.sh`, nieko mokamo nekuria): administratorius paleidžia jį mokyklos prenumeratoje prieš kursą, o mokiniai savoje | trumpas „žalia/raudona“ rezultatas, kuris parodo, ar prenumerata paruošta |

**Svarbu:** jei mokiniai naudos savo atskiras paskyras, tai nuo mokyklos pusės nieko papildomai nereikia, bet apribojimai gali būti kiekvienai prenumeratai skirtingi, todėl patikrą reikia daryti kiekvienoje.

**Alternatyva** (jei mokyklos prenumeratos nebus): **Azure for Students** kiekvienam mokiniui (paprastai be kortelės, kreditai, reikalauja studento statuso patikros mokyklos el. paštu). Prašau patvirtinti, ar mokyklos domenas jame priimamas. Šio kelio trūkumas: dėstytojas nemato mokinių kaštų ir negali jų valdyti centralizuotai.

## 2. Kiek tai kainuos (apytikslis įvertis)

**Prielaidos:** kainos paimtos iš viešo Azure Retail Prices API, regionas **West Europe**, **Linux**, mokėjimas pagal naudojimą, **USD** (2026-11-07 duomenys). Mokesčiai, duomenų išėjimas ir diskų operacijos neįtraukti.

| Pozicija | Kaina |
|---|---|
| VM `Standard_B2s` (2 vCPU, 4 GB) | 0,048 USD/val. |
| VM `Standard_B2ms` (2 vCPU, 8 GB), West Europe, palyginimui | 0,096 USD/val. |
| VM `Standard_B2s_v2` (2 vCPU, 8 GB), dėstytojo etalonas dabar (Sweden Central) | [patikslinti Azure Pricing Calculator] |
| Statinis viešasis IP | 0,005 USD/val. (~3,65 USD/mėn., mokama ir išjungus VM) |
| OS diskas | ~2 USD/mėn. (mano įvertis, nepatikrintas per API) |

**Kiek vienam mokiniui per modulį (3 savaitės):**

| Scenarijus | Prielaida | Vienam mokiniui | 30 mokinių |
|---|---|---|---|
| **Mažas** | VM tik pamokų metu (~40 val.), be statinio IP | ~4 USD | **~120 USD** |
| **Realus** | VM ~75 val. (pamokos + namų darbai), statinis IP laikomas 3 savaites, nedidelė AKS/ACR demonstracija | ~10 USD | **~300 USD** |
| **Blogas** | pamiršta VM veikia 24/7 visas 3 savaites | ~29 USD | **~860 USD** |

Esminis skirtumas tarp „realaus“ ir „blogo“ yra **auto-shutdown ir resursų išvalymas**, todėl 1 lentelės 6 punktas (biudžetas ir Azure Policy) yra svarbiausias. Be jų kaina gali išaugti maždaug 3 kartus.

**Dėstytojo etalonas ir demonstracijos:** ~27–47 USD/mėn. (8 GB VM, nuo kasdien 10 iki 14 val. veikiantis VM, su IP ir disku), kol aplinka paleista. Tai atskirta nuo mokinių kaštų.

**Rekomenduojama bendra riba visam moduliui: ~400–450 USD** (realus scenarijus + ~30 % rezervas + dėstytojo aplinka), su perspėjimais ties 50 %, 80 % ir 100 %. Šis skaičius yra įvertis; prieš patvirtinant jį verta patikrinti su **Azure Pricing Calculator** ir mokyklos sutarties kainomis (jos gali skirtis nuo viešų).

Pastaba: Azure biudžetai tik **perspėja**, bet pats resursų neišjungia, todėl nauda realiai kyla iš auto-shutdown, Policy ir mokinių instrukcijos „po darbo išvalyti“.

## 3. Terminai

| Kada | Kas |
|---|---|
| **Kuo greičiau (iki 2026-11-30)** | bendram serveriui: prenumerata ar aparatūra vienai VM (mano asmeniniai kreditai baigiasi ~2026-12-06) |
| **Iki 2027-04-16** | mokyklos sprendimas dėl individualios prenumeratos / Azure for Students |
| **Apie 28–30 sav.** | mokiniai prisijungia, patikrina prenumeratą, sukuria savo resursų grupę (paruošimo patikra) |
| **31–33 sav.** | Azure paskaitos |

Dėl bendro serverio sprendimo prašyčiau kuo greičiau, geriausiai iki 2026-11-23, kad spėčiau perkelti etaloną iki 2026-11-30.

## 4. Klausimai administratoriui

1. Ar mokykla turi Azure sutartį / Microsoft 365 Education, per kurią galima sukurti prenumeratą?
2. Ar mokiniai gali naudoti mokyklinius el. paštus su Azure (MFA reikalavimai)?
3. Ar galima suteikti Contributor tik atskiroms resursų grupėms ir pritaikyti Azure Policy?
4. Ar galima padidinti vCPU kvotą ir kurį regioną rekomenduojate (pas mus `westeurope` atmetė naujus klientus, veikė Sweden Central)?
5. Kas mokyklos pusėje būtų kontaktinis asmuo ir kas stebės kaštus?
6. Bendram serveriui (nuo 2026-11-30): ar tai gali būti mokyklos prenumerata, ar mokyklos aparatūra (pvz. serveris mokykloje), ar dėstytojo prenumerata kol kas?

Galiu pateikti detalesnį planą ir pamokų sąrašą, kuriose naudosime Azure.

Ačiū,
Deividas Koncius

---

*Dėstytojo pastaba prieš siunčiant: patikrinkite skaičius su Azure Pricing Calculator (ypač `Standard_B2s_v2` kainą, pažymėtą [patikslinti]) ir pakeiskite pamokų/val. skaičių pagal savo Excel. Patvirtinkite datą 2026-11-23. Papildykite gavėjo vardą ir kontaktus.*
