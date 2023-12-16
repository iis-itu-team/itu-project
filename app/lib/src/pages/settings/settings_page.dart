import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/settings/settings_controller.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_checkbox.dart';

class SettingsPage extends StatelessWidget {
  final SettingsController controller;

  const SettingsPage({required this.controller, super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Nastavenia'),
      body: Container(
        color: ThemeColors.colorOnion,
        child: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxWidget(
                text: "Uchovávanie údajov pre sledovanie vašich detí",
                value: false),
            CheckboxWidget(
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
