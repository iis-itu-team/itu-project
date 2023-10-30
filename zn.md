# Správa Návrhu

# Téma

## Návrhy

### Webová aplikácia pre EDR (Endpoint Detection and Response)

Navrhol: Matúš Hubinský

EDR systémy analyzujú chovania viacerých zariadení a vyhodnocujú bezpečnostné hrozby na základe udalostí zaznamenaných v databáze. Ak vyhodnotia chovanie ako nebezpečné vygenerujú alert. Tento alert je následne spracovaný bezpečnostným analytikom, ktorý sa venuje monitoringu. Bezpečnostný analytici môžu naraz monitorovať viarece systémov a preto potrebujú také grafické rozhranie, z ktorého vedia na prvý pohľad určiť počet nových bezpečnostných alertov a zároveň ich závažnosť. Existuje viacero riešení, ale každé má svoje problémy a dalo by sa vylepšiť.

### Mobilní aplikace pro BAM (Brněnský Architektonický Manuál)

Navrhl: Martin Otradovec

BAM je projekt poskytující databázi architektonicky významných objektů v Brně. Cílem realizace by bylo vytvořit k již existujícímu webu mobilní aplikaci poskytující přístup k objektům, trasám a audioprůvodcům přívětivě a offline. Dalším možným prvkem je skenování kódú, které jsou po Brně rozmístěny u budov nebo detekce budov v okolí podle GPS. Aplikaci by bylo možné v případě kvalitní realizace nabídnout BAMu pro reálné využití, případně rozvinout do bakalářské práce. Zájem mezi uživateli existujícího webu je značný. Podobná applikace existuje pouze ve formě postarší bakalářské práce, ale není veřejně přístupná.

### Mobilní aplikace pro objednávání a sestavování burgerů - Food Blueprint

Navrhl: Marek Vandík

Aplikace Food Blueprint má za cíl umožnit svým uživatelům nejen objednávat, ale rovnou poskládat burger podle preferencí uživatelů. Inspirací pro toto téma jsou zejména samoobslužné systémy v restauracích jako jsou McDonald's, Burger King apod. Bylo by zajímavé, kdyby uživatelé aplikace mohli sami vytvářet burgery podle svých představ (sestavit burger z oblíbeného typu žemle, masa atp.) a byli schopni mezi sebou své výtvory sdílet. Funkcionalitu sestavit burger sice dříve zmíněné systémy umožňují, ale není to jejich hlavní záměr a např. nenabízí (z mého předběžného průzkumu) / je příliš složité prohodit pořadí ingrediencí.

## Vybrané téma

Po hlasování a domluvě jsme vybrali aplikaci pro objednávání a sestavování hamburgerů - Food Blueprint. Aplikace je relativně jednoduchá na realizaci a sběr dat pro průzkum uživatelských potřeb.


# Průzkum

## Matúš

### Dotazník
1. Používali ste niekedy aplikáciu na objednávanie jedla?
2. Ak áno, popíšte čo sa vám na nich páčilo.
3. Aké funkcie sa vám na nej páčili?
4. Čo sa vám páčilo na ich GUI?
5. Čo sa vám páčilo na ich dizajne?
6. Aký je pre vás najdôležitejší faktor pri výbere hamburgeru?
7. Ako by ste si predstavovali výber hamburgeru?
8. Sú pre vás možnosti výberu burgerov dostačujúce?
9. Sú pre vás možnosti prispôsobenia burgerov dostačujúce?
10. Sú pre vás aplikácie, ktoré sú momentálne na trhu, uspokojivé?
11. Narazili ste na problém pri objednávaní burgeru?
12. Je nejaká špecifická funkcia ktorá podla vás chýba ostatným aplikáciam na jedlo?
13. Aký typ uživatelského rozhrania vám príde najprívetivejší?
- [ ] jednoduchý a minimalistický
- [ ] farebný 
- [ ] vysoký kontrast

### Poznatky    
Všetci respondenti mali skúsenosti s používaním aplikácií na obejdnávanie jedlo. Respondenti si všímajú hlavne prehladnosť aplikácie. Pri väčšine aplikácií majú problém s nedostatočnou možnosťou úpravy jedla. Niektoré aplikácie ponúkajú možnosti odstránenie ingrediencií položiek, ale nemajú možnosť pridania ingrediencií navyše. Taktiež je pre nich dôležité aby bolo hlavná stránka prehladná a nebolo na nej nič čo nepotrebujú.

