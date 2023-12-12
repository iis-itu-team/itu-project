import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/settings/settings_controller.dart';

class SettingsPage extends StatelessWidget {
  final SettingsController controller;

  const SettingsPage({required this.controller, super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
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
              // do something
            },
          ),
        ],
      ),
      body: Container(
        color: COLOR_SECONDARY,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Nastavenia",
                style: TextStyle(
                    color: COLOR_TEXT,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            CheckboxListTile(
              value: false,
              onChanged: (val) {},
              activeColor: COLOR_SECONDARY,
              title: const Text(
                "Uchovávanie údajov pre sledovanie vašich detí",
                style: TextStyle(color: COLOR_TEXT, fontSize: 18),
              ),
            ),
            CheckboxListTile(
              value: false,
              onChanged: (val) {},
              activeColor: COLOR_SECONDARY,
              title: const Text(
                "Uchovávanie údajov ktoré môže jednoduche deanonymizovať užívatela",
                style: TextStyle(color: COLOR_TEXT, fontSize: 18),
              ),
            ),
          ],
        )),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        height: 100,
        color: COLOR_PRIMARY,
      ),
    );
  }
}
