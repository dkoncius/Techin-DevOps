=== titulinė | SSH ir raktai
06 pamoka · 1 etapas
- Sukurti SSH raktų porą ir pridėti viešą raktą prie GitHub
- Paaiškinti, kodėl privatus raktas niekada nekeliamas į Git
- Išspręsti pirmą merge konfliktą
Pastaba: ~10 min pasitikrinimas po 05. Primename, kad WSL klausimas turi būti išspręstas.

=== pagalvokime
Prisijungiate prie serverio ir nenorite kaskart rašyti slaptažodžio.
# Kaip įrodyti, kad tai jūs?
> Kaip spyna ir raktas: spyną galima rodyti visiems, o raktą turi tik savininkas.
Pastaba: ~3 min. Jie jau jungėsi per `ssh` su slaptažodžiu: klauskite, kuo tai nepatogu ir nesaugu.

=== tekstas | Raktų pora
@iliustracija: raktas
- **Privatus raktas** lieka tik jūsų kompiuteryje
- **Viešas raktas** (`.pub`) gali būti kur nori
- Serveris pažįsta jus pagal viešą raktą
- Niekada nerodykite, nesiųskite ir nekelkite į Git privataus rakto
Pastaba: ~10 min. Pakartojimas: `ssh` ir `scp` jie jau moka; nauja yra raktai.

=== schema | Kaip veikia prisijungimas raktu
```excalidraw
file: prisijungimas-raktu
box pc | Jūsų kompiuteris\nprivatus raktas | 0,0.5 | blue | 1.1,1
box serveris | GitHub arba serveris\nviešas raktas | 2.4,0.5 | green | 1.1,1
arrow pc -> serveris | užklausa
arrow serveris -> pc | iššūkis
note Privatus raktas niekada nekeliauja tinklu | 1.2,1.8
```
Pastaba: ~5 min. Serveris užduoda iššūkį, jūs pasirašote privačiu raktu, serveris patikrina viešu.

=== komanda | Raktų pora
```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_kursas -C "kursas"
ls -l ~/.ssh
```
```bash+
cut -c1-40 ~/.ssh/id_ed25519_kursas.pub
```
- `-f` atskiras failas, kad nepersirašytų esamas raktas
- Slaptažodinė frazė: ne tas pats kaip paskyros slaptažodis
Pastaba: ~10 min. Kitas pavyzdys: `id_ed25519_demo`. Dažna klaida: jau yra `~/.ssh/id_ed25519` ir klausia perrašyti: atsakyti „n“.

=== tekstas | Teisės `~/.ssh`
| Failas | Teisės |
|---|---|
| `~/.ssh` aplankas | ?700 |
| Privatus raktas | ?600 |
| Viešas raktas `.pub` | ?644 |
Pastaba: ~5 min. SSH atsisako rakto, kurį gali skaityti kiti. Nelaikykite raktų `/mnt/c`.

=== komanda | `config` ir GitHub
```bash
nano ~/.ssh/config
```
```
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_kursas
  IdentitiesOnly yes
```
```bash+
ssh -T git@github.com
```
Pastaba: ~15 min. Pirmą kartą palyginkite serverio pirštų antspaudą su oficialiu GitHub sąrašu prieš rašydami „yes“. Dažna klaida: `Permission denied (publickey)`.

=== tekstas | Merge konfliktas
@iliustracija: šaka
- Dvi šakos pakeitė **tą pačią eilutę** skirtingai
- Git nežino, kuri teisinga, todėl klausia jūsų
- Ranka palikite vieną galutinį tekstą
- Tada `git add` ir `git commit`; arba `git merge --abort`
Pastaba: ~10 min. Kitas pavyzdys nei užduotyje: `pastabos.txt`, dvi šakos.

=== komanda | Kaip atrodo konfliktas
```
<<<<<<< HEAD
Raktų pora: privatus ir viešas raktas.
=======
Raktų pora: du failai.
>>>>>>> pamoka-06-a
```
+ Viršuje jūsų šaka, apačioje sujungiama
+ Pašalinkite visus tris žymeklius ir palikite vieną sakinį
Pastaba: ~5 min. Dažna klaida: žymekliai palikti faile; `git commit` atidaro vim (`:wq`).

=== klaida | Dažnos klaidos
:: | Permission denied (publickey) | Raktas neprijungtas prie paskyros arba nenurodytas `IdentityFile`
:: | Įklijuotas ne `.pub` | GitHub'ui reikia tik viešo rakto
:: | Teisės `644` | SSH atsisako: `chmod 600`
:: | Žymekliai faile | Pašalinkite `<<<<<<<`, `=======`, `>>>>>>>`
Pastaba: ~3 min.

=== uzduotys | Užduotys
@uzduotys: auto
Pastaba: Skelbkite po vieną. Primename: niekada nerodykite privataus rakto.

=== kita | Kita pamoka
Git pagrindai: commit'ai, `stash`, `revert`, konfliktai po `pull`