#### Potreby užívateľov
- prehladnosť aplikácie
- obrázky ingredienií a jedál
- nevyžadovanie registrácie

#### Kľúčové problémy
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
- veľký dôraz na možnosti upravovania jedľa
- predvytvorenie širokej ponuky hotových jedál


## Marek

### Dotazník

Sedmi uživatelům byl zaslán následující dotazník a dále byla provedena krátká diskuze nad odpověďmi a případnými nejasnostmi a dalšími náměty.

1. Uvítali byste možnost získat doporučení na dobrý burger od ostatních uživatelů?
	* Ano / Ne
	* Cíl zjištění: Má uživatel potřebu objednávat jídla podle ostatních uživatelů? - relevance modulu komunitního workshopu / sdílení burgerů
	* Zjištění: 6/7 uživatelů shledalo tuto funkcionalitu jako užitečnou, vhodné pro zařazení do projektu

2. Když navštěvujete nějakou restauraci, máte při vstupu jasno, co konkrétně budete jíst?
	* Ano / Ne
	* Cíl zjištění: Potřebuje uživatel nejprve vidět představení restaurace nebo přímo objednávat? - přivítat uživatele informacemi o restauraci / jídelním menu
	* Zjištění: Všichni dotazovaní vybírají až na místě - bylo by vhodné řádně představit menu / možnosti

3. Uvítali byste možnost uložit si recept na dobrý burger, který byste si snadno mohli objednat v budocnousti?
	* Ano / Ne
	* Cíl zjištění: Má uživatel potřebu ukládat si oblíbená jídla? - relevance modulu pro ukládání receptů
	* Zjištění: 3:4 část uživatelů by modul pro ukládání receptů využila, zřejmě vhodné pro zařazení do projektu

4. Jak často v restauracích jako je McDonald's nebo KFC upřednostníte objednávku u samoobslužného kiosku před klasickou objednávkou na pokladně?
	* Vždy (téměř vždy) / Využívám obě možnosti / Jen výjimečně, např. je-li příliš dlouhá fronta / Vůbec
	* Cíl zjištění: Familiarita uživatele s těmito systémy - relevance dalších odpovědí zaměřených konkrétněji na GUI
	* Zjištění: Všichni dotazovaní až na jediného respondenta, který odpověděl "Jen výjimečně", zvolili možnost "Vždy / téměř vždy" - výsledek odpovědí na GUI bude rozdělen váhově následujícím způsobem: Odpovědí respondentů, kteří vybrali "Vždy / téměř vždy", budou mít váhu 1. Zbývající respondent bude mít váhu 0.5

5. Kolik přibližně ingrediencí je podle Vás ideální počet v burgeru (housky se nepočítají)?
	* 2 a méně / 3 - 5 / 6 a více
	* Cíl zjištění: Přizpůsobení GUI pro nejčastější počet ingrediencí - velikost vykreslovaných položek
	* Zjištění: S váhou 3.5 lze předpokládat jako nejčastější počet položek možnost "6 a více". Možnost "3 - 5" měla váhu 3, a zbývající možnost "2 a méně" měla váhu 0

6. Stalo se vám někdy, že jste v burgeru chtěli mít nějakou ingredienci vícekrát / v jiné vrstvě burgeru?
	* Ano / Ne
	* Cíl zjištění: Potřeba uživatele měnit složení burgeru. Zpětně krajně zbytečné - pokryto otázkou 10, ale tahle otázka pro změnu zjišťuje příčinnou souvislost
	* Zjištění: 4:3 - Někteří uživatelé tuto funkcionalitu jistě uvítají, právě díky zkušenosti uvedené v otázce

7. Využili byste možnost sestavit si burger z předem daných ingrediencí dle vašich představ?
	* Ano / Ne
	* Cíl zjištění: Má uživatel potřebu sestavovat vlastní burgery? - relevance této aplikace
	* Zjištění: 6:1 Většina uživatelů by takovou možnost ráda využila - tato aplikace má smysl

