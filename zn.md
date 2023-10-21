# Správa Návrhu

# Téma

## Návrhy

// - Sepsat návrhy
// TODO: Matúš
// TODO: Marek

### Webová aplikácia pre EDR (Endpoint Detection and Response)

Navrhol: Matúš Hubinský

EDR systémy analyzujú chovania viacerých zariadení a vyhodnocujú bezpečnostné hrozby na základe udalostí zaznamenaných v databáze. Ak vyhodnotia chovanie ako nebezpečné vygenerujú alert. Tento alert je následne spracovaný bezpečnostným analytikom, ktorý sa venuje monitoringu. Bezpečnostný analytici môžu naraz monitorovať viarece systémov a preto potrebujú také grafické rozhranie, z ktorého vedia na prvý pohľad určiť počet nových bezpečnostných alertov a zároveň ich závažnosť. Existuje viacero riešení, ale každé má svoje problémy a dalo by sa vylepšiť.

### Mobilní aplikace pro BAM (Brněnský Architektonický Manuál)

Navrhl: Martin Otradovec

BAM je projekt poskytující databázi architektonicky významných objektů v Brně. Cílem realizace by bylo vytvořit k již existujícímu webu mobilní aplikaci poskytující přístup k objektům, trasám a audioprůvodcům přívětivě a offline. Dalším možným prvkem je skenování kódú, které jsou po Brně rozmístěny u budov nebo detekce budov v okolí podle GPS. Aplikaci by bylo možné v případě kvalitní realizace nabídnout BAMu pro reálné využití, případně rozvinout do bakalářské práce. Zájem mezi uživateli existujícího webu je značný. Podobná applikace existuje pouze ve formě postarší bakalářské práce, ale není veřejně přístupná.

## Vybrané téma

Po hlasování a domluvě jsme vybrali aplikaci pro objednávání jídel - konkrétně hamburgerů.Aplikace je relativně jednoduchá na realizaci a sběr dat pro průzkum uživatelských potřeb.

// TODO: *"stačí uvést vybrané téma a zdůvodnění"*, tohle tedy přepsat Markem na jeho návrh, pak smazat
// Ako téma sme si vybrali aplikáciu pre upravovanie a objednávanie hamburgerov. Chceme aby si každý užívateľ mohol pripraviť a objednať svôj burger podľa jeho vlastných predstáv.Hamburgery by mali mať možnosť nastavovania žemle, mäsa, syra, omáčok, atd.

# Průzkum

// dopísať dotazníky
// TODO: Marek
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

// TODO
### Dotazník
#### Uživatelské potřeby
#### Klíčové problémy
### Porovnání s existujícími aplikacemi
#### Prednosti
#### Nedostatky
#### Inšpirácia a riešenie nedostatkov

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
