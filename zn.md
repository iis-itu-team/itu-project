# Správa Návrhu

# Téma

## Návrhy

### Webová aplikácia pre EDR (Endpoint Detection and Response)

Navrhol: Matúš Hubinský

EDR systémy analyzujú chovania viacerých zariadení a vyhodnocujú bezpečnostné hrozby na základe udalostí zaznamenaných v databáze. Ak vyhodnotia chovanie ako nebezpečné vygenerujú alert. Tento alert je následne spracovaný bezpečnostným analytikom, ktorý sa venuje monitoringu. Bezpečnostný analytici môžu naraz monitorovať viarece systémov a preto potrebujú také grafické rozhranie, z ktorého vedia na prvý pohľad určiť počet nových bezpečnostných alertov a zároveň ich závažnosť. Existuje viacero riešení, ale každé má svoje preblémy a dalo by sa vylepšiť.

### Mobilná aplikácia pre BAM (Brnenský Architektonický Manuál)

Navrhol: Martin Otradovec

BAM je prejekt poskytujúci databázu architektonicky významných objektov v Brne. Cielom realizácie bolo vytvoriť k už existujúcemu webu mobilnú aplikáciu poskytujúcu prístup k objektom, trasám a audiosprievodcom prívetivo a offline. Ďalším možným prvkom je skenovanie kódov, ktoré sú po Brne rozmiestnené pri budovách alebo detekvia budov v okolí podľa GPS. Aplikáciu by bolo možné v prípade kvalitnej realizácie ponúknuť BAMu pre reálne využitie, pripadne rozvinúť do bakalárskej práce. Záujem medzi užívateľmi existujúceho webu je nezanedbateľný. Podobná aplikácia existuje vo forme postaršej bakalárskej práce, ale nieje verejne prístupná.

### Mobilná aplikácia pre objednávánie a zostavanie burgerov - Food Blueprint

Navrhol: Marek Vandík

Aplikácia Food Blueprint má za cieľ umožniť svojim užívateľom nielen objednávať, ale rovno poskladať burger podľa prefrencí užívateľov. Inšpiráciou pre toto téma sú hlavne samoobslužné systému v reštauráciách ako sú McDonald's, Burger King apod. Bolo by zaujímavé, keby užívatelia aplikácie mohli sami vytvárať burgery podľa svojich predstáv (zostaviť burger z obľúbeného typu žemle, mäsa atp.) a boli by schopný medzi sebou svoje výtvory zdieľať. Funkcionalitu zostaviť burger síce predtým zmienené systémy umožňují, ale nieje to ich hlavný zámer a napr. neponúkajú (z môjho predchádzajúceho priezkumu) alebo je príliž zložité prehodiť poradie ingrediencií.

## Vybrané téma

Po hlasovaní a dohode sme vybrali aplikáciu pre objednávanie a zostavanie hamburgerov - Food Blueprint. Aplikácia je relatívne jednoduchá na realizáciu a zber dár pre priezkum uživateľských potrieb.

# Průzkum

## Matúš

### Dotazník

1. Používali ste niekedy aplikáciu na objednávanie jedla?
    * Možnosti: Áno/Nie
    * Cieľ otázky:
    * Zistenie:
    
2. Ak áno, popíšte čo sa vám na nich páčilo.
    * Možnosti: Áno/Nie
    * Cieľ otázky:
    * Zistenie:

3. Aké funkcie sa vám na nej páčili?
    * Možnosti: Áno/Nie
    * Cieľ otázky:
    * Zistenie:

4. Čo sa vám páčilo na ich GUI?
    * Možnosti: Áno/Nie
    * Cieľ otázky:
    * Zistenie:

5. Čo sa vám páčilo na ich dizajne?
    * Možnosti: Áno/Nie
    * Cieľ otázky:
    * Zistenie:

6. Aký je pre vás najdôležitejší faktor pri výbere hamburgeru?
    * Možnosti: Áno/Nie
    * Cieľ otázky:
    * Zistenie:

7. Ako by ste si predstavovali výber hamburgeru?
    * Možnosti: Áno/Nie
    * Cieľ otázky:
    * Zistenie:

8. Sú pre vás možnosť výberu burgerov dostačujúce?
    * Možnosti: Áno/Nie
    * Cieľ otázky:
    * Zistenie:

