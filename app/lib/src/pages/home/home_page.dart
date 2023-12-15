import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_page.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_page.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
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

                        return ListTile(
                          title: Text(burger.name ?? ''),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              BurgerEditPage.routeName,
                              arguments: BurgerEditArguments(burger),
                            );
                          },
                        );
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
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        color: ThemeColors.colorBun,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, OrderNewPage.routeName);
                // Navigate to a different page here
              },
              child: SvgPicture.asset("assets/images/BurgerOrder.svg",
                  height: 80, width: 80),
            ),
          ],
        ),
      ),
    );
  }
}
