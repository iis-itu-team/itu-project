import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/food_edit/food_edit_arguments.dart';
import 'package:food_blueprint/src/pages/food_edit/food_edit_controller.dart';

class FoodEditPage extends StatelessWidget {
  final FoodEditController controller;

  const FoodEditPage({required this.controller, super.key});

  static const routeName = '/food-edit';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as FoodEditArguments?;

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
