import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:food_blueprint/src/models/ingredient.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_controller.dart';
import 'package:food_blueprint/src/pages/home/home_page.dart';
import 'package:food_blueprint/src/utils/category_names.dart';
import 'package:food_blueprint/src/widgets/burger_edit/ingredient_builder.dart';
import 'package:food_blueprint/src/widgets/burger_edit/ingredient_tray.dart';
import 'package:food_blueprint/src/widgets/burger_edit/name.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';

class BurgerEditPage extends StatelessWidget {
  final BurgerEditController controller;

  const BurgerEditPage({required this.controller, super.key});

  static const routeName = '/burger-edit';

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
                    child: NameWidget(
                      initialName: args?.burger.name,
                      onSubmit: (String value) {
                        controller.editedBurger.name = value;
                      },
                    ))),
            Expanded(
                flex: 10,
                child: Center(
                    child: FutureBuilder(
                        future: controller.listIngredients(),
                        builder: (context, ingredients) {
                          if (ingredients.hasData) {
                            return IngredientBuilder(
                                burgerIngredients:
                                    args?.burger.ingredients ?? []);
                          } else {
                            return const Center(
                                child: Text("Loading assembler..."));
                          }
                        }))),
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(children: [
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.handleSave();
                                  Navigator.pushNamed(
                                      context, HomePage.routeName);
                                  // Navigate to a different page here
                                },
                                child: const Text("Smazat"),
                              ))),
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.handleSave();
                                  Navigator.pushNamed(
                                      context, HomePage.routeName);
                                  // Navigate to a different page here
                                },
                                child: const Text("Uložit"),
                              )))
                    ]))),
            Expanded(
                flex: 5,
                child: FutureBuilder(
                    future: Future.wait([
                      controller.listIngredients(),
                      controller.listCategories()
                    ]),
                    builder: (context, future) {
                      if (future.hasData) {
                        List<Ingredient> ingredients =
                            future.data!.toList()[0] as List<Ingredient>;
                        List<String> categories =
                            future.data!.toList()[1] as List<String>;
                        developer.log(categories.toString());
                        return IngredientTray(
                            availableCategories:
                                CategoryNames.categoryObjects(categories),
                            availableIngredients: ingredients);
                      } else {
                        return const Text("Loading tray...");
                      }
                    })),
          ],
        ));
  }
}
