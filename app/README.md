# Food Blueprint Aplikace

Mobilní aplikace pro Android.

## Požadavky pro vývoj

- [Flutter](https://flutter.dev/) - nainstalovat [podle oficiálního návodu](https://docs.flutter.dev/get-started/install)
- Spuštěná API

## Příprava pro vývoj

Nainstalujte flutter packages \
`flutter pub get`

Vytvořte nový soubor `.env` z templatu \
`cp .env.template .env`

Nastavte proměnné `BASE_URL` a `API_Key` v `.env` \
`BASE_URL` podle URL dostupné API, kterou chcete využívat. (např.: `https://api.foodblue.devport.space`) \
`API_KEY` podle hodnoty proměnné `API_Key` v `.env` backendu. (pro využití veřejné API je hodnota `d3pl0y3d#14`) \
Pokud chcete použít lokální API v kombinaci s emulátorem, MUSÍTE použít adresu `http://10.0.2.2` s portem z npm serveru.

Připojte zařízení pro spuštění aplikace (emulátor nebo fyzické zařízení) podle návodu na https://docs.flutter.dev/get-started/install/linux#set-up-your-android-device

Spusťte aplikaci pomocí `flutter run` \
(případně přidejte `--hot` pro možnost hot reloadu)

## Použité knihovny
- [flutter](https://flutter.dev) - [licence](./licenses/FLUTTER)
- [event_bus](https://pub.dev/packages/event_bus) - distribuci eventů mezi více stránkami
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) - načítání `.env` konfiguračního souboru
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) - generování a nastavení ikonky aplikace v Androidu
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) - generování ikonky a pozadí aplikace při načítání (Android Splash)
- [flutter_svg](https://pub.dev/packages/flutter_svg) - načítání SVG assetů
- [google_fonts](https://pub.dev/packages/google_fonts) - využití google fonts
- [http](https://pub.dev/packages/http) - základní dart klient pro HTTP komunikaci
- [shared_preferences](https://pub.dev/packages/shared_preferences) - pro perzistentní uložení dat aplikace na disku

Licence použitých knihoven jsou dostupné pod jejich odkazy.