9. Sú pre vás možnosť prispôsobenia burgerov dostačujúce?
    * Možnosti: Áno/Nie
    * Cieľ otázky:
    * Zistenie:

10. Sú pre vás aplikácie, ktoré sú momentálne na trhu, uspokojivé?
    * Možnosti: Áno/Nie
    * Cieľ otázky:
    * Zistenie:

11. Narazili ste na preblém pri objednávaní burgeru?
    * Možnosti: Áno/Nie
    * Cieľ otázky:
    * Zistenie:

12. Je nejaká špecifická funkcia ktorá podla vás chýba ostatným aplikáciam na jedlo?
    * Áno/Nie
    * Cieľ otázky:
    * Zistenie:

13. Aký typ užívateľského rozhrania vám príde najprívetivejší?
    * Možnosti: Áno/Nie
    * Cieľ otázky:
    * Zistenie:

    - [ ] jednoduchý a minimalistický
    - [ ] farebný 
    - [ ] vysoký kontrast

### Poznatky    

Všetci respondenti mali skúsenosti s používaním aplikácií na obejdnávanie jedlo. Respondenti si všímajú hlavne prehladnosť aplikácie. Pri väčšine aplikácií majú preblém s nedostatočnou možnosťou úpravy jedla. Niektoré aplikácie ponúkajú možnosť odstránenie ingrediencií položiek, ale nemajú možnosť pridania ingrediencií navyše. Taktiež je pre nich dôležité aby bolo hlavná stránka prehladná a alebolo na nej nič čo nepotrebujú.

#### Potreby užívateľov

- prehladnosť aplikácie
- obrázky ingredienií a jedál
- nevyžadovanie registrácie

#### Kľúčové preblémy

- potreba upraviť si jedlo podla seba

### Porovnání s existujícími aplikacemi
- foodora

#### Prednosti

- rozdelovanie jedla podľa kategorií
- široká ponuka predvytvorených jedál
- jednochuchá paleta farieb
- veľké obrázky s jedlami

#### Nedostatky

- nutnosť registrácie
- chýba možnosť úpravy jedál (pridávanie a odoberanie ingrediencií)

#### Inšpirácia a Riešenie nedostatkov

- naša aplikácia bude používať malú paletu farieb (maximálne 3 farby)
- nebudeme vyžadovať registráciu
- veľký dôraz na možnosť upravovania jedľa
- predvytvorenie širokej ponuky hotových jedál

## Marek

### Dotazník

Siedmim užívateľom bol zaslaný nasledujúci dotazník a ďalej následne bola uskutočnená krátka diskusia nad odpoveďami a prípadnými nejasnosťami a ďalšími námetmy.

1. Uvítali by ste možnosť získať doporučenie na dobrý burger od ostatných užívatelov?
	* Možnosti: Áno/Nie
	* Cieľ otázky: Má užívateľ potrebu objednávať jedlo podľa ostatných užívateĺov? - Relevancia modulu komunitného workshopu / zdielanie burgerov
	* Zistenie: 6/7 užívateľov považuje túto funkcionalitu ako užitočnú, vhodné pre zaradenie do projektu.

2. Keď navštevujete nejakú reštauráciu, máte pri vstupu jasno, čo konkrétne budete jesť?
	* Možnosti: Áno/Nie
	* Cieľ otázky: Potrebuje užívateľ najskôr vidieť vidieť prestavenie reštaurácie alebo priamo objednať? - Privítať užívateľa informáciámi o reštautácií / výberom jedál
	* Zistenie: Všetci respondenti vyberajú až na mieste - bolo by vhodné dôkladne predstaviť menu / možnosti

3. Privítali by ste možnosť uložiť si recept na dobrý burger, ktorý by ste si mohli jednoducho objednať v budúcnosti?
	* Možnosti: Áno/Nie
	* Cieľ otázky: Má užívateľ potrebu ukladať si oblíbená jedlá? - relevancia modulu pre ukladanie receptov
	* Zistenie: 3:4 časť užívateľov by modul pre ukladanie receptov využila, zrejme vhodné pre zaradanie do projektu

