///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Date: 12. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/settings/settings_controller.dart';
import 'package:food_blueprint/src/widgets/app_bar_widget.dart';
import 'package:food_blueprint/src/widgets/checkbox_widget.dart';

class SettingsPage extends StatelessWidget {
  final SettingsController controller;

  const SettingsPage({required this.controller, super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(text: 'Nastavenia'),
      body: Container(
        color: ThemeColors.colorOnion,
        child: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckBoxWidget(
                text: "Uchovávanie údajov pre sledovanie vašich detí",
                value: false),
            CheckBoxWidget(
                text:
                    "Uchovávanie údajov ktoré môže jednoduche deanonymizovať užívatela",
                value: false),
          ],
        )),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        color: ThemeColors.colorBun,
      ),
    );
  }
}
