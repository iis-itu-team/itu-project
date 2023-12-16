import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
import 'package:food_blueprint/src/widgets/common/burger_listing.dart';
import 'package:food_blueprint/src/widgets/common/create_burger.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_row_menu.dart';

class MinePage extends StatelessWidget {
  static const routeName = '/mine';

  final TextStyle linkStyle = const TextStyle(color: Colors.blue);

  final HomeController controller;

  const MinePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(text: 'Moje'),
        body: Column(children: [
          const CustomRowMenu(),
          Expanded(
              child: BurgerList(
            controller: controller,
            extraChildren: const [CreateBurgerButton()],
          ))
        ]),
        bottomNavigationBar: const BottomNavigationWidget());
  }
}
