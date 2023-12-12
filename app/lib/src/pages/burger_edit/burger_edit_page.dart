import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_controller.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_page.dart';
import 'package:food_blueprint/src/pages/settings/settings_page.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class BurgerEditPage extends StatelessWidget {
  final BurgerEditController controller;

  const BurgerEditPage({required this.controller, super.key});

  static const routeName = '/food-edit';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as BurgerEditArguments?;

    controller.enter(args);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: COLOR_PRIMARY,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Enter a burger name:"),
            TextField(
              onChanged: controller.handleNameUpdate,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to a different page here
                Navigator.pushNamed(context, OrderNewPage.routeName);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
