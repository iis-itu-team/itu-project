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

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(text: 'Burger'),
        body: FutureBuilder(
            builder: (context, future) {
              if (!future.hasData) {
                return const Center(child: Text("Loading Burger Assembler..."));
              }

              List<Ingredient> availableIngredients =
                  future.data!.toList()[0] as List<Ingredient>;
              List<String> availableCategories =
                  future.data!.toList()[1] as List<String>;

              controller.enter(args, availableIngredients);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      flex: 4,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              right: 32, left: 32, top: 8),
                          child: NameWidget(
                            initialName: controller.editedBurger!.name,
                            onSubmit: (String value) {
                              controller.editedBurger!.name = value;
                            },
                          ))),
                  Expanded(
                      flex: 20,
                      child: Center(
                          child: IngredientBuilder(
                              burgerIngredients:
                                  controller.editedBurger!.ingredients))),
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
                      child: IngredientTray(
                          availableCategories: CategoryNames.categoryObjects(
                              availableCategories),
                          availableIngredients: availableIngredients)),
                ],
              );
            },
            future: Future.wait(
                [controller.listIngredients(), controller.listCategories()])));
  }
}