4. Ako často v restauracích ako je McDonald's alebo KFC uprednostníte objednávku pri samoobslužnom kiosku pred klasickou objednávkou na pokladne?
	* Možnosti: Vždy (takmer vždy) / Využívám obe možnosť / Len výnimočne, napr. ak je príliš dlhá rada / Vôbec
	* Cieľ otázky: Familiarita užívateľe s týmyto systémami - relevancia dalších odpovedí zameraných konkrétnejšie na GUI
	* Zistenie: Všetci respondenti až na jediného respondenta, ktorý odpovedal "Len výnimočne", zvolili možnosť "Vždy / takmer vždy" - výsledok odpovedí na GUI bude rozdelený váhovo nasledujúcím zpôsobom: Odpovedi respondentov, ktorý vybrali "Vždy / takmer vždy", budú mať váhu 1. Zostávajúci respondent bude mít váhu 0.5

5. Koľko približně ingrediencií je podľa vás ideálny počet v burgeru? (žemle sa nepočítajú)
	* Možnosti: 2 a menej / 3 - 5 / 6 a viac
	* Cieľ otázky: Prizpôsobenie GUI pre najčastejší počet ingrediencií - veľkosť vykreslovaných položiek
	* Zistenie: S váhou 3.5 možno predpokladať ako najčastejší počet položiek možnosť "6 a viac". možnosť "3 - 5" mala váhu 3, a zostávajúca možnosť "2 a menej" mala váhu 0

6. Stalo se vám niekedy, že jste v burgeru chceli mať nejakú ingredienciu viackrát / v inej vrstve burgeru?
	* Možnosti: Áno/Nie
	* Cieľ otázky: Potreba užívateľa menit zloženie burgeru. Zpätne veľmi zbytočné - obsiahnuté v otázke 10, ale táto otázka pre zmenu zisťuje príčinu
	* Zistenie: 4:3 - Niektorý užívateľia túto funkcionalitu určite ocenia, práve vďaka zkúsenostiam uvedených v otázke

7. Využili by ste možnosť zostaviť si burger z dopredu daných ingrediencí podľa vašich predstáv?
	* Možnosti: Áno/Nie
	* Cieľ otázky: Má užívateľ potrebu zostavovať vlastné burgery? - relevancia tejto aplikácie
	* Zistenie: 6:1 Väčšina užívateľov by takúto možnosť ráda využila - táto aplikácia má zmysel

8. Prosím, zaraďte následujúce ingrediencie do skupín.
	* Možnosti: : rajčina, majonéza, slanina, hovädzie, tatárka, uhorka, tofu, chilli paprička, kuracie, šalát, kapusta, sojové mäso, horčica
	* Cieľ otázky: Ako užívatelia najčastejšue nazývajú rôzne kategórie ingrediencí - ako prezentovat ingrediencie
	* Zistenie: Užívatelia mali veľmi odlišné radenie do skupin, ale z odpovedí sa dá vypozorovat, že väčšina užívateľov zvolila kategorizáciu skôr na druhy jedál - omáčka, mäso, zelenina, prípadne vegán alebo špecialita pre tofu a chilli. Len minorita užívateľov volila odlišnejšie rozdelenie - po chodoch (hlavný - mäso, príloha - šalát atp.) alebo podľa toho, ako majú danú ingredienciu radi (najlepšie - mäso, dobré - rajčina atď.)

9. Prosím, zaraďte vymenované ingrediencie do uvedených kategorií. V případe, že sa nedá ingredienciu logicky zaradiť, vymyslite vlastnú kategoriu.
	* Možnosti: rajčina, slanina, hovädzie, uhorka, tofu, chilli paprička, kuracie, šalát, kapusta, sojové mäso
	* Kategórie: mäso, zelenina
	* Cieľ otázky: ako 8) s zameraním na špecifické ingrediencie: slanina, chilli, tofu - nedá sa jednoznačne určiť, ako tieto ingredience kategorizovať + porovnávanie s 8)
	* Zistenie: Z výsledkov nedá sa jednoznačne určiť zaradenie vspomínaných surovín. Pre slaninu časť ľudí zvolila kategoriu mäso, ale časť ľudom toto zaradenie nevyhovovalo a radšej vymysleli inú kategóriu ako napríklad špecialita alebo doplnok. Pre chilli väčšina ľudí zvolila kategóriu zelenina, ale stále sa našli repsondenti, ktorý by preferovali špeciálne zaradenie mimo zeleninu opäť ako špecialita. U tofu bolo rozhodovanie najzložitejšie - objavily sa kategórie mäso, zelenina aj specialita, prípadne vegán (respondent, ktorý je vegán, uviedol, že mu nejviac vyhovuje zaradenie špecialita)

