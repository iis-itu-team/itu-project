# Správa Návrhu

# Téma

## Návrhy

### Webová aplikácia pre EDR (Endpoint Detection and Response)

Navrhol: Matúš Hubinský

EDR systémy analyzujú chovania viacerých zariadení a vyhodnocujú bezpečnostné hrozby na základe udalostí zaznamenaných v databáze. Ak vyhodnotia chovanie ako nebezpečné vygenerujú alert. Tento alert je následne spracovaný bezpečnostným analytikom, ktorý sa venuje monitoringu. Bezpečnostný analytici môžu naraz monitorovať viaceré systémov a preto potrebujú také grafické rozhranie, z ktorého vedia na prvý pohľad určiť počet nových bezpečnostných upozornení a zároveň ich závažnosť. Existuje viacero riešení, ale každé má svoje problémy a dalo by sa vylepšiť.

### Mobilná aplikácia pre BAM (Brnenský Architektonický Manuál)

Navrhol: Martin Otradovec

BAM je projekt poskytujúci databázu architektonicky významných objektov v Brne. Cielom realizácie bolo vytvoriť k už existujúcemu webu mobilnú aplikáciu poskytujúcu prístup k objektom, trasám a audios sprievodcom prívetivo a offline. Ďalším možným prvkom je skenovanie kódov, ktoré sú po Brne rozmiestnené pri budovách alebo detekcia budov v okolí podľa GPS. Aplikáciu by bolo možné v prípade kvalitnej realizácie ponúknuť BAMu pre reálne využitie, pripadne rozvinúť do bakalárskej práce. Záujem medzi užívateľmi existujúceho webu je nezanedbateľný. Podobná aplikácia existuje vo forme postaršej bakalárskej práce, ale nie je verejne prístupná.

### Mobilná aplikácia pre objednávanie a zostavanie hamburgerov - Food Blueprint

Navrhol: Marek Vandík

Aplikácia Food Blueprint má za cieľ umožniť svojim užívateľom nielen objednávať, ale rovno poskladať burger podľa prefrencií užívateľov. Inšpiráciou pre toto téma sú hlavne samoobslužné systému v reštauráciách ako sú McDonald's, Burger King apod. Bolo by zaujímavé, keby užívatelia aplikácie mohli sami vytvárať hamburgery podľa svojich predstáv (zostaviť burger z obľúbeného typu žemle, mäsa atp.) a boli by schopný medzi sebou svoje výtvory zdieľať. Funkcionalitu zostaviť burger síce predtým zmienené systémy umožňujú, ale nie je to ich hlavný zámer a napr. neponúkajú (z môjho predchádzajúceho prieskumu) alebo je moc zložité prehodiť poradie ingrediencií.

## Vybrané téma

Po hlasovaní a dohode sme vybrali aplikáciu pre objednávanie a zostavanie hamburgerov - Food Blueprint. Aplikácia je relatívne jednoduchá na realizáciu a zber dár pre prieskum uživateľských potrieb.

# Průzkum

## Matúš

### Dotazník

1. Používali ste niekedy aplikáciu na objednávanie jedla?
    * Možnosti: Áno/Nie
    * Cieľ otázky: Prefiltrovanie respondentov na vhodných a nevhodných pre náš prieskum
    * Zistenie: Všetci respondenti odpovedali áno a sú teda vhodný pre náš prieskum

2. Čo sa vám páčilo na ich GUI?
    * Možnosti: Páči sa mi ich vzhlad, na "dáme jídlo" sa mi nepáči úvodná stránka ktorá je moc chaotická
    * Cieľ otázky: Aké GUI je pre užívateľov najlepšie? Majú radi GUI ostatných aplikácií?
    * Zistenie: Aplikácie ktoré sú momentálne na trhu majú ideálne GUI pre užívateľov a 

3. Čo sa vám páčilo na ich dizajne?
    * Možnosti: Majú tak akurát myšlienok, ani veľa ani málo. / Sú prívetivé a nemajú veľa farieb.
    * Cieľ otázky: Aký dizajn aplikácií sa respondentom najviac páči?
    * Zistenie: Respondenti preferujú jednoduché aplikácie ktoré majú minimálnu paletu farieb.

