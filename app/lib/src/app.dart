import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_blueprint/src/env/env.dart';
import 'package:food_blueprint/src/pages/basic/basic_page.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_controller.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_page.dart';
import 'package:food_blueprint/src/pages/community/community_page.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/pages/home/home_page.dart';
import 'package:food_blueprint/src/pages/mine/mine_page.dart';
import 'package:food_blueprint/src/pages/order_new/order_confirm_page.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_controller.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_page.dart';
import 'package:food_blueprint/src/pages/order_show/order_show_controller.dart';
import 'package:food_blueprint/src/pages/order_show/order_show_page.dart';
import 'package:food_blueprint/src/pages/settings/settings_controller.dart';
import 'package:food_blueprint/src/pages/settings/settings_page.dart';
import 'package:food_blueprint/src/services/burger_service.dart';
import 'package:food_blueprint/src/services/ingredient_service.dart';
import 'package:food_blueprint/src/services/order_service.dart';
import 'package:food_blueprint/src/services/rating_service.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  final Environment env = Environment();

  MyApp({super.key});

  TextTheme generateSingleColorTextTheme(Color textColor) {
    return TextTheme(
        bodyLarge: TextStyle(color: textColor),
        bodyMedium: TextStyle(color: textColor),
        bodySmall: TextStyle(color: textColor),
        displaySmall: TextStyle(color: textColor),
        displayMedium: TextStyle(color: textColor),
        displayLarge: TextStyle(color: textColor),
        labelSmall: TextStyle(color: textColor),
        labelMedium: TextStyle(color: textColor),
        labelLarge: TextStyle(color: textColor),
        titleSmall: TextStyle(color: textColor),
        titleMedium: TextStyle(color: textColor),
        titleLarge: TextStyle(color: textColor),
        headlineSmall: TextStyle(color: textColor),
        headlineMedium: TextStyle(color: textColor),
        headlineLarge: TextStyle(color: textColor));
  }

  @override
  Widget build(BuildContext context) {
    final BurgerService burgerService = BurgerService();
    final RatingService ratingService = RatingService();
    final IngredientService ingredientService = IngredientService();
    final HomeController homeController = HomeController(burgerService);
    final BurgerEditController foodEditController =
        BurgerEditController(burgerService, ingredientService);

    final OrderService orderService = OrderService();
    final OrderNewController orderNewController =
        OrderNewController(orderService);
    final OrderShowController orderShowController =
        OrderShowController(orderService);

    const SettingsController settingsController = SettingsController();

    ThemeData themeData = ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: ThemeColors.colorOnion,
        fontFamily: GoogleFonts.outfit().fontFamily,
        textTheme: generateSingleColorTextTheme(ThemeColors.colorMeat));

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

      debugShowCheckedModeBanner: false,

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
      theme: themeData,
      darkTheme: themeData.copyWith(
          scaffoldBackgroundColor: Colors.black,
          textTheme: generateSingleColorTextTheme(ThemeColors.colorOnion)),

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
                return const OrderConfirmPage();
              case OrderShowPage.routeName:
                return OrderShowPage(controller: orderShowController);
              case SettingsPage.routeName:
                return const SettingsPage(controller: settingsController);
              case MinePage.routeName:
                return MinePage(controller: homeController);
              case CommunityPage.routeName:
                return CommunityPage(
                    burgerService: burgerService, ratingService: ratingService);
              case BasicPage.routeName:
                return BasicPage(controller: homeController);
              default:
                return HomePage(controller: homeController);
            }
          },
        );
      },
    );
  }
}
