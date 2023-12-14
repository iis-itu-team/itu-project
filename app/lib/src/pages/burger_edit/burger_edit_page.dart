import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_controller.dart';
import 'package:food_blueprint/src/pages/home/home_page.dart';
import 'package:food_blueprint/src/types/ingredient_category.dart';
import 'package:food_blueprint/src/widgets/burger_edit/ingredient_builder.dart';
import 'package:food_blueprint/src/widgets/burger_edit/ingredient_tray.dart';
import 'package:food_blueprint/src/widgets/burger_edit/name.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';

class BurgerEditPage extends StatelessWidget {
  final BurgerEditController controller;

  final List<IngredientCategory> _categories = const [
    IngredientCategory("salad", "Salát"),
    IngredientCategory("meat", "Maso")
  ];

  const BurgerEditPage({required this.controller, super.key});

  static const routeName = '/food-edit';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as BurgerEditArguments?;

    controller.enter(args);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(text: 'Burger'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: NameWidget(initialName: args?.food.name))),
            Expanded(
                flex: 10,
                child: Center(
                    child: FutureBuilder(
                        future: controller.listIngredients(),
                        builder: (context, ingredients) {
                          if (ingredients.hasData) {
                            return IngredientBuilder(
                                burgerIngredients: ingredients.data!);
                          } else {
                            return const Center(
                                child: Text("Loading assembler..."));
                          }
                        }))),
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.handleSave();
                            Navigator.pushNamed(context, HomePage.routeName);
                            // Navigate to a different page here
                          },
                          child: const Text("Save"),
                        )))),
            Expanded(
                flex: 5,
                child: FutureBuilder(
                    future: controller.listIngredients(),
                    builder: (context, ingredients) {
                      if (ingredients.hasData) {
                        return IngredientTray(
                            categories: _categories,
                            ingredients: ingredients.data!);
                      } else {
                        return const Text("Loading tray...");
                      }
                    })),
          ],
        ));
  }
}