4. Aký je pre vás najdôležitejší faktor pri výbere hamburgeru?
    * Možnosti: Ingrediencie, suroviny / Ingrediencie, zloženie
    * Cieľ otázky: Na základne čoho sa užívatelia rozhodujú pri výbere hamburgeru?
    * Zistenie: Užívateľom najviac záleží na surovinách, ingredienciách a zložení hamburgeru.

5. Ako by ste si predstavovali výber hamburgeru?
    * Možnosti: Chcem si vyberať suroviny / Základná šablóna ktorú neskôr doupravím
    * Cieľ otázky: Aký je pre užívateľov najlepší spôsob ako si vybrať svôj burger?
    * Zistenie: Užívatelia si chcú upraviť svoje hamburgeri, z toho vyplýva že, naša aplikácia má zmysel.

6. Sú pre vás možnosť prispôsobenia burgerov dostačujúce?
    * Odpovede: Nie. Málo nevídám kuřecí burgery. Kamarátka hovädzie nemá rada, takže sme nemohli ísť na burger / Nie, chcela by som vidieť niečo nové. 
    * Cieľ otázky: Zistenie či naša aplikácia má zmysel a či užívatelia chcú viac prispôsobiť ingrediencie v svojich burgeroch.
    * Zistenie: Respondeti majú potrebu prispôsobiť si burgre.

7. Sú pre vás aplikácie, ktoré sú momentálne na trhu, uspokojivé?
    * Možnosti: Áno/Nie
    * Cieľ otázky: Sú užívatelia spokojný s aplikáciami ktoré sú momentálne na trhu?
    * Zistenie: Respondeti odpovedali pol na pol. Nedá sa jednoznačne určiť či sú spokojný s aplikáciami ktoré sú momentálne na trhu.

8. Narazili ste na preblém pri objednávaní burgeru?
    * Možnosti: Áno, chýbala mi možnosť výberu mäsa / Nikdy som neobjednavala burger
    * Cieľ otázky: Majú respondeti problémy pri objednávaní burgerov? 
    * Zistenie: Užívatelia sa pri objednávaní burgerov stretávajú s problémami. Chcú upravovať zloženie burgerov.

9. Je nejaká špecifická funkcia ktorá podla vás chýba ostatným aplikáciam na jedlo?
    * Možnosti: Áno, chýba mi upravovanie jedla / Upravovanie surovín v burgery
    * Cieľ otázky: Potrebuje naša aplikácia novú funkciu, inú ako konkurečné aplikácie na objednávanie jedla?
    * Zistenie: Respondenti majú záujem o aplikáciu ktorá by umožňovala detailne upravovať jedlo.

10. Aký typ užívateľského rozhrania vám príde najprívetivejší?
    * Možnosti: jednoduchý a minimalistický / farebný / vysoký kontrasy
    * Cieľ otázky: Aký vzhľad UI príde respondentom najprívetivejší?
    * Zistenie: Respondeti preferujú farebné, jednoduché a minimalistické aplikácie.

11. Aké prísady podla vás patria do hamburgeru?
    * Odpovede: hovädzie mäso, bravčové mäso, kuracie mäso, mix mäso, svetlá a tmavá žemľa, cheddar, hermelín, niva, šalár, rajčina, cibuľa, uhorky, olivy, majonéza, BBQ, chilli, volské oko
    * Cieľ otázky: Zistenie aké ingriencie má naša aplikácia obsahovať.
    * Zistenie: Zoznam ingrediencií ktoré užívatelia chcú od našej aplikácie.

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
    *body sú priradné podľa toho, ako vysoko užívatelia jednotlivé položky umiestnili, následne boli body sčítané*
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

## Výstup prieskumu

### Kľúčové potreby užívateľov
- nedostatočné úpravy jedla

### Uživateľské potreby
Ostatné aplikácie sú málo prehladné. 
Najvýraznejšou funkciou na home page bude vytvorenie novej objednávky. Ďalšou funkciou na home page bude ponuka jedál. Ako posledná možnosť bude vytvorenie nového burgeru. História a nastavenie budú najmenej nápadné. 

### Kľúčové vlastnosti budúcej aplikácie
- prehladnosť
- filtrovanie položiek
- vidieť fotky jedla
- predvytvorené jedlá 
- uprava predvytvorených jedál
- cena jednotlivých položiek
- upravovanie jedla podľa vlastných potrieb (diety, jedálníčku, chuti)
- prehladná homepage
- zvyšovanie množstva prísad (namiesto klikania znovu)
- nevyžadovať registáciu
- zľavy (mimo rozsah)