10. Pri výbere dopredu zostaveného burgeru, uvítali by ste možnosť tento burger upravit?
	* Možnosti: Upravit / Ponechať bez úprav
	* Cieľ otázky: Potreba užívateľa meniť dopredu pripravené burgery
	* Zistenie: 6:1 užívateľov by uvítalo možnosť meniť zloženie dopredu zostavené burgery

11. Pri ukladaní Vašeho burgeru, priali by ste si, aby tento burger mohli vidieť aj ostatný užívatelia?
	* Možnosti: Uložiť viditelně pre všetkých / Uložit len pre seba / Uprednostnil by som obe možnosti
	* Cieľ otázky: Má užívateľ potrebu svôj burger ukladať a zdielať ho?
	* Zistenie: 2:0:4 a "vôbec neukladať" - Väčšina užívateľov by uvítala túto možnosť vrátane rozlišenia soukromých a verejných burgerov. Odpoveď "vôbec neukladať" je zpôsobené zle formulovanou otázkou

12. Chceli by ste zostavovať burger pomocou tlačítiek pre pridávanie jednotlivých ingrediencií do určitej vrstvy, alebo radšej dotykovo presúvať ingredience z ponuky priamo do burgeru?
	* Možnosti: Tlačítka / Presúvať / Iné
	* Cieľ otázky: Aký zpôsob zadávania ingrediencií je pre užívateľa najlepší?
	* Zistenie: 1:4.5:1 - Väčšina užívateľov by preferovala presúvanie ingrediencií priamo do burgeru

13. Čo chcete vidieť ako prvé, keď otvoríte aplikáciu pre objednanie jedla z konkrétnej reštaurácie?
	* Možnosti: Ponuku štandartných burgerov / Zostavovač burgeru / Ponuku komunitných burgerov (odporúčanie burgerov od ostatných užívateľov) / Iné
	* Cieľ otázky: o má užívateľ za potrebu vidieť ako prvé?
	* Zistenie: 0.5:3:3.5 - užívatelia by preferovali ponuku komunitných burgerov alebo zostavovač. Hodnotenie 0.5 z dôvodu výberu 2 pri jednom respondentovy

14. Je pre vás dôležité vidieť cenu burgeru a jeho ingrediencií pri zostavovaní? 
	* Áno, túto informáciu chcem vidieť hneď / Nie, na obrazovke by bolo príliš veľa informácií (stačí až pri platbe)
	* Cieľ otázky: Má užívateľ potrebu vidieť priebežne cenu burgeru a jeho ingrediencí pri zostatovaní?
	* Zistenie: 7:0 - užívatelia majú potrebu vidieť cenu burgeru a jeho ingrediencí pri zostavovaní.

15. Predstavte si, že v našej aplikácií zostavujete vlastný burger. Ako by sa vám páčilo riešenie situácie, keď máte viac rovnakých ingrediencií nad sebou?
	* Možnosti: Zobrazovať počet pri každej ingrediencie a vykrasliť ju iba raz / Zobrazovať každú ingredienciu zvlášť - napríklad 2x mäso nad sebou atď.
	* Cieľ otázky: Ako najlepšie zobrazovať ingrediencie pri zostavovaní burgeru?
	* Zistenie: 3:4 - Väčšina užívateľov by zvolila moźnosť vykreslovania jednotlivo. V diskusí po vyplnení dotazníku bolo zistené, že obidve varianty sú vyhovujúce pre všetkých respondetov.

### Porovnání s existujícími aplikacemi
- McDonald's mobilnej aplikácie pre iOS
#### Prednosti
- pekne riešené kalorické hodnoty jedál
- dobre rozdelené burgery do kategórií
#### Nedostatky
- 2 rôzne pohlady na jedlá, jeden sa používa pri objednávaní na pobočke a zároveň pri prezentáciu jedál, a druhý pre objednávanie z Foodory atď, čo je dosť metúce.
- neumožňuje zdielanie burgerov
- neumožňuje ukladať obľúbené burgery

#### Inspirace a řešení nedostatků
- inšpirovať sa budeme grafikou a kategóriami rozdelenie burgerov
- nedostatky vyriešime implementáciou danej funkcionality a iba jedným podľadom pre objednávanie aj prezentovanie jedál

