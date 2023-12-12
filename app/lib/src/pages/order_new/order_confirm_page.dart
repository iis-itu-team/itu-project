import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/order_show/order_show_page.dart';
import 'package:food_blueprint/src/pages/settings/settings_page.dart';
import 'package:food_blueprint/src/theme/theme.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class OrderConfirmPage extends StatelessWidget {
  const OrderConfirmPage({super.key});

  static const routeName = '/order_confirm';

  get selectedMenu => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: COLOR_PRIMARY,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
              if (value == 'moje objednávky') {
                Navigator.pushNamed(context, OrderShowPage.routeName);
              } else if (value == 'nastavenia') {
                Navigator.pushNamed(context, SettingsPage.routeName);
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'moje objednávky',
                  child: Text('moje objednávky'),
                ),
                const PopupMenuItem<String>(
                  value: 'nastavenia',
                  child: Text('nastavenia'),
                ),
              ];
            },
            color: COLOR_SECONDARY,
          ),
        ],
      ),
      body: Container(
        color: COLOR_SECONDARY,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ďakujeme",
                style: TextStyle(
                    color: COLOR_TEXT,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                "Vaša objednávka je na ceste!",
                style: TextStyle(
                    color: COLOR_TEXT,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
