import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_blueprint/src/env/env.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_controller.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_page.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/pages/home/home_page.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_page.dart';
import 'package:food_blueprint/src/pages/order_new/order_confirm_page.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_controller.dart';
import 'package:food_blueprint/src/pages/order_show/order_show_page.dart';
import 'package:food_blueprint/src/pages/order_show/order_show_controller.dart';
import 'package:food_blueprint/src/services/burger_service/burger_service.dart';
import 'package:food_blueprint/src/services/order_service/order_service.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  final Environment env = Environment();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final BurgerService burgerService = BurgerService();
    final HomeController homeController = HomeController(burgerService);
    final BurgerEditController foodEditController =
        BurgerEditController(burgerService);

    final OrderService orderService = OrderService();
    final OrderNewController orderNewController =
        OrderNewController(orderService);
    final OrderShowController orderShowController =
        OrderShowController(orderService);

    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MaterialApp(
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',

      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],

      // Use AppLocalizations to configure the correct application title
      // depending on the user's locale.
      //
      // The appTitle is defined in .arb files found in the localization
      // directory.
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,

      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // SettingsController to display the correct theme.
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      // themeMode: settingsController.themeMode,

      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case HomePage.routeName:
                return HomePage(controller: homeController);
              case BurgerEditPage.routeName:
                return BurgerEditPage(controller: foodEditController);
              case OrderNewPage.routeName:
                return OrderNewPage(controller: orderNewController);
              case OrderConfirmPage.routeName:
                return OrderConfirmPage(controller: orderShowController);
              case OrderShowPage.routeName:
                return OrderShowPage(controller: orderShowController);
              default:
                return HomePage(controller: homeController);
            }
          },
        );
      },
    );
  }
}
