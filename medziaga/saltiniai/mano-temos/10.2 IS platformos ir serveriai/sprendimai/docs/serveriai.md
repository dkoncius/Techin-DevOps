# Serveriai: tipai ir nuotolinis valdymas

Pavyzdinis mokinio failas (mokyklos IS platformos schemai, žr. `is-schema.png`).

## 1. Fizinis, virtualus ir debesijos serveris

| Tipas | Kaina | Lankstumas | Kas prižiūri |
|-------|-------|------------|--------------|
| Fizinis | didelė iš karto (įranga, vieta, elektra) | maža: įrangą keisti lėta | mūsų komanda |
| Virtualus | vidutinė: viena įranga, daug VM | didelė: VM kuriama per minutes | mūsų komanda (įranga ir VM) |
| Debesijos | pagal naudojimą, mokama kas mėnesį | labai didelė: resursus galima keisti bet kada | tiekėjas įrangą, mes sistemą |

## 2. Rack, tower, blade

1. Rack: serveris, montuojamas į standartinę spintą, užima vienetus (1U, 2U).
2. Tower: stovi kaip kompiuterio dėžė, tinka mažai įstaigai be spintos.
3. Blade: plonas modulis, kuris dedamas į bendrą korpusą, dalijasi maitinimu ir aušinimu.

## 3. Nuotolinis valdymas: iDRAC (Dell)

Galima daryti, kai serveris išjungtas (per atskirą valdymo prievadą):

1. Įjungti, išjungti ir perkrauti serverį.
2. Pamatyti serverio ekraną ir valdyti jį klaviatūra bei pele (nuotolinė konsolė).
3. Prijungti ISO failą kaip virtualų diską ir įdiegti sistemą (virtualioji laikmena).

Dokumentacijos skyrius: raskite Dell oficialioje iDRAC User's Guide dokumentacijoje skyrius apie power control, virtual console ir virtual media (tikslios nuorodos čia nerašau, nes versijos skiriasi). Apibrėžimas: [IPMI](https://en.wikipedia.org/wiki/Intelligent_Platform_Management_Interface).

## 4. Kodėl administratorius negali visada ateiti prie serverio

Serveriai dažnai stovi duomenų centre kitame mieste ar šalyje, o gedimas gali įvykti naktį ar savaitgalį. Kelionė užtrunka valandas, o paslauga tuo metu nustoja veikti. Per nuotolinę sąsają administratorius per kelias minutes perkrauna serverį ar pamato klaidą. Todėl ši sąsaja turi būti uždaryta nuo interneto ir pasiekiama tik per VPN ar vidinį tinklą.