## Martin

### Dotazník
Dotazník bol vedený formou rozhovoru s tromi subjektami.

"**\***" Pravdepodobne mimo rozsah našej aplikácie

1. Využívate aplikácie pre dovoz jedál, poprípade ktoré?
    * Odpovede: Áno/Nie
    * Cieľ otázky: Zistenie nedostatkov / predností ostaných aplikácí
    * Zistenie:

2. Ako ste spokojný s jednotlivými aplikáciami, čo sa vám na nich páči/nepáči?
    * Odpovede: Nedostatočne presné a nepredlané určenie adresy pre doručenie / Nešpecifikované pokyny a priebeh doručovaní jedla (viedlo k zmätku, panike, často odradilo od objednania) / Nepresná špecifikácia zľavy, nezobrazuje sa správne / Nieje presne špecifikované, čo je zahrnuté v cene
    * Cieľ otázky: Zistanie možných prvkov pre aplikácie, prípadne čomu sa vyvarovať.
    * Zistenie: 
        - pridať do aplikácie možnosť špecifikovať presnú adresu.
        - pridať do poslednej obrazovky informáciu o tom, ako doručenie prebehne
        - prehladná špecifikácia zliiav v checkoute, prípadne už v košíku
        - jasný súpus cien jedlotlivých položiek, ingrediencií

3. Je nejaká špedcifická funkcia, ktorá podľa vás chýba ostatným aplikáciám na jedlo?
    * Odpovede: chýbajúce online platby / pokročilé a zábavné zľavy
    * Cieľ otázky: 
    * Zistenie: 
        - nutnosť implementácie platobnej brány 
        - implenetovať gamifikáciu zliav / ruletu / minihry

4. Máte niekedy potrebu upraviť si zloženie jedál, napr. burger, pizzy v reštaurácií podľa vlastných potrieb?
    * Odpovede: Áno, upravenie jedál podľa vlastnej diéty
    * Cieľ otázky: Zistenie, či užívatelia majú potrebu pre hlavnú funkciu navrhovanej aplikácie
    * Zistenie: Funkia skladanie jedál má využitie


5. Aké prísady patria do správneho burgeru?
    * Odpovede: Slanina, tofu, sójové mäso, majonéza, kečup, rajčina, uhorka, šalár, kapary
    * Cieľ otázky: Zistenie prísad, ktoré by v aplikácií mali byť
    * Zistenie: 

6. Pokiaľ by ste mali možnosť poskladať (nastaviť si konkrétne zloženie) vašeho jedla, využili by ste ho, alebo by ste si zvolili predvytvorené jedlo? 
    * Odpovede: Záleží na miere hladu, po aplikácií človek väčšinou siahne keď má hlad a nechce sa mu tráviť čas "skladaní" jedál. Ak má čas a napadne ho zaujímavá kombinácia tak túto funckiu využije.
    * Cieľ otázky: Zistenie, či užívatelia majú potrebu pre hlavnú funkciu navhovanej aplikácie
    * Zistenie: Pridať do výberu jedál aj predvytvorené kombinácie, ponúknuť zdielané jedlá od ostatných užívateľov

7. Ako by malo vyzeraŤť UI pre skladanie burgerov?
    * Odpovede: Možnosť upraviť už existujúce jedlá (predvytvorené, komunitné, vlastné) / Mierna gamifikácia štýlom "candy factory" hry, t.j. skladnanie jedla pomocou výrobnej linky / Prehladne zobrazovať čo najviac prísad naraz, čo nejmenej zdržovať užívateľa, zobraziť výsledné jedlo a jednotlivé vrstvy, možnosť prehadzovať
    * Cieľ otázky: Rozvíjajúca otázka ako má skaladanie vyzerať.
    * Zistenie: Nutnosť implementovania funkcie upravovanie existujúcich jedál

8. Pokiaľ by ste mali možnosť zdielať vaše poskladané jedlo s ostatnýmu užívateľmi, využili by ste ju?
    * Odpovede: Áno
    * Cieľ otázky: zistenie ći je zdielanie jedál užívaľmi využitelná funkcia
    * Zistenie: Užívatelia by jedlo zdielali