8. Prosím, zařaďte následující ingredience do rozumného množství skupin.
	* ingredience: rajče, majonéza, slanina, hovězí, tatarka, okurek, tofu, chilli paprička, kuřecí, salát, zelí, sojové maso, hořčice
	* Cíl zjištění: Jak uživatelé nejčastěji nazývají různé kategorie ingrediencí - jak prezentovat ingredience
	* Zjištění: Uživatelé měli dosti různorodé řazení do skupin, ale z odpovědi lze vypozorovat, že většina uživatelů volila kategorizaci spíše na druhy jídla - omáčka, maso, zelenina, popř. vegan nebo specialita pro tofu a chilli. Jen minorita uživatelů volila nějak více odlišné rozdělení - po chodech (hlavní - maso, příloha - salát atp.) nebo podle toho, jak mají danou ingredienci rádi (nejlepší - maso, dobré - rajče atp.)

9. Prosím, zařaďte vyjmenované ingredience do uvedených kategorií. V případě, že nelze ingredienci logicky zařadit, vymyslete vlastní kategorii.
	* ingredience: rajče, slanina, hovězí, okurek, tofu, chilli paprička, kuřecí, salát, zelí, sojové maso
	* kategorie: maso, zelenina
	* Cíl zjištění: Jako 8) se zaměřením na specifické ingredience: slanina, chilli, tofu - nelze jednoznačně určit, jak tyto ingredience kategorizovat + porovnání s 8)
	* Zjištění: Bohužel z výsledků nelze jednoznačně určit zařazení sledovaných surovin. Pro slaninu část lidí volila kategorii maso, ale části lidem toto zařazení nevyhovovalo a raději vymysleli jinou kategorii jako např. specialita nebo doplněk. Pro chilli většina lidí volila kategorii zelenina, ale stále se našli repsondenti, kteří by preferovali speciální zařazení mimo zeleninu opět jako specialita atp. U tofu byl střet rozhodování asi největší - objevily se kategorie maso, zelenina i specialita, popř. vegan (respondent, který je vegan, uvedl, že mu nejlépe vyhovuje zařazení specialita)

10. Při výběru předem sestaveného burgeru, uvítali byste možnost tento burger upravit?
	* Upravit / Ponechat bez úprav
	* Cíl zjištění: Potřeba uživatele měnit předem připravené burgery
	* Zjištění: 6:1 uživatelů by uvítalo možnost měnit složení předem sestavených burgerů

11. Při ukládání Vašeho burgeru, přáli byste si, aby tento burger mohli vidět i ostatní uživatelé?
	* Uložit viditelně pro všechny / Uložit jen pro sebe / Uvítal bych obě možnosti
	* Cíl zjištění: Má uživatel potřebu svůj burger ukládat a sdílet jej?
	* Zjištění: 2:0:4 a "vůbec neukládat" - Většina uživatelů by uvítala tuto možnost včetně rozlišení soukromých a veřejných burgerů. Odpověď "vůbec neukládat" pramení ze špatně formulované otázky

12. Chtěli byste sestavovat burger pomocí tlačítek pro přidávání jednotlivých ingrediencí do určité vrstvy, nebo raději dotykově přesouvat ingredience z nabídky přímo do burgeru?
	* Tlačítka / Přesouvat / Jiné
	* Cíl zjištění: Jáky způsob zadávání ingrediencí je pro uživatele nejlepší?
	* Zjištění: 1:4.5:1 - Většina uživatelů by preferovala přesouvání ingrediencí přímo do burgeru

13. Co chcete vidět jako první, když otevřete aplikaci pro objednání jídla z konkrétní restaurace?
	* Nabídku standardních burgerů / Sestavovač burgeru / Nabídku komunitních burgerů (doporučení burgerů od ostatních uživatelů) / Jiné
	* Cíl zjištění: Co má uživatel potřebu vidět jako první?
	* Zjištění: 0.5:3:3.5 - Uživatelé by preferovali nabídku komunitních burgerů nebo sestavovač. Hodnocení 0.5 z důvodu výběru 2 možností u jednoho respondenta

14. Je pro Vás důležité vidět cenu burgeru a jeho ingrediencí při sestavování
	* Ano, tuto informaci chci vidět hned / Ne, na obrazovce by bylo příliš mnoho informací (stačí až při platbě)
	* Cíl zjištění: Má uživatel potřebu vidět průběžně cenu burgeru a jeho ingrediencí při sestavování?
	* Zjištění: 7:0 - Uživatelé potřebují vidět cenu burgeru a jeho položek již při sestavování

