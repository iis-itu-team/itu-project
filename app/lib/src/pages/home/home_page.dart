import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/food_edit/food_edit_arguments.dart';
import 'package:food_blueprint/src/pages/food_edit/food_edit_page.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Column(children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - 120),
                      child: FutureBuilder(
                          builder: (context, foods) {
                            return ListView.builder(
                              itemCount: foods.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                final food = foods.data?[index];

                                if (food == null) {
                                  return const ListTile();
                                }

                                return ListTile(
                                    title: Text(food.name),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, FoodEditPage.routeName,
                                          arguments:
                                              FoodEditArguments(food));
                                    });
                              },
                            );
                          },
                          future: controller.listFoods())))),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, FoodEditPage.routeName);
                },
                child: const Text("Create new burger! (click...)",
                    style: TextStyle(fontWeight: FontWeight.bold))),
          )
        ]));
  }
}
