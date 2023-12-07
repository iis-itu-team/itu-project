import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_controller.dart';

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
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          children: [
            const Text("Enter a burger name:"),
            TextField(
              onChanged: controller.handleNameUpdate,
            ),
            GestureDetector(
              onTap: controller.handleSave,
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