15. Představte si, že v naší aplikaci sestavujete vlastní burger. Jak by se Vám líbilo řešení situace, když máte více stejných ingrediencí nad sebou?
	* Zobrazovat počet u každé ingredience a vykreslit ji pouze jednou / Zobrazovat každou ingredienci zvlášť - tedy i např. 2x maso nad sebou apod.
	* Cíl zjištění: Jak nejlépe zobrazovat ingredience při sestavování burgeru?
	* Zjištění: 3:4 - Většina uživatelů zvolila možnost vykreslování jednotlivě. V diskuzi po vyplnění dotazníku bylo zjištěno, že obě varianty jsou vyhovující pro všechny respondenty

### Porovnání s existujícími aplikacemi
- McDonald's mobilní aplikace pro iOS
#### Přednosti
- hezky řešené kalorické hodnoty jídel;
- dobře rozdělené burgery do kategorií;
#### Nedostatky
- 2 různé pohledy na jídla, přičemž jeden se použivá pro objednání na pobočce a zároveň pro prezentaci jídla, a druhý pro objednání z Foodory apod, což je dost matoucí. Proč?;
- neumožňuje sdílení burgerů;
- neumožňuje ukládat oblibené burgery;
#### Inspirace a řešení nedostatků
- inspirace: rozdělení burgerů - grafika i kategorie;
- nedostatky: implementace dané funkcionality, pouze jeden pohled jak pro objednání tak pro prezentaci jídla;

## Martin

### Dotazník
Dotazník byl veden formou rozhovoru se 3 subjekty.

"**\***" Nejspíš bude mimo rozsah naší realizace
"=>" implikace pro naši realizace aplikace z odpovědi

1. Využíváte aplikace pro dovozové služby jídla, popř. které?

    Cíl: úvodní zjištění nedostatků/super prvků ostatních aplikací

2. Jak jste spokojeni s jednotlivými aplikacemi, co se vám na nich líbí/nelíbí?

    Cíl: zjištění možných prvků pro aplikaci, případně čemu se vyvarovat

    Poznatky:
    - Nedostatečně přesné a nepřehledné určení adresy doručení => přidat do aplikace možnost specifikovat přesnou adresu (adresa, patro, číslo bytu?)
    - Nespecifikované pokyny a průběh doručení jídla (vedlo ke zmatku, panice, často odradilo od objednání) => přidat do poslední obrazovky checkoutu informace o tom, jak doručení proběhne
    - Nepřesné specifikace slev, nezobrazují se správně => přehlednou indikaci slev do checkoutu, případně už do košíku (objednávky při vytváření) **\***
    - Není přesně specifikované, co je zahrnuto v ceně => jasný soupis cen jednotlivých položek, ingrediencí

3. Je nějaká specifická funkce, která podle vás chybí ostatním aplikacím na jídlo?

    Poznatky:
    - Chybí online platby => implementovat platební bránu **\***
    - Pokročilé a zábavné slevy => implementovat gamifikaci slev, ruletu? minihry?; opakované objednávky povedou ke slevě? **\***

4. Máte někdy potřebu upravit si složení jídla, např. burgeru, pizzy v restauraci dle vlastních potřeb?

    Cíl: zjištění, zda uživatelé mají potřebu pro hlavní funkci navrhované aplikace

    Poznatky: Ano, upravení jídla dle vlastní diety, bez limitací => funkce pro skládání jídla má využití
    
5. Jaké přísady patří do správného burgeru?

    Cíl: zjištění přísad, které by v aplikaci měli být

    Poznatky: Anglická slanina, tofu, sójové maso, majonéza, kečup, rajče, okurek, salát, kapary,...

6. Pokud by jste měli možnost poskládat (nastavit si konkrétní složení) vašeho jídla, využili by jste ji, nebo zvolili zhotovené jídlo?

    Cíl: zjištění, zda uživatelé mají potřebu pro hlavní funkci navrhované aplikace

    Poznatky: Záleží na míře hladu, po aplikaci většinou člověk sáhne, když má hlad, tzn. nechce se mu trávit čas "skládáním" jídla. V případě, že čas má a napadne člověka zajímavá kombinace, využije => přidat do výběru jídel i předhotovené kombinace, nabízet sdílená jídla od ostatních uživatelů

