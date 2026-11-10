# Apie mane: skaidrių outline

Pristatymas 01 pamokos pradžioje (~5 min). Tikslas: studentai žino, kas jiems dėsto, kuo dirbu ir kur mane rasti.

1. Titulinė: Deividas Koncius, DevOps kursas
2. Apie mane: nuotrauka, stack (React / TypeScript, Firebase), įrankiai (GitHub, Vercel, Cursor, Claude Code), GitHub ir LinkedIn
3. Mano projektai: AppGlove, Trenio, Scan Plan
4. Su kuo dirbau: Acme grupė, Telia, LTKT; dabar Krei (procesų automatizavimas)

Generuoti: `python3 -I .claude/skills/skaidres/build_deck.py "kursas/01 Kas yra DevOps/apie-mane-skaidres.md"` → `apie-mane-skaidres.html`.

=== titulinė | Deividas Koncius
Susipažinkime
- Kas aš esu ir kuo dirbu
- Mano projektai ir patirtis
Pastaba: ~1 min. Pasisveikinkite, pasakykite, kad prisistatymas trumpas.

=== tekstas | Apie mane
@nuotrauka: deividas.jpg
:: | Deividas Koncius | Jūsų DevOps kurso dėstytojas
:: | Stack | React / TypeScript, Firebase
:: | Įrankiai | GitHub, Vercel, Cursor, Claude Code
- GitHub: [github.com/dkoncius](https://github.com/dkoncius)
- LinkedIn: [deividas-koncius](https://www.linkedin.com/in/deividas-koncius/)
Pastaba: ~3 min. Trumpai apie save. Pabrėžkite, kad įrankius (GitHub, Vercel, Claude Code) naudojate kasdien, o kurse matysite, kaip jie jungiasi į vieną kelią.

=== tekstas | Mano projektai
:: | AppGlove | Žaidėjų prisijungimas: [appglove.com](https://www.appglove.com/players-login)
:: | Trenio | Klubų puslapis: [trenio.lt](https://trenio.lt/u/t1OTLKQzjoZXejmxoAkBLG0hYBm2/klubai)
:: | Scan Plan | Interneto programa: [scan-plan.vercel.app](https://scan-plan.vercel.app)
Pastaba: ~2 min. Parodykite vieną projektą gyvai ir paminėkite, kad kiekvieną reikia ne tik parašyti, bet ir paleisti bei prižiūrėti: būtent to mokysis kursas.

=== tekstas | Su kuo dirbau
:: | Acme grupė | [acmegrupe.lt](https://acmegrupe.lt)
:: | Telia | [telia.lt](https://www.telia.lt)
:: | LTKT | [ltkt.lt](https://www.ltkt.lt)
:: | Dabar | Partneriai integruojant įmonėse automatizacijos procesus: [krei.lt](https://krei.lt)
Pastaba: ~2 min. Pabrėžkite, kad dabartinis darbas (procesų automatizavimas) yra artimas DevOps minčiai: tas pats kelias kiekvieną kartą, be rankinio darbo.

=== tekstas | Susipažinkime: pristatykite save
1. Vardas ir ko tikitės iš kurso
2. Windows ar Mac, ir ar kompiuteris asmeninis (ne mokyklos ar darbo)
3. Ar veikia Ubuntu (WSL) arba Terminalas Mac
4. Ar turite GitHub paskyrą
5. Patirtis nuo 1 iki 5: Git, Linux, Python, Docker
Pastaba: ~10 min. Kiekvienas studentas atsako į visus penkis klausimus pristatydamasis, o dėstytojas atsakymus užsirašo Google lentelėje (eilutė kiekvienam studentui). Rezultatai reikalingi 02 pamokai: kiek Windows ir kiek Mac, kam gali nepavykti `wsl --install` dėl administratoriaus teisių, kam trūksta GitHub paskyros. Docker nepažįsta, tai tikėtina. Skaičiuokite greitai, neaiškinkite, ką daryti pagal atsakymus, tai vėliau.
