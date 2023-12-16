import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_page.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
import 'package:food_blueprint/src/widgets/common/image_with_fallback.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_row_menu.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  TextStyle linkStyle = const TextStyle(color: Colors.blue);

  final HomeController controller;

  HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Domov'),
      body: Column(
        children: <Widget>[
          const CustomRowMenu(),
          Expanded(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - 120),
                child: FutureBuilder(
                  builder: (context, burgers) {
                    return ListView.builder(
                      itemCount: burgers.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final burger = burgers.data?[index];

                        if (burger == null) {
                          return const ListTile();
                        }

                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                BurgerEditPage.routeName,
                                arguments: BurgerEditArguments(burger),
                              );
                            },
                            child: Row(children: [
                              ImageWithFallback(
                                  icon: burger.icon,
                                  width: 80,
                                  height: 80,
                                  fallback: ImageUrlLoader.prefixUrl(
                                      '/icons/burger.png')),
                              Expanded(child: Text(burger.name ?? ''))
                            ]));
                      },
                    );
                  },
                  future: controller.listBurgers(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, BurgerEditPage.routeName);
              },
              child: const Text(
                "Create new burger! (click...)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