## Makety
### Matúš
- TODO: obrázok
- TODO: popis

### Marek
- TODO: obrázok
- TODO: popis

### Martin
- TODO: obrázok
- TODO: popis

## Rozdelenie práce
- 2. Každý člen pracuje na časti aplikácie, výsledkom je jedna aplikácia

### Matúš
- dokonečenie objednávky (checkout) 
- hlavná stránka (home page)

### Marek
- zdielanie burgerov (community workshop)

### Martin
- skladanie burgerov
- ukladanie vytvorených burgerov

# Testovanie

## Matúš

### Metriky
- počet pokusov na splnenie úlohy
- počet otázok
- využitie nápovedy

#### Úlohy:
1. Vytvorenie novej objednávky 
2. Voľba suroviny 
3. Zaplatenie objednávky
4. Stornovanie objednávky
5. Prehlad objednávok
6. Zmena nastavení
7. Prehlad uloženého jedla
8. Prehlad vytvoreného jedla
9. Návrat na hlavnú stránku

### Priebeh
Uživatelia nemali problémy pri plnení úloh. Nepotrebovali žiadne nápovedy a zvládli splniť všeky úlohy. Jedinú komplikáciu spôsobil zlý piktogram pre návrat na hlavnú stránku a absencia tlačítka pri dokončení objednácky, ktoré by tiež umožňovalo návrat na hlavnú stránku.

### Výsledky
- Úspešnosť oboch užívatelov bola 89%. Splinili 8 z 9 úloh na prvý pokus a 1 úlohu na druhý pokus
- Je nutné zmeniť tlačítko pre návrat na hlavnú stránku
- Piktogramu pre návrat na hlavnú stránku je mätúci a vyžaduje zmenu

## Marek
### Metriky
### Priebeh
### Výsledky

## Martin
### Metriky
- Počet žiadostí o nápovedu
- Počet sťažností / pripomienok na rozloženie / prehladnosť rozhrania

### Priebeh
Rozhranie bolo testované na 3 užívateloch formou scenára s konkrétnými úlohami. Každý užívateľ dostal základný kontext o aplikácií. Kvôli limontáciám neplatenej figmy niektorá funkcionalita nebola v prototype similovaná. Napríklad drag and drop (pridávanie ingrediencií alebo pridávanie burgerov do objednávky).

Úlohy:
- Vytvoriť nový burger, pomenovať ho, pridať surovinu, uložiť
    - 1/3 užívatelov nenašla premenovanie burgeru, symbol je moc nevýrazný
    - 0/3 užívatelov malo pripomienky
- Pridať burger do objednávky, prejsť checkou a odoslať objednávku
    - 0/3 užívatelov vyžadovalo nápovedu 
    - 2/3 užívatelov malo problém trafiť tlačítko kvôli malej veľkosti UI
- Vytvoriť nový burger, pomenovať ho, zverejniť
    - 0/3 užívatelov vyžadovalo nápovedu, zverejnenie sa uskutoční okamžite a chýba potvrdzovacie okno
    - 2/3 užívatelov malo pripomienky
- Odstrániť položku z objednávky
    - 1/3 užívatelov neodhalili funkčnosť (drag and drop mimo objednávkového priestora)
    - 0/3 užívatelov malo pripomienky
- Prehliadnuť si svoje objednávky
    - 1/3 užívatelov vyžadovalo nápovedu, malé tlačítko, schované
    - 0/3 užívatelov malo pripomienky

### Výsledky
12/15 úloh bolo splnených bez žiadosti o nápovedu. Väčšina pripomienok a žiadostí o nápovedu bolo zpôsobená malými veľkosťami tlačítok, texto a polí na vkladanie. Inak pôsobí aplikácia prehlane a prívetivo.

# Maketa / Diagram / Screenshot
# Riešenie preblémov uživateľov

# Architektura

