/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Date: 14. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/types/cart.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
import 'package:food_blueprint/src/widgets/app_bar_widget.dart';
import 'package:food_blueprint/src/widgets/row_menu_widget.dart';

class BasicPage extends StatelessWidget {
  static const routeName = '/basic';

  final Cart cart;

  final TextStyle linkStyle = const TextStyle(color: Colors.blue);

  final HomeController controller;

  const BasicPage({super.key, required this.controller, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(text: 'Základné'),
        body: const RowMenuWidget(),
        bottomNavigationBar: BottomNavigationWidget(cart: cart));
  }
}
