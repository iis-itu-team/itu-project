# Technická zpráva

Projekt: Food Blueprint
Člen týmu: Marek Vandík (xvandi01)


## O projektu

Projekt Food Blueprint umožňuje uživatelům sestavovat a objednávat burgery a m.j. je sdílet s ostatními uživateli.

Projekt je implementován jako mobilní aplikace s využitím platformy Flutter s BE běžící na AdonisJS s postgreSQL DB (viz README.md).

Cílem projektu bylo umožnit uživatelům sestavit si burger přímo podle jejich představ, protože jsme nenarazili na podobnou aplikaci (resp. aplikaci, která by to uměla opravdu dobře / se soustředila přímo na to).


## Autorská část implementace

Autorská část implementace Marka Vandíka zahrnuje následující soubory:

xvandi01.zip/app/src/lib
- interfaces/irating_changed.dart
- models/burger.dart
- pages/community/community_page.dart
- services
	- burger_service.dart
	- rating_service.dart
- theme/theme.dart
- widgets
	- burger_rating_widget.dart
	- burger_select_widget.dart
	- burger_select_floating_page.dart
	- button_share.dart
	- rating_searchbar.dart
	- row_menu_widget.dart
	- button_widget.dart
						  
Implementace zahrnuje stránku komunitního workshopu (community_page.dart), která nabízí uživateli burgery hodnotit (model navrácený z BE burger.dart, widget pro hodnocení - burger_rating_widget.dart a služba pro komunikaci s BE - rating_service.dart). Komunitní workshop také zobrazuje přehled nejlépe hodnocených burgerů (funkce listTopCommunityBurgers() ze služby burger_service.dart) a přehled všech burgerů s možností filtrace (funkce listCommunityBurgers(searchQuery = '')). Tyto zmíněné funkce simulují funkcionalitu, která by normálně byla dostupná na BE, ale z časových důvodů jsme ji nestihli na BE naimplementovat. Při vyhledání burgeru podle názvu se nejprve spustí časovač s prodlevou 1.5s, který následně zašle požadavek na BE, jestliže není do té doby přerušen a spuštěn znovu.

BurgerRatingWidget umožňuje uživateli hodnotit burger jako přispěvky na sociální síti Reddit - funkcionalita tlačítek je identická. Mimo jiné implementuje rozhraní IRatingChanged (irating_changed.dart), které je zjednodušeným návrhovým vzorem pro správu událostí - instance této komponenty se přihlašují k poslechu události notify() u služby rating_service.dart, která při změně hodnocení provolá metodu BurgerRatingWidget.onRatingChanged(String burgerId, BurgerRating currentRating, int totalRating). Komponenta se následně překreslí, je-li to potřeba.

Modální okno BurgerSelectFloatingPage umožňuje vybrat a nahrát do workshopu nové burgery. K tomu využívá komponentu burger_select_widget.dart, která slouží k zaškrtnutí daného burgeru.

Navigace (row_menu_widget.dart a button_widget.dart) je řešena pomocí jednoduchého seznamu tlačítek se zkrácenými názvy stránek. Tento seznam se vyskytuje hned nahoře na stránce hned pod záhlavím a aktuální stránka je barevně podtržena. V implementaci je jako autor uveden kolega Matúš Hubinský, nicméně z jeho prvotní implementace této navigační komponenty zbylo jen naprosté minimum, proto si dovolím tvrdit, že navigace je implementována mnou.

Třída ThemeColors (theme.dart) zapouzdřuje barvy použité ve stylech komponent.


## MVVM

V komponentách je využit implicitní návrhový vzor MVVM. Metoda build ve Stateless komponentě (případně v State<T> komponenty T extends StatefulWidget) je definicí view a zbývající kód následně funguje jako code-behind (ViewModel) pro konkrétní instanci Widget po zavolání této metody a umí např. změnit stav a následně překreslit komponentu (pouze u StatefulWidget). Při systémovém volaní build se vytvoří Element v ElementTree, který už představuje konkrétní stav dané komponenty (Model) podle definice třídy State<T> pro T extends StatefulWidget (jinak pouze Element vytvořený implicitně obsahující nejnutnější informace jako je id komponenty).