Aplikace je rozdělena na backend server a mobilní aplikaci, které spolu komunikují pomocí HTTP Rest API. Mobilní aplikace posílá požadavky na backendový server, který provede nějakou operaci (případně nad daty z databáze) a odpovídá. Zvolená architektura se dá s přimhouřením oka nazvat MVC přístupem - databázový model, byznys logika a zobrazení pro uživatele jsou jasně odděleny. Jediným rozdílem je rozdělení ve více úrovních. Backendový server bude obsahovat model (databázový; struktury mapující záznamy), controller (byznys logika jednotlivých přístupových bodů rozhraní). Frontend potom znovu model (namapování odpovědí z API na struktury v paměti), controller (byznys logika pracující nad daty v paměti) a výsledné view, tedy zobrazení uživateli. Architektura je tímto vcelku komplikovaná a obsahuje přebytečné vrstvy (dalo by se zjednodušit použitím lokálního uložení dat - "čisté" MVC), jde ale o realizaci, která se běžně používá v praxi a je nutná pro naši funkcionalitu. Díky rozdělení backendového serveru a poskytnutí veřejné API je možné připojit více zařízení na stejný zdroj dat, je tedy možné mezi uživateli interagovat.

Jedním z požadavků uživatelů bylo nevytvářet uživatelské účty pro správu jídel a objednání. Při nainstalování aplikace (popř. prvním požadavku na BE server) se tedy uživateli vygeneruje unikátní identifikátor, který bude uložený lokálně na jejich telefonu. Podle něj budou přiřazena vytvořená jídla a objednávky. Toto řešení je pro reálný svět nejspíš nedostatečné. Při získání identifikátoru nebezpečnou třetí stranou získá přístup k adrese, atp. 

## Platforma

Jedinou podporovanou platformou je Android. Cílem bylo vyvinout mobilní aplikaci, bohužel vývoj pro iOS vyžaduje sestavení aplikace na stroji od společnosti Apple, který nikdo z týmu nevlastní. Nebylo by tedy možné aplikaci sestavit, ani ladit při vývoji.

## Mobilní aplikace

Definuje jednotlivé modely dat `Food { name: str, published: bool, ingredients: [{ ...Ingredient, amount }] }`, `Ingredient { name: str, price: num }`, `Order { foods: [{ ...Food, amount }], ...delivery details }`, které odpovídají datům vráceným z backendového serveru.

// TODO: doplnit definované funkce a datový struktury dle toho, co reálně kostra obsahuje

Pro vývoj mobilní aplikace jsme zvolili framework Flutter. Převážně z důvodu stability, ekosystému a skvělých vývojářských nástrojů. Programovací jazyk dart, který flutter využívá je flexibiní a umožňuje rychlý vývoj, zároveň je velice podobný jazykům, které jsme dříve využívali. Flutter podporuje sestavování aplikací na více platforem. Tuto funkcionalitu v projektu nevyužijeme, i přes to jsme se rozhodli flutter využít oproti např. React Native nebo čistému Android SDK s Javou/Kotlinem.

## Backendový server s Rest API

Backendový server definuje následující datové struktury:
`Ingredient` - ingredience, jsou předvytvořené v databázi (uvažujme, že je přidává a spravuje strana restaurace), definují název a cenu
`Food` - vytvořené jídlo, má název a přiřazené ingredience s počtem kusů.
`Order` - objednávka, obsahuje objednaná jídla a informace o doručení objednávky
`Keeper` - identifikátory uživatelů, definuje pouze vytvoření nového identifikátoru a kontrolu, zda identifikátor existuje

a skupiny přístupových bodů:
`/ingredients` - pro správu ingrediencí ze strany restaurace, v aplikaci pravděpodobně nebude využito, dovoluje všechny CRUD operace, operauje nad moodelem `Ingredient`
`/foods` - vytvořená jídla uživateli a jídla sdílená s ostatními, dovoluje všechny CRUD operace, operuje nad modelem `Food`
`/orders` - objednávky vytvořené uživatelem, dovoluje všechny CRUD operace, operuje nad modelem `Order`

Server je zabezpečený přístupovým klíčem, který je nutno specifikovat v hlavičce HTTP požadavků `API-Key`, jde převážně o zamezení přístupu nechtěným stranám. V případě veřejné distribuce aplikace ale není nutné a ani by správně nefungovalo (klíč by musel být distribuovaný v aplikaci - získatelný).

Backendový server je postavený na frameworku adonis.js, který je napsaný v typescriptu a běží v nodejs prostředí. Je relativně nový a silně inspirovaný php frameworkem Laravel. Zvolili jsme jej převážně kvůli flexibilně jazyka a jednoduchosti frameworku vzhledem k tomu, že hlavní prioritou projektu je mobilní aplikace. Framework už v základu obsahuje spoustu věcí a přidávání další funkcionality je relativně snadné. Máme s ním také předchozí zkušenosti.
