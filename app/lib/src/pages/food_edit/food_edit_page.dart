import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/food_edit/food_edit_arguments.dart';

class FoodEditPage extends StatelessWidget {
  const FoodEditPage({super.key});

  static const routeName = '/food-edit';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as FoodEditArguments;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(child: Text(args.id)),
    );
  }
}