9. V prípade, že by ste zdielali svoje "poskladané" jedlo, chceli by ste pri ňom mať uvedené svoje meno? Zahrňovalo by to vytvorenie uživatelského účtu pomocou e-mailu a hesla
    * Odpovede: Uživateľské účty sú zbytočné zdržovanie
    * Cieľ otázky: Je nutné vyžadovať alebo poskytovať vytvorenie uživateľských účtov pre zdielanie?
    * Zistenie: Užívatelia nechcú registráciu a uživateľské účty 

10. Využívali by ste vytvorenie uživateľského účtu pre prístup k svojim dátam - objednávkam?
    * Odpovede: 
    * Cieľ otázky: Rozhodnutie či vyžadovať alebo poskytovať vytvorenie účtu alebo iba ukladanie dát lokálne na zariadenie
    * Zistenie: Lokálne ukladanie dát stačí, uživateľské účty niesu nutné. Prípadný prenos dát na viac zariadní pomocou QR kódu, bluetooth alebo exportu.

11. Zoraďte, prosím, jednotlivé akcie podľa dôležitosti:
    * Možnosti: 
        - prehliadnutie si jedál od ostatných užívateľov
        - prehliadnutie si svojich predošlých objednávok
        - prehliadnutie si svojich poskladaných jedlá
        - poskladanie nového jedla
        - vytvorenie novej objednávky
    * Cieľ otázky: Akým spôsobom poskladať domovskú stránku? Čo je pre užívateľa najdôležitejšie?
    * Zistenie:
        - 12b: prehliadnutie si jedál od ostatných užívateľov
        - 11b: vytvorenie novej objednávky
        - 9b:  prehliadnutie si svojich poskladaných jedlá
        - 8b:  prehliadnutie si svojich predošlých objednávok
        - 5b:  poskladanie nového jedla
    *body jsou přiřazené popodľa toho, ako vysoko položky jednotliví užívateľé umístili, potom sečtené*
        - na úvodnej stránke aplikácie budú zobrazené predvytvorené jedlá a jedlá vytvorené ostatnými. Zobraziť veľké tlačítko na vytvorenie novej objednávky. Poskladanmie nového jedla a predošlé objenávky schovať, urobiť menšie a nenápadné

### Porovnání s existujícími aplikacemi
- Dáme Jídlo

#### Přednosti
- prehladné zadávanie objednávok
- nevyžaduje uživateľský úceť pre objednanie
#### Nedostatky
- možnosť meniť prísady jedla je neprehladná, je možné iba naklikať dopredu zadané prísady v zozname (pokiaľ ho reštaurácia takto predvytvorí nieje to funkcia podporovaná aplikáciou)
- chýba konkrétna informácia o zpôsobe, akým spôsobom prebehne doručenie jedla. Užívateľ, ktorý vídí aplikáciu prvý krát, vedel čo sa bude diať a čo má čakať
#### Inšpirácia a riešenie nedostatkov
- Hlavný zoznam reštaurácií, prehlad košíku a checkout sú prehladné a pre užívateľa prívetivé. Použiť podobné rozloženie.
- Doplniť do posledného kroku checkoutu informácie o doručení a možnosť výberu z viacerých variant

## Výstup priezkumu

### Kľúčové potreby užívateľov
- nedostatočné úpravy jedla

### Uživateľské precesy
Ostatné aplikácie sú málo prehladné. 
Najvýraznejšou funkciou na home page bude vytvorenie novej objednávky. Ďalšou funkciou na home page bude ponuka jedál. Ako posledná možnosť bude vytvorenie nového burgeru. História a nastavenie budú schované. 

### Kľúčové vlastnosti budúcej aplikácie
- prehladnosť
- filtrovanie položiek
- vidieť fotky jedla
- pred vytvorené jedlá 
- uprava pred vytvorených jedál
- cena jednotlivých položiek
- upravovanie jedla podľa vlastných potrieb (diety, jedálníčku, chuti)
- prehladná homepage
- zvyšovanie množstva prísad (namiesto klikania znovu)
- nevyžadovať registáciu
- zlavy (out of scope)

## Rozdelenie práce
- 2. Každý člen pracuje na časti aplikácie, výsledkom je jedna aplikácia

### Marek
### Martin
### Matúš

# Maketa / Diagram / Screenshot
# Riešenie preblémov uživateľov

# Testovanie
## Metriky
## Priebeh
## Výsledky

# Architektura
## FE
## BE