7. Jak by mělo vypadat UI pro skládání burgeru?

    Cíl: rozvíjející otázka, jak má skládání jídla vypadat

    Poznatky:
    - Možnost upravit již existující jídla (předhotovená, komunitní, vlastní) => implementovat funkcni
    - Mírná gamifikace stylem "candy factory" hry, tzn. skládání jídla pomocí výrobní linky **\***
    - Přehledně, zobrazovat co nejvíce přísad najednou, co nejmíň zdržovat uživatele, zobrazit výsledné jídlo a jednotlivé vrstvy, možnost přehazovat

8. Pokud by jste měli možnost sdílet vaše poskládané jídlo s ostatními uživateli, využili by jste ji? 

    Cíl: zjištění, zda je sdílení jídel uživateli využitelná funkce

    Poznatky: Ano, jídlo by sdíleli

9. V případě, že by jste sdíleli své "poskládaný" jídlo, chtěli by jste u něj mít uvedené své jméno? Zahrnovalo by to vytvoření uživatelského účtu pomocí e-mailu a hesla.

    Cíl: vyžadovat/poskytovat vytvoření uživatelských účtů pro sdílení?

    Poznatky: Uživatelské účty jsou zbytečné zdržování => uživatelé nechcou registraci, účty

10. Využili by jste vytvoření uživatelského účtu pro přístup ke svým datům - objednávkám, 

    Cíl:
    - vyžadovat/poskytovat vytvoření uživatelských účtů, nebo pouze lokální data?

    Poznatky: Lokální data stačí, uživatelské účty nejsou nutné; případný přenos dat na více zařízení pomocí QR kódů / Bluetooth / Exportů **\***

11. Seřaďte prosím jednotlivé akce podle důležitosti:
    - Prohlédnout si jídla vytvořená ostatními
    - Prohlédnout si své předešlé objednávky
    - Prohlédnout si svá předem poskládaná jídla
    - Poskládat si nové jídlo
    - Vytvořit novou objednávku (v rámci vytvoření je dostupné poskládání jídla, prohlédnutí jídel od ostatních a prohlédnutí zhotovených jídel)

    Cíl: jakým způsobem skládat domovskou obrazovku? co je pro uživatele nejdůležitější?

    Výsledné pořadí:
    - 12b: Prohlédnout si jídla vytvořená ostatními
    - 11b: Vytvořit novou objednávku
    - 9b: Prohlédnout si svá poskládaná jídla
    - 8b: Prohlédnout si své předešlé objednávky
    - 5b: Poskládat si nové jídlo

    *body jsou přiřazené podle toho, jak vysoko položky jednotliví uživatelé umístili, potom sečtené*

    => na úvodní stránce aplikace zobrazit předvytvořená jídla a jídla vytvořená ostatními; zobrazit velké tlačítko na vytvoření nové objednávky; poskládání nového jídla a předešlé objednávky schovat, udělat menší, zapadlé

// TODO: Inšpirácia a Riešenie nedostatkov
### Porovnání s existujícími aplikacemi
- Dáme Jídlo

#### Přednosti
- Přehledné zadávání objednávek, checkout
- Nevyžaduje uživatelský účet pro objednání
#### Nedostatky
- Možnost změnit přísady jídel je nepřehledné, je možné pouze naklikat předem zadané přísady v seznamu (pokud to restaurace takto předvytvoří - není to funkce podporovaná aplikací)
- Chybí konkrétní informace o způsobu, jakým proběhne doručení jídla, aby uživatel, který vidí aplikaci poprvé věděl, co se bude dít a co má čekat
#### Inšpirácia a riešenie nedostatkov

## Výstup průzkumu

### Kľúčové potreby užívateľov
- nedostatočné úpravy jedla

### Uživateľské procesy
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
- 2. Každý člen pracuje na části aplikace, výsledkem je jedna aplikace.

### Marek
### Martin
### Matúš

# Maketa / Diagram / Screenshot
# Riešenie problémov uživateľov

# Testovanie
## Metriky
## Priebeh
## Výsledky

# Architektura
## FE
## BE
